Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E389332E08
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:17:06 +0100 (CET)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgun-0001Zk-0q
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7Z-0000DZ-02
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:09 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:45387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7W-0002km-He
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:08 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id s23so3177378oot.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFsXvn8twBtNJsU+A9bHI+28KQAx75XSf3FzGr0LfTA=;
 b=q0fu5sSoZ7yFFwRNiK535wkOmqDR8Mm3uSK5rzUFfY3DTblLR3s1rdAEvKm7FMmCz5
 Q3qgB+VjI1PLSCRsjpFuXcldMrKfo7Arvn086/zoNRQZb8066wF45pbk39AUS1NdudOg
 F8wND/7en4V0R62H43M3qafTpxkpYX/AvGWTPJLpGVbApaNdv8eIQKK4OgLknLuUjI3g
 J61P2wMlYOnA0aj8PQtJyBIP0lwjaNjrSxQkn1mtyXzR0kb0UAjYqC3fKP0oDmyLipx5
 QSq/2y7LzaybBmTLPusjytWgpVWt4AwGrfIQpJLI6p8B34UFVsDJ7CQJPZuzDcGJZ8xj
 Ayew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFsXvn8twBtNJsU+A9bHI+28KQAx75XSf3FzGr0LfTA=;
 b=XEvJTHt2JebZAVSKY5/l+ZvZlBaRYpTiehQRRKFX9LS0VnVw4ymzRRlYXFJ+n/fAdy
 c9nancEY+lZoP4XjN8GfrXv9dPinHF+zMDeUCS4/eK3pB56suH/ecl2owrGuq+eyZY+m
 jBmCF61L+4VeYtPeB164x1MDRXnrpG19OwjG76FPqRfhqFIfblBR5p9G6GplWzhkTutE
 bHZf1dUct3VbsggubTfX3yr89Pd2kAttF/uXSICqG/7AMCpgahBkHnrWoXlxIltMoXxm
 5Lm4HWZ3KeOPei77HJUm6aCS+Co98B1nlPnysKFC8a1UVteGiAY6FLUgVke0wXTC0HaY
 nwRw==
X-Gm-Message-State: AOAM531dd3cWx5IbocKjIyNLV3ePJUDfCp96A1UTptJmJ8KvW2BdkyCt
 hdnx1NMHePgNdmxFz5Faa0KggOUJq59aD0Z9
X-Google-Smtp-Source: ABdhPJxenISAWEy2VG1IwPQw1MiFKHbDxJRtBqL14OJoayCzwIdpm+khyyH2O+APNm4JsptC4mpaEg==
X-Received: by 2002:a4a:d1da:: with SMTP id a26mr22970496oos.58.1615306925485; 
 Tue, 09 Mar 2021 08:22:05 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 45/78] target/arm: Implement SVE2 gather load insns
Date: Tue,  9 Mar 2021 08:20:08 -0800
Message-Id: <20210309162041.23124-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d2..c3958bed6a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 895522e3cf..21ecb535ca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,6 +6016,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LD1_zprz(s, a);
+}
+
 /* Indexed by [mte][be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
     { /* MTE Inactive */
-- 
2.25.1


