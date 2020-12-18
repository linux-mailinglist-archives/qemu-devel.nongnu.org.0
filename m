Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7E2DE108
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:32:23 +0100 (CET)
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD3e-0005zS-JV
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvs-0002ve-G4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:20 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:39061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-00073g-P0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:20 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8GIg-1k3nHn1Aie-014EVA; Fri, 18 Dec 2020 11:24:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/14] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Fri, 18 Dec 2020 11:23:55 +0100
Message-Id: <20201218102407.597566-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D1Uk0JZ/yYg3/egXUqysZWc2tggqawqpcMchwhCUoT8xvHbo8H1
 H9URKpgkprHG3tyMK2sFE5r/ukLMQZUVLlFthuarDrLNjtfzri1dmBvnA2Zj+rA9YrPutAX
 byvbj6O5rpTVtrYuecTuw6mePJaYJO2cVr3YoiW5I6NLnf6cWZi9ho9Ikc4LjsUvDdESjvQ
 gp1fOUJZpBXC4hHKd+1Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ArcQcARn68k=:g86WhVYxSqzzkb1Ymvhkqa
 Wl8Lt2hS80yKUBUE6+7BqvHQBhdt8YsW7B9XjJYaMDLm+U9CaZyuIIz2CKlE182MlyhTDj1nM
 2z5VOCmVW1MzNb0eujSPNSypHrpdHTFY7bpkCdwAxDItOKW6VAHD3ptWy/r4ML53DXldrNUXp
 b1myWeyD5zIOSqcGMSSaZa6ctVP8RLFaKF27HyXpTZbNXT5AlHJRRjU79YQ8XK55fk6yFahyT
 GYfLg4ilwUZfGoW3CQ/Mh5/mqhno2I0IF+GfJXeAaErLgWdfKxVxnbPRAfFmOrtzw+OQLmmmT
 YQzVH9zXQUKZE895RJYfJtDor/y3ZX6ciDRWK6kA5NpbRauqMbHYefoDRpWU0XbVOcCNPgsYr
 JSVytgwim9scSaUapCMT+FfmIETIuXkH7BVLUBZ4p2QPwt6COXIRxCUG0MnQsJQMRPra83KbF
 pxSWjKh3YQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As we are going to add more macros, keep the function body clear.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025e..aae28fd929dc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,22 +989,22 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
+#define GET_FEATURE(_flag, _hwcap) \
+    do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-#define GET_FEATURE(flag, hwcap) \
-    do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
-
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
-#undef GET_FEATURE
-
     return hwcaps;
 }
 
+#undef GET_FEATURE
+
 #endif /* TARGET_MIPS */
 
 #ifdef TARGET_MICROBLAZE
-- 
2.29.2


