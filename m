Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6A2EE98C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:03:57 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeJx-0004rj-0N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkz-0004xd-Mt
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:49 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkx-0006Ut-MX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d26so7091124wrb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6z86y274+C7xcqFi/N79ZkHJjYYrdiH8WHVp+WKoviw=;
 b=uAZJuAqMkllQrDsX4nqlkrU8Zg8x3UjM+OgNNBVR4QmmaHScOqdeMJekk7Ngsa5czr
 FLoqi6FvROm/AQm0m97Ha3v7RG2n07jsRrJ4YKJrhNJdvO8Fhj29/NEHBrr2FLPcKLhG
 KggXA8Z4oj9RArPyrxA/7nU6b+zKcGhpsP0y7m4aIIcH0iZQY84xPVrawno0eBsQ9qKL
 I3bI6dBJMzTZ4O+GWDjqPGRUWTCmRX03nCptX8NG8pJ62YCw8zHLyBz4/SEf1peBhRnr
 Uc9TnQj0chhf/il1UeibVhUwUP1dhjduUb6Yh8g1gGeygwQxvFBPESMWfAZQXAl5g6vf
 6avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6z86y274+C7xcqFi/N79ZkHJjYYrdiH8WHVp+WKoviw=;
 b=VIFEgpE31sPZNN5nQVvDwmeym7BoP4higMCUUQ/iRmKtIgz3FYrunSraVnFdd8b9Qe
 /OsgkATxeb+anRcvBBJDVGgLeCmn93E8TimfQgiVOtmRPT3msuUcCrz5KvLBbmu6mXVA
 KUH/H+P+BrGmjZ3t7ZAEQPt7h/aOdfnsa3L31v+T24JKIVmiyocwHmQP2HvLzLuGVNaP
 SelUJzMNgzn1qY5dlg9BZXTN2TKhr3z3vB+cbrnTcCgwflixobqKVUMfnpYtpAB5Wh/b
 V7g+SIF3e89Om4bXmizyNPY4jm3sNmr/nRQwNm3jUI2rqSXcFtW2xWpcqGLvgSzQeiV8
 CSSQ==
X-Gm-Message-State: AOAM532VIWaz5DoAKmByCYe0Hv3RNL8jluiRVMckpibvFB68n5IRx+oX
 WuxXc6XrVIWk9QWBN19ViWc0ONbtKJE=
X-Google-Smtp-Source: ABdhPJyL6kNVJRlZ5scQksDQQqnFk6VuaNfLcIavVG3srQbvSUfFrJCIe0JFD6edKv135PKwSec01w==
X-Received: by 2002:a05:6000:1811:: with SMTP id
 m17mr660527wrh.67.1610058464943; 
 Thu, 07 Jan 2021 14:27:44 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m2sm9138739wml.34.2021.01.07.14.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/66] target/mips: Introduce decodetree helpers for Release6
 LSA/DLSA opcodes
Date: Thu,  7 Jan 2021 23:22:43 +0100
Message-Id: <20210107222253.20382-57-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

LSA and LDSA opcodes are also available with MIPS release 6.
Introduce the decodetree config files and call the decode()
helpers in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-24-f4bug@amsat.org>
---
 target/mips/translate.h      |  1 +
 target/mips/mips32r6.decode  | 17 +++++++++++++++++
 target/mips/mips64r6.decode  | 17 +++++++++++++++++
 target/mips/rel6_translate.c | 37 ++++++++++++++++++++++++++++++++++++
 target/mips/translate.c      |  5 +++++
 target/mips/meson.build      |  3 +++
 6 files changed, 80 insertions(+)
 create mode 100644 target/mips/mips32r6.decode
 create mode 100644 target/mips/mips64r6.decode
 create mode 100644 target/mips/rel6_translate.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 50281c93369..11730f5b2e6 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -162,6 +162,7 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* decodetree generated */
+bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
new file mode 100644
index 00000000000..027585ee042
--- /dev/null
+++ b/target/mips/mips32r6.decode
@@ -0,0 +1,17 @@
+# MIPS32 Release 6 instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume II-A
+#       The MIPS32 Instruction Set Reference Manual, Revision 6.06
+#       (Document Number: MD00086-2B-MIPS32BIS-AFP-06.06)
+#
+
+&lsa                rd rt rs sa
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
+
+LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
diff --git a/target/mips/mips64r6.decode b/target/mips/mips64r6.decode
new file mode 100644
index 00000000000..e812224341e
--- /dev/null
+++ b/target/mips/mips64r6.decode
@@ -0,0 +1,17 @@
+# MIPS64 Release 6 instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume II-A
+#       The MIPS64 Instruction Set Reference Manual, Revision 6.06
+#       (Document Number: MD00087-2B-MIPS64BIS-AFP-6.06)
+#
+
+&lsa                rd rt rs sa !extern
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
+
+DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
new file mode 100644
index 00000000000..631d0b87748
--- /dev/null
+++ b/target/mips/rel6_translate.c
@@ -0,0 +1,37 @@
+/*
+ *  MIPS emulation for QEMU - # Release 6 translation routines
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+
+/* Include the auto-generated decoder.  */
+#include "decode-mips32r6.c.inc"
+#include "decode-mips64r6.c.inc"
+
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
+bool decode_isa_rel6(DisasContext *ctx, uint32_t insn)
+{
+    if (TARGET_LONG_BITS == 64 && decode_mips64r6(ctx, insn)) {
+        return true;
+    }
+    return decode_mips32r6(ctx, insn);
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index e9730d95131..cd34b06faae 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29027,6 +29027,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         return;
     }
 
+    /* ISA (from latest to oldest) */
+    if (cpu_supports_isa(env, ISA_MIPS_R6) && decode_isa_rel6(ctx, ctx->opcode)) {
+        return;
+    }
+
     if (!decode_opc_legacy(env, ctx)) {
         gen_reserved_instruction(ctx);
     }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 21b75254047..ab01123013a 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,6 @@
 gen = [
+  decodetree.process('mips32r6.decode', extra_args: [ '--static-decode=decode_mips32r6' ]),
+  decodetree.process('mips64r6.decode', extra_args: [ '--static-decode=decode_mips64r6' ]),
   decodetree.process('msa32.decode', extra_args: [ '--static-decode=decode_msa32' ]),
   decodetree.process('msa64.decode', extra_args: [ '--static-decode=decode_msa64' ]),
 ]
@@ -16,6 +18,7 @@
   'msa_helper.c',
   'msa_translate.c',
   'op_helper.c',
+  'rel6_translate.c',
   'tlb_helper.c',
   'translate.c',
   'translate_addr_const.c',
-- 
2.26.2


