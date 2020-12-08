Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4A2D1FA2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:57:09 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRJU-0002Vy-7z
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR1V-0004in-3s
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:33 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR1T-0001WL-HQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:32 -0500
Received: by mail-ej1-x633.google.com with SMTP id bo9so22090776ejb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3EHUPkL70HlyKVB+n5bDV2NTA2TeWYMrsf4zc9uRWc=;
 b=tazcftDdhrH5Siz3vGPCkHIw5jTrupE0v8r0/N+j1BdLFSfuGPwZv/t5NCx7BWXmaz
 pzqAgixJPmxmKf9xisHP3PHOVYHXU72hIJNxpETgpYFU+kjrnF0/Xcw21gnfSO2AlcWX
 dE7+Do5RAUfQ+AV0+rrFcbRV9J03t8+v+hNJLXuYQRDIYyMvJc2xuZW26u3SXHbWMge6
 i3BXYrH7QweNGMhM0kdb6+3LL6flma+xWsugezogcadlwvWWs36zDyqvFj7EMUXRrK/3
 xCbI6ZV6irdeZUJtjR36PHnr+waw8IW3QOGM9m7OezCK0TNFwgTw4pmtmGb/KVcSctUe
 nC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x3EHUPkL70HlyKVB+n5bDV2NTA2TeWYMrsf4zc9uRWc=;
 b=mm3Zt3redjUnmdYadj8MGBqNqntribI58y4TPHRIP03WnohRzEvczkO/c7zxJpcwT9
 x5kesX7URN//uqcnKFnQ9zaOfbZ51zz3CEtM17KvOnV3LpCSNQkwEULBseAOOIRknuqX
 o/C/CQ5nKWwoYQKqvL/2xryttICkS5/r3t7XEP/zS7cOgbkBngIe46wGpByysm3Qz1Ut
 pB99q8ZpYO+F8/GuAgJWby/b7vzReMRt2lrtSpRHhyoki9M8zkurA0FvX+S77XyIc0c2
 VmNNLPDoPKut1luV12Xtl54dQxnqYKaSzUvU/ztpP7WOMiC4BX53LNt/sI4kXQnkX93e
 HqYg==
X-Gm-Message-State: AOAM531hFkDT/QUtH00dBr7LSKokWJTVV3fc4POn/lWLX+ebcVZXUtCS
 s33Y6oX8GYGMrpkcX3TeCMXCpZiMUgM=
X-Google-Smtp-Source: ABdhPJy9vmqIycYCXzmH4+3/R4YJU0CpD/y+Mx6BvObtS63jSrNwW1BfO7jCjPNhnnEx8gI4kz5l/w==
X-Received: by 2002:a17:906:9acc:: with SMTP id
 ah12mr17761833ejc.386.1607387909940; 
 Mon, 07 Dec 2020 16:38:29 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ng1sm13094570ejb.112.2020.12.07.16.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:38:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] target/mips: Introduce decode tree bindings for MSA
 opcodes
Date: Tue,  8 Dec 2020 01:37:01 +0100
Message-Id: <20201208003702.4088927-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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

Introduce the 'mod-msa32' decodetree config for the 32-bit MSA ASE.

We decode the branch instructions, and all instructions based
on the MSA opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h         |  1 +
 target/mips/mod-msa32.decode    | 24 ++++++++++++++++++++++++
 target/mips/mod-msa_translate.c | 31 +++++++++++++++++++++++++++++++
 target/mips/meson.build         |  5 +++++
 4 files changed, 61 insertions(+)
 create mode 100644 target/mips/mod-msa32.decode

diff --git a/target/mips/translate.h b/target/mips/translate.h
index c26b0d9155d..c4fe18d187e 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -84,5 +84,6 @@ extern TCGv bcond;
 void msa_translate_init(void);
 void gen_msa(DisasContext *ctx);
 void gen_msa_branch(DisasContext *ctx, uint32_t op1);
+bool decode_msa32(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/mod-msa32.decode b/target/mips/mod-msa32.decode
new file mode 100644
index 00000000000..d69675132b8
--- /dev/null
+++ b/target/mips/mod-msa32.decode
@@ -0,0 +1,24 @@
+# MIPS SIMD Architecture Module instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume IV-j
+#       The MIPS32 SIMD Architecture Module, Revision 1.12
+#       (Document Number: MD00866-2B-MSA32-AFP-01.12)
+#
+
+&msa_bz             df wt s16
+
+@bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
+@bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
+
+BZ_V                010001 01011  ..... ................    @bz
+BNZ_V               010001 01111  ..... ................    @bz
+
+BZ_x                010001 110 .. ..... ................    @bz_df
+BNZ_x               010001 111 .. ..... ................    @bz_df
+
+MSA                 011110 --------------------------
diff --git a/target/mips/mod-msa_translate.c b/target/mips/mod-msa_translate.c
index 55c2a2f1acc..02df39c6b6c 100644
--- a/target/mips/mod-msa_translate.c
+++ b/target/mips/mod-msa_translate.c
@@ -6,6 +6,7 @@
  *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
  *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
  *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
  *
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
@@ -17,6 +18,9 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+/* Include the auto-generated decoder.  */
+#include "decode-mod-msa32.c.inc"
+
 #define OPC_MSA (0x1E << 26)
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
@@ -370,6 +374,16 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
     return true;
 }
 
+static bool trans_BZ_V(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_EQ);
+}
+
+static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_NE);
+}
+
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
     check_msa_access(ctx);
@@ -391,6 +405,16 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
     return true;
 }
 
+static bool trans_BZ_x(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, false);
+}
+
+static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
+}
+
 void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -2264,3 +2288,10 @@ void gen_msa(DisasContext *ctx)
         break;
     }
 }
+
+static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
+{
+    gen_msa(ctx);
+
+    return true;
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index b6697e2fd72..7d0414bbe23 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,9 @@
+gen = [
+  decodetree.process('mod-msa32.decode', extra_args: [ '--decode=decode_msa32' ]),
+]
+
 mips_ss = ss.source_set()
+mips_ss.add(gen)
 mips_ss.add(files(
   'cpu.c',
   'dsp_helper.c',
-- 
2.26.2


