Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD855370DF1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:27:49 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEwe-0007EI-T0
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEm5-0005jB-5W
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEm1-0007Ym-Q3
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l14so3099161wrx.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEgBRw3bS0UqwDQNEnkoqhfr+jxoj1xXZeQLuQmGs0c=;
 b=iDaNjdJg72Z2bctorpKU/LM3WXl3AzPXJlYq2lmGZ5QPgS8+m+TPCGcX3gCUcmXuqg
 OVJlyXT71fXBZQTrJ3GIAimpugbLccVFGo0CAgcrtgOcSUCcBzBKVp2nTiSOtOzXqAk1
 yLl31QHKekjBv2zLI9uVFb5o7ZL5lzfS6gxP4YqlN3AI8SGrUr8h5WtHmqrpIyqT43Ru
 a8RNfCcY6kVZI5ehYg7E3XQCO6e0JNE6SD+00dez2wsglL3vJ/3juVybr6aNetfQ2eNo
 3J5ZdUIXPD9FVX+DYTC4ccYfybnsLQPJUMo/al9or1WXXeC/vFxgwRfJCl05GhoBKfnY
 k6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vEgBRw3bS0UqwDQNEnkoqhfr+jxoj1xXZeQLuQmGs0c=;
 b=Ws1ST6kjViCD3TRBt7a1UmwiMnjLP9I9MltMt3rhsGZ0Ju8HIvO4AjQGeKW6xu+O5f
 G96glxuLPGZuXByDmNd9BHJvvAiolbgCnKeCoiQ6zXvTBEJXKFCWu0pSs1yvwmT+Ug2w
 rKqyJu9l8Ot9bx5rQKKmOb5aT02gCDSvksErwUuy5GqSuTDe519kHsEw8rEMlh8sY8sV
 kDA7eiYCXPfHfOpRh0Fdskvv+aDrWAe7k501KKtbaC3tWDILwr3tN6asxAzwLJ6Xuv/H
 scfwfeyCjwAjfsr0huh8xNIVdYOv1NaRZGC5G8MzdPHUKcRce6BlsuJqXlw9+JDqcBcS
 pa2A==
X-Gm-Message-State: AOAM530XLQ4I4xEvzatGopEFaXdeG6UyVonXR8jxJJmkWj4fnS9Xuzte
 5KxT0dPulNQEzcQbpwqpm0JCMpD8TRg8WDuc
X-Google-Smtp-Source: ABdhPJy0ozRtVnQkWEijqE0clAm1KTUz6rztSjqKvhtTwHjFh0hURz3cGu9kyj+PSRXxfGG0F4n1Sg==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr11462265wrt.131.1619972208227; 
 Sun, 02 May 2021 09:16:48 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u9sm8759441wmc.38.2021.05.02.09.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] target/mips: Turn printfpr() macro into a proper function
Date: Sun,  2 May 2021 18:15:15 +0200
Message-Id: <20210502161538.534038-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn printfpr() macro into a proper function: fpu_dump_fpr().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-8-f4bug@amsat.org>
---
 target/mips/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 232f701b836..8f76f4576f4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,33 +145,31 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
 #endif /* !CONFIG_USER_ONLY */
 
+static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
+{
+    if (is_fpu64) {
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu: %13g\n",
+                     fpr->w[FP_ENDIAN_IDX], fpr->d,
+                     (double)fpr->fd,
+                     (double)fpr->fs[FP_ENDIAN_IDX],
+                     (double)fpr->fs[!FP_ENDIAN_IDX]);
+    } else {
+        fpr_t tmp;
+
+        tmp.w[FP_ENDIAN_IDX] = fpr->w[FP_ENDIAN_IDX];
+        tmp.w[!FP_ENDIAN_IDX] = (fpr + 1)->w[FP_ENDIAN_IDX];
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu:%13g\n",
+                     tmp.w[FP_ENDIAN_IDX], tmp.d,
+                     (double)tmp.fd,
+                     (double)tmp.fs[FP_ENDIAN_IDX],
+                     (double)tmp.fs[!FP_ENDIAN_IDX]);
+    }
+}
+
 static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
 {
     int i;
-    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
-
-#define printfpr(fp)                                                    \
-    do {                                                                \
-        if (is_fpu64)                                                   \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu: %13g\n",                \
-                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
-                         (double)(fp)->fd,                              \
-                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
-                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
-        else {                                                          \
-            fpr_t tmp;                                                  \
-            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
-            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu:%13g\n",                 \
-                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
-                         (double)tmp.fd,                                \
-                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
-                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
-        }                                                               \
-    } while (0)
-
+    bool is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
 
     qemu_fprintf(f,
                  "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
@@ -179,10 +177,8 @@ static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
                  get_float_exception_flags(&env->active_fpu.fp_status));
     for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
         qemu_fprintf(f, "%3s: ", fregnames[i]);
-        printfpr(&env->active_fpu.fpr[i]);
+        fpu_dump_fpr(&env->active_fpu.fpr[i], f, is_fpu64);
     }
-
-#undef printfpr
 }
 
 static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.26.3


