Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B86648F90
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CP-0003Rp-28; Sat, 10 Dec 2022 10:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42C9-0003O0-Hh
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42C7-0004IU-Dr
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id v7so1981308wmn.0
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrUqSoqcBKcPC/EIQSxB/g68+9dWnNAnr0RdD7MvGfE=;
 b=Mh3XIKg9gQlv3kGLBcQOwyrC/VYzC9TaWWyQadwmO6aQwTQ3Gkt7QI5DjQxgtIwrNB
 7y2+Ld9RpU3MI2/pqCedvdA9AouhEmyZsUTuCoYg1Dr6loo5KPi4Ngmcn7vbz52nq/YQ
 WmT3dsXdvFNPPZyG2X8XIYfB6wbWBiD/VL9mzaCXt41qjZv6uYdZ2kAKRwlIRyXhG+Ba
 8U6lJwPv91RtLoHlcg27AUGCJUZUpgHTFoKTkR3/j8hJHV7YW4y8tTg5RiFKGpxw0TK9
 H2TC1qR+qabekSHUiXA6g6fmJys6/ouuwx6ZOhWrRKugsAetGdJS5AJl7/5JJkDYg+2W
 7+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrUqSoqcBKcPC/EIQSxB/g68+9dWnNAnr0RdD7MvGfE=;
 b=zazAXxxU2p0v4bzY6QS8vDstdmpQAHS/wwS4IcuPhDsQxQKgdlbyGRbxkFT29aJpms
 WgFmgW2iIy+bQ+LwcKT9kegKYb4QwagRsPHRwz39ssMV4ctvaLQknXndd5s/pSGJr4Ok
 +Jl+pqwiMb8yiP0TnnCPW6hT5yXwHNkyttbZQ8z5fhWd/EXmrIy/IJPELBp45AaqcPPL
 2/xYWSo1n2Xbuq1DCaEbYKDYGtW6Cczv0USqovp3IV0ajXAkvF7O4OGW/2b71g/Jx2iA
 lTfyYavy+jkw/QoLcqoOUx5WQd1uPUX0IYbbm/xcBUVFrddcQuqQbdz/OYc6ns2O7wAq
 lIFA==
X-Gm-Message-State: ANoB5pmwlRZF0/5R3udHXGodbrktfgNBDDPKzQf0LfyQdgWOThPiVXdD
 k42thWo3ex3kAcBjfYf28h9aR0EfjwleMm2cbN0=
X-Google-Smtp-Source: AA0mqf7TIT/Ie/basT+RM1Axzd4PGcFZUs9A40y/7aE/zrpMwVw9C0eb3aWa84Ec7hxHFuftpI+Ihg==
X-Received: by 2002:a05:600c:3790:b0:3cf:8e70:f34e with SMTP id
 o16-20020a05600c379000b003cf8e70f34emr8079106wmr.14.1670687717085; 
 Sat, 10 Dec 2022 07:55:17 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a7bc5c3000000b003cfd4e6400csm3192893wmk.19.2022.12.10.07.55.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 2/7] hw/mips/bootloader: Pass 32-bit immediate value
 to LUI opcode generator
Date: Sat, 10 Dec 2022 16:54:57 +0100
Message-Id: <20221210155502.74609-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

While 32-bit wide instructions ISA restricts LUI to a 16-bit
immediate value, some 16-bit ones allow up to 20-bit immediate
(in particular nanoMIPS).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/bootloader.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index fc14eb0894..3a4573118c 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -116,10 +116,11 @@ static void bl_gen_jalr(void **p, bl_reg rs)
     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
 }
 
-static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
+static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
 {
     /* R6: It's a alias of AUI with RS = 0 */
-    bl_gen_i_type(p, 0x0f, 0, rt, imm);
+    assert(imm32 <= UINT16_MAX);
+    bl_gen_i_type(p, 0x0f, 0, rt, extract32(imm32, 16, 16));
 }
 
 static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
@@ -142,10 +143,10 @@ static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 }
 
 /* Pseudo instructions */
-static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
+static void bl_gen_li(void **p, bl_reg rt, uint32_t imm32)
 {
-    bl_gen_lui(p, rt, extract32(imm, 16, 16));
-    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+    bl_gen_lui(p, rt, imm32);
+    bl_gen_ori(p, rt, rt, extract32(imm32, 0, 16));
 }
 
 static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
-- 
2.38.1


