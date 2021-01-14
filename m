Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF372F6620
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:42:25 +0100 (CET)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05hY-0006IB-LZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NH-00040k-S4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:29 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NF-0000VO-8g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id t16so6384109wra.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gEo6KrT8NHlhGPjkXqXTbIY8WL/G7dn2mqCw4NdM/Qw=;
 b=ja8mltTeMXqJnrccgzdheI43s9A5MP9R0/v02+DFu5Hvg8yZdSmaMM/rvmvkTD8A4I
 rRhDQY5De6sCxuykGF4TmLckqklFeoFoKgAeyv/B6MObiHAZLTsmiiDY37LjivU9Rj1r
 qW3L31UR0BeyyMEwPklThvtOysLABh6CAHACYYtLdaaLCJsh6Z6mVP+npmK3ys7FVwB6
 6Wl6UUIQE/VM22J5rW+EonTH2l/HHuFX+5cUQy3COZgg3q/rAQOsRlaXQdpDDG1LtIo7
 XvRpr+BPSDjbAk22UribLqUZduaXwqHC2jxnoeYGWkwcMr9fleLZFkVTE0g8yR3nSPpI
 4WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gEo6KrT8NHlhGPjkXqXTbIY8WL/G7dn2mqCw4NdM/Qw=;
 b=UU5/vZVEfRcQI7vLcEMSWvKinv/NQHfWsItk92hZLgbz3ZDjCGB6XLLlz/PjU3rdXq
 3pu50qQMv1Xg8e28cP0Y9EG+S+8YJedlP6p0h9SORcaZylJtGcOAzT2cSyal0NevDXGa
 JdZV3vbfldKWC9e9PpYi+i0+AQPXNwuRFDIC4UjRGNOfhFA6hJbX42mqLndUozWiC/0H
 E+TG6BCzA6IJFnuwSot8sKJdo93WH8Ti8cbf/lkpgICZOhSbo8eKuv0f26Q7YERhDKrY
 7C8U1Vp58iRUKsxxKCUNpI5rV++8w4lYMMV4ysDZ1T+zpsoB7lzDa58nF6R/6Rd7knBU
 HEWw==
X-Gm-Message-State: AOAM530uTmQzHNDDIjs/cXY9UMl+y7duNm3SqIV/s+2ierkLpMjoPxSK
 HJ/FId55egGZQWAulolwa7l6Fq5Fr8w=
X-Google-Smtp-Source: ABdhPJzt4BGHDKZ47j6SyDrRId9KGUsej0ILb4cEp8LAmr85BSgjJyj+PIREp36QNFM3NJhhEq/Yfg==
X-Received: by 2002:adf:8145:: with SMTP id 63mr8507254wrm.8.1610641280336;
 Thu, 14 Jan 2021 08:21:20 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x13sm10375710wrp.80.2021.01.14.08.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 56/69] target/mips: Introduce decodetree helpers for
 Release6 LSA/DLSA opcodes
Date: Thu, 14 Jan 2021 17:20:10 +0100
Message-Id: <20210114162016.2901557-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
index f93df0c5ab2..f47b5f2c8d0 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -171,6 +171,7 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* decodetree generated */
+bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
new file mode 100644
index 00000000000..d71a65f32cb
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
+&rtype              rs rt rd sa
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
+
+LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
diff --git a/target/mips/mips64r6.decode b/target/mips/mips64r6.decode
new file mode 100644
index 00000000000..fd58ac72414
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
+&rtype              rs rt rd sa !extern
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
+
+DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
new file mode 100644
index 00000000000..da70ff9662b
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
+bool decode_isa_rel6(DisasContext *ctx, uint32_t insn)
+{
+    if (TARGET_LONG_BITS == 64 && decode_mips64r6(ctx, insn)) {
+        return true;
+    }
+    return decode_mips32r6(ctx, insn);
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index bed1a286f43..d297029a777 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29025,6 +29025,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         return;
     }
 
+    /* ISA (from latest to oldest) */
+    if (cpu_supports_isa(env, ISA_MIPS_R6) && decode_isa_rel6(ctx, ctx->opcode)) {
+        return;
+    }
+
     if (decode_opc_legacy(env, ctx)) {
         return;
     }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index b63d8f150f1..9741545440c 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,6 @@
 gen = [
+  decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
+  decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
   decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
   decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
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


