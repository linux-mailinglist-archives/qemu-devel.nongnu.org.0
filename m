Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E35523D7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:28:30 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M8T-0000jU-AS
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdI-0002s1-5B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdG-00022D-Fu
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:15 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w6so3709175pfw.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=OnOsZpuOIc0wPZnhT2ygJ9mo87qkK5Lfy5UziUhuOwSTqhd43aGqNNp3h73tL5BEKJ
 3gsIMCZa/XAvQZIl2yRrDn+/wOo3ei61oCQTuxNdedZMxTq6ZFmWpry+or46XGNNcYAs
 LOUtVH9Lg5VAo+KAqu4rp8Zvti/lnIUFiR2Wdvwmyi1T9PVeqAME/xuYHdBf9ngNpSP5
 cg8diQhmfvHXXKC6hFY07NoRKBSlYw1S/9hPBW83bGKIfowKKTTBg2hHZUVsjScuWcfF
 gRaaSo72DM+vC5a85idxojSSISOQgECtzbI8AVYIKmZTSmazV1Md5BkC/tkEit77PwAD
 lClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPMml4Tfq67+y3oqJMSmdBs/iUTANF8r3DziFKMfYRY=;
 b=UA1ialTxjbqkvj+Dc60NC2OwebJI/b6KQxH4WsB7tgnLcbyklw+sSfDckXe0rJBZaY
 52JxzxACTGNayRf+RaNA4NWyJkyJ5zeEKe1XtTmc53P/IydwAEDjCJLr8ZovUClW5l6D
 vgefYowkGUipJiAcDCtgz5Q5lwrSUY43KR4lhTjjiBu6m0xZ6bQeDXEg9Fbs26CRIZTQ
 I4d+GAEXbGGAVv7y2wuIYUnEVadPjaf/9+HOe+dObTAbalb2v0dJVXM/cIYDeluWpSwU
 WXQ9Q2DRWYefRpjfqUopIBXZXtAm3D2ZuhFXHXEfB3QpZlPQyCvze6Uo2y4GwnL5QnhV
 GuLA==
X-Gm-Message-State: AJIora/Wp+K4boumIgPYHirGvHKTD68Lgxe8q2FkdyOtJVkWmX9Yq0X2
 9yZQ9wETDFwFEYMEkJxnqLT+RTNqvAQbqw==
X-Google-Smtp-Source: AGRyM1sC7Cu0imaurkyYGMyMnqZllAc8Ti60ydoFOFhfwMUT/TBIye82XhyKnaRr6o1MXTIvBHxC2w==
X-Received: by 2002:a63:484c:0:b0:408:a75e:c44a with SMTP id
 x12-20020a63484c000000b00408a75ec44amr22916555pgk.363.1655747773160; 
 Mon, 20 Jun 2022 10:56:13 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 42/51] linux-user/aarch64: Tidy target_restore_sigframe
 error return
Date: Mon, 20 Jun 2022 10:52:26 -0700
Message-Id: <20220620175235.60881-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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


