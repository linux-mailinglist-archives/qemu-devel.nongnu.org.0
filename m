Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D863088EA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:12:41 +0100 (CET)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sdk-0004vY-LS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rne-000506-5g
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:50 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnc-00068q-HD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:49 -0500
Received: by mail-ed1-x536.google.com with SMTP id d2so10150646edz.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7SAxf70vdLe+3oJe0dcId8thjf5y7f8+/o9RGqIicA=;
 b=hWnXsmGvd0CRp8A0ak03F4I8XouAv0e7v6piuAnWTLy8lEHXhVk6ToZyjLVZ1S+dc7
 Tu/lYUm8l5zTiS7FoTRwon7GunY6SzGjn47cQRSpbmmvQOPJouQ75AEp+ptKi22Ivq8u
 Y0PMr6oXTr2/MGLXy06eY+a1C/ZWYzs441LjWVx1t1hA7KriHawTaCvK7ZKcSIcUjYoO
 U0Lir8+w4El2OaRWZzHHIZz4D9x3e/cek7qLO8+3QhDpyXa2S32WswPQLNx8bZSPhOGo
 vkW1Sapxop3+RGtRU/zkkQ6YOe/TVPtsYp3s8GSVDQ0+x2rUT9oSHnrp6N1ZVfr/0FRQ
 O4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z7SAxf70vdLe+3oJe0dcId8thjf5y7f8+/o9RGqIicA=;
 b=mUthxVRhHKhiyJfCriiGveWWnz8SZnYhUHMM3IkxvKdTQi00lGUk6GJJMPPEk7gr4D
 8F9+YkO4xOtVE8c0kMNn+stP3swBXNWssymekfipMEeTZrCSxh3jyEkqzU9E7n2SCdJF
 wwDKVypJ6mPsUCPB4mQsbVcEm9eaNjke/dYKgM4nyI71KfID5Vt8WFf8L8Nm2nJjXsv2
 +fQG0YHIZ3DHeqZyeKrh7frq1MiLNAPlmg8C2oIAa1dlMoIrST3kjLUxVgoJoqeXf4gr
 RyZfnQwi/fOKidIrWIiVjufnVjpyCb870QtckMozJR5weVbfZwApH0r3f4qayt+iHkGk
 dozg==
X-Gm-Message-State: AOAM530mFDqcZT3OTpVpoFbQ1PV/f+QdYcHQjb0stF31jtOpHXYbKSde
 RSlwxkMVs7YRPN87kMzGlWA7arSv4llIYw==
X-Google-Smtp-Source: ABdhPJy8KK/NOOZh7sbtabaSCvUxykqB3UzOx3sGNEN26ien2dTUOW6zYfiXWksPzXzsaTULGpdzPQ==
X-Received: by 2002:a50:fb04:: with SMTP id d4mr4380841edq.315.1611919127152; 
 Fri, 29 Jan 2021 03:18:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] accel/kvm/kvm-all: Fix wrong return code handling in
 dirty log code
Date: Fri, 29 Jan 2021 12:18:14 +0100
Message-Id: <20210129111814.566629-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
2.29.2


