Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235F308720
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:48:12 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PRr-0006V2-9y
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5PNz-00056m-4m
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5PNw-0006zS-4a
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611909842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qv9YMNcLwcgSLwEefxFQPZGzTNCVGjmDmw52ICClGqU=;
 b=B8nLMH5cCvpC5jEcFWpS2H1G5PBXz+owESInHfejjfFDSPbBhrQ0PefNyO4Jy0nsYjqcBe
 s8AaWGFmSdyEpjgVuXL86/9nUXof19CxWDGjevM3zDawKsDSeFY/Ry/jBK/5hL1p/8b5eM
 zTKEAeOIIWhzplYh4nSZ02Uarej/LII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-1htBLyCePkSS8o7GQ0qEsg-1; Fri, 29 Jan 2021 03:43:59 -0500
X-MC-Unique: 1htBLyCePkSS8o7GQ0qEsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED7C8030AB;
 Fri, 29 Jan 2021 08:43:57 +0000 (UTC)
Received: from thuth.com (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303135D9EF;
 Fri, 29 Jan 2021 08:43:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/kvm/kvm-all: Fix wrong return code handling in dirty
 log code
Date: Fri, 29 Jan 2021 09:43:54 +0100
Message-Id: <20210129084354.42928-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Serge Hallyn <serge.hallyn@ubuntu.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kvm_vm_ioctl() wrapper already returns -errno if the ioctl itself
returned -1, so the callers of kvm_vm_ioctl() should not check for -1
but for a value < 0 instead.

This problem has been fixed once already in commit b533f658a98325d0e4
but that commit missed that the ENOENT error code is not fatal for
this ioctl, so the commit has been reverted in commit 50212d6346f33d6e
since the problem occurred close to a pending release at that point
in time. The plan was to fix it properly after the release, but it
seems like this has been forgotten. So let's do it now finally instead.

Resolves: https://bugs.launchpad.net/qemu/+bug/1294227
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/kvm/kvm-all.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3feb17d965..7224596932 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -668,16 +668,19 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
 
         d.dirty_bitmap = mem->dirty_bmap;
         d.slot = mem->slot | (kml->as_id << 16);
-        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
-            DPRINTF("ioctl failed %d\n", errno);
-            ret = -1;
+        ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
+        if (ret == -ENOENT) {
+            /* kernel does not have dirty bitmap in this slot */
+            ret = 0;
+        } else if (ret < 0) {
+            error_report("ioctl KVM_GET_DIRTY_LOG failed: %d", errno);
             goto out;
+        } else {
+            subsection.offset_within_region += slot_offset;
+            subsection.size = int128_make64(slot_size);
+            kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
         }
 
-        subsection.offset_within_region += slot_offset;
-        subsection.size = int128_make64(slot_size);
-        kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
-
         slot_offset += slot_size;
         start_addr += slot_size;
         size -= slot_size;
@@ -774,8 +777,8 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     d.num_pages = bmap_npages;
     d.slot = mem->slot | (as_id << 16);
 
-    if (kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d) == -1) {
-        ret = -errno;
+    ret = kvm_vm_ioctl(s, KVM_CLEAR_DIRTY_LOG, &d);
+    if (ret < 0 && ret != -ENOENT) {
         error_report("%s: KVM_CLEAR_DIRTY_LOG failed, slot=%d, "
                      "start=0x%"PRIx64", size=0x%"PRIx32", errno=%d",
                      __func__, d.slot, (uint64_t)d.first_page,
-- 
2.27.0


