Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD053C086
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:59:13 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsqW-0007tT-Vl
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgk-0004Yz-5N
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgg-0008Vz-Nn
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r71so5834186pgr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76vB8wrE1Opihq5ZL4xDfiTWT29p2624W3Se2XeubnM=;
 b=RTyDCht9+yNtoXqwwpW6Lk2yOdUEKbX73tD5t69qtR5/egnInjoqAsn0e68hs7V8Uv
 qdf+S1ThrSmNZeudZjhkrlaEx75q8SsCdiCpE70tFHELyRR+yaV78EcK8CYv3dgBrxT5
 jLWRMg/Ii+r8FpGpqli0zyhOoY9o0H5stawH7Q78C/7KQ6sKXKNV9ER28gLMItvzrG7U
 KO5h6RraxOXTFGo7zsHO2MwTLTkEuycaDSqPN+3X7pl5kvzC+6gmBiaAmXpO/ryVaYYa
 51+IXXrFeRPmpIppG+eVfv2fJgB4UHp8w1GlzMKuWDdH0zNcMG7agQnpuV6Ff6uDTpl4
 S+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76vB8wrE1Opihq5ZL4xDfiTWT29p2624W3Se2XeubnM=;
 b=MLxtuO7nJ7NMGl4fIEoeEQPouvcjMe/fBfeiVGPjSY0gxjoIXtXJg7jJj0jZySEdbe
 Wi/IeUF6E9cQMG5hwf3YD+6ksuP+UNzUH8CYKS6RX8R2fvtMpJvFnw35ojFRKgGAaEvE
 epe/ZJfv38KR/vYRTVf6TIX3DXh1Vch3vAnJfE+UxNN68lc1Pf1EJGpebbDyA5WvKd1e
 WEegRY8EGyTQc5NZfW2OFJk782loG7h0HSC6f8+ShXdL2LI3tYWNUyWBvXC3yYozZXsP
 1GfuIjjouwFKkWT4qlsThLZXzwF0NBD/VUlrAciJJFeMBh1l5efeE5eoU/0xTKSntXXH
 7ypw==
X-Gm-Message-State: AOAM53365/uVznuIfoP/1zSM7oeTpujT6u7L+HHlcWqOhzYVjM/5SeX7
 +mG7WVU6NNoFxNBIqmaRofTN3c4a4wSATg==
X-Google-Smtp-Source: ABdhPJyZFkuALg/fx8XNhr7ZtLYycQ//eGXkNxyrQy+ltaKzaUnbBOkzVOWAtbMXc+9DKBUS7hdKBQ==
X-Received: by 2002:a05:6a02:105:b0:381:fd01:330f with SMTP id
 bg5-20020a056a02010500b00381fd01330fmr5875797pgb.483.1654206541335; 
 Thu, 02 Jun 2022 14:49:01 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/71] target/arm: Hoist arm_is_el2_enabled check in
 sve_exception_el
Date: Thu,  2 Jun 2022 14:47:50 -0700
Message-Id: <20220602214853.496211-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This check is buried within arm_hcr_el2_eff(), but since we
have to have the explicit check for CPTR_EL2.TZ, we might as
well just check it once at the beginning of the block.

Once this is done, we can test HCR_EL2.{E2H,TGE} directly,
rather than going through arm_hcr_el2_eff().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7319c91fc2..dc8f1e44cc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6193,15 +6193,12 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /*
-     * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
-     */
-    if (el <= 2) {
-        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-        if (hcr_el2 & HCR_E2H) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-                if (el != 0 || !(hcr_el2 & HCR_TGE)) {
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
                     break;
                 }
                 /* fall through */
@@ -6209,7 +6206,7 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-        } else if (arm_is_el2_enabled(env)) {
+        } else {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-- 
2.34.1


