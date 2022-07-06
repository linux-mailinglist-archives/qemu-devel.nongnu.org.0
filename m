Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CC568460
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:56:28 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91lj-0000WH-Mr
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M9-0006xF-Fo
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M7-0000l4-QH
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id j3so1087091pfb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=rkOEzuCdy72QBazxfH4WOLbSjgTeSOVXIAJAtC3bTScY5R+y59a1Z7P9mtNaXxDPIG
 kdjf2kZ1Ik7QeONBTLnHc2PFEKKFGqlT+8KGKViUxYX1yoycv+WKzbZVPDOO/u6swk6y
 4OAXbkI2Pz2YOFHwfg2hYH0CwG4gHTUjxBR9+hvML64zBaFNWl8lzNDjijbhbc1gTd4h
 v7F3kyN7MW5zEG9+2PHtB28q5q6axS3G34U2V+O/C+DH+6AMGiV5/PdTUHHohAoxBtqw
 gUsoeXRMm2vBxtODQ+iFZtDKwET9bPesKdOWvr+cOCboT+wfo8SCCo8fcmb0DrCypv8h
 Do8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6i1Exm7OWbV1UGGZQ+hkV1UWXfqGJYzldSUkhdBqXw=;
 b=2nozEuuCm+K84kFz+zyHbh/lIR6KawLHl0VG5K3m6LiDn71bLhkZhyFkerNTsmYg8g
 RfJU55FezcjeKDlo7Nv7hrByOCLRdOnGd+w/NKxmedGjIxgPW7rMEcJvOJuJEBk6rPhj
 nt+6pMFwycLqNLeUb95IiY4VORrLH3t33LkgUzc8nbbJXwGfRNwSiVYdkQ+jLr8KIDWB
 ppzMz4F0fWvspdy56YSDMl0GVeyMMbyk09hshf01YQ5GYh57i5NvfQ+XWI5wTKfZGSBe
 CaGwc4u8QYTGmFPX+G7iVHm6O45fCLrbMU97jjGLvj4Jf3Y6VawwFtM4NSxfEnb0GZAh
 4H3g==
X-Gm-Message-State: AJIora986Nv48JFtTBsp47fca9/qwd6ccy1Ojx5AnUtFI6dzBl8Ib+92
 WIo7oX665SCB5N4NH6s1UIL9Gs4PRDUyYolQ
X-Google-Smtp-Source: AGRyM1taRshPq3djEEbvmEGQLDkVyeUDAFJrlS3zTR7uT7LzAhTZCPDmXc10uPVQw02sZ9nLvrfd5A==
X-Received: by 2002:a05:6a00:84d:b0:525:3ce6:9c33 with SMTP id
 q13-20020a056a00084d00b005253ce69c33mr45074554pfk.47.1657095954501; 
 Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Wed,  6 Jul 2022 13:54:02 +0530
Message-Id: <20220706082411.1664825-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fold the return value setting into the goto, so each
point of failure need not do both.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 3cef2f44cf..8b352abb97 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -287,7 +287,6 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    bool err = false;
     int vq = 0, sve_size = 0;
 
     target_restore_general_frame(env, sf);
@@ -301,8 +300,7 @@ static int target_restore_sigframe(CPUARMState *env,
         switch (magic) {
         case 0:
             if (size != 0) {
-                err = true;
-                goto exit;
+                goto err;
             }
             if (used_extra) {
                 ctx = NULL;
@@ -314,8 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_FPSIMD_MAGIC:
             if (fpsimd || size != sizeof(struct target_fpsimd_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
@@ -329,13 +326,11 @@ static int target_restore_sigframe(CPUARMState *env,
                     break;
                 }
             }
-            err = true;
-            goto exit;
+            goto err;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             __get_user(extra_datap,
                        &((struct target_extra_context *)ctx)->datap);
@@ -348,8 +343,7 @@ static int target_restore_sigframe(CPUARMState *env,
             /* Unknown record -- we certainly didn't generate it.
              * Did we in fact get out of sync?
              */
-            err = true;
-            goto exit;
+            goto err;
         }
         ctx = (void *)ctx + size;
     }
@@ -358,17 +352,19 @@ static int target_restore_sigframe(CPUARMState *env,
     if (fpsimd) {
         target_restore_fpsimd_record(env, fpsimd);
     } else {
-        err = true;
+        goto err;
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
     if (sve) {
         target_restore_sve_record(env, sve, vq);
     }
-
- exit:
     unlock_user(extra, extra_datap, 0);
-    return err;
+    return 0;
+
+ err:
+    unlock_user(extra, extra_datap, 0);
+    return 1;
 }
 
 static abi_ulong get_sigframe(struct target_sigaction *ka,
-- 
2.34.1


