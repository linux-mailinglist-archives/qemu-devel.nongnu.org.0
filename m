Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4DF3905CC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:46:51 +0200 (CEST)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZGc-0001YA-72
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbQ-0003Dt-IM
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbH-0004Ml-GU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so30533279wrm.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tYsSTw2h6YrgtjiXj4rU1pmAFkax+RyugIVq/dcN8PM=;
 b=bZl6Alcm6+bpJd0cGWkH0/1XhBAaSLAsUWSHxlUCgWzivly1W1FqNsP4xaIu8bQQfV
 0OlCzwzyqTfVNjHCfrOVP4WWFqCnADT9ozsFmMcPXxdqap+Y4S5aSoACYtZUWIAA2bKA
 +QETSr0R618VRbDU94n+Km9emKxEsK0iEvVWJpsJuEqGKN9bXOMbn9TWMsxWwufsLtys
 UMu8AbPxh3LzEaJCbaNJE33dBlHAEMGC2lkrv+UGRttXLJv2tI9TvPR0NSJBlhBcskmF
 KBk4Jmu/PTRTWDBq76sz/KbIcVEu3L3xIJhlqbc3CXab1QukdjZVUb9VgPeTQbZzAF5p
 oDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYsSTw2h6YrgtjiXj4rU1pmAFkax+RyugIVq/dcN8PM=;
 b=tZrs+OQzv8b0+CQDMz4mtV8Ff+wfxfwboDC9iG8zKrBR6rSIf4phvTLqoyKXISGAp4
 F3vPus7oXDe9B3laKVlIyFQfzDPyVXe+/j/PxMSZInYhwgTymuGE/eqzAPr9M+mWh9p/
 fOj3O2Z4NZsN5IIe6xslYrF7kfarSX/9tsJhgriQ3mssiBdh8NCAjq7f0F0f1RY5M0m8
 sLmyC5wXfQMb9lOlRDGSSLyXqAEVuFynzlkeKaGroDP1Dg7iFyduxyPtat/Hz5OivXe6
 tm7TVbUZTFea0vhEncEDXJQGN8Ft2rLgROffLJsRjU5TN0X2F9K5bQXowEnR9kw2DWRb
 Pdjg==
X-Gm-Message-State: AOAM533B15OsAsWAAvkQnUx8AatfaPdxzwSxqWabvU+FIRNbZPFcG/W/
 4OLnP0y4CMchZbGzSRnfFdyOxH758gixi1cq
X-Google-Smtp-Source: ABdhPJzv0/MAPFDbT72YMgTlNN6/HzHm1qlDGbqNZQ1VlzWGVLAo1JaMOk6md24GH7zYpyDarNopsg==
X-Received: by 2002:a5d:50cf:: with SMTP id f15mr12849356wrt.287.1621955045811; 
 Tue, 25 May 2021 08:04:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 043/114] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Tue, 25 May 2021 16:02:13 +0100
Message-Id: <20210525150324.32370-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20210525010358.152808-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 79046d81e3a..d3c4ec6dd12 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cf4fa50ad2a..1f93b1e3fe3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6394,3 +6394,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ursra);
+}
-- 
2.20.1


