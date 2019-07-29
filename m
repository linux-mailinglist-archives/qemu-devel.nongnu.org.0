Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE378E73
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 16:53:57 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs72C-0001g6-Gk
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 10:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36379)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hs70v-0007ys-7x
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hs70u-0000SA-4K
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:52:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hs70t-0000Ro-Vv; Mon, 29 Jul 2019 10:52:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40B803082E90;
 Mon, 29 Jul 2019 14:52:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 485245D9E2;
 Mon, 29 Jul 2019 14:52:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 10:52:27 -0400
Message-Id: <20190729145229.4333-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 29 Jul 2019 14:52:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 0/2] s390: stop abusing
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
Cc: pbonzini@redhat.com, qemu-s390x@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


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
if it's more than KVM_SLOT_MAX_BYTES.

In order to replace these several RAM chunks with a single memdev and keep it
working with KVM memslot size limit and migration compatible, following was done:
   * [2/2] use memory region aliases to partition hostmem backend RAM on
           KVM_SLOT_MAX_BYTES chunks, which should keep KVM side working
   * [1/2] hacked memory region aliases (to ram memory regions only) to have
           its own RAMBlocks pointing to RAM chunks owned by aliased memory
           region. While it's admittedly a hack, but it's relatively simple and
           allows board code rashape migration stream as necessary

           I haven't tried to use migratable aliases on x86 machines, but with it
           it could be possible to drop legacy RAM allocation and compat knob
           (cd5ff8333a) dropping '-numa node,mem' completely even for old machines.

PS:
   Tested with ping pong cross version migration on s390 machine 
   (with reduced KVM_SLOT_MAX_BYTES since I don't have access to large
    enough host)
     

Igor Mammedov (2):
  memory: make MemoryRegion alias migratable
  s390: do not call memory_region_allocate_system_memory() multiple
    times

 exec.c                     |  7 ++++---
 hw/s390x/s390-virtio-ccw.c | 20 +++++++++++++++-----
 memory.c                   |  5 +++++
 3 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.18.1


