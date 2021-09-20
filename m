Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E841168C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:13:55 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK3O-0002Ai-Vr
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETW-0008RD-L4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:31 -0400
Received: from [115.28.160.31] (port=35652 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETT-0000pY-3u
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:30 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 127246340F;
 Mon, 20 Sep 2021 16:06:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125182; bh=0eHzsl2x/Qi54fYRqdqvLO1ukdxYXSVcFQeFmk/nHbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f4v3cBl3pSfJ4bTgZaADidgsf0YtpVpfdLBZFCoJAOXMjuiNptoCTmsQItmBuMakf
 29SUt4BqAe2NEQeqRLozH24Bjondegr81SYMDbAaSoG5ekeZx1nM9Dc4gOg5Izr9Vz
 e85um5b5wD7nrD5t1Wyyihz79ggFI0LszLyiOkPI=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/30] accel/tcg/user-exec: Implement CPU-specific signal
 handler for LoongArch hosts
Date: Mon, 20 Sep 2021 16:04:51 +0800
Message-Id: <20210920080451.408655-31-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
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
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 accel/tcg/user-exec.c | 83 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8fed542622..0f85062e61 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -878,6 +878,89 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
+#elif defined(__loongarch__)
+
+/*
+ * This logic is bitness-agnostic, so the generic __loongarch__ guard is used
+ * instead of explicit ones like __loongarch64.
+ */
+
+int cpu_signal_handler(int host_signum, void *pinfo,
+                       void *puc)
+{
+    siginfo_t *info = pinfo;
+    ucontext_t *uc = puc;
+    greg_t pc = uc->uc_mcontext.__pc;
+    uint32_t insn = *(uint32_t *)pc;
+    int is_write = 0;
+
+    /* Detect store by reading the instruction at the program counter.  */
+    switch ((insn >> 26) & 0b111111) {
+    case 0b001000: /* {ll,sc}.[wd] */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* sc.w */
+        case 0b11: /* sc.d */
+            is_write = 1;
+            break;
+        }
+        break;
+    case 0b001001: /* {ld,st}ox4.[wd] ({ld,st}ptr.[wd]) */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* stox4.w (stptr.w) */
+        case 0b11: /* stox4.d (stptr.d) */
+            is_write = 1;
+            break;
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
+            is_write = 1;
+            break;
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
+            is_write = 1;
+            break;
+        default:
+            /* test for am* instruction range */
+            if (0b00011000000 <= sel && sel <= 0b00011100011) {
+                is_write = 1;
+            }
+            break;
+        }
+        break;
+    }
+
+    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
+}
+
 #else
 
 #error host CPU specific signal handler needed
-- 
2.33.0


