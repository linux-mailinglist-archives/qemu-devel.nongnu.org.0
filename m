Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B815507B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 03:05:49 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izt1g-0006uY-3i
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 21:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvj-0006DJ-KF
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvi-0001JL-Be
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:39 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53100 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1izsvi-00018u-3P
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:38 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6D6121A2126;
 Fri,  7 Feb 2020 02:58:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F38821A20E9;
 Fri,  7 Feb 2020 02:58:22 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc5 17/32] target/avr: Initialize TCG register variables
Date: Fri,  7 Feb 2020 02:57:45 +0100
Message-Id: <1581040680-308-18-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Initialize TCG register variables.

Co-developed-by: Richard Henderson <richard.henderson@linaro.org>
Co-developed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 target/avr/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index a6e6748..becf096 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -129,6 +129,36 @@ struct DisasContext {
 };
=20
=20
+void avr_cpu_tcg_init(void)
+{
+    int i;
+
+#define AVR_REG_OFFS(x) offsetof(CPUAVRState, x)
+    cpu_pc =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(pc_w), "pc")=
;
+    cpu_Cf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregC), "Cf"=
);
+    cpu_Zf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregZ), "Zf"=
);
+    cpu_Nf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregN), "Nf"=
);
+    cpu_Vf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregV), "Vf"=
);
+    cpu_Sf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregS), "Sf"=
);
+    cpu_Hf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregH), "Hf"=
);
+    cpu_Tf =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregT), "Tf"=
);
+    cpu_If =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sregI), "If"=
);
+    cpu_rampD =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampD), "=
rampD");
+    cpu_rampX =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampX), "=
rampX");
+    cpu_rampY =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampY), "=
rampY");
+    cpu_rampZ =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(rampZ), "=
rampZ");
+    cpu_eind =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(eind), "ei=
nd");
+    cpu_sp =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(sp), "sp");
+    cpu_skip =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(skip), "sk=
ip");
+
+    for (i =3D 0; i < NUMBER_OF_CPU_REGISTERS; i++) {
+        cpu_r[i] =3D tcg_global_mem_new_i32(cpu_env, AVR_REG_OFFS(r[i]),
+                                          reg_names[i]);
+    }
+#undef AVR_REG_OFFS
+}
+
+
 static int to_regs_16_31_by_one(DisasContext *ctx, int indx)
 {
     return 16 + (indx % 16);
--=20
2.7.4


