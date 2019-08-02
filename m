Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E27FA6D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 15:33:40 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htXgh-0005zZ-LP
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 09:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52481)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1htXfv-0004v7-BG
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 09:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1htXfu-0004II-9h
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 09:32:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1htXfu-0004F1-3q; Fri, 02 Aug 2019 09:32:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3707FC024906;
 Fri,  2 Aug 2019 13:32:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B69205C207;
 Fri,  2 Aug 2019 13:32:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 09:32:39 -0400
Message-Id: <20190802133241.29298-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 02 Aug 2019 13:32:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 v3 0/2] s390: stop abusing
 memory_region_allocate_system_memory()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Changelog:
  since v2:
    - break migration from old QEMU (since 2.12-4.1) for guest with >8TB RAM
      and drop migratable aliases patch as was agreed during v2 review
    - drop 4.2 machines patch as it's not prerequisite anymore
  since v1:
    - include 4.2 machines patch for adding compat RAM layout on top
    - 2/4 add missing in v1 patch for splitting too big MemorySection on
          several memslots
    - 3/4 amend code path on alias destruction to ensure that RAMBlock is
          cleaned properly
    - 4/4 add compat machine code to keep old layout (migration-wise) for
          4.1 and older machines 


While looking into unifying guest RAM allocation to use hostmem backends
for initial RAM (especially when -mempath is used) and retiring
memory_region_allocate_system_memory() API, leaving only single hostmem backend,
I was inspecting how currently it is used by boards and it turns out several
boards abuse it by calling the function several times (despite documented contract
forbiding it).

s390 is one of such boards where KVM limitation on memslot size got propagated
to board design and memory_region_allocate_system_memory() was abused to satisfy
KVM requirement for max RAM chunk where memory region alias would suffice.

Unfortunately, memory_region_allocate_system_memory() usage created migration
dependency where guest RAM is transferred in migration stream as several RAMBlocks
if it's more than KVM_SLOT_MAX_BYTES. During v2 review it was agreed to ignore
migration breakage (documenting it in release notes) and leaving only KVM fix.

In order to replace these several RAM chunks with a single memdev and keep it
working with KVM memslot size limit, following was done:
   * [1/2] split too big RAM chunk inside of KVM code on several memory slots
           if necessary
   * [2/2] drop manual ram splitting in s390 code


CC: pbonzini@redhat.com
CC: qemu-s390x@nongnu.org
CC: borntraeger@de.ibm.com
CC: thuth@redhat.com
CC: david@redhat.com
CC: cohuck@redhat.com

Igor Mammedov (2):
  kvm: s390: split too big memory section on several memslots
  s390: do not call memory_region_allocate_system_memory() multiple
    times

 include/hw/s390x/s390-virtio-ccw.h | 10 ++++
 include/sysemu/kvm_int.h           |  1 +
 accel/kvm/kvm-all.c                | 79 ++++++++++++++++++------------
 hw/s390x/s390-virtio-ccw.c         | 30 ++----------
 target/s390x/kvm.c                 |  1 +
 5 files changed, 63 insertions(+), 58 deletions(-)

-- 
2.18.1


