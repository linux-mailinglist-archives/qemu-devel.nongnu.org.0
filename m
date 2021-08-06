Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A503E30AB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:08:55 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC75K-0002CF-JF
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72a-0003fY-A2
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72Y-0008Si-AO
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id b11so12661144wrx.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wP71Gc0dqQMoQtmov2pKx49t6eOicUkmwMuIIVfFCY=;
 b=bek8mWPnH0lT96eLI70bUepSow70OFswZr/pN5ZSnsUAGuNpSlYMgRNnx5AFfhoKcc
 Ywi/WzISlLFpdQgT4k5CgjVUMWBo6DzrcqliiRqXaRDWWjxkk+tF+ykUQFtZ9p4wZ1V5
 hUJRFz3GXh1WzKp9RA2AtLyuXcAz8Zc4kjkRW7OfO8j0bae1s+/yPrjxqWSz1zTj8hVA
 VTyCo6oCac1e8pkSnchNLg9Vl9g+QcoDDi9x4B5kElf8mtdvwFzvjE7cHQAQeBIEmT+d
 hWBQr+b/oVAVk6P8We5hM8H2v0hus6Hq5f+Vqr3kzr2hWqto149WBfIRD63599AdC9rk
 9LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5wP71Gc0dqQMoQtmov2pKx49t6eOicUkmwMuIIVfFCY=;
 b=bPiHORzibuIJEw/DN6HU4HnjawCmI1WQO1q5Ezfy1liTmVl7b45dHnwl5XbJxlbwGm
 0buPo7lCVRv/r3kPq2Izrla/WgPjO2vucs5Ql9IQT7wc1U0clHEeP8ml0VWyG4+CeK77
 G8Yv8GhaM3pec5SXkSRU8lsazbUCb+dKfF6fg8A48tsWldkproL47fwqMN1/N4HZy4AK
 w3o19LQ0yrcHhaqqaGX1TF6s9pL06uvua1YOXD6RIfvmdSmUUBJ+av+68hKJAUSAOXfU
 uMlAUGnv3ae1xDtLYMnQr7V5C/S0EWfxtO6d2PoktAWK1VmSY9NDVvZ8jNwOQoCJCgse
 iDqQ==
X-Gm-Message-State: AOAM531EUU0ajQRCicUS7qaf/ryoeMbi6Me+5+husuYSEveW31T0GMdp
 Mm6n4PXfid7UV1MUwYNUkJnOCoiPk8qAOBcntq0=
X-Google-Smtp-Source: ABdhPJy/g0ANXF7Z8DrmaQNA7O7ogLDfmdIpol6sSwHaLE7rTuds3eIdybNiKQzO4xwUtRmbdnp2jw==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr12676268wri.312.1628283960826; 
 Fri, 06 Aug 2021 14:06:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x9sm13635756wmj.41.2021.08.06.14.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:06:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 2/5] target/mips: Introduce decodetree structure
 for NEC Vr54xx extension
Date: Fri,  6 Aug 2021 23:05:45 +0200
Message-Id: <20210806210548.8568-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806210548.8568-1-f4bug@amsat.org>
References: <20210806210548.8568-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The decoder is called but doesn't decode anything. This will
ease reviewing the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210801235926.3178085-3-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.h        |  1 +
 target/mips/tcg/vr54xx.decode      |  8 ++++++++
 target/mips/tcg/translate.c        |  3 +++
 target/mips/tcg/vr54xx_translate.c | 19 +++++++++++++++++++
 target/mips/tcg/meson.build        |  2 ++
 5 files changed, 33 insertions(+)
 create mode 100644 target/mips/tcg/vr54xx.decode
 create mode 100644 target/mips/tcg/vr54xx_translate.c

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index c25fad597d5..d82c78c9bdc 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -201,5 +201,6 @@ bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 #if defined(TARGET_MIPS64)
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
 #endif
+bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
new file mode 100644
index 00000000000..f6b3e42c999
--- /dev/null
+++ b/target/mips/tcg/vr54xx.decode
@@ -0,0 +1,8 @@
+# MIPS VR5432 instruction set extensions
+#
+# Copyright (C) 2021  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference: VR5432 Microprocessor User’s Manual
+#            (Document Number U13751EU5V0UM00)
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 9b8c40c302d..71a9a2df0a9 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16098,6 +16098,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
         return;
     }
+    if (cpu_supports_isa(env, INSN_VR54XX) && decode_ext_vr54xx(ctx, ctx->opcode)) {
+        return;
+    }
 
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
new file mode 100644
index 00000000000..13e58fdd8df
--- /dev/null
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -0,0 +1,19 @@
+/*
+ * VR5432 extensions translation routines
+ *
+ * Reference: VR5432 Microprocessor User’s Manual
+ *            (Document Number U13751EU5V0UM00)
+ *
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+#include "internal.h"
+
+/* Include the auto-generated decoder. */
+#include "decode-vr54xx.c.inc"
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index ff618a159b7..8f6f7508b66 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -2,6 +2,7 @@
   decodetree.process('rel6.decode', extra_args: ['--decode=decode_isa_rel6']),
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
+  decodetree.process('vr54xx.decode', extra_args: '--decode=decode_ext_vr54xx'),
 ]
 
 mips_ss.add(gen)
@@ -19,6 +20,7 @@
   'translate_addr_const.c',
   'txx9_translate.c',
   'vr54xx_helper.c',
+  'vr54xx_translate.c',
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-- 
2.31.1


