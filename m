Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5495523B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:18:27 +0200 (CEST)
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lyk-0000fu-MW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdH-0002rz-Li
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdF-000225-KH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:15 -0400
Received: by mail-pj1-x102b.google.com with SMTP id cv13so8164901pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=I0zEmmSRnroTqVIlvOlh//3Po8ZfxZ/ASEC3jQqRUORRN/yJH8qaENzqxLLGVLPB8N
 xT4PzlJajO+pNbHnhE2zFA7iabo1E6NkvW2nD0UyRc9ST+VP/h4H82AS4CULrZ9Gujt9
 nLYRmzO+Hp+kQF9NcsrdmjO2iZt4F+c4J6J8OdpIUSctP37TMqTVJwuez9xkQX+yHHVt
 xxMUT0weFwknYEQpMgFteYH3n1rj0QCfwe/gCvk5JC4T+P97oNF/Icrp22/4caPpOrfJ
 1CyQJmclMQr27YFss1ugqd15xZ1jRMfgwcLgfUSt1+6fhMuVqe8mHGcEsd2KttsBYcjF
 RhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=SH3BuLuPazMMRYNP9Po5rGbEWNRsW47yqTQEDtYI1gRlHC1tVUAovSbD02vjKTUgki
 gHPFgw9vc8wXTqsZ7gSkVhH0XvL6Fo1JSE8YAfsHTOf5wgfMId4mprTDIaZ6Ql+H+Z/A
 JTxr7cBBMkmB9ubGwGdkJyK29ilRqbiLueOrgtNxvR/9DdQNtSdKB0kctUL2p4RsllXs
 X1ryuMzSgoCKfHkWXKKBjfPIf02jWNbzntWrJg1EleH30EfvQdJoldOOVfEZ6bSDdo8U
 xR92BAXi/NBoblGBsqXTNNT0rywMe2ZtlGpyyOKiIUqkfFB+TTBc8a/Xr4gTBQe9qTCA
 A3wA==
X-Gm-Message-State: AJIora8pSyJjgS+ExWEy/T3leY3EeKAi/UWv5E05ymWRkWwFSQAV1u8D
 We77+SArbMrICYw+yeJ+OPaD+2TpSwAwZQ==
X-Google-Smtp-Source: AGRyM1vtCJVbbbObTF4sRL92t13ezo2lq2g7TdtsRKfX+MABmq9gefmIw0RAtgofYcdY2J6NzQEd6w==
X-Received: by 2002:a17:902:b217:b0:169:67b:146 with SMTP id
 t23-20020a170902b21700b00169067b0146mr22838314plr.33.1655747772222; 
 Mon, 20 Jun 2022 10:56:12 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 41/51] linux-user/aarch64: Add SM bit to SVE signal context
Date: Mon, 20 Jun 2022 10:52:25 -0700
Message-Id: <20220620175235.60881-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


