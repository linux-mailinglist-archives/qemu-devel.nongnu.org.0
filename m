Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E651B2F6698
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:02:57 +0100 (CET)
Received: from localhost ([::1]:35328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l061Q-0005Qr-ML
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NF-00040A-Pp
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05N8-0000Tq-Hg
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id e25so5226716wme.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IVQfD/3Vp5h4X9RtCu6DOTaRAYjm9w2H6u44f+7IHiI=;
 b=fSJwad6lVsMuTlyANRjvpa6BYsFnIXV13RO+32kvIuZLD8AVhbRxBmQTGPmKG7vZNb
 9NycJm0EIc/tegtNNSPbURZcPj3i7yeOozu6CnY+IoKNtk/frnPx3TG3i/+wME1l9Cz+
 10B2azk+jS0ynvr+RDtDbWKEniQFk7IPToJoXJnkbvOhsfOMye/VTp9NILxLQ3IL0tnV
 x10jcel9HTkulkpReZHXxRxRYQUvvJ6qaqT7LLvfIAbJSMvuKYZ49LY+sy/SBc2CfwAG
 XMZc/zzu/plL2TThh2C6KcB/N7Xqt/PfrRASLqK76xDxPPUYz3Ag2oZPMYhfEgVSkEcX
 bHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IVQfD/3Vp5h4X9RtCu6DOTaRAYjm9w2H6u44f+7IHiI=;
 b=gdDYoqFFDrF2ASz273eMCx21wkZjY2PnL4leps0cvUZyF/1aj2ltEMYnBEF2tpXTIv
 47mNQGTO3vnmFmoipSQMJkDgZwQU9kLldwrdKiwPaQ7lClwjmkhgH+ovWSmtkWxUHy4/
 HdoYu+zHljFhrnAptNaGeL7SX1QHNx+HzJcQCyMg3IxqO4xb2ptrIM5WLUPUGdJpm0mv
 oYRBz6+4+R8FzQxk2sItPn8bnxLMQrLUKdcrs4luz4pgRkUmua0mwsH0c4OUh2pb+wLq
 M3+C0/NtN+OuAG32KYAbG41lrkXIDNep5h+oH/LTus/p2ZPQ823vOVEpVekkgMVsrf/a
 GhLg==
X-Gm-Message-State: AOAM531bOJUVbiYAQKFdMpPxuja2kROUyKqzMhNzIxcfoaVlVIHshmZs
 BZG0gJ81j2qs1lGt8q5V809TsHrWh3I=
X-Google-Smtp-Source: ABdhPJySljGk/ou10LW1rkJcqrrVcwXyEXuFVQwphzN7SBp/s2DTzHMxTss0+h9Oay9R9tgeXCBAXQ==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr4579154wmc.25.1610641275310; 
 Thu, 14 Jan 2021 08:21:15 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b132sm9722556wmh.21.2021.01.14.08.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 55/69] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
Date: Thu, 14 Jan 2021 17:20:09 +0100
Message-Id: <20210114162016.2901557-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the LSA opcode to the MSA32 decodetree config, add DLSA
to a new config for the MSA64 ASE, and call decode_msa64()
in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-23-f4bug@amsat.org>
---
 target/mips/msa32.decode    |  5 +++++
 target/mips/msa64.decode    | 17 +++++++++++++++++
 target/mips/msa_translate.c | 14 ++++++++++++++
 target/mips/meson.build     |  1 +
 4 files changed, 37 insertions(+)
 create mode 100644 target/mips/msa64.decode

diff --git a/target/mips/msa32.decode b/target/mips/msa32.decode
index d69675132b8..ca200e373b1 100644
--- a/target/mips/msa32.decode
+++ b/target/mips/msa32.decode
@@ -10,11 +10,16 @@
 #       (Document Number: MD00866-2B-MSA32-AFP-01.12)
 #
 
+&rtype              rs rt rd sa
+
 &msa_bz             df wt s16
 
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
 @bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
+LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
 BZ_V                010001 01011  ..... ................    @bz
 BNZ_V               010001 01111  ..... ................    @bz
 
diff --git a/target/mips/msa64.decode b/target/mips/msa64.decode
new file mode 100644
index 00000000000..d2442474d0b
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
+&rtype              rs rt rd sa !extern
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
+
+DLSA                 000000 ..... ..... ..... 000 .. 010101 @lsa
diff --git a/target/mips/msa_translate.c b/target/mips/msa_translate.c
index 8a48f889aa2..ae6587edf69 100644
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
 
+static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
+{
+    return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
+static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
+{
+    return gen_dlsa(ctx, a->rd, a->rt, a->rs, a->sa);
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
index 3810554343c..b63d8f150f1 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
+  decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
 ]
 
 mips_ss = ss.source_set()
-- 
2.26.2


