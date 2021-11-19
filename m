Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED8457348
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:42:06 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6xg-0005RW-Dj
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6PP-00076m-Jo
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:39 -0500
Received: from [2a00:1450:4864:20::42c] (port=44794
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6PI-0004Z7-IZ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n29so18920980wra.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7LvCVjFwXG6lmnJq/FAM7YlBS2Bp7tUwJB7azokYbc=;
 b=xaS0mQ20BJWCzNOxjioEvSY/a9TWNuZ6uHGjjo4vctKGkwneOk35tfAw/w2Itga+xX
 PkiBYkeCOGSA0rN+xgxzRiEgyvBH3NDeh/lejWoLWsTmxOp7F0A2y+fydV07kqpkKWHZ
 76+Y1jzPijWpAG30CAlTY2Kpag3Anav7Ei71QpdC5ysR3fqZ9jwc2HOFDuQrOhYRD7Hm
 sOu1gmCDZRg7vjAfd70LasRc0Q0aMTVYNEPKiiTJSEGpbuNcFMoxIu79Nczn+M3EDDLi
 bjLkHD6OpFoj8lekR4eCIrBLMAM7wk1PVljuiHjD56pzTSOsx9Ijor7GkrpFSJTSRvXF
 CD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7LvCVjFwXG6lmnJq/FAM7YlBS2Bp7tUwJB7azokYbc=;
 b=wztwNQ4ydSg2qIouogRUiKWsDqX9ffHE5QosHRbwJLrCgILzZGYCXN+28uMjLDuKMw
 BKxNwtn6OiDlOh353j9ugPxisDAvIBNcVwXb8KdVlXLUR+ZhMymM+ZUtjEq8QsGmeyxs
 zCsbjw34kIOkmxVrXo2wm1qB1mGoz34R2zqnBCbZCvo3VmM7kl4mqsVR+naMOOBGUnqW
 xqnLaVQRvSrxtSMvfNOQatQdzWk+QdynMQnSgvM/I6JtpxwJ/LqXb0uDobsjp+e3QFvs
 90uZP7M0cxlhuZNlDMJVmcjdcwjLxuMZ/5bJOAyETjP7e0irvx7soUGd6mlxBFoWx5eg
 w+JQ==
X-Gm-Message-State: AOAM531Vq9Soo0FTmrfUt6cEv56Qq3h1DpsrVBhLL9eF+Au/Gf2NaTDy
 a/NUD7BDkOMH0tpJE8v32I1itP301Bwfj0UMOuQ=
X-Google-Smtp-Source: ABdhPJzNcpGaC+BPNSAgwYUrVyVKhVcvka5U5YDkSkYiT1YBX02tDzPXyLUf7VragDwBRvQ3o2fWGA==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr8476148wrm.299.1637337980280; 
 Fri, 19 Nov 2021 08:06:20 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/35] target/ppc: Use helper_todouble/tosingle in
 helper_xststdcsp
Date: Fri, 19 Nov 2021 17:05:01 +0100
Message-Id: <20211119160502.17432-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When computing the predicate "is this value currently formatted
for single precision", we do not want to round the value according
to the current rounding mode, nor perform a floating-point equality.
We want to see if the N bits that make up single-precision are the
only ones set within the register, and then a bitwise equality.

Fixes a bug in which a single-precision NaN is considered !SP,
because float64_eq(nan, nan) is always false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ea238929da..b81aaca67b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3115,26 +3115,25 @@ void helper_xststdcsp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xb)
 {
     uint32_t dcmx, sign, exp;
     uint32_t cc, match = 0, not_sp = 0;
+    float64 arg = xb->VsrD(0);
+    float64 arg_sp;
 
     dcmx = DCMX(opcode);
-    exp = (xb->VsrD(0) >> 52) & 0x7FF;
+    exp = (arg >> 52) & 0x7FF;
+    sign = float64_is_neg(arg);
 
-    sign = float64_is_neg(xb->VsrD(0));
-    if (float64_is_any_nan(xb->VsrD(0))) {
+    if (float64_is_any_nan(arg)) {
         match = extract32(dcmx, 6, 1);
-    } else if (float64_is_infinity(xb->VsrD(0))) {
+    } else if (float64_is_infinity(arg)) {
         match = extract32(dcmx, 4 + !sign, 1);
-    } else if (float64_is_zero(xb->VsrD(0))) {
+    } else if (float64_is_zero(arg)) {
         match = extract32(dcmx, 2 + !sign, 1);
-    } else if (float64_is_zero_or_denormal(xb->VsrD(0)) ||
-               (exp > 0 && exp < 0x381)) {
+    } else if (float64_is_zero_or_denormal(arg) || (exp > 0 && exp < 0x381)) {
         match = extract32(dcmx, 0 + !sign, 1);
     }
 
-    not_sp = !float64_eq(xb->VsrD(0),
-                         float32_to_float64(
-                             float64_to_float32(xb->VsrD(0), &env->fp_status),
-                             &env->fp_status), &env->fp_status);
+    arg_sp = helper_todouble(helper_tosingle(arg));
+    not_sp = arg != arg_sp;
 
     cc = sign << CRF_LT_BIT | match << CRF_EQ_BIT | not_sp << CRF_SO_BIT;
     env->fpscr &= ~FP_FPCC;
-- 
2.25.1


