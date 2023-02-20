Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B403B69D715
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:30:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYj-0004Sf-Vw; Mon, 20 Feb 2023 18:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYe-0004F6-NO
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:56 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYc-0000QK-3j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:56 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2795817pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4Ci3OKSOkWsuhLLCd9XsBSP6q75DdfzpORQaA+1Aqs=;
 b=F6+sFcFdW1ZtAnPQO4GNXDAuyz+Q5bFePcMX6bH5wEf8dqWAfCSSbjDG47dxVIXFKa
 Ed7KwcyusTxKS0uEEQxt0ggaXA8AQ5pS5hRdwB727Pz7dXcT5NdzM0BVEDV+PPG/Oh5V
 j/PoWFd9bTplJ5jjf/Wpwf3hWeybIf/kGTfEIUlvaeT+rAS8/aLG9/XjLl0NYeyoXp8d
 EjM3WLdZIQqgdBlygpF3JzNRBf8TYzE3uO0/oHESxtdxlIWfIreot5dZj7fWTDCnMN6r
 6xKZM856uexts1tP5D9qszL+atib9EOFNywhzIRQf5h/pGJUMWinVTJfPfI1GH8u7Wbp
 vQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4Ci3OKSOkWsuhLLCd9XsBSP6q75DdfzpORQaA+1Aqs=;
 b=a4pChJ4GZCG9/VhBopvBSMzZn7C6wSwRf4CkezygqEDSQbGU2wXR1i6GRgDVoH2uY0
 Ob92eXDtp9l5UsKvvajomQ/5yxY6lZU+wLWmtWGY8EH+IuMDQbIXi25IQbKJuSPRFKhx
 YXY/cUHtZ5OYC6p3JIv99I25Njw+oGPOvuSWhfN4G8d75wN/x/e+WyodffVm1TZix+eW
 xvsn6PV+C9/QDSkkCh+/loJ0A6apiWqeciW76XVX/WFuD8XvrZMkEg07ZOpz3OaYLnhq
 vyo0yCswN2zp/FwiKFN1F2hwzUK8inwSOcpByI6c/7dWSVqMgDxpnDR0ebO7KGMHRIdY
 jGfA==
X-Gm-Message-State: AO0yUKUXayJ+r2C+Un6a9YOx69uhywTJ0x0N3CyLylqmm8597pwN0AJv
 b8f0MW4wjeljz8y64yJ1PWiiSK48haeF3RylBF8=
X-Google-Smtp-Source: AK7set+BGUPe9qHyeDlXLopDCXxbU7pNQzBon11NvGHVxsnCQkQJGzeQbea1zzxp/P4Dd7Ho/ehAsg==
X-Received: by 2002:a17:902:c40d:b0:19a:8284:83a2 with SMTP id
 k13-20020a170902c40d00b0019a828483a2mr4647179plk.10.1676935612564; 
 Mon, 20 Feb 2023 15:26:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 14/21] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 20 Feb 2023 13:26:19 -1000
Message-Id: <20230220232626.429947-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 54e72baff5..6e980654be 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -234,29 +234,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = arm_space_to_phys(space),
-                .in_space = space,
-                .in_secure = is_secure,
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = arm_space_to_phys(space),
+            .in_space = space,
+            .in_secure = is_secure,
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
+        pte_secure = s2.f.attrs.secure;
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
-- 
2.34.1


