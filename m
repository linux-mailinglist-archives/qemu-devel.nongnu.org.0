Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF056BD16
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:57:53 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qMa-0006ZI-VV
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjc-0004Q4-89
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjZ-0002Ye-KR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:35 -0400
Received: by mail-pf1-x434.google.com with SMTP id l124so13388203pfl.8
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObBO5dq04E0/5WroJlYaFhrT48czebw/dLTC4ZwRUvk=;
 b=a0gTKm+YDEunXFRMEWfBfGCbrdFz7mYChFjdQiQhBUUeCzicP/Kh9Fr8kP6vrKsmBZ
 0SReZTNRmWQFUH8HqteykSr3JcKjJpWo1bCWbrwgdP9K0PgNG3PM3vWr/FJ3jjeNBEW2
 nNvdIT1LSVqqKt09HNxAJsAUCmlZK8u6wRVB4spQEzq+Osd0jz/lZZC6OlMATC8h16Oo
 D0Pb3372TsJCLg14dbAUAwl3grSCJdeG2GN2D0SGg2/deQziiukZt9H4JkjLe6MVcGVx
 f8M/6BEemEYbqDlqtvj5QM1q0GCkZhmym1wmyXQ2jp5pQ46ufUmDN2jVrvgurzhnA33o
 MRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObBO5dq04E0/5WroJlYaFhrT48czebw/dLTC4ZwRUvk=;
 b=AXRC3oteSOO7adZBvOhtTrWTvZJflzt/UhMOuEJtEX6T89gUjTp8gweEvVcxyuu2CV
 P9BLDGKNurujY4dHzDyIrzm30UuxSbjav3I+sjEb0EG6YQXzVfy4r+syC3/2zgxr+WM1
 +59kc4eDPz8T7P4LufIxzU1Gp/r+lKHXhkM4m1G+G480eOwHPyPcD57b/Jb78nbIB+6l
 sF9B342BewfNr4Tl9JYDjibbUilajMKIa33lZ2vjgWaK9YdNFjTFiab8El+w7YRCsx7g
 XWut5J7u6xOjKTPdz1v9aqwmt2mdIMBS8EwIUxs+Vq25MqnCjsElHvgFMx36qFN0ORvQ
 nOuw==
X-Gm-Message-State: AJIora8JUIy99lUvXqnTMcBJy2qtWticeMtgCglZedLMYoVsXljcEHFG
 LKJrDfafE9j2hMTYrzwz3HfKNVrvrGPQPtNO
X-Google-Smtp-Source: AGRyM1tsXKyhPNB0sAnw7Mv4Gf7owVpUvnxp/IMl4F9BGe4sxsbxRgfTE3hdI1k74fbTTmZnI5IF6g==
X-Received: by 2002:a63:1a21:0:b0:412:b103:97a2 with SMTP id
 a33-20020a631a21000000b00412b10397a2mr3787164pga.12.1657293451081; 
 Fri, 08 Jul 2022 08:17:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Fri,  8 Jul 2022 20:45:30 +0530
Message-Id: <20220708151540.18136-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Make sure to zero the currently reserved fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7da0e36c6d..3cef2f44cf 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.34.1


