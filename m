Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B384572DC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:27:21 +0100 (CET)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6jQ-0004Xc-OI
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:27:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Or-0006Oz-Tb
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:05 -0500
Received: from [2a00:1450:4864:20::436] (port=39546
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oq-0004P5-2H
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so18985271wrb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbQgvwjpt8WjDTiCXKN/sa14AvU0duryN2atawPgVWw=;
 b=lv0JSXU984JfcMASa9hZJ3uLwk+Sd1+LOMN1oN1x1jzuK7pTcEKJr17fdQHYdy3gTy
 BzvpmwPqSH62duL37gNKBLmBl36fypCJwC0tVGgPoY+gCClNlykVkd7sidO04ULJ6VL7
 OAI0m23i86FxBkxiG40trKLAqvY04VvmTz8asY+OVwQ8KlGUcNgz2nE0V02MDdyRwPD3
 bVAb1CwlsVakPuNao3y6985amMd/D6EFDdDUsGfgaDDvol1HjsN90MRDXq5wtlTa3eOy
 uVfC1D7SfLT/ILr6ahJwQbByn2nBxes8dTabQwlb1LYhRWsKHuVOf9C3tTB5fOHf9WU0
 oZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbQgvwjpt8WjDTiCXKN/sa14AvU0duryN2atawPgVWw=;
 b=EGr6MHyyk1pJfswVm9LzZtbvSzGnlPYU6MizXbXLwGnOfDJRlrX9Ij+8Y1nK0Pwxm4
 lukx9018FMgVASs9z4KuKSdumsKdRxgj+TLy+AniGn88M7Uj2INh5ZDv4tRS/ltWbReT
 biSO/sRODwW8m2K+m1R+ePA8m2RS6O3hO0ZElor211TucsWjiG7pfrZkokkZWz9MlIH0
 DjEFU3qvgUO2cuuSJ/0ATbVg6vyerOYWnm4jVHJ+ArpaWzexNAQjBuEhDDobuJz82MlN
 VO+Dvt3Plifj3R6QqTGohoO+HC5YuzPlU4F8l3puU/ApgNlA5Lussz9mFFcz7vix6zx5
 aX1g==
X-Gm-Message-State: AOAM532qEcxkNT6diFjIeveVOUWrKkUreU/8Hl83EL4p4cFChC0pvFpK
 i03SDo3RG2189XuL9z+k65b24SAP3Ukav2AnnD8=
X-Google-Smtp-Source: ABdhPJwVSfyF8vvVtSgyi/6cDoqRb3W4r9a/C6Et/s3TCWdlldGDTRlGb/lVtsXiL9+PT46vvGjAIw==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr8738213wru.34.1637337960462; 
 Fri, 19 Nov 2021 08:06:00 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/35] target/ppc: Update do_frsp for new flags
Date: Fri, 19 Nov 2021 17:04:49 +0100
Message-Id: <20211119160502.17432-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

Now that vxsnan is computed directly by softfloat,
we don't need to recompute it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e91a6b0212..38f20e9783 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -675,18 +675,13 @@ FPU_FMADD(fnmsub, NMSUB_FLGS)
 /* frsp - frsp. */
 static uint64_t do_frsp(CPUPPCState *env, uint64_t arg, uintptr_t retaddr)
 {
-    CPU_DoubleU farg;
-    float32 f32;
+    float32 f32 = float64_to_float32(arg, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    farg.ll = arg;
-
-    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
+    if (unlikely(flags & float_flag_invalid_snan)) {
         float_invalid_op_vxsnan(env, retaddr);
     }
-    f32 = float64_to_float32(farg.d, &env->fp_status);
-    farg.d = float32_to_float64(f32, &env->fp_status);
-
-    return farg.ll;
+    return float32_to_float64(f32, &env->fp_status);
 }
 
 uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
-- 
2.25.1


