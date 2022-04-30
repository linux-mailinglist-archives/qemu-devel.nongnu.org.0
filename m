Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B0515DB9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:40:09 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknKS-0008Hq-8z
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAY-0004mC-GV
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAW-0006Gi-N8
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:54 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t13so8493245pgn.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bMzSVxcdvq+IuYW0Vc/jOyPOv06xtgKXvctJnUGtedE=;
 b=gJV4mWnk6zBJnSDgFpEUX8RfgjE82mp9ZhyZpKMekEkgso9t7oa53yC/c+6wOjr2QU
 aEqInOIJ5rnkwk8H9CD1mJlOabcapLwXThl6Z9UFo5J41uYl/dq071wH97Rtd46tMzez
 s63ctcCtRaCpAHkwz8o5r1a/J0KSxE8NJNXb1p5TW3d5MvKQ6/Cw+N/FJonqzuzs5gqx
 VeocVoGD1mQ/ky5STgWxeV0bMkmDKu1rycTm36NlKuU7bHiQ9QMaDf1/j610DpTwoka5
 pa0gpd3znPv+/YnwaPyZsT/9/ak0A79NSmpEFHSz9hBz2FUCuG6tilDhZwMZKjaeZQiT
 NcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMzSVxcdvq+IuYW0Vc/jOyPOv06xtgKXvctJnUGtedE=;
 b=kCPi4IXtb87uBV0RRhAq18bFFBQv1MTU41+Ceib9Il5+1esYiD4h4bEHBOAajgSe77
 FUjS7ATE47hUl6bcU2DXWNeCJktyETmhSX+5GKuZU7Jsb7h8ts6DxX+u4SREfFjUbwWC
 OM43DwCCF56gi3YSAgGa5O9Nx6UeF9u2knwqF9N3l47y05vNzfH+/NIRpnDHq0WmHSXA
 ZcshRBtcmDRDOD2YA68CjUSpHYYRjspRSMT6HaXX3vNsVS1wkd8K51rDInjNjiAbpIf1
 PgS+u3LtMWLqcRd91e1/MIUuuzqqb8lfkGcciTyVqa21wvB0Zk8CTXkW77dBpa5uD6C8
 5lIA==
X-Gm-Message-State: AOAM531f6CSnlB1GId/ZzaM4Qbo+hsiaPCHuWoiBIeyfcaMPSceZ0QZr
 K/0zz/+veVyoos+5qR0y66shSEL4m6WeTA==
X-Google-Smtp-Source: ABdhPJwC6i2+NALuyega/I0il81TbQHrRxKhdQNilWkJsNu2RNv1TzbXKPAyJYFMIIM/8a3RiJKE9Q==
X-Received: by 2002:a63:101:0:b0:3aa:b7e9:6708 with SMTP id
 1-20020a630101000000b003aab7e96708mr3151682pgb.111.1651325391394; 
 Sat, 30 Apr 2022 06:29:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/43] semihosting: Split out common_semi_has_synccache
Date: Sat, 30 Apr 2022 06:29:06 -0700
Message-Id: <20220430132932.324018-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out a boolean test for SYS_SYNCCACHE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index b2816e9f66..6149be404f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Invalid for A32/T32. */
+    return !is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -260,6 +266,11 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
 #endif
 
 /*
@@ -1103,16 +1114,11 @@ void do_common_semihosting(CPUState *cs)
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-#ifdef TARGET_ARM
-        if (is_a64(cs->env_ptr)) {
+        if (common_semi_has_synccache(env)) {
             common_semi_set_ret(cs, 0);
             break;
         }
-#endif
-#ifdef TARGET_RISCV
-        common_semi_set_ret(cs, 0);
-#endif
-        /* fall through -- invalid for A32/T32 */
+        /* fall through */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
         cpu_dump_state(cs, stderr, 0);
-- 
2.34.1


