Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF2570650
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:56:34 +0200 (CEST)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAupt-0001xB-6H
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvm-0006j3-G2
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0002qA-5A
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v16so7100831wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v0XksmWulWyoIYEkFkRz7rlUUrdgrjXm0Tlxlvbybc0=;
 b=X6PyNrCY9wUsRlxJekVAJhNVAE89o9oikBE1X4XgdGxyapkElTVdVuP/RDJf9r6Y2W
 Cng4pVnTbOfEu4BtTGLhr6Lywl3zLifv1bEdFnPbfLyGfhgjkhfmqmWYTA6fwo29+2Py
 Qe8CDwxZqxgItaKmaffIqWbd2Llftl+Xdh1Cmn+/zTOYOnz/u7OchbogdzE4fqQXCDo7
 troV4Ufb3UWGdbHEG3Hzv5Na+lJLjC1qBX9xB+gAxmFyPqHW6PVvq3p+1VWPJxYhYqEn
 5ny5WQwyJPjceUDbkbYrm4nRGdBFHGPfM7SNl3715C3f1sIcDtYejmTl0VsZsZdN5qTM
 cgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0XksmWulWyoIYEkFkRz7rlUUrdgrjXm0Tlxlvbybc0=;
 b=Ps/9ZFyptfO5GFs0dYnruss92yGOP9GjuLqt3h72+Fb3lXpP47O50yvlP/5a0gwpLV
 17VZYPi6pJD75J3oZTwFmeHsdUdK+HjQGeFiVG5n1BmCqqaBsxXgqw+/FIqhlP81ggmb
 2vkLwNVwHuaiR8R+Jjr6md7EgSQ9k+ocbSwKA8vDSwxn6qPU+gtlJ/dEdpKOZu557U0d
 aVon6DYzfD6pjCCxBCj+eVGgisxghSmJcTRQLIuNMBjhbBWjIHJiVq85TIjnBfi/7Xnu
 t9IOz5lsWJCSgvqtPiXE3Pq+WMBWUhUBwav9P29UUpBfh2IKsQhIOMSwcwKw5QlCqviV
 UzjQ==
X-Gm-Message-State: AJIora+F1LDJ/qfiaGhSn8i9JeWKOzrN3NVY/IBmNp5/kte45888Ir7L
 /s+KsimA7GyBLPevhAYZ+WkcsNqo7GVFVA==
X-Google-Smtp-Source: AGRyM1siAis/aYrST1yLrGqmUL8kq+x5hWxZKHZj8HBd1e3ioRsL5VLogjlhHKm+EqCrXK0ob88Q2w==
X-Received: by 2002:a05:6000:15c3:b0:21d:9f8b:2c3e with SMTP id
 y3-20020a05600015c300b0021d9f8b2c3emr8368779wry.72.1657547902271; 
 Mon, 11 Jul 2022 06:58:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/45] linux-user/aarch64: Tidy target_restore_sigframe error
 return
Date: Mon, 11 Jul 2022 14:57:41 +0100
Message-Id: <20220711135750.765803-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Fold the return value setting into the goto, so each
point of failure need not do both.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-37-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/signal.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 3cef2f44cf5..8b352abb97c 100644
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
2.25.1


