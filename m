Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F747B9AF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 06:49:57 +0100 (CET)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzY28-0001JR-Hb
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 00:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXuv-00017i-69
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:29 -0500
Received: from mail.xen0n.name ([115.28.160.31]:56386
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXut-000232-Gg
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:28 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E80C2600B5;
 Tue, 21 Dec 2021 13:42:24 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640065345; bh=LM1Siz/EeTlz6osNR6PDpkUVNnjNmlIpxGItvRKpa7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v9X20SR5CItB7217Y9tld2kJMfOraZOAp+eL3+3H4zuxZaVfxvseBu2K1vl7VdB5n
 kTbPh+evX90cml+VSPQfAkfhzSysC7nr29JguW1hsUFPOkO01qTicJijuwUIMYcm3C
 zq7FRDN8npTbO1JDQhARttM8YVbz8K5fsP/C2M5Y=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 08/31] tcg/loongarch64: Implement the memory barrier op
Date: Tue, 21 Dec 2021 13:40:42 +0800
Message-Id: <20211221054105.178795-9-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
References: <20211221054105.178795-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a88ba9a253..615bed9096 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -234,3 +234,35 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         g_assert_not_reached();
     }
 }
+
+#include "tcg-insn-defs.c.inc"
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    /* Baseline LoongArch only has the full barrier, unfortunately.  */
+    tcg_out_opc_dbar(s, 0);
+}
+
+/*
+ * Entry-points
+ */
+
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
+{
+    TCGArg a0 = args[0];
+
+    switch (opc) {
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.0


