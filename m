Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEB2DB715
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:23:19 +0100 (CET)
Received: from localhost ([::1]:37468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJf4-0004M9-J6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIn-0006RX-4P
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:19 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIk-0004C2-5O
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:15 -0500
Received: by mail-ej1-x630.google.com with SMTP id n26so30034046eju.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FByo0luaRsj+aLeL9XTS/vkQm9Li61qyHi3C9wh89E=;
 b=qbkqTfIDUlwvWOW7Gd7einDqrUc20NC6J69WdA//sX2fo8TGhuEXTmkdAH/RZtkQTb
 MytpnmKRDJ2G3biodDRUNJsm4o2wsUZKKPfrOp9aA2U7ePCJq2nogPiRf7NwhgSC6J5I
 VxoQxzii3zg6w0RPO8fKylTunHuMfAnetvaZD1PE/CPBNe7y9IXnzT1oSIXiMWZK7hyZ
 jTPN568DPQA2XPrg5MRhen2iiHE7wvPlKAtrsO45gOHgbHTnLSpgQzFsYUHNwwRNe4CY
 t7fEqmVjRymZegCRGsKFl6xLMw0pDtbWoJuNd66Y2EkTqcUQAAyDLxkfgy9MQpH/4b93
 yQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4FByo0luaRsj+aLeL9XTS/vkQm9Li61qyHi3C9wh89E=;
 b=Gm0N5lT+EMFTcyZg2SE48M0la0rv86a3ZwFsiIed5vOFr1GbicxDdYONLqsTWn3UhK
 H6DVh+earWjWyMgSDo86nRSyV4ZQy1rfvQkD0pUbV47vcFQ63ETuuQZt7OQEa5UtPi4y
 lge+eSvkhdZQxYfmDUWi5MKHjmscffGl+HNaECKKtX998QVE35GqyBSrclXgaYf6zKNB
 3zB5omrlFsR+2UqiHf1KTvp1HaYkuciG6URQyc3Ezmuih+ST9mzbpt3zk3Nq++Y2/D5b
 IAA49ftcg9iGscqOASrDC9tGB9z/q1A07hD/dM/t5Kbq8EQ6GpL6m09gbwHCD6R/m84A
 VNUQ==
X-Gm-Message-State: AOAM533eWVrxcaD3VorhGFn/mfgiUN6D7umJVJ27I5vIyc+1Q0kIJefv
 iHOtxnOpUz8O2WAHlx9ajKI=
X-Google-Smtp-Source: ABdhPJwDVfUkiC184zELa5kw8x1BW2v7eil7oduSJGx+lW/j20b1aOWUnA0EMRSvgjtAUsGKyYriMg==
X-Received: by 2002:a17:906:b793:: with SMTP id
 dt19mr28515625ejb.120.1608073209280; 
 Tue, 15 Dec 2020 15:00:09 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm19497149edz.95.2020.12.15.15.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 15:00:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] target/mips: Introduce decodetree helpers for
 Release6 LSA/DLSA opcodes
Date: Tue, 15 Dec 2020 23:57:56 +0100
Message-Id: <20201215225757.764263-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LSA and LDSA opcodes are also available with MIPS release 6.
Introduce the decodetree config files and call the decode()
helpers in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h               |  1 +
 target/mips/isa-mips32r6.decode       | 17 ++++++++++++
 target/mips/isa-mips64r6.decode       | 17 ++++++++++++
 target/mips/isa-mips_rel6_translate.c | 37 +++++++++++++++++++++++++++
 target/mips/translate.c               |  5 ++++
 target/mips/meson.build               |  3 +++
 6 files changed, 80 insertions(+)
 create mode 100644 target/mips/isa-mips32r6.decode
 create mode 100644 target/mips/isa-mips64r6.decode
 create mode 100644 target/mips/isa-mips_rel6_translate.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 47129de81d9..cbaef53b958 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -161,6 +161,7 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* decodetree generated */
+bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
new file mode 100644
index 00000000000..027585ee042
--- /dev/null
+++ b/target/mips/isa-mips32r6.decode
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
diff --git a/target/mips/isa-mips64r6.decode b/target/mips/isa-mips64r6.decode
new file mode 100644
index 00000000000..e812224341e
--- /dev/null
+++ b/target/mips/isa-mips64r6.decode
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
diff --git a/target/mips/isa-mips_rel6_translate.c b/target/mips/isa-mips_rel6_translate.c
new file mode 100644
index 00000000000..d5872bbf8fc
--- /dev/null
+++ b/target/mips/isa-mips_rel6_translate.c
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
+#include "decode-isa-mips32r6.c.inc"
+#include "decode-isa-mips64r6.c.inc"
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
index e0439ba92d8..125b2aac848 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29027,6 +29027,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         return;
     }
 
+    /* ISA */
+    if (isa_rel6_available(env) && decode_isa_rel6(ctx, ctx->opcode)) {
+        return;
+    }
+
     if (!decode_opc_legacy(env, ctx)) {
         gen_reserved_instruction(ctx);
     }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 8e2e5fa40b8..2d62288d604 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,6 @@
 gen = [
+  decodetree.process('isa-mips32r6.decode', extra_args: [ '--static-decode=decode_mips32r6' ]),
+  decodetree.process('isa-mips64r6.decode', extra_args: [ '--static-decode=decode_mips64r6' ]),
   decodetree.process('mod-msa32.decode', extra_args: [ '--static-decode=decode_msa32' ]),
   decodetree.process('mod-msa64.decode', extra_args: [ '--static-decode=decode_msa64' ]),
 ]
@@ -12,6 +14,7 @@
 mips_ss.add(when: 'CONFIG_TCG', if_true: files(
   'dsp_helper.c',
   'fpu_helper.c',
+  'isa-mips_rel6_translate.c',
   'lmmi_helper.c',
   'op_helper.c',
   'mod-msa_helper.c',
-- 
2.26.2


