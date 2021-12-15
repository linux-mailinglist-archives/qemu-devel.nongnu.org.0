Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DC475981
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 14:14:59 +0100 (CET)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxU7W-0006m5-IX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 08:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mxTlo-0004kM-4B
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:52:32 -0500
Received: from mail.xen0n.name ([115.28.160.31]:36810
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mxTlm-000447-BS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:52:31 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0099E6055C;
 Wed, 15 Dec 2021 20:52:07 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639572728; bh=CFxjVZaeEKrmopYSgaJR4ZE57E6Hgims2Jb6iDhTGsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CfM8gPEb604qHgjpvu2Z8hAddIOBCPxi1mnE0P6aV8ITFb9jozVm+NqLRNhc44ZHK
 tX+B+IHFcQUniKMLLaAZfprv2WJWQ2WRtIAN1Blz0NQ2w01ACZab/5ex8aQ6L5150z
 tRj/Q5j72nsRjPXQKq9kjAi5QdqCM28py7ZS0VyU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 10/31] tcg/loongarch64: Implement goto_ptr
Date: Wed, 15 Dec 2021 20:51:15 +0800
Message-Id: <20211215125136.3449717-11-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211215125136.3449717-1-git@xen0n.name>
References: <20211215125136.3449717-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target-con-set.h | 17 +++++++++++++++++
 tcg/loongarch64/tcg-target.c.inc     | 15 +++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
new file mode 100644
index 0000000000..5cc4407367
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define LoongArch target-specific constraint sets.
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target-con-set.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index bb45ea0fcf..3a8c52465b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -397,9 +397,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_goto_ptr:
+        tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
 }
+
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
+{
+    switch (op) {
+    case INDEX_op_goto_ptr:
+        return C_O0_I1(r);
+
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.0


