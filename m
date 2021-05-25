Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F39061C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:02:15 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZVP-0000FE-PF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc9-0004qm-Ty
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc4-0004zJ-SH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id x7so13005725wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m0F1jCIsu5r4R6xgNRrMiODL/y5IxSgWfHE2unGlwSs=;
 b=Ftjmoe/Gg/ZGW/TwhAdW03AUAjd8Vwxepoh5IoHYzDxJYn2sOASc/WVolTtoB/96zp
 psnUy70hI6iGzCLmG1KV8heIBCc9xwJEAW8BKu1G6xDMJ6cOXq8YNwYvA0r7E/t0eCCw
 bdqqJjlYhWjOYzVxqN5o6UiMn6dhNMU+J+lhdx/DecPy7+lGRbolmshlDZg+r/bmt1zI
 2aLwpHRzlSQclkmJf3rP5MxyPydMwGSiOVwxHNvYZ6HqewvSobWpilKq3Ow9dAW8huLH
 LEwpImrje2Vuk9UEfQ3EVsKNOmNH44dcpSoLE/o4P4ekvh5jkgA0ZHecrc44ZHoZA6ZQ
 WAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0F1jCIsu5r4R6xgNRrMiODL/y5IxSgWfHE2unGlwSs=;
 b=X2I26T/hCMxSC7Ff7nJN6h+2sOmU0ysubaOZbjxFCaIuUdC3MqgOYFggl16/cgxOeZ
 m6dNd1C97GBXxFpzx9Ad0lsCkv2eULbzsfT8r0YtteMq3bfjnpDHKW8TMewNYJhYBJXj
 l6qDPpEv2klXx7CoFEYhSjvkSNg2BwveFI+nrhZopL0mTwbz+Bmo9tJHzZ2E5z7kvAGU
 Cdt1sLbda8u+U3GJ/H6ncE5E/ZlyR6640f36U3oNBfUfxCqpY+rsKjMriwcLfCbFkrG0
 GbIx7EmrjmK0jFmkPI0mlYyUvcTJEX+hwZwUKepPqy/jDsmymV7XlRVztkanK0hPDqDO
 ualg==
X-Gm-Message-State: AOAM530KcQrqZB8Fv7pU21Nj4yoxFWG4tUrxeLN+nrBnEWkS3PtZIRXh
 WwiohT4mOBBdqmjjv/TGQREWkrSqmF15zN0T
X-Google-Smtp-Source: ABdhPJwQ0RDcxlZtw2/0pefffaGZ4PdFhuh1JslNWjXsug3QVwFlcrb96wkbThsOeCMfAoTqs5+dgA==
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr27861091wry.271.1621955095506; 
 Tue, 25 May 2021 08:04:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 090/114] target/arm: Implement SVE2 crypto unary operations
Date: Tue, 25 May 2021 16:03:00 +0100
Message-Id: <20210525150324.32370-91-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-69-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9f037fe5a78..a9cf3bea3e6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1558,3 +1558,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
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
index ae078b095aa..79b49915492 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8148,3 +8148,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
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
2.20.1


