Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB944196B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:06:10 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUCf-0001OU-Pd
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzo-00060J-6G
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51034 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzl-0008EL-3k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:51 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S30; 
 Mon, 01 Nov 2021 17:52:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 28/29] accel/tcg/user-exec: Implement CPU-specific signal
 handler for loongarch64 hosts
Date: Mon,  1 Nov 2021 17:51:50 +0800
Message-Id: <1635760311-20015-29-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S30
X-Coremail-Antispam: 1UD129KBjvJXoW7tw43Wr1rCrWfGw47ur4rZrb_yoW8Kw4Upr
 nrtr4rGr4kXr9xJrs3JrWkJwn8KFn7AF4DJryxKFs8uF1jgw15J3y5GrWUKr90gryUuFyS
 grW7Xr1ruF1jyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Base-on: <20210925173032.2434906-30-git@xen0n.name>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 accel/tcg/user-exec.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7604b0a..ec887c4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -811,10 +811,68 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     siginfo_t *info = pinfo;
     ucontext_t *uc = puc;
     greg_t pc = uc->uc_mcontext.__pc;
-    int is_write;
+    uint32_t insn = *(uint32_t *)pc;
+    int is_write = 0;
+
+    /* Detect store by reading the instruction at the program counter. */
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
+        case 0b00011000000 ... 0b00011100011: /* am* insns */
+            is_write = 1;
+            break;
+        }
+        break;
+    }
 
-    /* XXX: compute is_write */
-    is_write = 0;
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
-- 
1.8.3.1


