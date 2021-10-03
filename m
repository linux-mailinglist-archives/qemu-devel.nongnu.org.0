Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB1420219
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:44:07 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2ik-0001vt-FG
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e4-00043Y-AC; Sun, 03 Oct 2021 10:39:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e2-0006j2-Ui; Sun, 03 Oct 2021 10:39:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id j27so11272729wms.0;
 Sun, 03 Oct 2021 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soj3mlpq1XGVnYdRPbu8mTTZwhPlnAcdl32I7zHR/J4=;
 b=eLydzjjUSndvsp4Pc7Pg+frBLP8Hf1X3x16dY8TUxs7edOM64E4rPbU5EsNvajN5sG
 YY3jKswTGiYxc2CrZP3+o4DMfcX03XqSA/nzLlNQDI5KuA7N565qXPUYSecwenMr3LJ6
 RK3O0fMLN1/9Z+SKybuYgOHblrG/A8oPBoyNU2HJE7Ny2e5KDZRQZRyymkh3WF4xOCgX
 v48IVCsZU8GiUtaRrn0VM0WPc/rms5jdQGAaAn0yE204edwfQTZ5USRpN4Gfuo14PYVj
 cJEqWOs3yAEjuPfcWuZbOkruv2RfLPNVJyntk4oQbPmohf49Ts6CYn7R2lwXCD4Vf1Am
 Z83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=soj3mlpq1XGVnYdRPbu8mTTZwhPlnAcdl32I7zHR/J4=;
 b=IOyVkNBZ0e/rJyuuWRAi9YfOOq5kqDVp5xuZxD/eHzFN63Hh38V6T/aEIQT+eA606d
 bI8Abee0b85xk3hBn/tJq7oLFw3TC9WNxW1jhb6ZHjhpptiO3vwvrsInnekPWlHOGq4n
 +sr5h2nnlUQp/KEEOd7+Ut5KyMYeSi1i1Z/hWp9TR8whISdRrBa7F8V0WvLbnIwm0KSz
 vfm5M2lKaXq7wyudIyRDWERtbWnDxvLjvxR8OZ4tcY3/L0Zo4AEHEBF6COnAijSaGyyM
 JtoRN/9doB+Kvu+oDqvJ7m+x3baYJ3IIf7Ep2/vdOFSt6DIWrjaGUg5Uet9k98ElpjpX
 Txug==
X-Gm-Message-State: AOAM531sUMBueu5l1WluYNe+G7uck/fbwxNhXdwYVk5+m5kgaQzHjm72
 gfnD5yPFwN4C0vo8xPk2SI6MnwnPpRc=
X-Google-Smtp-Source: ABdhPJy5E34c2Zi/jXLcI6/sJLb1t6Bv5fBVKP0szLHSNfjBdlHS3dqhrXPEqF6Oca7SNDh2FZOwfA==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr13573772wmh.171.1633271953008; 
 Sun, 03 Oct 2021 07:39:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s13sm10472245wrv.97.2021.10.03.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:39:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Introduce store_cpu_field_constant() helper
Date: Sun,  3 Oct 2021 16:39:00 +0200
Message-Id: <20211003143901.3681356-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003143901.3681356-1-f4bug@amsat.org>
References: <20211003143901.3681356-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a32.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e8..b0abaac6f99 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,14 +61,19 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
+static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
 {
     tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
+    if (is_temp) {
+        tcg_temp_free_i32(var);
+    }
 }
 
 #define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
+    store_cpu_offset(var, offsetof(CPUARMState, name), true)
+
+#define store_cpu_field_constant(val, name) \
+    store_cpu_offset(tcg_const_i32(val), offsetof(CPUARMState, name), false)
 
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
-- 
2.31.1


