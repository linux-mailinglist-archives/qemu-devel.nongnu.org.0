Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6362DB6E6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:06:56 +0100 (CET)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJPC-0004uu-R8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHL-0003Zu-Aw
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:47 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHG-0003iv-GA
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:47 -0500
Received: by mail-ej1-x641.google.com with SMTP id ga15so30036003ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BnBuWwu/IR7HzibU0fSLa1btap3ty/kGytf5ZOVzJHw=;
 b=US6pT9hkIUe/3Y7u3abkxfxmo+g63uoofHU7oXDwqFCQZm1V3FKeZ5fDXzLgWMR+tz
 ZUIr8FArsHvKzwdU5ieVduhNmBORH2czavfCNyp2G3DaW1Wx7Y+dAOSt4ViEAcfknR4j
 NEDgCAFVKk+EIAx5IlI16zjC648EjQDBh+vWLjHPVKgPCIwWemlKmBw9hB648PyqxsGN
 VdYu36vVvnu1D9nYrydInoLe21pVmk0ZgN067MnXf6abBT+2DG+WabDXSuxUz78F/nNw
 ztxNkZsRG3MrTs1HcvdY+Er07tfLpecaOC2VF4tD5oP0KgRVvnanghVChVImnzbLu5mN
 nnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BnBuWwu/IR7HzibU0fSLa1btap3ty/kGytf5ZOVzJHw=;
 b=m1btd8j6BiXwt4rnxk1e2c7XabmwM401uy2YG1bW/eRWxl7Jmc+ni+nl3WwbnXJsff
 EovliEu+EsvugamxFLPQOhDsIavqK030lr0tiVGvufu0m0uROIxz4doDD8+vId0FKBs7
 73ySQi2L85twL5SXCnUE6kXrg8KxSivivr/0RBd6TRTmWpcnFB6vvVuxwGPZnZ6LfUUe
 wS0ViG82dw8e+LRO85tSRswCseesHb53UORgUbXSoqcxeo9rW+dAccZX8SjSEJ7w8UO2
 qQQRueqdWQS4sENlNGKSigbAvyC46p7St32eMAHzNxnsjXF2DJDSbOGoeJcz2Cg2wC9b
 xU1A==
X-Gm-Message-State: AOAM533f+mjguaJeUREJNtQlcoi/0CikYYnWVUGDk/R+12Wmr8QM4UeS
 l5q4C+hdh6KVdSaeMus9QVA=
X-Google-Smtp-Source: ABdhPJwWEmYN+znrgrxMg2p+03mYpoUKLrA8wM858BfPuk+pAWE4X4Nrr/vTEL+NY0y64W3QwD6D1g==
X-Received: by 2002:a17:906:705:: with SMTP id
 y5mr14673838ejb.428.1608073120174; 
 Tue, 15 Dec 2020 14:58:40 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 35sm19174328ede.0.2020.12.15.14.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/24] target/mips: Simplify MSA TCG logic
Date: Tue, 15 Dec 2020 23:57:40 +0100
Message-Id: <20201215225757.764263-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only decode MSA opcodes if MSA is present (implemented).

Now than check_msa_access() will only be called if MSA is
present, the only way to have MIPS_HFLAG_MSA unset is if
MSA is disabled (bit CP0C5_MSAEn cleared, see previous
commit). Therefore we can remove the 'reserved instruction'
exception.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index fc658b3be33..02ea184f9a3 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28568,13 +28568,8 @@ static inline int check_msa_access(DisasContext *ctx)
     }
 
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
-        if (ctx->insn_flags & ASE_MSA) {
-            generate_exception_end(ctx, EXCP_MSADIS);
-            return 0;
-        } else {
-            gen_reserved_instruction(ctx);
-            return 0;
-        }
+        generate_exception_end(ctx, EXCP_MSADIS);
+        return 0;
     }
     return 1;
 }
@@ -30418,7 +30413,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
 static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
-    check_insn(ctx, ASE_MSA);
+
     check_msa_access(ctx);
 
     switch (MASK_MSA_MINOR(opcode)) {
@@ -31048,9 +31043,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_BNZ_H:
         case OPC_BNZ_W:
         case OPC_BNZ_D:
-            check_insn(ctx, ASE_MSA);
-            gen_msa_branch(env, ctx, op1);
-            break;
+            if (ase_msa_available(env)) {
+                gen_msa_branch(env, ctx, op1);
+                break;
+            }
         default:
             MIPS_INVAL("cp1");
             gen_reserved_instruction(ctx);
@@ -31239,7 +31235,9 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
         } else {
             /* MDMX: Not implemented. */
-            gen_msa(env, ctx);
+            if (ase_msa_available(env)) {
+                gen_msa(env, ctx);
+            }
         }
         break;
     case OPC_PCREL:
-- 
2.26.2


