Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCEB55BE76
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:32:11 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63pa-0002Xm-19
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kV-0002pz-GH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kR-0003kU-CM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id jb13so9966190plb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=hBs/391mBUNXZXJVaDcIN3yFJeRFk6nzxqb9FprRy/Bg1FKtqoP++ezU6gfp8I934n
 SHEwCnKqHjJzt3KNjcqUMnwDU9I2quv2mlRoBHAbRwmMctvAuJhJFqKB5NJeCUQYFo40
 jj4zio/zX1UKxXgN3UAVC+PV4zzmXC9xT3AtojprgyHuf0yxkBmNCv57S/rpGxyFo4bd
 MwR/QssPvrTvpb9LoGeGGKzlXllYtcKeDKCj6PTPpBB0T34jLP4LKQOT7ogOp70hSxJP
 YA/moE9Ocei8SHogqZiJCPeSY+vGl7t8gI+EukE5ApWHUUAL0s955kxdQe5624S6rp3L
 Shdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=DttaTJYvuk8TlFUjmTAPoYaaQ1Sl8vZzZ1TBBbJTro2CsXyfpGW6VRLxT8g9xL/XQX
 eiLUmPZ7U8+WSSgG0YLwIthisHETH7A/ARAdsTpxAJmUPoFE/nVwJcaYtvWXpEYeykp1
 wjlHOdMBG6Y+/zyGUrO4XrZVxcDyVv28H6SkdlJxvOxno3xHuJ7vwRiN3AhOKSGb4NkZ
 cP+8MxjyNx3OfDiM87yHyk2fSDSsqsEdlnZSFdi7hqq9Xw/zOhJ79jJnWBoEnWCH4G5l
 o+QGKUKt4Gw3LVjC9vzA/ZXu/PUepbl7aoSAJUzH9gChv71ol2eSkDyLv4GMIxsXejEB
 EYxw==
X-Gm-Message-State: AJIora87aV+lRKkrryRs9Z/nn7hXy8CPFA22pNPv6bZtKYYAl3JE0O4S
 s78/8ViXYcmph2KRLNkuYfbyidPx4z341A==
X-Google-Smtp-Source: AGRyM1uSYxKTIYeI/f8BOm3mFqZWGpRy67nHzTyvJk938JoVkCE5ilZRPkfjytrR7LeH191WE0DKag==
X-Received: by 2002:a17:902:6b05:b0:168:ee36:1928 with SMTP id
 o5-20020a1709026b0500b00168ee361928mr1764667plk.114.1656390166075; 
 Mon, 27 Jun 2022 21:22:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Tue, 28 Jun 2022 09:51:07 +0530
Message-Id: <20220628042117.368549-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


