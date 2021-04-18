Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF3363850
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:53:33 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGIG-0004Zj-5E
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGP-0002pQ-HW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGN-0000Wi-LX
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id p19so17159457wmq.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTQ5LbmfBKa+DkChI03N3lX+fZBlTslCfIb2OafYz+c=;
 b=lVi3ifnZlBlVA9Tv1suzJAXIDD4rwQKhYoZ1+vj/HtpUnz62dPam8ae+PYQELQnYtC
 zl0vcqn9S7l8VeAf/Q8ZFv89JKNopf3e/r0WIHJuqVsZgCJKAp9cDoBnbhLB5440rpdO
 s0jCYQ7FplSaHg0liJj12OidmVRdaVbKO0KQrAp9REPKRcUDRs/ganE/DlSNceKzAeB1
 fGhWlZjSfnuMiAmzkg9zQzQboAvE6T2fGS9XL3pnOaRSTadci7FRNscsTPI0cpyfAhPC
 CxkuZJHsJgfT43Y7iS38PKc21rpARw6H1Q4Ajc/JzrOc2D7eWUQ/XJnu0GpBjAySyBt0
 g49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fTQ5LbmfBKa+DkChI03N3lX+fZBlTslCfIb2OafYz+c=;
 b=OoCLsS+MN2pDA3w1f6iL6EsuympbUl3u89+FTpJJIvlQeY3lxQCQmOGv4pGcAFcZWj
 BDZFtzXPnOzY40lrjWXCmJx8QzUDiFNRafI9Y/TOaMR7o59ZKtIcpC/hhBvct5HANkbL
 vHA23Yukt5GcfjlXHkpHIdCedtTWAb5Tz2/RjEZE6xD7ZLgDTwvwm4Sd/WN3aZmDpkgV
 uEUhF/lVptDaboSCc6Qaty/h38wqr5ltR9UK3nvo0dY3AUsbQxyVxJCsvnqDRzez+8vo
 tCRsFzyRXnkrKdx/eOBvkBYSFvvID/npy8b1svqDsig+3V8FVAW4FwP5TbwY24fM5RM2
 Cp8A==
X-Gm-Message-State: AOAM530VrjM0IzzpfYbPFAFIMRNby+VoQqjtqVs6jFkMir7jEQBoBE5I
 86xsDZJ/ozkNrEx3UFbMCfSw7bxa1LmvjA==
X-Google-Smtp-Source: ABdhPJy/9KW9kNiXZwJNCB8pRsy2QmigWiBuSPGGqPe1uEtPrGEQFQSHM2AYYljm5FQcWfu9FLcAKw==
X-Received: by 2002:a1c:a182:: with SMTP id
 k124mr18974890wme.132.1618786294123; 
 Sun, 18 Apr 2021 15:51:34 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v4sm17235085wme.14.2021.04.18.15.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/29] target/mips: Turn printfpr() macro into a proper
 function
Date: Mon, 19 Apr 2021 00:50:36 +0200
Message-Id: <20210418225058.1257014-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn printfpr() macro into a proper function: fpu_dump_fpr().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 48 ++++++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 232f701b836..90ae232c8b8 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,44 +145,40 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
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
     int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
 
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
-
     qemu_fprintf(f,
                  "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
                  env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
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


