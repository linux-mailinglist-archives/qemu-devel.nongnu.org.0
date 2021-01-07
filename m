Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A885F2EE951
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:55:03 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeBK-0001mx-KJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdku-0004qZ-Jq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:44 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkr-0006TU-OD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:43 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k10so6364768wmi.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fXnJoY5COKKqaViQrzHGXO3P7g2CyIkmu5oDvOAw7V8=;
 b=O1qK4uUowbfAgF0pV9XHWYIIQaO0chpA4tklBN1Up+BJAoLZE0wIKBO2VDRscoKz56
 jP19Q0Su11gLV1fKdsc1opLqlp0xzAdFetHHneRdQYTnl+6xTxrrBj7KrPV0kV6GKgAj
 X8xAA414trpxr67UU5Ql/dfJgwK/7urzxPBQhCWsQlujCpSFopxKqz4JxUd9rF1p6uu4
 vLdWXdse1VirzPhq9L+qIM6HEMP1LUN/ph3DM0wpVzV5Snu9+D8z/kFvumRq4WXJmHXv
 ucjGtmwWYBC2YnRooDlKESI02N1uCeeo3bpQQSIDEM6L8UyDSi4V0ePyts1KFHLOpH78
 uoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fXnJoY5COKKqaViQrzHGXO3P7g2CyIkmu5oDvOAw7V8=;
 b=AP32C9gvLZL7rWhQQpZcfBlssBudm/5lBIMPrDNC5xW1/QCTqx0LPlWSVmv3h5NhMd
 PFdOGuC2vFFwQv2MVGJhpouhctokTCPZFgDiTZkARlmzvoxTrVqzqvirq4S14i6tSytU
 kvgyXFl1km9dvxB0OmKFXK9fGofejrzmuyFpwr1elxX2GSixub4z5Fl5qrl32/i8DGB0
 U5dl26TrXFR+R3YqCEYaFc5nfjD09IwMsxcynXF8Yru3nHkFdjlD2UC7EEjh05v5s6kA
 FSRD3x3MHPrpmF7plbQpzNrBun8pqkCF+8Ldq8mHC0+kkDyFTqxZjVXLS/0yoPZPedfS
 ABHQ==
X-Gm-Message-State: AOAM5301KXUNM+K/8zqaoW4q9lJ2Jj9mPqtJPAGXiJ6PdayTXyAAf+pq
 aLURVgp+cOZtmcvK7W1HZBg1COycaT8=
X-Google-Smtp-Source: ABdhPJx4Sw9YkvyMOSz1j6l4//C+swB7Ehawld7rbm9wWnEhdS49W2zJ3bBVSKrxYAHspGHLrfxgpA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr519327wmi.20.1610058459860;
 Thu, 07 Jan 2021 14:27:39 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w8sm10003601wrl.91.2021.01.07.14.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/66] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
Date: Thu,  7 Jan 2021 23:22:42 +0100
Message-Id: <20210107222253.20382-56-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

Add the LSA opcode to the MSA32 decodetree config, add DLSA
to a new config for the MSA64 ASE, and call decode_msa64()
in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-23-f4bug@amsat.org>
---
 target/mips/msa32.decode    |  4 ++++
 target/mips/msa64.decode    | 17 +++++++++++++++++
 target/mips/msa_translate.c | 14 ++++++++++++++
 target/mips/meson.build     |  1 +
 4 files changed, 36 insertions(+)
 create mode 100644 target/mips/msa64.decode

diff --git a/target/mips/msa32.decode b/target/mips/msa32.decode
index d69675132b8..0b2f0863251 100644
--- a/target/mips/msa32.decode
+++ b/target/mips/msa32.decode
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
 
diff --git a/target/mips/msa64.decode b/target/mips/msa64.decode
new file mode 100644
index 00000000000..8dcbbcd8538
--- /dev/null
+++ b/target/mips/msa64.decode
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
diff --git a/target/mips/msa_translate.c b/target/mips/msa_translate.c
index 8a48f889aa2..e97370e54c2 100644
--- a/target/mips/msa_translate.c
+++ b/target/mips/msa_translate.c
@@ -19,6 +19,7 @@
 
 /* Include the auto-generated decoder.  */
 #include "decode-msa32.c.inc"
+#include "decode-msa64.c.inc"
 
 #define OPC_MSA (0x1E << 26)
 
@@ -2266,7 +2267,20 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
+static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
+static bool trans_DLSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_DLSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn)
 {
+    if (TARGET_LONG_BITS == 64 && decode_msa64(ctx, insn)) {
+        return true;
+    }
     return decode_msa32(ctx, insn);
 }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9afee0ca955..21b75254047 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('msa32.decode', extra_args: [ '--static-decode=decode_msa32' ]),
+  decodetree.process('msa64.decode', extra_args: [ '--static-decode=decode_msa64' ]),
 ]
 
 mips_ss = ss.source_set()
-- 
2.26.2


