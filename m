Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B969378C4D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:34:34 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg57J-0002sN-B3
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yy-0005Xx-CK
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yv-000391-Vt
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h4so16399113wrt.12
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6v1BFUcHTHuknKkZHtkSafnfLAhD43tM7z8g+lL3ix0=;
 b=On+j3o3Iel7K5u61OE/pGWmx0QgVOWl5SGi0tmOk7dW/imQVTDYFl03K6FWiKn0Rot
 gvN7Z0eTTf8K5u75SnTZMhLPXW7mNoWlkYUCRIo4BU/AKLBqSm5b0Qq89DWCBngBPaJb
 fYNup2NGzRLlucxcW+1HovawQKVhpVuaNGJaw+AUw8MuaD1YPP1SCY1ZY+7LQU1/W+sx
 JYkxKoB7Q2rpJD01+H77uZcJfctq86dr9o2k4mi1q/B+J2x12C3eFbigR8wQ9BOq/EnN
 meDJ4xa6BBiJYcgR1QmBv3TkOWcSeL6tNiSl64ak74HwyENopxkaUf70gpaunOd3RDId
 e5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6v1BFUcHTHuknKkZHtkSafnfLAhD43tM7z8g+lL3ix0=;
 b=Xvxicf4PkBUusgAv4BpGExL03PrJ3oe1mkPNVrn/GJwdVyoz/i9PkYnJzXufAZuiI/
 I96USsIPoaFi8LNdRbM1XusjZpoMR5vkdAdpQ8N+NprgEGmCpJubliad3eqk84OCK61o
 99I5hulx4JthI5GIguD5dxtXmAxnCDUhyESkOCMvPzj+VyVBzMhPxui/OQHD2IEoPxIi
 v3kPWr7G8jWSsKkxnPMOmXwrqA/h4jBCLoDZEwX/j/ZRVjX5D2P4YUHnysuAZueFT5nS
 ysJVjRzwbsYqXMIcSp4uZpIRdiZh7/hvl50U6lCQC/TseDCW8UEx28TDpOurBBKgBW7q
 +RMA==
X-Gm-Message-State: AOAM5308TuY6t+yKOTvTqetNGsl9DFWgNTjkqe0w0ikG4zdUYVje8EmH
 ZjfyY/D0B3G/jS+IvnRHGWufRJPRb9RnMg==
X-Google-Smtp-Source: ABdhPJyykHr3RVumpT7ojpzpkN+vaLvXr1HGCsYXlWx/vylQgzbsNU3UMiVyKsUxD/nz31iygsr2WQ==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr30323003wro.359.1620649552776; 
 Mon, 10 May 2021 05:25:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] target/arm: Move constant expanders to translate.h
Date: Mon, 10 May 2021 13:25:26 +0100
Message-Id: <20210510122548.28638-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the constant expanders defined in translate.c are generically
useful and will be used by the separate C files for VFP and Neon once
they are created; move the expander definitions to translate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-2-peter.maydell@linaro.org
---
 target/arm/translate.h | 24 ++++++++++++++++++++++++
 target/arm/translate.c | 24 ------------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index ccf60c96d84..b5b21619597 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -118,6 +118,30 @@ extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static inline int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static inline int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static inline int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static inline int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 43ff0d4b8ac..bb9e228d1ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,30 +109,6 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
-/*
- * Constant expanders for the decoders.
- */
-
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
-- 
2.20.1


