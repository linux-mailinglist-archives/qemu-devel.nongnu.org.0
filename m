Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC653A8E27
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:16:59 +0200 (CEST)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKAr-00031I-1i
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6J-0005BF-Ms
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:15 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6H-0008Kw-3p
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id n12so550380pgs.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYIekZ7E/4IYX4eiK6xNe4M6uHE016F0haAs2Oq20xQ=;
 b=Cop90s9pWYpPLPVIBKugKe96uw6O0INI6O5CcP/EL2iTFNKsBstuetvJG4dR1F73gu
 P9vVyf47OGlWh35TZBk9/TRzOtmGCMFbw6wLsMUl50/hNRGCZZ5RdNWtkuz0S3MJxzPK
 PeAfdwOsbrNJ6sDsk/3xiJA2wtVcmylFVQKSfxM3KHJz1jipMDMayX4qvad58ThzWYXR
 poKRmOheb5gC3LdjCZq/nutiv6uGIeJjKdpWeSXT0NcFodWw5/6PWznK/3GLOek6CDRn
 gzjAvtEFrL5u3zYzzAYw/3JDGVkCRGno4R0k96V/k/80fLI9tzU65I5gpgfZYW8s2zr2
 sKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYIekZ7E/4IYX4eiK6xNe4M6uHE016F0haAs2Oq20xQ=;
 b=TL+/YN3uqopAVMv5GnYUBEmffIkY94aFXOrIMNfDxQ+HlTXDJw7zsY5/HH69OL7fbG
 UGXYc/pGSpqv2ec3mixELQSaeJbzAxHuEgxXxJxZs4wvZgOWu44atly5lBjGxowqhllx
 k7GaF6X95qiCwOQxIlEPLIYS0B9UJ45dLh1aQkT35HSGe7QkJn20lfM/FuU0W0P/YVRU
 7CRQud2UdHHYA7rXnQ9zfo+pu+2ncfoCQ/94JuLeDHd12oZA2cJ7uAFdWM+oPS3XXd1h
 rUne0W1pCkj27MsVfCRpGVn4dGxhYt0zn9ybQ4zhDRL8uTnVbjHydFfCGx8wUuT2MlE/
 Ri6w==
X-Gm-Message-State: AOAM530FvSvhj2rPMTbTFmxvcX4JMSGhX1xsoC0N3lmakCQpAMdx3/sw
 JVntDeraECF0tjNkPdThrbRIeOc6paB1fQ==
X-Google-Smtp-Source: ABdhPJy7tc7mQXkXt2kWBh75KuMUvKYI2MbNJbjL0kctjIV6w4PfySfE+Hnb2qi2xUcvuQG1QLrNfg==
X-Received: by 2002:a62:e307:0:b029:2f8:d49:7b65 with SMTP id
 g7-20020a62e3070000b02902f80d497b65mr6998165pfh.48.1623805931806; 
 Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/21] linux-user/aarch64: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:50 -0700
Message-Id: <20210616011209.1446045-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  2 ++
 linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
 2 files changed, 20 insertions(+), 10 deletions(-)

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
index 662bcd1c4e..65b84eb04e 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -108,7 +108,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
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
@@ -576,3 +567,20 @@ long do_sigreturn(CPUARMState *env)
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


