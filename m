Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4369669D02
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGo-0001zy-5z; Fri, 13 Jan 2023 10:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGm-0001z0-0e
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGk-0006Jq-9c
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id t5so17051283wrq.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfwA7R8MzV84uWf1n09fJfRvu4+D8tshi1nr8jmckno=;
 b=ldaZZqiFvPDR5kLGFnQJhCeQah+mYENaOUlk1wHsuRn4JLDoxv7Z13xKWzR+e0jsQu
 sIBZW9DV/6/0nH2s8A3JbH12HgTUbe1IvJwFtCO8OsVYOLulcNUmpu0A8VexSrnPkHYs
 T2m/8liGaLb1etNBynw1YrmWNEBL8PP/q+JmLKytUhmp9qWBOxCVc0Ab4pOswTfpKkWS
 nvaClc0MK6jr+br9lXfVMQ0pDLe0A+gCljNbMcy4IFPkTA1fxvvgJksno4BBc0IS8Hkl
 TJZoEFMdjpchGObs6t2cRiVSGZVx4V7h0R+cZXbDpa4IriVFEFs8Makxx+yWwg1r8+lt
 wHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfwA7R8MzV84uWf1n09fJfRvu4+D8tshi1nr8jmckno=;
 b=r5xm91Qt+Qyu9PlAvhxmxgZts5YWw2ATYiE7mpAH6zauVicjfmTPh5g4WATjw/eqdN
 UKWTUtu+Hda1x27GXNVOs+O54wQNYgRHfSkmEB2p4RJxBG8dFON7mYgjHPy4ThZdfMsX
 98B4N0UjFBAyoB2Z8jzvch44vzixyJTJj0E7uv0Rs2OeZdWkYpyTKx5zTDV9OQ4LUwWo
 3359gLKV+VKuC4lU1iRCkQ1ASwa3yisLAEp9uGmJxV5FxT1SEMIUjZ6GyqN1Ls7pxtPJ
 5pCzI1RbH3jk4Srpl9BWympOgsNs0VUudvyiBTcCvwLeDqQWOWZKC+nDzTrTIkKt3FbL
 GNrA==
X-Gm-Message-State: AFqh2kotaqKbB5D4Tbmsttfudn7aTbtMQZa0XXM4m1dIMrthu+3DR+Jk
 HEfZgvisYqdmF35nKpKre5/Z7QLtr0I7HbA6
X-Google-Smtp-Source: AMrXdXv4D3UJ3hEpj54cfrhmkCPYbwjxMw6Vd3HoNGxPxjmjW7JWXxQq3jcHQJq0AX/xypZ4KEnbcg==
X-Received: by 2002:a5d:4c51:0:b0:2b7:88d3:d221 with SMTP id
 n17-20020a5d4c51000000b002b788d3d221mr19119494wrt.1.1673624820752; 
 Fri, 13 Jan 2023 07:47:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b0024274a5db0asm19414427wrj.2.2023.01.13.07.47.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/46] hw/mips/malta: Use bootloader generator API for nanoMIPS
 CPUs (1/5)
Date: Fri, 13 Jan 2023 16:45:04 +0100
Message-Id: <20230113154532.49979-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
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

Similarly to how commit 0c8427baf0 ("hw/mips/malta: Use bootloader
helper to set BAR registers") converted write_bootloader(), convert
the equivalent write_bootloader_nanomips(), allowing us to modify
the bootloader code more easily in the future.

Part 1/5: Convert PCI0 MEM1 BAR setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-7-philmd@linaro.org>
---
 hw/mips/malta.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b5b62e7245..a496053a9a 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -620,6 +620,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                       uint64_t kernel_entry)
 {
     uint16_t *p;
+    void *v;
 
     /* Small bootloader */
     p = (uint16_t *)base;
@@ -693,13 +694,13 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
      *
      *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
      *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
-     *  - set up PCI0 MEM1 at 0x18200000, size 0xbe00000
      *
      */
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
                                 /* lui t1, %hi(0xb4000000)      */
 
 #if TARGET_BIG_ENDIAN
+#define cpu_to_gt32 cpu_to_le32
 
     stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
                                 /* lui t0, %hi(0xdf000000)      */
@@ -742,14 +743,8 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0xe020); stw_p(p++, 0x0821);
                                 /* lui t0, %hi(0xc1000000)      */
 
-    /* 0x80 corresponds to GT_PCI0M1LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
-                                /* sw t0, 0x80(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0bc0);
-                                /* lui t0, %hi(0x5e000000)      */
-
 #else
+#define cpu_to_gt32 cpu_to_be32
 
     stw_p(p++, 0x0020); stw_p(p++, 0x00df);
                                 /* addiu[32] t0, $0, 0xdf       */
@@ -792,19 +787,20 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
                                 /* addiu[32] t0, $0, 0xc1       */
-
-    /* 0x80 corresponds to GT_PCI0M1LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9080);
-                                /* sw t0, 0x80(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x005e);
-                                /* addiu[32] t0, $0, 0x5e       */
-
 #endif
+    v = p;
 
-    /* 0x88 corresponds to GT_PCI0M1HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9088);
-                                /* sw t0, 0x88(t1)              */
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
+                     cpu_to_gt32(0x18200000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
+                     cpu_to_gt32(0x0bc00000 << 3));
+
+    p = v;
+
+#undef cpu_to_gt32
 
     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
 
-- 
2.38.1


