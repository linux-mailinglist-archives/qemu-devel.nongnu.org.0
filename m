Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DD3DCE3C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:01:55 +0200 (CEST)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALP0-000610-5Z
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMr-0003bW-P0
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMq-0006pb-4q
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p5so19342512wro.7
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StzvGMLMsgqPmTgAHMYz+S6poTEEwTkgQFoR1NPgVPo=;
 b=tpYuqU7ULMhKJXymVktl4eeLz39gZN5KbXfYL6BM8AKi1rzi2Atn7iTbUHXxEPkJVp
 Dco/xvctgWLneB22YkOUeP26Cnocng3QXo9/YpQG7kV1cJx4hD3WhXfR/MzS2ssiZV7v
 qmp0trqshTP2EKAZLtuLWS+s70HisfiG9P0n9TYR6jqsH7VC16Uxs+LJXZDyem/crhrf
 WJl3g/KfWY94W6MsTZvR9FGRIJ8B6CC8Xu88makD2ankr486VsO8BHGb0mSMJDS7PFsF
 3SVkHJEGFgvU4WIFhiafGMai9SgMOnV2E0K0pT/HvZNU6y8io+rCZBPuI0LI2r4DY++w
 MktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=StzvGMLMsgqPmTgAHMYz+S6poTEEwTkgQFoR1NPgVPo=;
 b=PIF6eusmaAUMnhfSzvBYyWs6T2o+BPy3FPLUGDaBI806h9XK0r4jMcqAKoMPje9Yvq
 WOja/zzDW6LRpdHAiyJgigfUuYA8e2d67xxcOqQJh8f0LXMbY1FBfKA3uDDw9t0exrt+
 pFjITvSDZIt+RKB0W+R1eEz/twnaTCG2LR8/Qro8lY50Mzs0eOPNaWZMVsut6CKfRTJD
 4ksrwHImkx261CFj/1qJeQobDnQP1W8Dj2qvwxTjiDpVPkvFlwNrlWqHgwJ8weqAkTrL
 BuLVJKwSVIdpWZ8+CxUsi7Axt5+CM87fktkj2N65/etZDaxxbIWwtHqD1gmkH5FXQwTz
 iO8Q==
X-Gm-Message-State: AOAM530CZw2YObM77y1GHoIUnlBQNpLfjBjuvn9GVYFvsfn/w5xrdjQV
 4tMRlyjAZk+rtL1Vy3X+fknQCncJgms+Dw==
X-Google-Smtp-Source: ABdhPJxliFQ5C+u6XOw8fWfQofvit45wu7tofeeO30t6iBGOxhlaC3UUpgMAMc9CBvF2AsQO3QfakA==
X-Received: by 2002:adf:c3c5:: with SMTP id d5mr14764331wrg.76.1627862377969; 
 Sun, 01 Aug 2021 16:59:37 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f26sm9249423wrd.41.2021.08.01.16.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/5] target/mips: Introduce decodetree structure for
 NEC Vr54xx extension
Date: Mon,  2 Aug 2021 01:59:23 +0200
Message-Id: <20210801235926.3178085-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801235926.3178085-1-f4bug@amsat.org>
References: <20210801235926.3178085-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The decoder is called but doesn't decode anything. This will
ease reviewing the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 34a96159d15..98dfcf5afd1 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16109,6 +16109,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
         return;
     }
+    if (cpu_supports_isa(env, INSN_VR54XX) && decode_ext_vr54xx(ctx, ctx->opcode)) {
+        return;
+    }
 
     if (decode_opc_legacy(env, ctx)) {
         return;
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
index 68eb284e099..259663a8893 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -3,6 +3,7 @@
   decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
+  decodetree.process('vr54xx.decode', extra_args: '--decode=decode_ext_vr54xx'),
 ]
 
 mips_ss.add(gen)
@@ -20,6 +21,7 @@
   'translate_addr_const.c',
   'txx9_translate.c',
   'vr54xx_helper.c',
+  'vr54xx_translate.c',
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-- 
2.31.1


