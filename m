Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91423905F5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:56:34 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZQ1-0005Gv-OH
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbs-0003w5-4E
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbi-0004ea-OH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id z130so16945046wmg.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EWhXgFqOneH7V1Qq3LKSPEw+6BdQZoZFRV1IVK9EHEw=;
 b=ca+Tw1skRjSYSJL9l07Fr4RbGt8+iIQkRA9qnE5lCsXf/1/IL6xsp5ZnfQ74a2yipF
 tTiLeD3KuyIspLb7os+o64mPObgk2iHW7ScsF09pEQAzwW6sqxPc42jdk+4zV8UAvflW
 WI6y46yhZvDDmf4OjyptV9YhcV24vS/nvH6i7gegs7paaiYH+1+PswDLaVwrimlROQEA
 /Vop9DuzCY5OPHKgRlFgieRKMRASM4SYRHg4E5v5+pTzQt7HAtuCxCwhlFErEGMQCctw
 fl8HXV4ZcMHIlOLpEZSq5mCRjR+cszxHL7A7MAWh8ThDwzWmfaIEe86sFI/xv/r1WJ6G
 Dsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWhXgFqOneH7V1Qq3LKSPEw+6BdQZoZFRV1IVK9EHEw=;
 b=IaGhy1XxWAiyDLnAnNLcjjcXIgtALoqsJywrcinobO02ZBQeN2oPrQQ36Cc+hdTA4K
 nxrB0n0obyd/2Xy7eQKmQimvfqIyvXOz4bj5SrNmepTF7dSaR+0MDJB2weS7bxwZZ9lz
 HDN1Vqbhx2QX0iQ2yKIzkn7yGWxFEsTZuAiKeXomSrcQITUvkS9vAyYzafNfX/6QbZGX
 P/ud9BHO8Vu6kBMKxfPeacHZ64sns1zd0ZAlBoOzIcEkJydCWkj1cHply+aKPg6ld2zK
 q/nTA3FplE782jmYKZSeElM/bmtE0LDerKiBFI5/svnEBdVe3iJ/w3clKWe/u2vt+B/1
 gl4g==
X-Gm-Message-State: AOAM532Xmw+YK7Wqtsm/p6JUKWNu3Mt4Hjw35pAYJTof2wXdkyQsgUdk
 R9RpvnAFb4C0tqI1DDTYq5pIDWlrgedx5tQB
X-Google-Smtp-Source: ABdhPJz85xq2iXLA0ENlfgtfCMB59szb62CQ0zhG5ElpFlroh3UgHzaSBjnCMJuWnmtvHeIXqDZWhg==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr4386158wmg.146.1621955070732; 
 Tue, 25 May 2021 08:04:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 067/114] target/arm: Implement SVE2 gather load insns
Date: Tue, 25 May 2021 16:02:37 +0100
Message-Id: <20210525150324.32370-68-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-46-richard.henderson@linaro.org
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d24..c3958bed6ac 100644
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
index ac43bb02be3..a64ad04c502 100644
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
2.20.1


