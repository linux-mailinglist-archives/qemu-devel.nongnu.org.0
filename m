Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3063E17FD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:29:31 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfJJ-0007w1-W6
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfI8-0005PU-JU
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfI7-00067q-5t
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FmTffAR/VmwDXaNjvwG7lDbdAok11iKxZJF4+PNQ6G4=;
 b=VMlOsfcEG9g2yaAAZ2SbWdbc+q1cwgmYFsJySTEwyUW1GWjpy/WmFS9zaoej2OECl1sO7n
 vYzM5p3uI+acCdCD/RU4LWB/Y/yOIN9lI/5Zf9wOXsxszvPJI8IeUge5otjx4u3IuOQmwD
 l7DEGEVtI5bBkHEWrCT+9WFVgZm4rKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499--1c9rOcTPou8SdLRdWsP1Q-1; Thu, 05 Aug 2021 11:28:13 -0400
X-MC-Unique: -1c9rOcTPou8SdLRdWsP1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B187A87D54A;
 Thu,  5 Aug 2021 15:28:11 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9E62B45D;
 Thu,  5 Aug 2021 15:28:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 00/12] s390x: skey related fixes, cleanups,
 and memory device preparations
Date: Thu,  5 Aug 2021 17:27:52 +0200
Message-Id: <20210805152804.100333-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes multiple TCG issues related to storage key instructions,
fixes some TCG issues related to LOAD REAL ADDRESS and skeys, implements
lazy skey enablement under TCG, and prepares the whole skey infrastructure
for dealing with addresses beyond initial RAM (e.g., memory devices like
virtio-mem). Along, some cleanups.

To prepare for memory devices / memory hotplug, my goal was to get rid of
as many ms->ram_size users as possible. Unfortunately, I stumbled over
many other things on the way :) The remaining s390x users of ms->ram_size
are:

a) hw/s390x/ipl.c: loading the FW. Won't need adjustment.
b) hw/s390x/s390-skeys.c: allocating the array for storage keys. Will need
   adjustment for memory devices.
c) hw/s390x/s390-stattrib-kvm.c: will need adjustments in the future when
   using memory devices with CMM.
d) hw/s390x/s390-virtio-ccw.c: fixing up / handling initital ram. Won't
   need adjustment.
e) hw/s390x/sclp.c: same as d)

Especially patch 9-11 also affect KVM. The remaining ones mostly only
affect TCG.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Jason J. Herne <jjherne@linux.ibm.com>
Cc: qemu-s390x@nongnu.org

David Hildenbrand (12):
  s390x/tcg: wrap address for RRBE
  s390x/tcg: fix ignoring bit 63 when setting the storage key in SSKE
  s390x/tcg: convert real to absolute address for RRBE, SSKE and ISKE
  s390x/tcg: check for addressing exceptions for for RRBE, SSKE and ISKE
  s390x/mmu_helper: no need to pass access type to mmu_translate_asce()
  s390x/mmu_helper: fixup mmu_translate() documentation
  s390x/mmu_helper: move address validation into mmu_translate*()
  s390x/mmu_helper: avoid setting the storage key if nothing changed
  hw/s390x/s390-skeys: use memory mapping to detect which storage keys
    to migrate
  hw/s390x/s390-skeys: use memory mapping to detect which storage keys
    to dump
  hw/s390x/s390-skeys: check if an address is valid before dumping the
    key
  hw/s390x/s390-skeys: lazy storage key enablement under TCG

 hw/s390x/s390-skeys.c           | 183 +++++++++++++++++++++-----------
 include/hw/s390x/storage-keys.h |  63 +++++++++++
 target/s390x/helper.h           |   6 +-
 target/s390x/mmu_helper.c       |  70 ++++++++----
 target/s390x/s390x-internal.h   |   1 +
 target/s390x/tcg/excp_helper.c  |  13 ---
 target/s390x/tcg/mem_helper.c   |  54 +++++++---
 7 files changed, 277 insertions(+), 113 deletions(-)

-- 
2.31.1


