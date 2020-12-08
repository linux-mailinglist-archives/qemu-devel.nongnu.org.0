Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04282D354D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:36:25 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkem-0003wG-SY
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjn-0004Fp-7t
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:32 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjl-0008GK-MP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:31 -0500
Received: by mail-ed1-x542.google.com with SMTP id u19so19014768edx.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1ThRM4curwGL9SR1qu+6oPmIadZWTqw434ldcSwUhY=;
 b=ZeKuQVoVrFDnIq3klsVf1xGQjVp4L+Wrlg14VoaSMgNckSh70NaHbVliN9pkNF5Eqz
 MszKDYg8bFNUExuZvzOTq1r3/zinTrDmgcYAZ+tnpR9/BE4A9dpDgS6mJ+tne/GZUlj3
 zfcX2sdZeU+un4ycvMrrbHfX73cS1HoWaXcOha3kT3fRuUO4nTyoGDb35yoTzNZSeKsZ
 gwNusef7Oadk2tV0vzGgAQa53E/P9JXuMI5aCJt7wuTwxIHUMv/MpFpuKujrezc0Qkfz
 bjyU3bx+AgOQTK0aOiZgtdqWHo9uMPpeI00031F3xRC8GSbVf6qIdw34FX8/J8HD4lqK
 3RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e1ThRM4curwGL9SR1qu+6oPmIadZWTqw434ldcSwUhY=;
 b=WGhrnwmIB3vfdusUCy4o2L41bogTNSRbQ1uuq+A4/wThyWx/1LnavS65QX4xRuESfM
 itDhuqDwUT9Ind4Jyt/HDW0P1u3ktjXY+6FJV5W+Klrp7ARpp7yPuosV7aFnS3yLBwiF
 HUhwG1jJ/IabNZsisq1sC399wQaXO+cMRwKMF+aWW2QhPdS9Cc1CchTDW0fvsHughtAU
 K8jEC2To5eAuDKkFtDAWh898ZLdi4sngkV4ToJ3qbtMmmqR54nWkitUMR1WBC/ZaReDm
 YO8bR5dnjie2Yzyi7bQrxJVJJr0MP5VqYrCFOBBavg77fkXnWltJiysk0nh/oAiQya5S
 /jnA==
X-Gm-Message-State: AOAM531eVH4ccyA/EL1Op5feIfmCrhBbI5yFrwP319MU/tN047eN+4aV
 vzYeoDxWBw+k5jfbDavU81NteJgKMNQ=
X-Google-Smtp-Source: ABdhPJyC5gNPf2y9DUmPTpDv8HMoD4+4INUtL0W9fCtf6t9Ru9St5OxobKwoZfSiDbcnRnR3XxjjUw==
X-Received: by 2002:a05:6402:1d3b:: with SMTP id
 dh27mr19429921edb.238.1607459847982; 
 Tue, 08 Dec 2020 12:37:27 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x9sm5763368ejd.99.2020.12.08.12.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] target/mips: Introduce decodetree helpers for Release6
 LSA/DLSA opcodes
Date: Tue,  8 Dec 2020 21:36:55 +0100
Message-Id: <20201208203704.243704-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
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

LSA and LDSA opcodes are also available with MIPS release 6.
Introduce the decodetree config files and call the decode()
helpers in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h               |  2 ++
 target/mips/isa-mips32r6.decode       | 17 ++++++++++++++
 target/mips/isa-mips64r6.decode       | 17 ++++++++++++++
 target/mips/isa-mips_rel6_translate.c | 33 +++++++++++++++++++++++++++
 target/mips/translate.c               | 10 ++++++++
 target/mips/meson.build               |  3 +++
 6 files changed, 82 insertions(+)
 create mode 100644 target/mips/isa-mips32r6.decode
 create mode 100644 target/mips/isa-mips64r6.decode
 create mode 100644 target/mips/isa-mips_rel6_translate.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 00601232b97..dcd8de602c1 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -96,8 +96,10 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* decodetree generated */
+bool decode_mips32r6(DisasContext *ctx, uint32_t insn);
 bool decode_msa32(DisasContext *ctx, uint32_t insn);
 #if defined(TARGET_MIPS64)
+bool decode_mips64r6(DisasContext *ctx, uint32_t insn);
 bool decode_msa64(DisasContext *ctx, uint32_t insn);
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
index 00000000000..c77f3ed57e0
--- /dev/null
+++ b/target/mips/isa-mips_rel6_translate.c
@@ -0,0 +1,33 @@
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
+#if defined(TARGET_MIPS64)
+#include "decode-isa-mips64r6.c.inc"
+#endif /* TARGET_MIPS64 */
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
index b3c45d6211a..9b333f97822 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28320,6 +28320,16 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         return;
     }
 
+    /* ISA */
+#if defined(TARGET_MIPS64)
+    if ((ctx->insn_flags & ISA_MIPS64R6) && decode_mips64r6(ctx, ctx->opcode)) {
+        return;
+    }
+#endif /* TARGET_MIPS64 */
+    if ((ctx->insn_flags & ISA_MIPS32R6) && decode_mips32r6(ctx, ctx->opcode)) {
+        return;
+    }
+
     op = MASK_OP_MAJOR(ctx->opcode);
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 124b5f7d49d..a459d0917ee 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,7 +1,9 @@
 gen = [
+  decodetree.process('isa-mips32r6.decode', extra_args: [ '--decode=decode_mips32r6' ]),
   decodetree.process('mod-msa32.decode', extra_args: [ '--decode=decode_msa32' ]),
 ]
 gen64 = [
+  decodetree.process('isa-mips64r6.decode', extra_args: [ '--decode=decode_mips64r6' ]),
   decodetree.process('mod-msa64.decode', extra_args: [ '--decode=decode_msa64' ]),
 ]
 
@@ -13,6 +15,7 @@
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
+  'isa-mips_rel6_translate.c',
   'lmmi_helper.c',
   'op_helper.c',
   'mod-msa_helper.c',
-- 
2.26.2


