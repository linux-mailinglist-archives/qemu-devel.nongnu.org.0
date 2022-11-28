Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3D63B329
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkjm-0002p5-Aj; Mon, 28 Nov 2022 15:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjl-0002oo-5d
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:28:21 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjV-00029V-M9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:28:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso9251298wms.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyIB5NjZrVPmAFslKBgckP8KrUdTCBt+mgHvj7bYx9E=;
 b=f0prDy1f8r7Si5+D/mIq8FAI+n1Vw3E3oqEHeDYogYddgxop9A0scJVRpWG2o+Xj4R
 3kYhs4eu10o4uyYAtWvL8270N4jz5r/isJvqk550JLQYXNMiucp+IXqaKNkxQ1HW7rK2
 k97VpcWgoNg1kZLJ8G+d+QAdmkQcYCwpPBeyh+tOcv9dl9/A0gwrLFuzbFOF3FzD4HsU
 8lqOXqVz1bqP/M4D70IfjkeB9F91O3mkILQbUOBLm1CLSTi88A3+77z6eRz8h+lF81Us
 oAZc+ps/Aveh69y3xlHLdrPx3YxKMncptFMRFQclVO3utK6zkY53//wk2WvAHtmxSZ1g
 2lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyIB5NjZrVPmAFslKBgckP8KrUdTCBt+mgHvj7bYx9E=;
 b=ub72XYHa4NUhWLA2BS3ofncuVFfKNCoyevF5MboGMTTLk7twmbWxC7RFCDWJKznfAo
 jxci8OwnedFZmdNYTqBJziNbWREU3XXawE0EOdkZjdulC2HQWAMpcLzVr89W66o0xbDf
 tHp7mvK/EVCmYp6R+B4hOQ7Mvi0+iMuTUyOD3hYzZJrtfNUjEZj+/3Pu3tICBCxHUMp4
 bArdmejYFuWQ/CC7ZmijzpZ9ouf1YirW7gpbfQsqUs4NCSZ4a445//RaZPfcIhGZjgh7
 19jhvcMxOFB2/1IRXOrwHEAxZj3hi5MNGx6ySrEVLMWY373OZp+S65lewG2x8TMbA/5Y
 RoQQ==
X-Gm-Message-State: ANoB5pm9PgyflxSVREg7toz9blR6UgCk9X33q+GiwqLY3U3rxYEcqSna
 ZA9M61ot7qYvRWstOBu2s3msFG7H5bsOkw==
X-Google-Smtp-Source: AA0mqf4a6R3uV9fGqedkgrJF5l4xvW4G+o1JM5E6I1hw/U5Q4N0WsdpJZrAldZ2RVH7A5u3hy/VCmQ==
X-Received: by 2002:a7b:c8c3:0:b0:3cf:b49e:1638 with SMTP id
 f3-20020a7bc8c3000000b003cfb49e1638mr28554163wml.50.1669667284133; 
 Mon, 28 Nov 2022 12:28:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b003cf75f56105sm18096809wmq.41.2022.11.28.12.28.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 12:28:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 v3 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Date: Mon, 28 Nov 2022 21:27:40 +0100
Message-Id: <20221128202741.4945-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128202741.4945-1-philmd@linaro.org>
References: <20221128202741.4945-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Have qxl_get_check_slot_offset() return false if the requested
buffer size does not fit within the slot memory region.

Similarly qxl_phys2virt() now returns NULL in such case, and
qxl_dirty_one_surface() aborts.

This avoids buffer overrun in the host pointer returned by
memory_region_get_ram_ptr().

Fixes: CVE-2022-4144 (out-of-bounds read)
Reported-by: Wenxu Yin (@awxylitol)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.c | 27 +++++++++++++++++++++++----
 hw/display/qxl.h |  2 +-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 231d733250..0b21626aad 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
 
 /* can be also called from spice server thread context */
 static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
-                                      uint32_t *s, uint64_t *o)
+                                      uint32_t *s, uint64_t *o,
+                                      size_t size_requested)
 {
     uint64_t phys   = le64_to_cpu(pqxl);
     uint32_t slot   = (phys >> (64 -  8)) & 0xff;
     uint64_t offset = phys & 0xffffffffffff;
+    uint64_t size_available;
 
     if (slot >= NUM_MEMSLOTS) {
         qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
@@ -1452,6 +1454,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
                           slot, offset, qxl->guest_slots[slot].size);
         return false;
     }
+    size_available = memory_region_size(qxl->guest_slots[slot].mr);
+    if (qxl->guest_slots[slot].offset + offset >= size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" > region size %"PRIu64"\n",
+                          slot, qxl->guest_slots[slot].offset + offset,
+                          size_available);
+        return false;
+    }
+    size_available -= qxl->guest_slots[slot].offset + offset;
+    if (size_requested > size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" size %zu: "
+                          "overrun by %"PRIu64" bytes\n",
+                          slot, offset, size_requested,
+                          size_requested - size_available);
+        return false;
+    }
 
     *s = slot;
     *o = offset;
@@ -1471,7 +1490,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
         return (void *)(intptr_t)offset;
     case MEMSLOT_GROUP_GUEST:
-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
+        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
             return NULL;
         }
         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
@@ -1937,9 +1956,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
     uint32_t slot;
     bool rc;
 
-    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
-    assert(rc == true);
     size = (uint64_t)height * abs(stride);
+    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
+    assert(rc == true);
     trace_qxl_surfaces_dirty(qxl->id, offset, size);
     qxl_set_dirty(qxl->guest_slots[slot].mr,
                   qxl->guest_slots[slot].offset + offset,
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index bf03138ab4..7894bd5134 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -157,7 +157,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  *
  * Returns a host pointer to a buffer placed at offset @phys within the
  * active slot @group_id of the PCI VGA RAM memory region associated with
- * the @qxl device. If the slot is inactive, or the offset is out
+ * the @qxl device. If the slot is inactive, or the offset + size are out
  * of the memory region, returns NULL.
  *
  * Use with care; by the time this function returns, the returned pointer is
-- 
2.38.1


