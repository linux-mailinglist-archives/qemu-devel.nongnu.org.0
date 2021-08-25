Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0791A3F75A2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:10:06 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsfN-0008Ip-2P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYY-0007Ob-7a
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYT-0002R0-JG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d26so16002873wrc.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtJHpFNb3pDGfH1hMhE0K1VwxFwp2STcaYrJ+svwAgw=;
 b=mTQV830Lpbdys1m46U+gFyBMd+2kDTteKdgr/sFqVS87uMBXoUlkv1jtkCTUL1/s99
 YSBVOOFOYVaKz6zHcXwTnWZphYx6hWuY0NDMeXnGXzRnyvVPXX3Is9MW+FikgfvxDTmf
 zWkJUKjsWg+xhZde1dIqiErMTgGSF4B9zGGOeEP72AgA8WG7l9gZKK20KvBODwseOiKJ
 eVtUDn+OdCxfMOsmdqgmsnIA3Bg+W2f4xYSpCDpTeMdm+bIRAtaOxAGpu2RUPJo2qLVi
 3nbwXkIUaJ/UsddxNBRyFDB1WHWwFuEc9zWGWBDcH16mKR2G9yTYOWFduZjdMfJz8IIK
 bjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RtJHpFNb3pDGfH1hMhE0K1VwxFwp2STcaYrJ+svwAgw=;
 b=MzFqOSrtixRJI2NECS/0j/oisQUdmvHwoq1cM9sy+HJt82Nby8WB7W6lB1KW2NO6jy
 xPRS08kyfzGf0S832y24V4OsiICZnR1SOlYWAYdKx/4fMtuKYQF9m0mKpmm3luZhYYXo
 JsxY4VOFJ1V7rypHCohjcWgQ8OhHaK3F71C+DfDbHEauPzlNyXzjIZBOEjaCzfghHY4I
 tGzyifLlPz9KTBnKBZn+DUt3JZksQtaAh826myORM0Gw81Q75JX5trFAZ2PwAd6yquSD
 dZBs/alb1nAYIKW4qHA/uqDGuYml0Mqa35O19izD562zS+zaAOFnCT8auCdqB01l59G0
 drwQ==
X-Gm-Message-State: AOAM530mcreyD9O4x2KIhY9x5vSgxzTxgELGUxUgMS15arxKhcgW3jp1
 7zOZ0Ij1LqMnG0gfzF+NT2u56QQAnoE=
X-Google-Smtp-Source: ABdhPJwOpQLwTuSk6DGcPv9433VfWXwXHr3fgA6HHvdwkWnkQJzxff3gB8JZfO68+4uwKlKKeLED1A==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr15573297wrn.86.1629896576180; 
 Wed, 25 Aug 2021 06:02:56 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b18sm21202071wrr.89.2021.08.25.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] target/mips: Introduce decodetree structure for NEC
 Vr54xx extension
Date: Wed, 25 Aug 2021 15:01:52 +0200
Message-Id: <20210825130211.1542338-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 791e3e2c7e8..bb0a6b8d74f 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -201,6 +201,7 @@ bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 #if defined(TARGET_MIPS64)
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
 #endif
+bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
 
 /*
  * Helpers for implementing sets of trans_* functions.
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
index 490add3fc15..34363639937 100644
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


