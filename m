Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C22D3579
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:44:45 +0100 (CET)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkmq-0003kd-Tm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjl-0004Fk-DB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:31 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjh-0008FX-2C
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:26 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lt17so26595047ejb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egytU2KQefn/Es9E3Yg/Fw4QqJAhSkiglactlGUyVCU=;
 b=Em4kDzEydRSpWB0wkn/pAjsy2bc0IBWLImt3h9jogbBxzBmm8fIP/aEOM64pg45IrR
 MAAKDjjYfFc6dNEKimwUNTwuaqVAcygzH8lBqKMZMMSrLLGvVpyECNvRJydKFRbzNAF5
 aEDRqcWlXRTW1PrukmpqS4PPLDH9U2KK35CwoiF1qUZ2GddIinjsGoRHlcUP2KSSuxGK
 2SEjO72u0rsk56f3TnOMJo2RZUs3N3noGr0JdxjE09YBoyOfPsz6Cb44Orbnw294g4M+
 +1xBfxI5BuO+gUE16fIvzUwAjc1flrqvneJ8vMhqdIRGL/iJEC1kUuwXwL1ZXTuRnr9D
 GTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=egytU2KQefn/Es9E3Yg/Fw4QqJAhSkiglactlGUyVCU=;
 b=A+8iG4VHJ+lg153HvpJYmC+47NB5BGMKaq8pUeIjWau0YMBPRiO7D2HfFD2USLFEt/
 qABMmzUDZfoPJSzUajET7u/LAq71PXT9NeBuphq7Q8DHVKZyeutgyVNAceR+7bckfUYj
 ViU1TGRBZ3T+Ukl2sDMmkUDnWhmyjLa3rJapRgrYN31IUq5Rc1Vk7UPA9sDyb0AS2U36
 WHclRdYx44hvCa2ONxP/ssFC8OksujUPdv+7o9mLoDXuyczbg9zGqwpqzP/0LzdHSS7G
 z1VedDjsvG2OKHaUm+T+gsl7OuQ/+95AdeqxnC4Od+UezGTiA/+iCRuf+sLvvDBEp2Xo
 L+gw==
X-Gm-Message-State: AOAM530FQgg2/nBu3x8LLhMckr/U2/JmGGun7KEqhYaZx1FkpSl8BtJ6
 Gs8tVrW4YFEWSCRpPcWNB51TG4+Mr8k=
X-Google-Smtp-Source: ABdhPJw8goCIEoICDSfUVecsS7ZFt20DYxjX+sKYEKAAubi/XgQE8ru6zltSk8fFiIchfYRUL9S61g==
X-Received: by 2002:a17:906:26c6:: with SMTP id
 u6mr24291050ejc.349.1607459842774; 
 Tue, 08 Dec 2020 12:37:22 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o11sm16729199ejh.55.2020.12.08.12.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/13] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
Date: Tue,  8 Dec 2020 21:36:54 +0100
Message-Id: <20201208203704.243704-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the LSA opcode to the MSA32 decodetree config, add DLSA
to a new config for the MSA64 ASE, and call decode_msa64()
in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h         |  3 +++
 target/mips/mod-msa32.decode    |  4 ++++
 target/mips/mod-msa64.decode    | 17 +++++++++++++++++
 target/mips/mod-msa_translate.c | 15 +++++++++++++++
 target/mips/translate.c         |  5 +++++
 target/mips/meson.build         |  5 +++++
 6 files changed, 49 insertions(+)
 create mode 100644 target/mips/mod-msa64.decode

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 4eb218e2c9f..00601232b97 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -97,5 +97,8 @@ void msa_translate_init(void);
 
 /* decodetree generated */
 bool decode_msa32(DisasContext *ctx, uint32_t insn);
+#if defined(TARGET_MIPS64)
+bool decode_msa64(DisasContext *ctx, uint32_t insn);
+#endif
 
 #endif
diff --git a/target/mips/mod-msa32.decode b/target/mips/mod-msa32.decode
index d69675132b8..0b2f0863251 100644
--- a/target/mips/mod-msa32.decode
+++ b/target/mips/mod-msa32.decode
@@ -10,11 +10,15 @@
 #       (Document Number: MD00866-2B-MSA32-AFP-01.12)
 #
 
+&lsa                rd rt rs sa
 &msa_bz             df wt s16
 
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
 @bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
+LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
 BZ_V                010001 01011  ..... ................    @bz
 BNZ_V               010001 01111  ..... ................    @bz
 
diff --git a/target/mips/mod-msa64.decode b/target/mips/mod-msa64.decode
new file mode 100644
index 00000000000..8dcbbcd8538
--- /dev/null
+++ b/target/mips/mod-msa64.decode
@@ -0,0 +1,17 @@
+# MIPS SIMD Architecture Module instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume IV-j
+#       The MIPS64 SIMD Architecture Module, Revision 1.12
+#       (Document Number: MD00868-1D-MSA64-AFP-01.12)
+#
+
+&lsa                rd rt rs sa !extern
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
+
+DLSA                 000000 ..... ..... ..... 000 .. 010101 @lsa
diff --git a/target/mips/mod-msa_translate.c b/target/mips/mod-msa_translate.c
index 7e7fc0644ff..7af0c2fd657 100644
--- a/target/mips/mod-msa_translate.c
+++ b/target/mips/mod-msa_translate.c
@@ -20,6 +20,9 @@
 
 /* Include the auto-generated decoder.  */
 #include "decode-mod-msa32.c.inc"
+#if defined(TARGET_MIPS64)
+#include "decode-mod-msa64.c.inc"
+#endif /* TARGET_MIPS64 */
 
 #define OPC_MSA (0x1E << 26)
 
@@ -2268,3 +2271,15 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 
     return true;
 }
+
+static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
+#if defined(TARGET_MIPS64)
+static bool trans_DLSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_DLSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+#endif /* TARGET_MIPS64 */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 752a06afa21..b3c45d6211a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28311,6 +28311,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     /* Transition to the auto-generated decoder.  */
 
     /* ISA Extensions */
+#if defined(TARGET_MIPS64)
+    if (ase_msa_available(env) && decode_msa64(ctx, ctx->opcode)) {
+        return;
+    }
+#endif /* TARGET_MIPS64 */
     if (ase_msa_available(env) && decode_msa32(ctx, ctx->opcode)) {
         return;
     }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9e42c341a90..124b5f7d49d 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,6 +1,9 @@
 gen = [
   decodetree.process('mod-msa32.decode', extra_args: [ '--decode=decode_msa32' ]),
 ]
+gen64 = [
+  decodetree.process('mod-msa64.decode', extra_args: [ '--decode=decode_msa64' ]),
+]
 
 mips_ss = ss.source_set()
 mips_ss.add(gen)
@@ -18,6 +21,8 @@
   'translate_addr_const.c',
   'mod-msa_translate.c',
 ))
+mips_ss.add(when: 'TARGET_MIPS64', if_true: gen64)
+
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 mips_softmmu_ss = ss.source_set()
-- 
2.26.2


