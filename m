Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AE649655
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDF-0005Gf-Md; Sun, 11 Dec 2022 15:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDB-0005GA-UJ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:13 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDA-0003Sj-9U
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:13 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z92so10333556ede.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eknjn/+ALn7qsOcWBIprFo8Hn74KPp/Z/Hjsxlzbs0=;
 b=s3vkzJsH6q9f9cwlXQrvVMJkDAEWJXzUDowR+VZWI4vreNwCCLdhshk/tnIgGKwugm
 npC7/f7ZwIvohUo0Wjs/u0is0LkhYNwmfqhVBYaSoQZJSvLvZEy8Aygr+h2QeUWpNVXU
 d2I5ViSoHcugTo8mxeim9ZCVdMBt5+mtKDDQvHFsXDmj+2rIR5eKC66XwRpMtO2Wo2O7
 JlyQbiP09Jtwp1NgfK1qtUoxbGqFeZM1/gJKq/YCBuzRJmngahevhNMPUxfvNGoGtnEI
 PL68r1OMMJTyrXKIlFA7AlfRQqPiGvzoJdnKr01FAqxb685r92jLsaBwu+yGHutt3QU9
 udaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eknjn/+ALn7qsOcWBIprFo8Hn74KPp/Z/Hjsxlzbs0=;
 b=APEmMGw8XD6nCLwTz6e8WCYd8HX7ovQGci5Oq2XdnI64CMJML/xs/iO/2OEp/T4syl
 5OSNj173WIwajK1GhD0B56bLui7kYqibk1f2TtJGLPuKMhn0QYpNu6upt3zKhr+ye7WI
 ccJKlrcdZnmI3jF4udyL1ThXv2HVP6Oyb3D7g/iLO/HG8m8CIkq1Dw6VFPYV0EGY3v/p
 QUqib1rduoyOgISzeXoFR9hYgsC0SBVMpdNHgMLuV0FniXaJmv/uQcABNJZix0sV0sfr
 Nfn3gdop4xu/tEIoCyTGal4xmtB5jB/Iz0AAOzJZO1eRyeL5V0P4Rokq71tjL/OAgDaU
 P6HA==
X-Gm-Message-State: ANoB5pml7db66GqGHsTnOdSrp89PowfTUUTKZxXZuAq7T7qEOQTrQ70I
 slzidy74aNOwxqn0KUKUfn22UaiLmkVk3E8C+Os=
X-Google-Smtp-Source: AA0mqf4epwX7GZElmWkQm8Rao/lZQNCq40CPY7vy5zViDchNtvGf0TB1sZozfdFjikPq+wzboI3LGw==
X-Received: by 2002:a05:6402:c43:b0:469:ae36:b954 with SMTP id
 cs3-20020a0564020c4300b00469ae36b954mr16916645edb.30.1670791570857; 
 Sun, 11 Dec 2022 12:46:10 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a50fd0f000000b0046b4e0fae75sm3042011eds.40.2022.12.11.12.46.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 06/11] hw/mips/malta: Use bootloader generator API
 for nanoMIPS CPUs (1/5)
Date: Sun, 11 Dec 2022 21:45:28 +0100
Message-Id: <20221211204533.85359-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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
---
 hw/mips/malta.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 8f84846f97..30ca4e0000 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -614,6 +614,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                       uint64_t kernel_entry)
 {
     uint16_t *p;
+    void *v;
 
     /* Small bootloader */
     p = (uint16_t *)base;
@@ -687,13 +688,13 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
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
@@ -736,14 +737,8 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
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
@@ -786,19 +781,20 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
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


