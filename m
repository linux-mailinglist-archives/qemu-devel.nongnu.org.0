Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB196F1ACC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 16:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPOy-0006MB-3J; Fri, 28 Apr 2023 10:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOp-0006Gd-EA; Fri, 28 Apr 2023 10:48:40 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOl-0002Co-V7; Fri, 28 Apr 2023 10:48:38 -0400
Received: from [167.98.27.226] (helo=lawrence-thinkpad.guest.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1psPON-005zz5-PZ; Fri, 28 Apr 2023 15:48:11 +0100
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org
Subject: [PATCH v3 10/19] qemu/host-utils.h: Add clz and ctz functions for
 lower-bit integers
Date: Fri, 28 Apr 2023 15:47:48 +0100
Message-Id: <20230428144757.57530-11-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

This is for use in the RISC-V vclz and vctz instructions (implemented in
proceeding commit).

Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 3ce62bf4a56..d3b4dce6a93 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -107,6 +107,36 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 }
 #endif
 
+/**
+ * clz8 - count leading zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz8(uint8_t val)
+{
+    return val ? __builtin_clz(val) - 24 : 8;
+}
+
+/**
+ * clz16 - count leading zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz16(uint16_t val)
+{
+    return val ? __builtin_clz(val) - 16 : 16;
+}
+
 /**
  * clz32 - count leading zeros in a 32-bit value.
  * @val: The value to search
@@ -153,6 +183,30 @@ static inline int clo64(uint64_t val)
     return clz64(~val);
 }
 
+/**
+ * ctz8 - count trailing zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz8(uint8_t val)
+{
+    return val ? __builtin_ctz(val) : 8;
+}
+
+/**
+ * ctz16 - count trailing zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz16(uint16_t val)
+{
+    return val ? __builtin_ctz(val) : 16;
+}
+
 /**
  * ctz32 - count trailing zeros in a 32-bit value.
  * @val: The value to search
-- 
2.40.1


