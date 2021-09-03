Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C54002BC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:57:30 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBZJ-000386-W4
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXN-0000T1-5J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXK-00007G-Dd
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eK7TE9SGkZ7MrXs41nGpgW1LJtxbgl0OnNUyizX5uyU=;
 b=dcxZnlyd+xUXaLM9j8JrGq0BGZ6d9NWWoSUrmAv0UdzxqJUI+IHm8bhYNF/j+31FRAOuQr
 LQZ42UQzf1ZNbY8j8/6sy4TijbxfCUU7nXcgnZ5bHxZg93GuwBq62ti/h/T/0rEWnP6hDx
 AK3D207y+mhPj2hJ5o4EayskxJ+JVA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-t2G5feJQOFWCiR2gUWR9xA-1; Fri, 03 Sep 2021 11:55:22 -0400
X-MC-Unique: t2G5feJQOFWCiR2gUWR9xA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E496D4E0;
 Fri,  3 Sep 2021 15:55:21 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65D88838BC;
 Fri,  3 Sep 2021 15:55:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] s390x: skey related fixes, cleanups,
 and memory device preparations
Date: Fri,  3 Sep 2021 17:55:01 +0200
Message-Id: <20210903155514.44772-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
many other things on the way. The remaining s390x users of ms->ram_size
are:

a) hw/s390x/ipl.c: loading the FW. Won't need adjustment.
b) hw/s390x/s390-skeys.c: allocating the array for storage keys. Will need
   adjustment for memory devices.
c) hw/s390x/s390-stattrib-kvm.c: will need adjustments in the future when
   using memory devices with CMM.
d) hw/s390x/s390-virtio-ccw.c: fixing up / handling initital ram. Won't
   need adjustment.
e) hw/s390x/sclp.c: same as d)

Especially patch 9-12 also affect KVM. The remaining ones mostly only
affect TCG.

v2 -> v3:
- "s390x/tcg: check for addressing exceptions for RRBE, SSKE and ISKE"
-- Use trigger_pgm_exception() to trigger PGM_ADDRESSING

v1 -> v2:
- "s390x/tcg: fix ignoring bit 63 when setting the storage key in SSKE"
-- Extended description
- "s390x/tcg: convert real to absolute address for RRBE, SSKE and ISKE"
-- Extended description
- "s390x/tcg: check for addressing exceptions for RRBE, SSKE and ISKE"
-- Fix compilation issue
- "s390x/mmu_helper: no need to pass access type to mmu_translate_asce()"
-- Mention commit id in description
- "s390x/mmu_helper: move address validation into mmu_translate*()"
-- Introduce and use MMU_S390_LRA
- "hw/s390x/s390-skeys: check if an address is valid before dumping the
   key"
-- Add missing return
- "hw/s390x/s390-skeys: rename skeys_enabled to skeys_are_enabled"
-- Added
- "hw/s390x/s390-skeys: lazy storage key enablement under TCG"
-- Adjust error cases/message in TCG get_skeys() and set_skeys()
-- Use "enable_skeys" and return a bool
-- Adjust function documentation

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Jason J. Herne <jjherne@linux.ibm.com>
Cc: qemu-s390x@nongnu.org

David Hildenbrand (13):
  s390x/tcg: wrap address for RRBE
  s390x/tcg: fix ignoring bit 63 when setting the storage key in SSKE
  s390x/tcg: convert real to absolute address for RRBE, SSKE and ISKE
  s390x/tcg: check for addressing exceptions for RRBE, SSKE and ISKE
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
  hw/s390x/s390-skeys: rename skeys_enabled to skeys_are_enabled
  hw/s390x/s390-skeys: lazy storage key enablement under TCG

 hw/s390x/s390-skeys-kvm.c       |   4 +-
 hw/s390x/s390-skeys.c           | 206 +++++++++++++++++++++-----------
 include/hw/s390x/storage-keys.h |  65 +++++++++-
 target/s390x/helper.h           |   6 +-
 target/s390x/mmu_helper.c       |  70 +++++++----
 target/s390x/s390x-internal.h   |   3 +
 target/s390x/tcg/excp_helper.c  |  13 --
 target/s390x/tcg/mem_helper.c   |  53 +++++---
 8 files changed, 294 insertions(+), 126 deletions(-)

-- 
2.31.1


