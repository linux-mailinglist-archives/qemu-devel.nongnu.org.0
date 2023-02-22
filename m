Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52A69FF78
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWW-0000UU-7y; Wed, 22 Feb 2023 18:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWT-0000Tb-SH
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:41 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWS-0005Lf-9y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso10541894pjb.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=q8UiJlMYn76Kp5xIiOK1vrmBwGwUfGzPLHc9x4ZwIxPw3yr0cfMCUVAgGIJMvMcOFM
 LfasL7cLb0blW2MI4X0vj55Peyb6lX0MoZMq4B+ij08UdRzOABYtbfXfYdBBWkXs4rHj
 ZXkk/TqEvjF2SdTxCgWFKNsohM4x4meR6cKAjKtcMetUG15MeWtk6jCwpcY0U6zzeeWc
 PGFr1cl9hbVI3XC/wHGljkY3JQ7NdGuD/XO4hGxPuzglML5ulIRFB+M3GYrtgRAvihRG
 J8q29UDZhQ2XkRJSfaeTywnQoYpp/maac6wcEmwP+GitswQjHZBSFzTKuLoYb46etmrk
 5cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=b02cZ8IKPKxZkIKb+MIV0fNeKBf4ynU614f4U4lOL1NhJ9IP8XALVy1Gv+jkL9Y51y
 H3UwHISiq7iE3eCr9R32eYtx3/W28Szc7Fij5KbioOIzSsYpysr+AssbTqd1cAF0H428
 VPHAvBr+aAt7R2FKdC1wGn5dGWF+WiYS1vYMcHqB3dWV4U5PFcuQru6c2UM/YvVeVG8Q
 kwg31aJkF9mWLO7SfFGuOz017clDgTmKob63rkvmt5S2WRBe/mSag2rt2xIvAmtCU+c2
 JjP2vHTd7mA/+fiOnoo0TVi9sc8n/cbP+Gx4CgXvNKVPZFhrS39x46ZoiR7QIEtr42QN
 rXyg==
X-Gm-Message-State: AO0yUKUiMXM2UVwZzEzdj1dsaLvbh5jw/yVEkG29hnimRdroTBPo0Bol
 gjhvipHNd8clm3L4XHean9wcJibbKebsjxqp5B0=
X-Google-Smtp-Source: AK7set+Iuj7sjUZJnUXyHNP+2if04y/2scL3UeVqlBMOVyYUvDpR4QnLJ8X4xXt+YXm6HB4tl5mMDA==
X-Received: by 2002:a17:90b:4ac3:b0:233:f354:e7df with SMTP id
 mh3-20020a17090b4ac300b00233f354e7dfmr12157714pjb.18.1677108458921; 
 Wed, 22 Feb 2023 15:27:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 15/28] tcg: Change default temp lifetime to TEMP_TB
Date: Wed, 22 Feb 2023 13:27:02 -1000
Message-Id: <20230222232715.15034-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Guest front-ends now get temps that span the lifetime of
the translation block by default, which avoids accidentally
using the temp across branches and invalidating the data.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6cc6758cd6..2e220d4040 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -901,7 +901,7 @@ static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -927,7 +927,7 @@ static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
@@ -946,7 +946,7 @@ static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -972,7 +972,7 @@ static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
-- 
2.34.1


