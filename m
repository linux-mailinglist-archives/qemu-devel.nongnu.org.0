Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A5387183
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:58:02 +0200 (CEST)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisjx-00054z-7K
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKy-0008G1-SK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:12 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKu-0007Fg-5A
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:12 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPXMa-1m4Ew20b7C-00Mfmm; Tue, 18
 May 2021 07:32:04 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 59/59] linux-user/elfload: add s390x core dumping support
Date: Tue, 18 May 2021 07:31:31 +0200
Message-Id: <20210518053131.87212-60-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UB0M8/AP8+vEhOxNroUTuVpihz2jCsPzOFXihu/f7YfZK0U33Ko
 AvxbOPK2MtnSjfDvx/AaVfbQJ2rR/iqLVglLiSFQmMMJebFVbrq4XFHpEvey8cHmp36DOb6
 vgKntCLUqDZQr8Ml97C9edUmXk7lCVrhTfu7lXcOxHS5i08Tl5dygNgSeO9aSfvvcCvIAbL
 XQiLqaO1WzplgI0ZSp7Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xjLIdSS/zeE=:FzgMK0KIcce9AdDbCgmy3t
 muvOTIARJXEMuWkmQPsxI+LBL7xNjec9ZqmEJCfnEIwn/gi/eN5TxXoywt7M9cXorjbc84lJX
 YYxGZSsvPoB5640Ipp++EkWOv0SYmU9rDI0rWF01y3RikmnMzKc9vYS4jx3AbRQQCgi8WpuAm
 JEawS2uACjxpa6jWEX33A1JGfQboS19gjN8MlLxPTKX5o6OGfj3DXTRyC6kMPmSywd2vQNb7W
 Yio3pQ0Pg7xIAnA85wRNQKvfHEs4DLT3MthPphEyhGDIB5WotjQHL7+a80/jLCIS6Bm31p2+s
 t63lP45WM72aR2zhNE5IDLXAqKyVgJdgsY3sfOLQPei2YeRLf2IbBIw+TXaUZV5Q0cDpuuNEx
 H4NmT5sR3yL+kqXcNlLvLGJvgYRWPmDVzBsDf/4ux0M5TwxZyczh7UBVBlFbtQCUdNduaJk44
 +IzslO+NBbkloYhufuu0WoDKu39iOsDpC6No2eNeb+MfyUIBeVuCGNkK9qiYArdYvjop1iYHP
 CsdtpDq3b4rltWVLHrDV8k=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


