Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C192DE0F6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:27:51 +0100 (CET)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCzG-0007ma-EI
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-0002rc-Ew
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-00073d-GY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:18 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MCsLu-1kz2dQ0xPc-008oSK; Fri, 18 Dec 2020 11:24:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET()
 macro
Date: Fri, 18 Dec 2020 11:23:57 +0100
Message-Id: <20201218102407.597566-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wuqXcLWJwT22rsqHIlWK2F1sTo7/1zk1RaJYfjjLYqGYhHVG29G
 KAs5Z/ITuLXsPVTBeG96/4DbefAKJBVSZnTL0xeJ3E3wX5z4wpK0joYWLslg35d4jbECwmM
 cL2liQSctXwRG3b+R6Ih+ISiJXVqe10VRI+8YTVEhHMYLU1OimI1gWn9pkTK/g1lTJSE0v6
 lMl49y0KcqW9tVYF6Gs6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f+doaN3aWXY=:orMGH1C7mjD+XeXIwvhtkP
 XfjMzpwRltIprXRm10MX5QfRWVj+yNMlCdpoxP4hLjYly9vWqnlpgNiCG63qSf0TupO5GCmxP
 keRNvl9qE3QyXE5FFFP36VokzD1jy/imjOg0/8YUjFw4W4iyKReSVc2VC6xYOQZQnXWAbSeKj
 I6cCSZj221Hor4u8/txRUPlAEbe6lYkUrfjqdauPRVk5fGykDDUV/+O83p0f1i9wRSvdiEkqm
 fLivZm3GZk/quCmqmFX5kCZn90Ghq/OYPyVpVhX/xdLtfjvr+96LzdkUQuWccMDcp83K+c+MN
 Wju4xg9kIpPRey/oVKn9gUrM6abCQzdDJYoOQU7Q8R73KhUIwGBCDDR+jcYHnRLLVR5Gxvq6E
 H8csrXCycftV+m1QLKZWs71jfan2E6uSKPiyijr7wcwkBRZ4nl12laOd3AlljecFOY90xuMR5
 0E7Ue8Zk0Q==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_SET() macro which
checks if a CPU register has bits set.

Use the macro to check for MSA (which sets the MSAP bit of
the Config3 register when the ASE implementation is present).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e1d7e7677c8..b7c6d30723a3 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -992,17 +992,21 @@ enum {
 #define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
+    do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
     GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
-- 
2.29.2


