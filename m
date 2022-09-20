Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9D5BEEC0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:51:47 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakDa-00036z-5y
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oafV7-0007TH-Hd
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:49:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oafV5-0003FS-VS
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:49:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id z6so5049416wrq.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tQr6UloN0NhycfhAQGHw2WkJ6sRO+hnSTFjzapZYW40=;
 b=asH43nNm0YZYLhk0Zx9hpS1onb81CRbp+kcHdjhtlI1AO4mtbbSRQXo5LrpAz0KmT8
 tZh0whiwK1Yi7ZSTudTXbafdjjKkzG5XDBpTSKr4awXWNh31+Oe0k+boUoeb2TzWCRjO
 M5JFDJtum/5Yv+HZZuyDE7SNgM3NRnUlq5AlVSrtMVU4L49N/axIIOG02KVNLKHjM9+9
 0xnOl0AT8rAs+U4z3KJQHz5aKcIh/Yi8JWP9jiPk419jV+IksjTW1OJZRXbT/gib2FFO
 do7Dwkl3DA8CqAxkesnY9RTYniv3Nu8iI6YMgeGjWcDPNQgkWzf0KOQVhsVKDZzm4Gfu
 LHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tQr6UloN0NhycfhAQGHw2WkJ6sRO+hnSTFjzapZYW40=;
 b=BNjfqJLylHe3skW5BKoL0x2o8Hq+Ah0KoC6Su+Qp0Mz/jMNG/jCNoL6MTUJwrDfqgd
 0Eo8Uu4209tH7yaBgcKMuXAn3gh49Kuehf26QGAtS5KApO0+9mQb/t7vcRmQ8eVLy/Gd
 7KX0j8N1xhWlFwclCCrYHc1RzMZxCOz92EF258m6vsaPSn0p1/RO5Y7loRtPF/Pt9Ara
 DWjS8+f/TFcbpxOAXik8k88jye8oRUMrmBhUyoctjcyyN+t99ME44qrwMPS7iSg5gJdD
 0PXxN9TAnd8c4D0V6oU+oR9O3acb/sc5yPNa1ILw0L7bdT8OPU8lqDj8nJXmyysDy2rD
 N5zw==
X-Gm-Message-State: ACrzQf32nXvsFD2SXmvHviFJzihwnuBUVXrYyC8t4Ps43dYy8njRjf55
 Qzx0QU2NaYye4Xs7vYUwmdXkzqz/NPE=
X-Google-Smtp-Source: AMsMyM79o0mnKGsnnb8woyM36GVt2FklqaAZ4qy+DgiqPGxPLW1UhuKvK+3jqGEnGpwUNAuASmJCSQ==
X-Received: by 2002:a5d:678a:0:b0:22a:c9d9:443d with SMTP id
 v10-20020a5d678a000000b0022ac9d9443dmr13875581wru.129.1663688970370; 
 Tue, 20 Sep 2022 08:49:30 -0700 (PDT)
Received: from liavpc.localdomain ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a05600c17c300b003b3307fb98fsm102304wmo.24.2022.09.20.08.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 08:49:29 -0700 (PDT)
From: Liav Albani <liavalb@gmail.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org,
	Liav Albani <liavalb@gmail.com>
Subject: [PATCH 1/1] hw/display: expose linear framebuffer address in Bochs
 VBE registers
