Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FFF2EE8C0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:32:38 +0100 (CET)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdpd-0002Qp-Ur
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjd-0002aA-Q2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjc-00063x-7F
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id g25so5687958wmh.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfYlsVfQrXnabjTXXkFkj4bzS4FCzoFbCGst2ujqd0Q=;
 b=pW1Zb8pev9GO4TUM9GY6gZDLX4t4GaeD4uraukSwhqJJkoUA4i4lRS5n497MFqD4eF
 VHvCngigU9DZrCP5g6LmBL736BkvhGwf9Fe4Bqx3yDpfwGcX6u3e8MtfZRLqrYdXCem7
 vZ4fkI0op3/4/p0tKvuH+IVaYT56LZOTWJbVC0aZ8Zas6hX3qwvLmjMpt93Xoaaus6ii
 yoWxFhcczE4vkgUQIaVqdRPE3SWP4JvkY1XuICN6279OG4Vy2f4cLe6vmaQTBbkFQ+Tk
 JBiKA0DPw3QG/OndqLZPXRTkfZOmGbdpZ0WTBkSFC1Us1qG7f6eTSFbJoAqwi065YXD2
 okfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VfYlsVfQrXnabjTXXkFkj4bzS4FCzoFbCGst2ujqd0Q=;
 b=I7qELvasTb2vnEnExGCg2rfW6xIlRddouRhMyAB7FDQrYz4U2ripZAftJpNm1ZNfev
 GreDiuVX56AAL45Rd+2BXLZ+b2gDJMDtjrR/Noq2cmngZYUVPv6aEawzZG5Nj7FHGT4j
 Wx3T2dWgMY7nX6HkCy66zW2+0IzgORTJ66V77MHg8KNNffCBWwxrruxS8yUkA0anv0I8
 SVYUe5SOcmxXW7tz1RcJV4nQfKzxxvrVR8mXYcftjahwhpVlcZeRiTKQtQ4yzrIoFYIa
 MMkTH8Q1e3Zsl+VXKQoPZtFN8ex5c5YsPXhxZ03s8m3JfO3kQE7WoPKu1/QzBnZ2WaRY
 vreA==
X-Gm-Message-State: AOAM530+prhVi4y+2CfJbAvqPQJ91LX90KYByguC9OC9xlZ59wUb47O0
 gbm+d12ZFr6FwNDvluu582hLsMKbbVw=
X-Google-Smtp-Source: ABdhPJyuyk/uuo1jE+1Ma9y+rdP3wcRZcepOSreGLlzAjvYUHlv2HHczclLyJP+4aKOK9Wz7lwVN/w==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr503813wml.160.1610058382799; 
 Thu, 07 Jan 2021 14:26:22 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z6sm10681403wrw.58.2021.01.07.14.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/66] target/mips: Simplify MSA TCG logic
Date: Thu,  7 Jan 2021 23:22:27 +0100
Message-Id: <20210107222253.20382-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-5-f4bug@amsat.org>
---
 target/mips/translate.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c01db5f9d39..e3cea5899f3 100644
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
@@ -31048,9 +31043,11 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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
+            /* fall through */
         default:
             MIPS_INVAL("cp1");
             gen_reserved_instruction(ctx);
@@ -31239,7 +31236,9 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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


