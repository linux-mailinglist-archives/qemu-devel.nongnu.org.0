Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C1341C53F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:10:59 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZMQ-0003bE-4L
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHj-000664-5m
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:07 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHg-00062u-Ps
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:06 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 i26-20020a4ad09a000000b002a9d58c24f5so737730oor.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VOAvx3TChGYyGqXcRBxcpjzeCX+UxKswiiX03Eo6C3g=;
 b=CLa6BcebyJSQGf8uPtebpFpdlIR8YRDOOs+qO3M7/M1ZB9o9yRtfdv/5GOjqwMhRB4
 IrDQ1X3NDzAL33CsZF+fzpsAj5W6TDjvW84p1ijHroWk1XntBmJeL7RLUna9bqcqqFQ5
 bQXsHuPskH2QA+cCGBxcHoupaqLl9JwwgPgkYWpwpWO+iXynsVlFN2x7iWgxwxy/VnyB
 o3Bm0SZorbLl8a5sphnD2On8na+bRzc5Skg4JapuFZz+wyJZbYDQx4FTGPz0gYVqT9ot
 JDsyoA33o3Jjbo0uUc7qj5QdrJMDcf2fVFI8AI/055S6SlmcH9BB69SJiRDUkuCmaz6s
 JF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VOAvx3TChGYyGqXcRBxcpjzeCX+UxKswiiX03Eo6C3g=;
 b=1qrtJtfMGdWregdnc1ngXuRICAIrAaIq3VDyKNbpv2r6ApvighOye8Ax8GWE71Bler
 FbctzYdB4LmCjY02OW2qRz/B0Vg0RgQX7TRkXAYVoAxoau3iBaaR0ak8FxYlP5L/cN8C
 J3E8UlXGlYzOSEiQAn31vaMrlOo+kl7a0IMnM+fMhD5/TMZjIk+h9kbWTLD7LJ/Czg0U
 94ndVN1+K95T/CfTOA8BSOmonAe/TU7RDYewpwsxHvKJqcHIGVpoWRkUksdt/Hz/Xtut
 goGKFqfEeu7EVLzbFtpiUFdRhwhyUhxz+1LgYpIiWkQwsrbi8p0+xRswQr10yPyxTKVb
 3YFg==
X-Gm-Message-State: AOAM532gCjmWJ/Cx+fMDfmv0ima7HCx3NYC71R5qoBt8aMDnETrAN1yr
 VtVF1clcVT6o2oL5zPL01ZdkXvY30XKmuw==
X-Google-Smtp-Source: ABdhPJyi/peYK+RMV+eUVeP4vOPsmn8Nsn0cWiIBaCsyYRfHb4nEC2NqWMW5kYOYlRjqYVR1DP1Lxg==
X-Received: by 2002:a4a:adca:: with SMTP id t10mr5458561oon.19.1632920763588; 
 Wed, 29 Sep 2021 06:06:03 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/26] linux-user/aarch64: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:29 -0400
Message-Id: <20210929130553.121567-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  2 ++
 linux-user/aarch64/signal.c        | 34 ++++++++++++++++++------------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 18013e1b23..7580d99403 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 49025648cb..29c52db3f1 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -109,7 +109,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -461,9 +460,9 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     layout.total_size = MAX(layout.total_size,
                             sizeof(struct target_rt_sigframe));
 
-    /* Reserve space for the return code.  On a real system this would
-     * be within the VDSO.  So, despite the name this is not a "real"
-     * record within the frame.
+    /*
+     * Reserve space for the standard frame unwind pair: fp, lr.
+     * Despite the name this is not a "real" record within the frame.
      */
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
@@ -496,15 +495,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
@@ -577,3 +568,20 @@ long do_sigreturn(CPUARMState *env)
 {
     return do_rt_sigreturn(env);
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * mov x8,#__NR_rt_sigreturn; svc #0
+     * Since these are instructions they need to be put as little-endian
+     * regardless of target default or current CPU endianness.
+     */
+    __put_user_e(0xd2801168, &tramp[0], le);
+    __put_user_e(0xd4000001, &tramp[1], le);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


