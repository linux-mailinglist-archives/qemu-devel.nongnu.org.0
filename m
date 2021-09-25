Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43D41839F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:33:35 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBYM-0005JZ-I9
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBW4-0002Gw-Ev
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:13 -0400
Received: from [115.28.160.31] (port=57188 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBW2-0005Py-Kc
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:12 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CEE5660B3A;
 Sun, 26 Sep 2021 01:30:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591054; bh=vXium7SFtJM4q3RXtRnqZAIpFRwoKaNFCsZcsoZHaa0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b5Ie1hVZ9Ep0LV3uf0CnDuvkHB+9Sj5OiYNbzhlNWAZj8OzFhkBqtkvDQoHxUi9b4
 8GrKlIcpr8yB0sVDzcZB0pgaXej3ZdmyTnfE5WxMMf9U+NfUJWxOpCyKSsaQ+88KEY
 S8Df4dQYaD+4USSCxwa9PDesHvx39b6G2bT61KhQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/30] tcg/loongarch64: Implement goto_ptr
Date: Sun, 26 Sep 2021 01:30:12 +0800
Message-Id: <20210925173032.2434906-11-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 4487851b5e..17f869dbd2 100644
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
2.33.0


