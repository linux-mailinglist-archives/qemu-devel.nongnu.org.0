Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FF60E8F9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:26:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlvI-0008BG-HI; Wed, 26 Oct 2022 15:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvH-0008As-3t
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvF-00025N-DI
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id jb18so7501340wmb.4
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9a2BgiZ2Wkwz71ZOqgHOarEdR2H1gReHI5qtGn0+1g=;
 b=eUrSxLeGAASuSSsuAZ2jUAQktZMYC4sxkjFDoQlakOV790FbgyJ+rbHv/ie2YUO97+
 TyuwXgjLVrZhHBPh4UPTDtO7cvARTfCI8iRrgBQJctj1C5lWK0S6wi6LgMAyx0xDrAfn
 iqi0J99i9F6nfP1+pkgn+eJVOYhPAAFNPbkgcwUrxtruFb6Ct2IYl4XHOy83HQZEFMfu
 MNXyFLBAU1pM6s1q8PHoxJLNH9M+gY5u5ZPTJsGQhR7Mu7FjLNV4TEhVC9zH6NUpkl2Q
 mAvNJLfShUPUEVO82X72e34+SiW5J62VqPMhI428oLoALGmLFyHm76cAlc7xFE+NgTuc
 Mk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9a2BgiZ2Wkwz71ZOqgHOarEdR2H1gReHI5qtGn0+1g=;
 b=krZpWsN4M0Nfnvm84ZxFhf/oZkSLIkDOB30JrEooFmtxsB7QvDx229Fxi8bnsQPTXP
 f+fj0i58ek7lfuXD8OahObloF8LCNqlqJaCeyUFpkCR5NOBhUIg1QHcytRQG4D8lif1d
 WuoxZxodcDD7jsrB/rmieigfghvfpcY392g85btl2tttCe0946Neevbgt4mt+Q86/VzE
 BTG1XDK2bEa7AkCQRzeW3pIxRKxvS6qRlQ8z6PmmrCMvWly84fMBXRX7EXGTEN0hDPrT
 hkdsflRTLVX1PK6b7LTlNBWJ3pOgK9PRZbaHhxNOBFgkxA0PBneYEDulRyVcB6AlpURm
 JmQw==
X-Gm-Message-State: ACrzQf2F0t5CiRMGWfyb5G31KxV3C0Dr4wBwSzsYJS195pPHrjMU7Ui5
 ZJT5b3pmrqxifpcQtPZiVBb9yiTNeWS350cn
X-Google-Smtp-Source: AMsMyM4lRkWAq8wBDlMk4xbyuMsVuQpMQcpfLJNXXmm1rSIdH7SwZsqZxGzpj4nxGCgfDV1/M3elcA==
X-Received: by 2002:a05:600c:34c1:b0:3cf:3921:ef22 with SMTP id
 d1-20020a05600c34c100b003cf3921ef22mr3469183wmq.204.1666811919874; 
 Wed, 26 Oct 2022 12:18:39 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a05600c46d000b003c6f426467fsm2706402wmo.40.2022.10.26.12.18.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v4 3/3] hw/mips/malta: Use bootloader helper to set BAR
 registers
Date: Wed, 26 Oct 2022 21:18:21 +0200
Message-Id: <20221026191821.28167-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026191821.28167-1-philmd@linaro.org>
References: <20221026191821.28167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Translate embedded assembly into IO writes which is more
readable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210127065424.114125-4-jiaxun.yang@flygoat.com>
[PMD: Explode addresses/values to ease review/maintainance]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 79 +++++++++++++++++++++++--------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e24572c885..272d93eea7 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -867,56 +867,51 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     /* Second part of the bootloader */
     p = (uint32_t *) (base + 0x580);
 
-    /* Load BAR registers as done by YAMON */
-    stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
+    /*
+     * Load BAR registers as done by YAMON:
+     *
+     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
+     *  - set up PCI0 MEM0 at 0x10000000, size 0x7e00000
+     *  - set up PCI0 MEM1 at 0x18200000, size 0xbc00000
+     *
+     */
 
+    /* Bus endianess is always reversed */
 #if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c08df00);                  /* lui t0, 0xdf00 */
+#define cpu_to_gt32 cpu_to_le32
 #else
-    stl_p(p++, 0x340800df);                  /* ori t0, r0, 0x00df */
+#define cpu_to_gt32 cpu_to_be32
 #endif
-    stl_p(p++, 0xad280068);                  /* sw t0, 0x0068(t1) */
 
-    stl_p(p++, 0x3c09bbe0);                  /* lui t1, 0xbbe0 */
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&p, /* GT_ISD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
+                     cpu_to_gt32(0x1be00000 << 3));
 
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c08c000);                  /* lui t0, 0xc000 */
-#else
-    stl_p(p++, 0x340800c0);                  /* ori t0, r0, 0x00c0 */
-#endif
-    stl_p(p++, 0xad280048);                  /* sw t0, 0x0048(t1) */
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c084000);                  /* lui t0, 0x4000 */
-#else
-    stl_p(p++, 0x34080040);                  /* ori t0, r0, 0x0040 */
-#endif
-    stl_p(p++, 0xad280050);                  /* sw t0, 0x0050(t1) */
+    /* setup MEM-to-PCI0 mapping */
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(&p, /* GT_PCI0IOLD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
+                     cpu_to_gt32(0x18000000 << 3));
+    bl_gen_write_u32(&p, /* GT_PCI0IOHD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
+                     cpu_to_gt32(0x08000000 << 3));
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(&p, /* GT_PCI0M0LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
+                     cpu_to_gt32(0x10000000 << 3));
+    bl_gen_write_u32(&p, /* GT_PCI0M0HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
+                     cpu_to_gt32(0x07e00000 << 3));
 
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c088000);                  /* lui t0, 0x8000 */
-#else
-    stl_p(p++, 0x34080080);                  /* ori t0, r0, 0x0080 */
-#endif
-    stl_p(p++, 0xad280058);                  /* sw t0, 0x0058(t1) */
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c083f00);                  /* lui t0, 0x3f00 */
-#else
-    stl_p(p++, 0x3408003f);                  /* ori t0, r0, 0x003f */
-#endif
-    stl_p(p++, 0xad280060);                  /* sw t0, 0x0060(t1) */
+    bl_gen_write_u32(&p, /* GT_PCI0M1LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
+                     cpu_to_gt32(0x18200000 << 3));
+    bl_gen_write_u32(&p, /* GT_PCI0M1HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
+                     cpu_to_gt32(0x0bc00000 << 3));
 
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
-#else
-    stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
-#endif
-    stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
-#if TARGET_BIG_ENDIAN
-    stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
-#else
-    stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
-#endif
-    stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
+#undef cpu_to_gt32
 
     bl_gen_jump_kernel(&p,
                        true, ENVP_VADDR - 64,
-- 
2.37.3


