Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C61559707
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:53:08 +0200 (CEST)
Received: from localhost ([::1]:35138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fzv-00055K-Ld
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwj-0002sK-6f
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:49 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwh-0001aY-D4
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MpDRv-1nJZ8o1UDf-00qj3I; Fri, 24
 Jun 2022 11:49:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/3] linux-user/x86_64: Fix ELF_PLATFORM
Date: Fri, 24 Jun 2022 11:49:41 +0200
Message-Id: <20220624094943.729568-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624094943.729568-1-laurent@vivier.eu>
References: <20220624094943.729568-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:63cLd7fB7I05pE/4tri8CTPOT+5c0XjCFHZMAzuxrdOjzAemtCd
 4SRwTfyMLMW5m4HvQaGu+Qx1WhLyM68gI9ajbruE/6Fnrtx7LhpwsSd+Gl+W4uKL8f54AVN
 53GuaHwbyPeP5428wrY+ODMvkdXxYqR2J/tE3vmz0nrOGlsV1pn3OJ91BlPQe6evHOFybPC
 bGSaDyM0T86s18xtSKhMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NnZZ7VNUex8=:0XvGZEQuaKL3KiSKtKPffM
 sLoLxBL1BFYarO9n2axHWT9B7AiJ3gzuBZB2PFWkQgKapbrFzOjQuBzehBp0Fwu2TKBszj38l
 ld5SUfYumJ9s2b8aCtoJp3n1Nga9s/s4HxaNB+mbAV+ZgQMt/qW9Wi/rd8MEIhzh1MY4KOc+Y
 fJ+wai5HZmnD6B1xlvHwINUaGNQMSrvlYo/SDyDouzjXEUDNtxwEVm8O1QKssSKr8KKmwxgxQ
 OYX9Ta3dJettcAeHjY6HeF6fFBauzBtuXbr6QNwRAPYghXsPUpTzP1uSsHembx+zNf8RfHxeA
 xSbbiikRysMhS6LNm563vurs0xcD1psvmhyqUumy66mquYudSycxjrnD36qxgwvRfKVyK5OE+
 R23gcctVtAeiNIJpPl96P2VS1q3qAWDtWZ63bqlI1HfANX6f0gee2tFAozVtUVhq2NH4IHqgP
 5VqX8njP3Fx/jARwn/1009QOZm4qwEbJ6gXvgb+ARb3xIeBOJuP83uDD9ZGSDSIdO83ZwAHxW
 nZZokUB83cmC0pRib5JKiB/mXSaTmOKK/AkVjZvUsKrrq0CdzuRqVw3TvBOlSg51P6In3aU1X
 Z6aWj+1JNAr2A9JJu7KvtYW9OEq1pmJAKQok9cZf3xM35+8Oq3qaiWidWmCsFcG0wFQ0ne6a9
 /ZV+EDiRpcKisnWlrzJuILpQtsNgm1r6mt15fuwjtN2bX7kfEsq44XXAtHM/vwj2jXM2M02g2
 d4aH9wF6xVMzpHfPwN75sNWpIvZHqYEJjs/mlg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

We had been using the i686 platform string for x86_64.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1041
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220603213801.64738-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f7eae357f4ae..163fc8a1eeab 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -130,19 +130,6 @@ typedef abi_int         target_pid_t;
 
 #ifdef TARGET_I386
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
-        family = 6;
-    if (family >= 3)
-        elf_platform[1] = '0' + family;
-    return elf_platform;
-}
-
 #define ELF_HWCAP get_elf_hwcap()
 
 static uint32_t get_elf_hwcap(void)
@@ -158,6 +145,8 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_CLASS      ELFCLASS64
 #define ELF_ARCH       EM_X86_64
 
+#define ELF_PLATFORM   "x86_64"
+
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
     regs->rax = 0;
@@ -221,6 +210,21 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 #define ELF_CLASS       ELFCLASS32
 #define ELF_ARCH        EM_386
 
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    static char elf_platform[] = "i386";
+    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
+    if (family > 6) {
+        family = 6;
+    }
+    if (family >= 3) {
+        elf_platform[1] = '0' + family;
+    }
+    return elf_platform;
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.36.1


