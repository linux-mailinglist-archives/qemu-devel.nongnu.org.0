Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B85383CF0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:09:09 +0200 (CEST)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liic0-00022A-Ip
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm8-0007B1-DG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:32 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihle-0004ca-9b
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:32 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7xml-1lMJG62dMJ-0155CK; Mon, 17
 May 2021 20:14:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 59/59] linux-user/elfload: add s390x core dumping support
Date: Mon, 17 May 2021 20:14:24 +0200
Message-Id: <20210517181424.8093-60-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wji4x8+UUAGg3ZK2PgGBVwrOcMIeV7MANcvPK8kWfixtrMNxUTb
 Kf9IwAbiWNL/9u8hyWc5y6N3fHKBdBXLtXLD3CTFFzf5MCk25E7/gFcPlOY96hmYv2BqcPO
 dqHL6e0soaoR8IzlvzlxyUXKYmWiZacoRxIHCmLAgt7gakVk7WscDaDnmjwC0XF2laE76Vw
 jntZ1CtTl5jyt/MaoGpXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Sa7AC+XY6M=:X+qDt7T41g2FUjvmXxTUQz
 oEgspOMXyQK83dOfUmYNqKnuTm+MK7ePSIk0gw5ykBR0z1TY6tDY+VjnvX70LuKS0o6dTDaKL
 reHwoUBQm0NNV6L3BS6xm19dUjLhq7g8qASFsfJBDUq9Kq/eF+pxmr9Zg5GlcJkIuq6Yonfmj
 EdYv0uh/HzXHYmQHldXph7f8KdAepPy7gOxEmja00J4f625ZpkhJ1lIa3tFgewZD5ubPc4dCp
 ZqKFeYk4LNwmIjHMACWq2w3+ZdGAQGn8MQbNjNME0iWGKeRGhTEU/hHmb7b+XrIs9NdHkCB49
 uFtcRkeP3oqvZc1i1EF9VwMolIh29tJqzanI1Mo4+RTm9MTUuT8oiRkqBe0Whp3/u8btTgXsh
 wkQqnYhyBESiems5cNNiv7lKkGnYkes0uZXsjcwu/nMwQ7ZZcmN6gZ9SAkaXa6A7kvoA0jRKe
 uWuMBK/jFrohB8wUaxLio9wkkSNNzKz5ywyFslwIr1p1whBBrQ+xbjzW4zcPXmX4yMJJZnO/U
 7Kep1o55VSqQ16nJmRUO+8=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Provide the following definitions required by the common code:

* ELF_NREG: with the value of sizeof(s390_regs) / sizeof(long).
* target_elf_gregset_t: define it like all the other arches do.
* elf_core_copy_regs(): similar to kernel's s390_regs_get().
* USE_ELF_CORE_DUMP.
* ELF_EXEC_PAGESIZE.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20210413205608.22587-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9779263727ba..0e832b2649f6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1375,6 +1375,39 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
     regs->gprs[15] = infop->start_stack;
 }
 
+/* See linux kernel: arch/s390/include/uapi/asm/ptrace.h (s390_regs).  */
+#define ELF_NREG 27
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+enum {
+    TARGET_REG_PSWM = 0,
+    TARGET_REG_PSWA = 1,
+    TARGET_REG_GPRS = 2,
+    TARGET_REG_ARS = 18,
+    TARGET_REG_ORIG_R2 = 26,
+};
+
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPUS390XState *env)
+{
+    int i;
+    uint32_t *aregs;
+
+    (*regs)[TARGET_REG_PSWM] = tswapreg(env->psw.mask);
+    (*regs)[TARGET_REG_PSWA] = tswapreg(env->psw.addr);
+    for (i = 0; i < 16; i++) {
+        (*regs)[TARGET_REG_GPRS + i] = tswapreg(env->regs[i]);
+    }
+    aregs = (uint32_t *)&((*regs)[TARGET_REG_ARS]);
+    for (i = 0; i < 16; i++) {
+        aregs[i] = tswap32(env->aregs[i]);
+    }
+    (*regs)[TARGET_REG_ORIG_R2] = 0;
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE 4096
+
 #endif /* TARGET_S390X */
 
 #ifdef TARGET_RISCV
-- 
2.31.1


