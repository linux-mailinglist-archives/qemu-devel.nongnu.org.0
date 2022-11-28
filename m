Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F463AA09
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:49:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeVI-0004yl-2l; Mon, 28 Nov 2022 08:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeVG-0004xN-09
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:58 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeVE-0000Jt-9l
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:57 -0500
Received: by mail-wr1-x434.google.com with SMTP id g12so16877168wrs.10
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjNbgTf1E7AI00TEfhwYXvMQtqcc4snLWTKJDvPZcks=;
 b=rtgMN5PwHDJ4483KQ5llJcVXxtK9fVGm60c5eWEbrX3MKDl2fKksm9eD4V4RKe/VoN
 zV5ws3igg5SdydWqYU3AUIZX4Al46H9DjmgG5Z7ab6RJMzuYjMM9YvKW9AFtENzg0ggX
 yAEqvcSMpweFZ67UsFVVdRFvGswg/BCQIByu7MCUobGrVV1LLRkzTXGyG4t5GidXL6kW
 0m3IkGyQMpLmjLyuwVB5uNVJiSD5BnK9NYSpNJOKvkIre/QOcYX6JGnjp/jFDbRv+3wV
 9qao2u2ETGfQ4AQVzLuMVj+A7gJrI87NzIbCtLbsu9fAkEpafyxyodx3qRW0tNs9Qz0p
 CFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjNbgTf1E7AI00TEfhwYXvMQtqcc4snLWTKJDvPZcks=;
 b=de+EXQpaUyZbzYoB1OppY3S6Xt6zCmX7uVWzQNxuO7hhvueCzVqFfPL4U1lfZQzBJ8
 7jLVS1oG20FptRiQnb2Xuk9lDbYcoNLCHm5hiENW0WDfXnvCSYTDt5XZ1yZ22Kd385WL
 SmKHTRy+lwf166Pj/Qwi+HzbD+Y56/OUwc8XIku/lOLsD9hwsZBiix+BKsU+b7M6/7Ef
 ICmV4z8I6nIK6+ewT2YfgcdpaNwAoVVIqoaIoINcC8CajMZNnir/KHUFr38fpXP7hT2D
 b3Eef9pDp+G6F5aLgCEBQCJ44K6jogDR222+tisJ9MjmUGhKuLuLy+0Rkbg7xJmgYLYj
 f1Ew==
X-Gm-Message-State: ANoB5pnmCA3N31VU6wBod3ONmZ11HfFz8aWpnYUYILpfCD8eWff7Ee+O
 tu9d/ywEgGGXUtgtxbtCUU/rfA==
X-Google-Smtp-Source: AA0mqf6bfQUmfL/pPILkqaumYha/XFflvy3Tn7+T4HxgqTC0YB75ORSEU6MWivN5KZOsFz/ke9h/xA==
X-Received: by 2002:adf:e68a:0:b0:242:1926:7838 with SMTP id
 r10-20020adfe68a000000b0024219267838mr2461131wrm.200.1669643334893; 
 Mon, 28 Nov 2022 05:48:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b002366c3eefccsm10955690wrr.109.2022.11.28.05.48.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 05:48:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Date: Mon, 28 Nov 2022 14:48:31 +0100
Message-Id: <20221128134832.84867-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
References: <20221128134832.84867-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/display/qxl.c | 22 ++++++++++++++++++----
 hw/display/qxl.h |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 231d733250..afa157d327 100644
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
@@ -1453,6 +1455,18 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
         return false;
     }
 
+    size_available = memory_region_size(qxl->guest_slots[slot].mr);
+    assert(qxl->guest_slots[slot].offset + offset < size_available);
+    size_available -= qxl->guest_slots[slot].offset + offset;
+    if (size_requested > size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" size %zu: "
+                          "overrun by %"PRIu64" bytes\n",
+                          slot, offset, size_requested,
+                          size_requested - size_available);
+        return false;
+    }
+
     *s = slot;
     *o = offset;
     return true;
@@ -1471,7 +1485,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
         return (void *)(intptr_t)offset;
     case MEMSLOT_GROUP_GUEST:
-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
+        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
             return NULL;
         }
         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
@@ -1937,9 +1951,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
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


