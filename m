Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3852F6D5
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:33:10 +0200 (CEST)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD3N-0001oj-HQ
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbv-0008B7-1o
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbZ-00040I-AY
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:41 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 10so5129623plj.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksJwiBOmhFBw0ef1995REJKMRag6w/MQtxaor/JS6fU=;
 b=ZUY1MdnoCWZ04waslyjRyDuZh5vxgvbxF/HBlcJ168IGfPNT7CnWww5F9N7pLP3fjU
 NgzhICCtEC6qmcPpEUVBXC9QlZO+cX5Wmqk8R+r4DLSDwf+s7tmuuAAfN/tIuPalh/GL
 DVEeYhK4Eo+Z1/L4A9C68cSZjoF3HapPpClpQwtauVz7hX93dkn/ite5rwOY2xDj/A/z
 7XPPeDDY5LP4TdxWh3Mnmz2qp+B5sFZb0PKqc2FA6441c2uiTYdov7k2joTHWWJYYO1U
 97EpH3joQa6fG57ceAIqm/wuEFGIynxV5U7YamGTygf82+xR1lBoF2R4SdwPGP3nx4Dv
 IL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksJwiBOmhFBw0ef1995REJKMRag6w/MQtxaor/JS6fU=;
 b=Mjv6XSuheeRbOA3kcWRWceWc4r2/LsxvdhpfD2cMLV3oAC0y2Gde4u53YLOUj6WA5p
 Vif/137MOUqgPKXjpvvKx135oBZwaqbIpiWbHtU5A3lfgOUVT4MrAiiIhrICdZD13GbG
 cgrFn33wAXnuqeBGthfp6kmv5lJsqXRDJWY3VpWZlNrEzhtkus3hC326KL84T8LDyk03
 w4bCy4ZvQjL1YuH76Zx7St0J+UWs1ejmnMAefCjBO/6RkB48m8HdQ5J2hyMOmwqO4BN/
 PnP+gyK6JyyxOsH5ptd+ltrl9U+NRREblUojp7KfKjIMLMaSDcJ1u8kpPHSg+ck14aPf
 yjFA==
X-Gm-Message-State: AOAM533FPujrILaYAO3KHCrpBNVCEgynvxi4G0T91JE3Eqaxs1/Tqi1k
 DXR2oUvIHh3zCxsfMHxxi6vCzB1JM5lrRA==
X-Google-Smtp-Source: ABdhPJyMlCGZRK7UqjzHcxtk+n8pqPK48vgKSAJ/OeaFF4Rw16FFmnsXjTbG/qcNpD9P85DFe3K15g==
X-Received: by 2002:a17:902:7593:b0:15e:fe5d:58e1 with SMTP id
 j19-20020a170902759300b0015efe5d58e1mr11798894pll.102.1653091463660; 
 Fri, 20 May 2022 17:04:23 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 18/49] semihosting: Split is_64bit_semihosting per target
Date: Fri, 20 May 2022 17:03:29 -0700
Message-Id: <20220521000400.454525-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split the function into multiple implementations per arch.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7becc14a81..99a1809f27 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -213,6 +213,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
 }
 
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -238,6 +242,10 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
 }
 
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return riscv_cpu_mxl(env) != MXL_RV32;
+}
 #endif
 
 /*
@@ -587,17 +595,6 @@ static const GuestFDFunctions guestfd_fns[] = {
  * call if the memory read fails. Eventually we could use a generic
  * CPUState helper function here.
  */
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-#if defined(TARGET_ARM)
-    return is_a64(env);
-#elif defined(TARGET_RISCV)
-    return riscv_cpu_mxl(env) != MXL_RV32;
-#else
-#error un-handled architecture
-#endif
-}
-
 
 #define GET_ARG(n) do {                                 \
     if (is_64bit_semihosting(env)) {                    \
-- 
2.34.1


