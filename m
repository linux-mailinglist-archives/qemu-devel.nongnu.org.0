Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2A32446F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:12:30 +0100 (CET)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzaH-0003UZ-1p
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMa-0007eA-4q
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMY-00032X-FR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id u125so2756644wmg.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aTBjgsTI4Wp6876fW/WwC5NahK2Whn3Re19zatSnL1c=;
 b=Ok5bfGrf6rdqJNEP7yjGraoSuCM/vghsATrsFnrDW0c4sE0IJgLeZFgE4yxET3jshG
 GU9jbVNqCX0eWt3hlJyMqb+6mWTcx3u8QSOv3Ip7OhaSQRL/V51bz+s8678MKv1PfNV4
 MHW4It43Q9nLj6atfgHraMNiyr9Q9bWffx5JxSluyNnhKTr3TIG0ZQjbAs0h8YGIIAel
 JgZYGwy3pXd6B3Pxs8jR9C2crlBUpUMH9xOUErkJSmUfkt02w8ZT1f+XJjzbcxSLzZld
 Ny5ycOv3x8XfJIHRIAeOoUfqkf+AKZb/Fd9xQJZcCT8mABgRZo/tYDm9ayEE8la4fQRV
 Wj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aTBjgsTI4Wp6876fW/WwC5NahK2Whn3Re19zatSnL1c=;
 b=T8ahQtD/ct7kY6fePsNhc+Dcw0zGS0Ymlh0LknFiZnFOTqJO4G50QXUQ71imvtOCVW
 +OksL+25dEo4rx8ImC27XVrGpvg57CIL2p2cqakeojt4qrD6QMZsGGuSkI7782RqaQ3W
 cN5M78KWYIPQM3Rf83FUEUBMA4pyKrmLQHiMt9r1aMQn2jJDTpRnXc9uAC/hP459MDn9
 LhNo9ti0RScZA96VGjES8D6gzK5MeXRXG3wUKbHd+864y1R3614Qk4r9eaiLbU62aniq
 IRrMEoUBsbjg0iix2F3D6iNcpFKF72ePHvCd1jwbDUBVyxZunGLExF/7k3n33AC8geG2
 CzCw==
X-Gm-Message-State: AOAM5320PXMJrfIj1yGSAZ4NZHC+doWjYGWjPt/dSbhBAOcJmelUq5XM
 GVdGZ290pY+FP7ZGT9scEyuzW6+bgog=
X-Google-Smtp-Source: ABdhPJzB+PHlUHrWp7Xw1a+rM8xTvhpikWlck8F+Ol+vIfIW0X42Y9pRaz5tkzTNZ3kwu0CVTPQUYg==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr5158622wmi.30.1614193096941;
 Wed, 24 Feb 2021 10:58:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p3sm5177005wro.55.2021.02.24.10.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:58:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] target/mips: Introduce mxu_translate_init() helper
Date: Wed, 24 Feb 2021 19:57:05 +0100
Message-Id: <20210224185706.3293058-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the MXU register initialization code from mips_tcg_init()
as a new mxu_translate_init() helper. Make it public and replace
!TARGET_MIPS64 ifdef'ry by the 'TARGET_LONG_BITS == 32' check to
elide this code at preprocessing time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  1 +
 target/mips/translate.c | 28 ++++++++++++++++------------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index a5c49f1ee22..a807b3d2566 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -179,6 +179,7 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* MXU */
+void mxu_translate_init(void);
 bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
 
 /* decodetree generated */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 84948ab9ce0..da6825c2fec 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2045,7 +2045,20 @@ static const char * const mxuregnames[] = {
     "XR1",  "XR2",  "XR3",  "XR4",  "XR5",  "XR6",  "XR7",  "XR8",
     "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "MXU_CR",
 };
-#endif
+
+void mxu_translate_init(void)
+{
+    for (unsigned i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
+        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
+                                        offsetof(CPUMIPSState, active_tc.mxu_gpr[i]),
+                                        mxuregnames[i]);
+    }
+
+    mxu_CR = tcg_global_mem_new(cpu_env,
+                                offsetof(CPUMIPSState, active_tc.mxu_cr),
+                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
+}
+#endif /* !TARGET_MIPS64 */
 
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
@@ -28047,18 +28060,9 @@ void mips_tcg_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
                                    "llval");
 
-#if !defined(TARGET_MIPS64)
-    for (i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
-        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
-                                        offsetof(CPUMIPSState,
-                                                 active_tc.mxu_gpr[i]),
-                                        mxuregnames[i]);
+    if (TARGET_LONG_BITS == 32) {
+        mxu_translate_init();
     }
-
-    mxu_CR = tcg_global_mem_new(cpu_env,
-                                offsetof(CPUMIPSState, active_tc.mxu_cr),
-                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
-#endif /* !TARGET_MIPS64 */
 }
 
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-- 
2.26.2


