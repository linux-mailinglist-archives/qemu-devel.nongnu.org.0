Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A52CB90B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:39:54 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOc5-0004lg-Ep
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNMG-0006df-GB
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM1-0006wt-Tn
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZm4OJGfL12VInI3zxmfcelS2XpydMDgLwNhdgfIDIA=;
 b=h3OAaMU+7pBYJB5icUpkj5NkRLlcNA2FEXvmjKwhmtWepHVJl+sdOLkh9QRwzGtJf2Fvda
 YRIwb/GDelLhy+mTwDZAMOAYHPNt9S8tqQlBgb4cp9WNgcSRm4yoqfqROnY8hcyg1KueOr
 5cYYeAf+6hzUg1Kn9EiQKSWg8MTIYMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-6b1wv4wJOhiIdkFgffXb6A-1; Wed, 02 Dec 2020 03:19:07 -0500
X-MC-Unique: 6b1wv4wJOhiIdkFgffXb6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C4BE8558F0
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D974F5D9C6;
 Wed,  2 Dec 2020 08:19:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] memory: allow creating MemoryRegions before accelerators
Date: Wed,  2 Dec 2020 03:18:52 -0500
Message-Id: <20201202081854.4126071-14-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compute the DIRTY_MEMORY_CODE bit in memory_region_get_dirty_log_mask
instead of memory_region_init_*.  This makes it possible to allocate
memory backend objects at any time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory.c | 12 ++++++------
 softmmu/vl.c     |  6 +-----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 11ca94d037..89a4723fe5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1548,7 +1548,6 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc(size, share, mr, &err);
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1573,7 +1572,6 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_resizeable(size, max_size, resized,
                                               mr, &err);
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1598,7 +1596,6 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->align = align;
     mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1622,7 +1619,6 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
                                            share ? RAM_SHARED : 0,
                                            fd, &err);
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1641,7 +1637,6 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
 
     /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
     assert(ptr != NULL);
@@ -1661,7 +1656,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion *mr,
     mr->ops = &ram_device_mem_ops;
     mr->opaque = mr;
     mr->destructor = memory_region_destructor_ram;
-    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
+
     /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
     assert(ptr != NULL);
     mr->ram_block = qemu_ram_alloc_from_ptr(size, ptr, mr, &error_fatal);
@@ -1819,6 +1814,11 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
                              memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
+
+    if (tcg_enabled() && rb) {
+        /* TCG only cares about dirty memory logging for RAM, not IOMMU.  */
+        mask |= (1 << DIRTY_MEMORY_CODE);
+    }
     return mask;
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0f63d80472..023c16245b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1715,11 +1715,7 @@ static bool object_create_early(const char *type, QemuOpts *opts)
         return false;
     }
 
-    /* Memory allocation by backends needs to be done
-     * after configure_accelerator() (due to the tcg_enabled()
-     * checks at memory_region_init_*()).
-     *
-     * Also, allocation of large amounts of memory may delay
+    /* Allocation of large amounts of memory may delay
      * chardev initialization for too long, and trigger timeouts
      * on software that waits for a monitor socket to be created
      * (e.g. libvirt).
-- 
2.26.2



