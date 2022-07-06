Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B1568389
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:36:23 +0200 (CEST)
Received: from localhost ([::1]:50360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91SI-00080t-PI
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M7-0006sN-2r
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M5-0000lS-G6
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:54 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s27so13419282pga.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=ELVQxAkwUONMK0N33AvX6XnGRdvzFCuJTCFPymZ3//wepfj99RXyrI7OqhoxBm8rKC
 4+fZ9I2HWa00sNbxp1MygpF6Wu9/VbHjV0MtiAeTfvrfSTUkH0XDqaLQPUOGy78+oC02
 HPNBtMobtIduXpBVR4yTZaTAFINNIENbunXIhly0SPUWGDdJxvhVkN17JSII1uc50t4y
 MNZkfLV6K3dITp4/8qE0n5N3k26oLB7Bi/mhpn4Mh2/4sSPs1Mllq1n4kUoMfeuAqxGI
 UyfNSAWEK8o1NmJtBc0cwIf739datNSRB4VRwwvu/gD2jxfav5/Vh3uaFbU87LfDf19w
 YwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=RIir9GPOA7uGl0hnbh6OnxQJ3rDkdUliJe1YNrAWrPMzPNmHgE6hWk6bk3hFTqKot4
 KTcWhWHWdiLG9jHOrtWUx17AC/Mx1XocFNoxKkNF16Yh853ZuJALhDmrGGSfdqBsVMjY
 Q11XyAiCHymrv1/q4CBWQqdHLmuOM5yQCGwAI2pg4wyrjKZnAYD/2tSMxRDcHzrkVx00
 6o+8cWvFk9ePOjyZe+bRMWeoj5rVguzeGz4kOTJYNkxQ35Or3g+cMdrQscZtxV9GuteX
 Yq/FumdbOTzd2qY0v5ucSOpnzgXq18NQzLuI4WEjZkBmrEIh1f6gL6Xy6Qk3/s33yAOp
 d2cg==
X-Gm-Message-State: AJIora/tOMW86fIqOS+g4tnrfhyz/zserMoi3eOc+ilG8p/CoHU0DSd2
 oFpsJtWhHsU0wnI+R1kipFn9LRANk/m+fqOO
X-Google-Smtp-Source: AGRyM1tfWz3mfp2X9qJJ1nNx37ExB2fLWxagkFBqErJgu1PfJuHicJ1/x3uv25r1JX9TpWrFpTFTlg==
X-Received: by 2002:a65:49c5:0:b0:412:6e3e:bd91 with SMTP id
 t5-20020a6549c5000000b004126e3ebd91mr7555829pgs.221.1657095952247; 
 Wed, 06 Jul 2022 01:25:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Wed,  6 Jul 2022 13:54:01 +0530
Message-Id: <20220706082411.1664825-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


