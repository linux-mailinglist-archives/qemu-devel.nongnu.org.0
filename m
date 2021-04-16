Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0A362A7D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:42:04 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWDz-00035R-4b
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdf-00068Q-Od
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdQ-0001je-KL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:31 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p67so14195073pfp.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCDHvXiyFXS1mzEiFOdu1UrmPEyO05QZiiThz71om18=;
 b=KVAj4DKavMVJw5wI5GH7QMxT6FW2E6YDuOuPBeY4z4tDTmfUCans+feT5uli14Pttv
 ff+JQ2O3W7n+DbVczxme2y7lXpYycyMmtqzaQllI3D1mSxFLuzx9toZB6z+9WeVIEjH7
 Wpz1uo58AhTmdKy4la8tdXliFNS8dJ2GfjY5/5D8Jhz5/xVsXsqelzpGWCLYWx2TNuXc
 RwFPNqa+/yEqXPvihi9PmE/bvw8qyBcyFylq/yZAJ3OqK4m6CeukoDP4tJlePPv52aIJ
 s96xgUJTpUeq9Sl684FICuPrdO4d8Bd0zq2xJMu4h8bMHMHyQorFI34ziImSa1U/YJbe
 yfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCDHvXiyFXS1mzEiFOdu1UrmPEyO05QZiiThz71om18=;
 b=KKsvZ1QESjHh5uSoGPlD2uOcE0QMiYi68qwfZOUTHOGu+4tdt93tF+F0jioAvQ4t0R
 SPFYPpeFtbbgox1nl5x8qfdp4IfqjbCsvP+jLYqxAKzvUytk2oMLG2pSYmVZ4R4lfMvT
 SWmMCBNMrhG0UAEGa7oGA9UjbyJq9URBksCI6iAGHFBuZz/vqtw3gDgqfq1RoNwK8W2Y
 nEdivjbbSO39Yjff/th2ixNLRySWKm5wos5Mrz0BzRfPXU1e545OGryTFG8t0w1yUkRR
 DdESYD5pqlmIohD3TXINxeWOAaCVo/3sDZUSHTGShPqlxQNEeh8CsAkUpYTPnhfv0tZR
 7Ipg==
X-Gm-Message-State: AOAM531yjEUun2WIsj/jPic1ijjjrdmaoWTgg2oLdeVUTCAoJBvTartH
 N02DC/5CqOgGdzkNZudhmb8SfBdHaNvsVA==
X-Google-Smtp-Source: ABdhPJzRLgmh3UpM4i1TTAcneP6MtiWTCEzxn6yJ0q5fdeRiZGHE0eGiCKI59rvQC9apaWFE8mHtZg==
X-Received: by 2002:a63:5223:: with SMTP id g35mr864332pgb.164.1618607051735; 
 Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 61/81] target/arm: Implement SVE2 crypto unary operations
Date: Fri, 16 Apr 2021 14:02:20 -0700
Message-Id: <20210416210240.1591291-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 73f1348313..6ab13b2f78 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1509,3 +1509,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0da4a48199..4213411caa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8072,3 +8072,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1


