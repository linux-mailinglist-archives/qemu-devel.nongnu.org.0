Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD6548575
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:36:17 +0200 (CEST)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kEq-00059T-LF
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5Z-00012z-GF; Mon, 13 Jun 2022 09:26:41 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5X-0004er-Fy; Mon, 13 Jun 2022 09:26:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5T0d6tz4xbN;
 Mon, 13 Jun 2022 23:26:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC5M5NGZz4yZB;
 Mon, 13 Jun 2022 23:26:31 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 07/17] hw/registerfields: Add shared fields macros
Date: Mon, 13 Jun 2022 15:25:29 +0200
Message-Id: <20220613132539.2199772-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <komlodi@google.com>

Occasionally a peripheral will have different operating modes, where the
MMIO layout changes, but some of the register fields have the same offsets
and behaviors.

To help support this, we add SHARED_FIELD_XX macros that create SHIFT,
LENGTH, and MASK macros for the fields that are shared across registers,
and accessors for these fields.

An example use may look as follows:
There is a peripheral with registers REG_MODE1 and REG_MODE2 at
different addreses, and both have a field FIELD1 initialized by
SHARED_FIELD().

Depending on what mode the peripheral is operating in, the user could
extract FIELD1 via
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE1, FIELD1)
or
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE2, FIELD1)

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: Id3dc53e7d2f8741c95697cbae69a81bb699fa3cb
Message-Id: <20220331043248.2237838-2-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/registerfields.h | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 3a88e135d025..1330ca77de61 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -154,4 +154,74 @@
 #define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
     (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
 
+
+/*
+ * These macros can be used for defining and extracting fields that have the
+ * same bit position across multiple registers.
+ */
+
+/* Define shared SHIFT, LENGTH, and MASK constants */
+#define SHARED_FIELD(name, shift, length)   \
+    enum { name ## _ ## SHIFT = (shift)};   \
+    enum { name ## _ ## LENGTH = (length)}; \
+    enum { name ## _ ## MASK = MAKE_64BIT_MASK(shift, length)};
+
+/* Extract a shared field */
+#define SHARED_FIELD_EX8(storage, field) \
+    extract8((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX16(storage, field) \
+    extract16((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX32(storage, field) \
+    extract32((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX64(storage, field) \
+    extract64((storage), field ## _SHIFT, field ## _LENGTH)
+
+/* Extract a shared field from a register array */
+#define SHARED_ARRAY_FIELD_EX32(regs, offset, field) \
+    SHARED_FIELD_EX32((regs)[(offset)], field)
+#define SHARED_ARRAY_FIELD_EX64(regs, offset, field) \
+    SHARED_FIELD_EX64((regs)[(offset)], field)
+
+/* Deposit a shared field */
+#define SHARED_FIELD_DP8(storage, field, val) ({                        \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint8_t _d;                                                         \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP16(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint16_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP32(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint32_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP64(storage, field, val) ({                       \
+    struct {                                                            \
+        uint64_t v:field ## _LENGTH;                                    \
+    } _v = { .v = val };                                                \
+    uint64_t _d;                                                        \
+    _d = deposit64((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+/* Deposit a shared field to a register array */
+#define SHARED_ARRAY_FIELD_DP32(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP32((regs)[(offset)], field, val);
+#define SHARED_ARRAY_FIELD_DP64(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP64((regs)[(offset)], field, val);
+
 #endif
-- 
2.35.3


