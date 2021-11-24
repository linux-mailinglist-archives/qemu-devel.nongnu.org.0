Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D945CC99
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:58:22 +0100 (CET)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxTJ-00077C-7U
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5q-0007Z0-L9
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:34:06 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43588
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5n-0004nN-3h
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:34:06 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6590260B07;
 Thu, 25 Nov 2021 02:33:32 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778812; bh=/783yYOHmRfWNoNL/gGH2F0LYZ9v7h7HgCt+aKpg8vQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hgZ3xVsC3NOon3abyPusnCBRtPIZb5NdoruQC4xz10Fc0qoDqZavAV5F+P1kidcfX
 SBt5pamRG7Jpo68zz4lhKW6cz5K0zIhoNmO1eziNTZg+kMVYTLyH7vUHLlKuLfy8p+
 tyKUtMhSCo/RKuPTQNPe2XKY28QAuc58Ch4YYrDk=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 29/31] linux-user: Implement CPU-specific signal
 handler for loongarch64 hosts
Date: Thu, 25 Nov 2021 02:32:29 +0800
Message-Id: <20211124183231.1503090-30-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
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
 linux-user/host/loongarch64/host-signal.h | 87 +++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 linux-user/host/loongarch64/host-signal.h

diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
new file mode 100644
index 0000000000..05e2c82371
--- /dev/null
+++ b/linux-user/host/loongarch64/host-signal.h
@@ -0,0 +1,87 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LOONGARCH64_HOST_SIGNAL_H
+#define LOONGARCH64_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__pc;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__pc = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    const uint32_t *pinsn = (const uint32_t *)host_signal_pc(uc);
+    uint32_t insn = pinsn[0];
+
+    /* Detect store by reading the instruction at the program counter.  */
+    switch ((insn >> 26) & 0b111111) {
+    case 0b001000: /* {ll,sc}.[wd] */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* sc.w */
+        case 0b11: /* sc.d */
+            return true;
+        }
+        break;
+    case 0b001001: /* {ld,st}ox4.[wd] ({ld,st}ptr.[wd]) */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* stox4.w (stptr.w) */
+        case 0b11: /* stox4.d (stptr.d) */
+            return true;
+        }
+        break;
+    case 0b001010: /* {ld,st}.* family */
+        switch ((insn >> 22) & 0b1111) {
+        case 0b0100: /* st.b */
+        case 0b0101: /* st.h */
+        case 0b0110: /* st.w */
+        case 0b0111: /* st.d */
+        case 0b1101: /* fst.s */
+        case 0b1111: /* fst.d */
+            return true;
+        }
+        break;
+    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
+        uint32_t sel = (insn >> 15) & 0b11111111111;
+
+        switch (sel) {
+        case 0b00000100000: /* stx.b */
+        case 0b00000101000: /* stx.h */
+        case 0b00000110000: /* stx.w */
+        case 0b00000111000: /* stx.d */
+        case 0b00001110000: /* fstx.s */
+        case 0b00001111000: /* fstx.d */
+        case 0b00011101100: /* fstgt.s */
+        case 0b00011101101: /* fstgt.d */
+        case 0b00011101110: /* fstle.s */
+        case 0b00011101111: /* fstle.d */
+        case 0b00011111000: /* stgt.b */
+        case 0b00011111001: /* stgt.h */
+        case 0b00011111010: /* stgt.w */
+        case 0b00011111011: /* stgt.d */
+        case 0b00011111100: /* stle.b */
+        case 0b00011111101: /* stle.h */
+        case 0b00011111110: /* stle.w */
+        case 0b00011111111: /* stle.d */
+        case 0b00011000000 ... 0b00011100011: /* am* insns */
+            return true;
+        }
+        break;
+    }
+
+    return false;
+}
+
+#endif
-- 
2.34.0


