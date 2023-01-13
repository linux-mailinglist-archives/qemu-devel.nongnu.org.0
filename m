Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110C669EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:48:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMH7-0002Fr-Bp; Fri, 13 Jan 2023 10:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMH5-0002FF-Hz
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMH3-0006PD-Vf
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id co23so21470999wrb.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGNLpc3KFK10A/aPMRWO52DZ2IuO8Bnj/8mkbLJTAeI=;
 b=t7kQubY6RHVLKS/DKP2mYUJqszwP5zOpbUtCTkrk/SFQkfaq1oYHSlBN7JffZUQRAv
 OdsPvcin9nhBtonni0cW+a4VgPMYMmpwUakOleJ52vd7GmQwzOePA81wYRHzhLK3hDKY
 iUee/k6imT6WZhYrPG3m7n+15oqm99ZyulZp7mscmchtnNobZXqb15WLX9OATviHoh3W
 AIaRxCU54uj2u84Td60ouG1Pz3SOCRTMsSlI6vjarzhdnQeqAj3m293wHdlPu9Y3d8Sb
 NI3Yz2HlKHOLs4NQPV0tTPuzw7BgCD13NqAFQC2OKaUqBnMS1Nq2zcxNyrrHMKsBUVuM
 dXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGNLpc3KFK10A/aPMRWO52DZ2IuO8Bnj/8mkbLJTAeI=;
 b=YFwE2AzQ+lm474r20/5JrUn/xmf1GXx7prpjr/uHDdxP0gzcsKEUj0XIOju20L11I2
 mCIqfg4wKLiM8uGR5/zGJA5qGC3wdulNbaBjygI1CX2/JjM+LS6NedQAr+uXxzcmAL4o
 gt2nDIPRVNTcxmA5pnV8iVRIeVwdKtY9Edns3VtQsh5N5hNxUTV9yrYZntJv3tUkiU36
 et8cxoQSmyZIxsSaBlackJys3pNjMgbXF+P7smpGhfvjgkbXARRHp6fdYcFi0Eo/RAkc
 IqlB1Xmniqqm4TPsNa2YRtUCFgY8Tbu4Ptjle7jExGEpF5+R5SI6qf/N9wIDTYOcdkhI
 Ve3A==
X-Gm-Message-State: AFqh2kqUe9wqWnn3CrO/fzBUPpZovibO8t5wHA9WqjDCevp5TzdBdyvY
 6s+l3+eqyXCbwgIzgIUyFvvUNfvk08iXM213
X-Google-Smtp-Source: AMrXdXvpFX1ttsOqcg0gprsVDHlaIKnvomif+45BSY1B8NwixmikBTj0YC1YnKZdz6QI6hf7posOFg==
X-Received: by 2002:adf:a408:0:b0:26f:6bf:348f with SMTP id
 d8-20020adfa408000000b0026f06bf348fmr196950wra.6.1673624839949; 
 Fri, 13 Jan 2023 07:47:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm19248538wrq.70.2023.01.13.07.47.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/46] hw/mips/malta: Use bootloader generator API for nanoMIPS
 CPUs (5/5)
Date: Fri, 13 Jan 2023 16:45:08 +0100
Message-Id: <20230113154532.49979-23-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Part 5/5: Convert jumping to kernel

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-11-philmd@linaro.org>
---
 hw/mips/malta.c | 68 ++++++++-----------------------------------------
 1 file changed, 11 insertions(+), 57 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e618513e35..b66dad0510 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -625,11 +625,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     /* Small bootloader */
     p = (uint16_t *)base;
 
-#define NM_HI1(VAL) (((VAL) >> 16) & 0x1f)
-#define NM_HI2(VAL) \
-          (((VAL) & 0xf000) | (((VAL) >> 19) & 0xffc) | (((VAL) >> 31) & 0x1))
-#define NM_LO(VAL)  ((VAL) & 0xfff)
-
     stw_p(p++, 0x2800); stw_p(p++, 0x001c);
                                 /* bc to_here */
     stw_p(p++, 0x8000); stw_p(p++, 0xc000);
@@ -648,46 +643,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                 /* nop */
 
     /* to_here: */
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed    */
-        stw_p(p++, 0x8000); stw_p(p++, 0xc000);
-                                /* nop                          */
-    } else {
-        stw_p(p++, 0x0080); stw_p(p++, 0x0002);
-                                /* li a0,2                      */
-    }
-
-    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_VADDR - 64));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR - 64));
-                                /* lui sp,%hi(ENVP_VADDR - 64)   */
-
-    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_VADDR - 64));
-                                /* ori sp,sp,%lo(ENVP_VADDR - 64) */
-
-    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_VADDR));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR));
-                                /* lui a1,%hi(ENVP_VADDR)        */
-
-    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_VADDR));
-                                /* ori a1,a1,%lo(ENVP_VADDR)     */
-
-    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_VADDR + 8));
-
-    stw_p(p++, NM_HI2(ENVP_VADDR + 8));
-                                /* lui a2,%hi(ENVP_VADDR + 8)    */
-
-    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_VADDR + 8));
-                                /* ori a2,a2,%lo(ENVP_VADDR + 8) */
-
-    stw_p(p++, 0xe0e0 | NM_HI1(loaderparams.ram_low_size));
-
-    stw_p(p++, NM_HI2(loaderparams.ram_low_size));
-                                /* lui a3,%hi(loaderparams.ram_low_size) */
-
-    stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
-                                /* ori a3,a3,%lo(loaderparams.ram_low_size) */
 
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32 cpu_to_le32
@@ -725,20 +680,19 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
                      cpu_to_gt32(0x0bc00000 << 3));
 
-    p = v;
-
 #undef cpu_to_gt32
 
-    stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
-
-    stw_p(p++, NM_HI2(kernel_entry));
-                                /* lui t9,%hi(kernel_entry)     */
-
-    stw_p(p++, 0x8339); stw_p(p++, NM_LO(kernel_entry));
-                                /* ori t9,t9,%lo(kernel_entry)  */
-
-    stw_p(p++, 0x4bf9); stw_p(p++, 0x0000);
-                                /* jalrc   t8                   */
+    bl_gen_jump_kernel(&v,
+                       true, ENVP_VADDR - 64,
+                       /*
+                        * If semihosting is used, arguments have already been
+                        * passed, so we preserve $a0.
+                        */
+                       !semihosting_get_argc(), 2,
+                       true, ENVP_VADDR,
+                       true, ENVP_VADDR + 8,
+                       true, loaderparams.ram_low_size,
+                       kernel_entry);
 }
 
 /*
-- 
2.38.1


