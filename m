Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CF541B96
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:51:40 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh6x-0004Zb-TX
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwu-0007Bm-HL
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwn-0008LF-7Q
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h1so15783545plf.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ZAjjgadE2Bg7RCCjuuzOFXghuaZuR+KAvojV219qSd6n63WjYs4xH4LEiBjFWYO9pH
 3Ue/N/ygU0PdOwhYoXQ5lE3uZD9zCPWbfDZ2rkbRO0xJmbzcRgzPgRekEhHjNGMLAFDd
 oZBrNsaFpX3oCRjDVl7Zw/rF3WUF6dnD3I6VEHD4itUHpu4NrlTm/QKNNKltBk4pJ61C
 z5DqwJ9kr1NcJ1sK1yt6WkMd+ofjYFuW8BlTwzCCgAOFFZBKNJtcd2kHsy+XT4zDqQv5
 f0PQfkbrTdjuCe10SNL58DRJmyg2W+mjnZEze8Cfl624d84oOz0NmswrfDg/Nie7aNcY
 grIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ywteUHb68rQQDX26kjIyuxmJPUP2147TeB4PG2qv54NHUZXLkN6sjm2+8FfWNBRYql
 isxdAXeFR5DNqotKFuvuADvJILcMa/Nn+2gEb7Putn8I4yJ0oWguwxL653c8j0lsCjQ4
 kyb4s6a1fidbXVOaeqX5LoJezLAIPtJExxDL8gxqMzLVxL+e+2MeeuGnE0pGyLZw5aeC
 wzGvoHaAAfJC3dbASwNAydbV69Ql11+Aap4tq/A6SGQDXIsCHX9wTMfWJqvSR8ZfJZxP
 RZQXJ/tlArjz+lKx0Zz/IKTR/QpbNpCC0e0t4SeqD6Yd4yXFOhQAsTDIQ1q4VUpvm2DF
 lXEg==
X-Gm-Message-State: AOAM531Qw8U4eWCZuNcOL4SkFiBKVeUKj/JTsuJD5yqVRG5Nks2IrkXd
 n2hwX5p4levsf4DAWC5vUFIc1XrYLWUttw==
X-Google-Smtp-Source: ABdhPJxznaQ36xxPSw6xOrLAfNDqyNd16M8wD1SFiVsPqbzbdJz6PclkH1jbPKsXhvlmIh8FV6UfXA==
X-Received: by 2002:a17:902:7b8f:b0:162:467:db7c with SMTP id
 w15-20020a1709027b8f00b001620467db7cmr29671017pll.140.1654634224007; 
 Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 61/71] linux-user/aarch64: Add SM bit to SVE signal context
Date: Tue,  7 Jun 2022 13:32:56 -0700
Message-Id: <20220607203306.657998-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


