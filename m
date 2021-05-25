Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880838F7D0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:01:38 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMO1-0004jr-4v
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYH-0008Sv-FR
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00041I-UJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id x188so22273057pfd.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVLmkte3/X8WeOPRHb0OAi+AOLu5ah+uxiTRZR828b8=;
 b=dXsAbzQfuSoNAh60M8w9PqGejS9pb7zhvdt32oQ/WPbJWAuhv3VrtNHI+ds1EjpupQ
 sVJJen/zU1Nc3woOC/mgSFb7LLr331ce1IN7rzJUZg5m3uM9hG2ameTNoy/Nb4O3IhzP
 d/CbZQ42iQPwI5dK7anIOHGVdIT0BZvShOzfjnSUa1NNRg9jQ6CZT72XLOqbncW2ynHQ
 F0NTRGcUaDwT1KxLU9f892dqhS2ORHQ6c4OLqgM871RiKuLZQQmZKTR43osmQ7N5pzeO
 PJerB6ArtyO95t+2pow9mu19ncmMIF2ahKlRO5qn6D0S/03sDCbIN9TK4n+SOZnLkLE/
 E9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVLmkte3/X8WeOPRHb0OAi+AOLu5ah+uxiTRZR828b8=;
 b=MGeazf0fqnOKATp4qJxgKZYPeUDCAg6nZHMb/AUcC88wLmyzfvqVodNGTBO7yNB9aj
 pMfhDY7esX2oPnNIJMeUsptqs6JZq4m8EN4ce9HlspauOWI/g0szaKbrjCl21cen+Tee
 Tc5ow4dWqkhrj06WQD8fQTYnnEBcq+a/+BFN3+fHxy5vsbdmnXfV/Q9U1ukQyI35AfDk
 kTzA9Rlp66OsSoLL752tB8uIyRnuN3jcewsU8BUMLcq//dONVOOT0nVwmdn7NZtQDWPy
 95nNnVLVVVL8v6L94V7CV7MK+GCMMQy6BsDCJjgU+HwgugfsiGzWPdC07oW0b5FHB4TK
 UmjA==
X-Gm-Message-State: AOAM533+jydKO/cSejoqj4pFivU5UgvoOn6ElWoVJIkKo5SQ9w5R6lhY
 AYXwjl8Agtyfq6/BynCkUZlLCw3Csri0zA==
X-Google-Smtp-Source: ABdhPJzaLJxhBvuGJowEbajCVmqar8VTQ3F5lEgJvxfij5QV8rWgXHiTShLWJPP8VacqMkcIlL7n+A==
X-Received: by 2002:a62:2743:0:b029:2d5:897d:7481 with SMTP id
 n64-20020a6227430000b02902d5897d7481mr27304397pfn.46.1621904847593; 
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 45/92] target/arm: Implement SVE2 gather load insns
Date: Mon, 24 May 2021 18:03:11 -0700
Message-Id: <20210525010358.152808-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index ac43bb02be..a64ad04c50 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6015,6 +6015,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
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


