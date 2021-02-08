Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B131439C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:20:42 +0100 (CET)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fpi-0003gT-0N
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCh-0003cy-SA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCe-0006Hw-9b
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so18331151wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ccxdfDtgZG2LHcT+ExTuqyHNL4jkGWnYIqOyRcBF9z8=;
 b=KUae6ZLinsYhIdLKTOgIMKeeGubCh5DUtkmZ+3if/SXegdO/9uisf4R8HimT6TOBm+
 0880kLc9SDzP/alunMACCWcG/cvKoLBMfW+mQMmMGb6JUKaCnVtJqoDut28WfaPZ1s00
 P85CYlLjCZlj+hlEGrdmpCgODcPYx46GMPey4pEKA65Xyi9b/7ee4b9jlAqSqU4i5BhX
 vVDWHKQWOE8UV4kh00Y9CW/Kp76h2CumTwnxf1mdGv1notxpdbVQ96nS9uXOQW6+CC7P
 9jNmtEC6W3PvYYrkjnIsYIT+SBCNCQMeX27p2Ag53r78gso16R1HdjtqaoT+AubkNrga
 i+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ccxdfDtgZG2LHcT+ExTuqyHNL4jkGWnYIqOyRcBF9z8=;
 b=Bi29ryz5/+FzMQIJq9PFHppQzpfWKylrFuWTW+4JnP7NZAZL1aPYdWX2cPkgLz5t8Z
 +vjmfzz2riNolyJyflLvOcRRVMkD42y206HdUbkJH/dOMdVuGYD9M8r22YOFjgM3bmh3
 kl77mKIW2266XAH4TqcsTgzYDl6f032tGRA/aoOgxZL3m3wI6M4k1vPXlqSr2kGeiS7g
 GtNutzLRr+Psts+jUNpPhi1VpkrR4KjV8MOrvHVDk7KCp3Def5lt2HjpOeZT4N8vgjRe
 rx/i4t4DLRk19vKzNSu6Ynolyk08+5jB0j42BXFuZ4OFW3ECKCPGDpEL4MZI5PbiPl51
 aaLg==
X-Gm-Message-State: AOAM532CTKuaLtOibku52/weZyIIvPaiUZK8sRK8B9XxPIjeulT/EcVM
 1jTUbEzku+LZGIOQHXxypQ0MxDUaPG9O9w==
X-Google-Smtp-Source: ABdhPJwXYz1pdsVZV1yusdHhV5tSUnF6YwrqECLf9JE9Iv0USoGwoGiC/lkdUJ3QLcJ/wW4PpN2zYA==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr21508012wrm.25.1612808642941; 
 Mon, 08 Feb 2021 10:24:02 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] accel/kvm/kvm-all: Fix wrong return code handling in
 dirty log code
Date: Mon,  8 Feb 2021 19:23:17 +0100
Message-Id: <20210208182331.58897-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210129084354.42928-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e72a19aaf8..47516913b7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -644,16 +644,19 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
 
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
@@ -750,8 +753,8 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
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
2.29.2



