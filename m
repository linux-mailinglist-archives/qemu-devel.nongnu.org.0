Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BB2E9FED
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:22:22 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYF3-0006do-AI
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5d-00071F-SK
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5c-0007wN-9D
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id c124so599547wma.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzS6CmYENIvHrXJm6AYrCynCfObCNaLAeaEBzOk9eFM=;
 b=kuviyC3bvcNL1c3FKSBJyLtiz6cjb2Zu2xb4KFt+rvzbW/7e9vn9ThgXG6klLyO4SW
 0N0gjOf9ZJcg73NeqTpTcoX/OY51VTPxN763ATmJyLdBh+2JbDVazq62f0Ve7BBz0PAZ
 H+ZeVWZMO4LZ3tEapHP0zVGD/hum148U6DXQuQbiAy8sdwsjpaTcEH7cnHKxbXpqi/Ck
 A/IpqKam4TLg83i7giX1xirJ+kic1BRkaJha0XytRhCQafs8ltc0AzKJ4gvL/jEpBUNz
 qy2VhVc5cfsRRpvMI9r+ni0EsmO/b4vYZzD2Av+lvDiNyX0fTjJCxiSc2C/X6wIfuXOF
 NPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mzS6CmYENIvHrXJm6AYrCynCfObCNaLAeaEBzOk9eFM=;
 b=dS5A50SA0cJ5EpIg844JBtMn22VMNtOk7vxVdU2u2/UDeOoRZy7CkheXCvvxggGs/v
 SPoJ2pe3+DuMch5TVOckFVPvwl/+X5QfMPJLVTNPqMNesiluCMNOC9gZI/PoWTKV6VO9
 zTyWiQQzKg1wEuIeSm+OcMMPYhb1FzeUf/DR/uDqm2bm72b7jx3zleJaG9OdKckrh00D
 FE92bn7dYbpa7D68WowzAkAWTmANK7brS79Jr+g/uFaS2WP2gqFzeKgtDr+qm4kgbXWL
 3ZhtzB+Mc2GnuCc1bH3LjBwAiVAvYiZS+jhTp0FMtkyCirHbYyAAAEv4XrEaGGA1SAgl
 qPWA==
X-Gm-Message-State: AOAM530XBmfORmWDLb068QEz0woInHljABJpBDl1N9WzsVOo/hd33uBR
 /ILG7hT0/KiY2vRbECAy7/Q3RlBR7WI=
X-Google-Smtp-Source: ABdhPJxpry71DEsr5XhyFZGdUco/OCYn0NYd6V0jdZ1HCyUziiKXaQI1mBSao6vUBxsKQmnF/rK4Ow==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr823613wmf.22.1609798354425;
 Mon, 04 Jan 2021 14:12:34 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r82sm1203228wma.18.2021.01.04.14.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] target/mips/mips-defs: Use ISA_MIPS32R2 definition
 to check Release 2
Date: Mon,  4 Jan 2021 23:11:46 +0100
Message-Id: <20210104221154.3127610-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R2 definition to check if the Release 2
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R2 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 3 +--
 linux-user/mips/cpu_loop.c | 1 -
 target/mips/translate.c    | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 23ce8b8406f..b36b59c12d3 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -18,7 +18,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -78,7 +77,7 @@
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32R1 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index cfe7ba5c47d..f0831379cc4 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -385,7 +385,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS64R2 ||
                               env->insn_flags & ISA_MIPS32R6 ||
                               env->insn_flags & ISA_MIPS64R6;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 172027f9d6e..9fc9dedf30d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28621,7 +28621,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DINSM:
     case OPC_DINSU:
     case OPC_DINS:
-        check_insn(ctx, ISA_MIPS64R2);
+        check_insn(ctx, ISA_MIPS32R2);
         check_mips_64(ctx);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
@@ -28641,7 +28641,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS64R2);
+            check_insn(ctx, ISA_MIPS32R2);
             check_mips_64(ctx);
             op2 = MASK_DBSHFL(ctx->opcode);
             gen_bshfl(ctx, op2, rt, rd);
-- 
2.26.2


