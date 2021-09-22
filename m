Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAB414FB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:17:04 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6nn-0006f1-6q
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6gs-0006Ep-HE
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:09:54 -0400
Received: from [115.28.160.31] (port=40334 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6gq-0007Am-LL
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:09:54 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5EA12633FA;
 Thu, 23 Sep 2021 02:09:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632334182; bh=Skjw9mZG0LIkXhJFmf2xdYa1NSGQSngJCT610KH4YTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGwar5i8KLbc3Mwh4j6u6Yhm3Peb3XlysISfgcWDrXyBOQSMv/buneEQAK1XogaIo
 9t16Z3SGa4IK9SUvVos1OxBejvynaHvrVRKYZlxwPtvptiGDc6KeOHCUAGh0889EZJ
 4jDF6NNpiBi3zfwXyRLbctfFBa9paoYXAvxie5BQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/30] tcg/loongarch64: Implement the memory barrier op
Date: Thu, 23 Sep 2021 02:09:05 +0800
Message-Id: <20210922180927.666273-9-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922180927.666273-1-git@xen0n.name>
References: <20210922180927.666273-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 69e882ba5d..338b772732 100644
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
2.33.0


