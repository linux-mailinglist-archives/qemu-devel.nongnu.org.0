Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C3390658
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:13:27 +0200 (CEST)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZgM-000715-C8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc4-0004gf-3J
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbn-0004jg-Fp
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id t206so16959715wmf.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KSjw868kspQmWtXhtqQ/YG76qtL5MRmMP163UpYuiHU=;
 b=s6Pnd6Ye46L6QMz438Qj/4O4T/Z9yEqmv4iXd/7BDFnS5XWTDC7pMpMNDnJatyMNLT
 Ik+Dcrnzb2ffPmdYMVh5VCjVWAOJ8dJJv0vZJGsLyVAf9p0AMa1mq2Tn6AqQINc6bMsF
 uMNYunmTu7DO+Oslozfbzo3QcR49182NchnmxRkkDDdcDk+6Lp0x43KNFNpGLq45OXk3
 AcOg+gFrZBUu9gknJDNPd5ivjblAe+BXceMvCJe4KLGg3R8TmxFproMjWsMJVS99IxB0
 Y1PtUkC+8c9cMQBjcHfCMbRJR5IFTbEqyXr2TLFmcbDdxfvIxrpTxovytWgJo53ljFOj
 1wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSjw868kspQmWtXhtqQ/YG76qtL5MRmMP163UpYuiHU=;
 b=ChfDtrU+FgEs0BKJpVyPdBXGFvPIrZ455HIqB2HVI4LWEdxcb7lpE3XJtmFtT0r2Mc
 wFs2RQoaJyGm9/gBiq2UByo1mhwD0tg8DsZuR1dJS+tIxuFea2GrLtX/41OlxtT5brl7
 PKExzEzfH2SaQYpBVOmt1C0Y5/5wHAfPtkVQwEhCGVOgnoB/EdibO55vm4pruqkWWZDh
 kdH5H/zdSoIjEanOnmUvtDLIzd80ak6CiecT7+Gh0Qmg/QYb8u2Y52ofX43ywYIKJnaj
 0uWQn89hBdzdub84/FORpFR2bnfm5W7HapQ1QSMGVIdbfyoM3va0YEB77LxaP5LmG/xW
 Tn6Q==
X-Gm-Message-State: AOAM530+5FW/JYElHkql8JpLPwV4iqfsorNyXwE6L5MzD85n6J3cZZji
 ffW2loNiVrMBOyFl0cIOa5GLQ1IpMYkQb7vZ
X-Google-Smtp-Source: ABdhPJwsEbKeZl6lBG8ubHPRo9rFjQaWkernMpkAfVewLg6JRPybJwMGigfMMdu7KOORMRTQ+xGPmA==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr24410122wmk.35.1621955078065; 
 Tue, 25 May 2021 08:04:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 073/114] target/arm: Split out formats for 2 vectors + 1 index
Date: Tue, 25 May 2021 16:02:43 +0100
Message-Id: <20210525150324.32370-74-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Currently only used by FMUL, but will shortly be used more.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-52-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04ef38f1480..a504b55dad1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,12 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by N-bit index
+@rrx_3          ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19
+@rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
+@rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +799,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 0. 1 ..... 001000 ..... .....   @rrx_3 esz=1
+FMUL_zzx        01100100 10 1 ..... 001000 ..... .....   @rrx_2 esz=2
+FMUL_zzx        01100100 11 1 ..... 001000 ..... .....   @rrx_1 esz=3
 
 ### SVE FP Fast Reduction Group
 
-- 
2.20.1


