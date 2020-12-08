Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CEF2D1F2E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:42:53 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR5g-0005t9-14
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0i-0003rs-My
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:44 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0h-0001GN-6x
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:44 -0500
Received: by mail-ej1-x642.google.com with SMTP id d17so22158533ejy.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wc59UVyyYsG4MSL5Uwdbqv0G30FtyphiU1+yChAdeOE=;
 b=rZiiY+p7sDRq/eDiWgYwVWDCXkKtMPzFjFGGoLdXOdzrqEfVv8PjKz5Xy0kjkNoMbc
 b6VejetpteRzP4glW99fS3Kz5BCZvhUJxYed8wFL6h+LxPfjylJDdrwgMcg+wOS27kau
 8L9P7cHbNJNdQHo+vFQwJSF9cTNe/UHvWaoEfRsQgCY2JfRGzo3S1BRv3qOVOeUee26g
 1jf0zcrWebfo0iEJcX4qmYcApPpSN/d1DnWS/RuTkLZKsNxX4OKQEfAIkx473874xR8e
 v8D+w0UM6/hHiyLV7SyUTnL9PCpbzazaq5xHDW5is5rT4z0B1clqV3m3KpmK6YJiBefb
 9NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wc59UVyyYsG4MSL5Uwdbqv0G30FtyphiU1+yChAdeOE=;
 b=dBmF00C7Tb4+JwOoiWIG1fqertlZuaFy03KJoKBIHiJMjIhbmSVFCogEYZ1biiLPdr
 5/SUobD/QZhhateJLz8kuknBL0nRVh+vqu2Ag/Nwl3x95sYk1szgw7jPrd3yb3VYDIds
 y8t7+GKdTsQQgnt46W7/JeyDHndpP+byFuBkZUj+H1qjo+qz4UHsaO3hMYSpOOj9r1iX
 oxcuc2+xuEtcRl3eiEpDOCGeWR5vAHbDu7e+ncJd6OXMi1xLg16gVPberYtuDRE3GWEn
 Jnj3XzAf+lN+DS9oV9BRLx2Wc+vLIWlLS0c38X8YdAXMGnaVhhRiXNenpt9mHH/cbxp2
 E5nQ==
X-Gm-Message-State: AOAM5308znroZrdoQB6m4OwoVCdg4HQTx0sp4aElxV/3ZuK+72Exw7yo
 cSp96tlCfTO4w4vMvPwuf390hKxmAWk=
X-Google-Smtp-Source: ABdhPJxOMAspRrPAEACiGM3Yu2xuWZ4PtjwSrLOlfbXYY9wzjsbWryiy+15xQFU3sMB8dF951GraMQ==
X-Received: by 2002:a17:906:3883:: with SMTP id
 q3mr20755205ejd.160.1607387861693; 
 Mon, 07 Dec 2020 16:37:41 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s1sm4884009ejx.25.2020.12.07.16.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
Date: Tue,  8 Dec 2020 01:36:52 +0100
Message-Id: <20201208003702.4088927-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the logic initialization of the MSA registers from
the generic initialization.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  3 +++
 target/mips/translate.c | 33 +++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index dbf7df7ba6d..765018beeea 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -80,4 +80,7 @@ extern TCGv bcond;
         }                                                                     \
     } while (0)
 
+/* MSA */
+void msa_translate_init(void);
+
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 95d07e837c0..bbe06240510 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31551,6 +31551,24 @@ void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
+static void msa_translate_init(void)
+{
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
+        /*
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
+         */
+        msa_wr_d[i * 2] = fpu_f64[i];
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
+        msa_wr_d[i * 2 + 1] =
+                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
+    }
+}
+
 void mips_tcg_init(void)
 {
     int i;
@@ -31566,20 +31584,7 @@ void mips_tcg_init(void)
 
         fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
     }
-    /* MSA */
-    for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-
-        /*
-         * The MSA vector registers are mapped on the
-         * scalar floating-point unit (FPU) registers.
-         */
-        msa_wr_d[i * 2] = fpu_f64[i];
-        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
-        msa_wr_d[i * 2 + 1] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-    }
-
+    msa_translate_init();
     cpu_PC = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.PC), "PC");
     for (i = 0; i < MIPS_DSP_ACC; i++) {
-- 
2.26.2


