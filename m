Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F810326048
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:41:41 +0100 (CET)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZcy-0005x7-DU
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTu-0004rH-71
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:19 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTs-0003O4-Qd
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:18 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a22so13654040ejv.9
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aTBjgsTI4Wp6876fW/WwC5NahK2Whn3Re19zatSnL1c=;
 b=DqaXvv54utNWZsxzWL08cH4+6TQfO+uKbNxGC2cDp+XZh+s/dxJuk+at8bANMmLAeD
 JpACiTQeTLZHKeJyoBekE8z1JIkLpRyZmlhHjwJDF4tzYaznkGXW9a/KCoMRIUGPY01F
 +FNdjvVKiveKWeXDm6buIDFR67iMW+MbsBUuXOerwbFR5LaMzjMOA6ppE+/G92A0wTJ6
 VakLnjgSB4VaYNC382S7rOf+GFTag3aiMSV85pEnC3u89XWh4cNE7clIHpBC/jJ//lNp
 hlOXA8a4FJe+KeJcjr+kRbUFC68AF10t94Zc2QD6w/YDC3E3/hR17r9tBBUL+qV1HdMA
 J99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aTBjgsTI4Wp6876fW/WwC5NahK2Whn3Re19zatSnL1c=;
 b=pSe7UL84r9frCDhqFJBF81kzOL/jpB5cyOiHguqA2GSVSFxhrSikiFonKUoqLpacY1
 RkM6dxIj6YEDJNZCsrDFffumiZkC4432B2OLdkJAdX2cEThQgixdoizvl5rSVq5Zx53b
 uJyPNOkxcQQfQW16H5440YF7RCaf9tOOPo4y3oFjLm3NCv8V/E5yktscyKAcP5WxPbkS
 QveA/RjQdi7aa/XbU7mziMcUf77iaJslrcIfdGnQeccn/MrJDLgNH9Xnto4UQuzOaFFv
 kLnkdCx+jJHMOrAg+ajdAnvSyZzBDdKoYMWxgMMmmdjwqqPrpkCEIvl9pBLz/xBnTjqx
 Hgiw==
X-Gm-Message-State: AOAM531cNH8CJYc0VySzDfdXRzW4826zWlH6Ofk4rXd85q3Qd3UVf+0I
 FTg5TNsejb6CCdsBjFRZX+f73T6nCwg=
X-Google-Smtp-Source: ABdhPJx06JN2gGMAoT8jkigY6an5vxccm2/h/QWBcblioNS4CyiKf1RcOeuuKgvZESQjm+JUbElm6g==
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr2337422ejk.141.1614331935299; 
 Fri, 26 Feb 2021 01:32:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c20sm4630759eje.59.2021.02.26.01.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:32:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/13] target/mips: Introduce mxu_translate_init() helper
Date: Fri, 26 Feb 2021 10:31:09 +0100
Message-Id: <20210226093111.3865906-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