Date: Tue, 20 Sep 2022 18:49:22 +0300
Message-Id: <20220920154922.248790-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920154922.248790-1-liavalb@gmail.com>
References: <20220920154922.248790-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is quite useful on the isa-vga device, because it lets guest drivers
to determine where is the framebuffer located in physical memory instead
of blindly hardcoding an address. It also allows future movements of the
framebuffer to other locations.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/display/bochs-display.c     | 10 +++++++++-
 hw/display/vga.c               | 13 +++++++++++--
 include/hw/display/bochs-vbe.h |  7 ++++++-
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8ed734b195..aa3aa51e2f 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -77,9 +77,17 @@ static uint64_t bochs_display_vbe_read(void *ptr, hwaddr addr,
 
     switch (index) {
     case VBE_DISPI_INDEX_ID:
-        return VBE_DISPI_ID5;
+        return VBE_DISPI_ID6;
     case VBE_DISPI_INDEX_VIDEO_MEMORY_64K:
         return s->vgamem / (64 * KiB);
+    case VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS1:
+        return (s->vram.addr) & 0xffff;
+    case VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS2:
+        return (s->vram.addr >> 16) & 0xffff;
+    case VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS3:
+        return (s->vram.addr >> 32) & 0xffff;
+    case VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS4:
+        return (s->vram.addr >> 48) & 0xffff;
     }
 
     if (index >= ARRAY_SIZE(s->vbe_regs)) {
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 50ecb1ad02..9d91946987 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -727,6 +727,14 @@ uint32_t vbe_ioport_read_data(void *opaque, uint32_t addr)
         }
     } else if (s->vbe_index == VBE_DISPI_INDEX_VIDEO_MEMORY_64K) {
         val = s->vbe_size / (64 * KiB);
+    } else if (s->vbe_index == VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS1) {
+        val = (s->vram.addr) & 0xffff;
+    } else if (s->vbe_index == VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS2) {
+        val = (s->vram.addr >> 16) & 0xffff;
+    } else if (s->vbe_index == VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS3) {
+        val = (s->vram.addr >> 32) & 0xffff;
+    } else if (s->vbe_index == VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS4) {
+        val = (s->vram.addr >> 48) & 0xffff;
     } else {
         val = 0;
     }
@@ -753,7 +761,8 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val)
                 val == VBE_DISPI_ID2 ||
                 val == VBE_DISPI_ID3 ||
                 val == VBE_DISPI_ID4 ||
-                val == VBE_DISPI_ID5) {
+                val == VBE_DISPI_ID5 ||
+                val == VBE_DISPI_ID6) {
                 s->vbe_regs[s->vbe_index] = val;
             }
             break;
@@ -1830,7 +1839,7 @@ void vga_common_reset(VGACommonState *s)
     s->bank_offset = 0;
     s->vbe_index = 0;
     memset(s->vbe_regs, '\0', sizeof(s->vbe_regs));
-    s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID5;
+    s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID6;
     s->vbe_start_addr = 0;
     s->vbe_line_offset = 0;
     s->vbe_bank_mask = (s->vram_size >> 16) - 1;
diff --git a/include/hw/display/bochs-vbe.h b/include/hw/display/bochs-vbe.h
index bc2f046eee..383474b9d1 100644
--- a/include/hw/display/bochs-vbe.h
+++ b/include/hw/display/bochs-vbe.h
@@ -19,8 +19,12 @@
 #define VBE_DISPI_INDEX_VIRT_HEIGHT     0x7
 #define VBE_DISPI_INDEX_X_OFFSET        0x8
 #define VBE_DISPI_INDEX_Y_OFFSET        0x9
-#define VBE_DISPI_INDEX_NB              0xa /* size of vbe_regs[] */
 #define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa /* read-only, not in vbe_regs */
+#define VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS1 0xb /* read-only, not in vbe_regs */
+#define VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS2 0xc /* read-only, not in vbe_regs */
+#define VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS3 0xd /* read-only, not in vbe_regs */
+#define VBE_DISPI_VIDEO_MEMORY_PHYSICAL_ADDRESS4 0xe /* read-only, not in vbe_regs */
+#define VBE_DISPI_INDEX_NB              0xe /* size of vbe_regs[] */
 
 /* VBE_DISPI_INDEX_ID */
 #define VBE_DISPI_ID0                   0xB0C0
@@ -29,6 +33,7 @@
 #define VBE_DISPI_ID3                   0xB0C3
 #define VBE_DISPI_ID4                   0xB0C4
 #define VBE_DISPI_ID5                   0xB0C5
+#define VBE_DISPI_ID6                   0xB0C6
 
 /* VBE_DISPI_INDEX_ENABLE */
 #define VBE_DISPI_DISABLED              0x00
-- 
2.37.3


