Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DEC2D1F37
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:46:30 +0100 (CET)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR9B-0000Sq-J0
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0T-0003jz-Po
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:29 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0R-0001D4-Ps
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:29 -0500
Received: by mail-ed1-x544.google.com with SMTP id c7so15768882edv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EM+VJnj9N5+Eo9D9uZ5ImcarVVv2XQ17VoxaCesAks=;
 b=qcON2vRUzK9jDc9B04+NV+rpqvRemQSaXmhQe7iGcQ/CZdr5KMjVd66uY4QlxdnJqj
 2D6aWArTGBrgnQTsmXA8xiyCH6lUObZxwX1sW05zgQyNwzApuwNHp7x+LvDzRVhej71V
 K0FozBgR6tiHwbSRK1yQA0hWa2nb1EGuTLGu/vbFnn6B9wup0H4uAD2L03qsWGykslC+
 60syOPQWPqJ3Aq8f2sdTgSOlFX/4Ereeu8L3eQ407hX0yXk96MK1Ghxqc9upv80c4x7x
 Tro0Fid6/Y1Wy3ygjnzt9jNtGQcgigQwzpM+5aMMbVKna1YqeORR59HqH4KZIia5P16Z
 GDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2EM+VJnj9N5+Eo9D9uZ5ImcarVVv2XQ17VoxaCesAks=;
 b=omXXk8CVLgQFt4pWdkr/oKAZzqIrwprICn/kNjTkdfzMQzBCCovhSnlAGNonhCI2ol
 vw6+TtVcHNCjrfKQCmDwTHQ/hA0u0mwZ3StbTgN9ERE+fGuudVIfMCFAR2+Mfa8p4JfU
 u0VswFphCWNooaAMhPMCCC6HnM0Nkp5AhpZho8BtdolL/uMlY4t8Vhb6Dgd9atvgYOVL
 EnjpvXnkTNJ8OWfkpvQWFWJ4CMkebkTwRBukCU+tWcjtIaLovDp9eBI18Tc7VohahnIh
 8p1OWmbYn4Yyqg+PLy68YCIpwrCfEISyb9MjbAn1xG84LAr0h+JZrcwm/AEmM34EAVo9
 RWpw==
X-Gm-Message-State: AOAM5336BVK7Avz/CXSDrXecpVbmFpuMWYmNzZ5DscH5KGCG8daqNRUg
 3PVTaSNxPKvOZ8/2wKzA/MYTViMIHgw=
X-Google-Smtp-Source: ABdhPJzTkLxWJ4xhekHbm421HeMQSVtuxyRdyKD/XgMSP91/4CCBemltSQBKeZJy1HJ8wE9Hn9H7Qg==
X-Received: by 2002:a05:6402:c83:: with SMTP id
 cm3mr22139357edb.189.1607387846066; 
 Mon, 07 Dec 2020 16:37:26 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b21sm15304035edr.53.2020.12.07.16.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] target/mips: Simplify MSA TCG logic
Date: Tue,  8 Dec 2020 01:36:49 +0100
Message-Id: <20201208003702.4088927-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
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
---
 target/mips/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index b20cf1b52d9..da0cb98df09 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28576,13 +28576,8 @@ static inline int check_msa_access(DisasContext *ctx)
     }
 
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
-        if (ctx->insn_flags & ASE_MSA) {
-            generate_exception_end(ctx, EXCP_MSADIS);
-            return 0;
-        } else {
-            generate_exception_end(ctx, EXCP_RI);
-            return 0;
-        }
+        generate_exception_end(ctx, EXCP_MSADIS);
+        return 0;
     }
     return 1;
 }
@@ -30426,7 +30421,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
 static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
-    check_insn(ctx, ASE_MSA);
+
     check_msa_access(ctx);
 
     switch (MASK_MSA_MINOR(opcode)) {
@@ -31073,9 +31068,10 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
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
             generate_exception_end(ctx, EXCP_RI);
@@ -31264,7 +31260,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
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


