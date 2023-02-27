Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1D6A4F70
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVW-0000Kb-CE; Mon, 27 Feb 2023 18:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVD-0007wA-UC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVB-00013C-7w
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7780697pjz.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKzOS7a1/7VrG1zwCTYqvRSxgc9GTxbO/gKX1CrEEmc=;
 b=khnllu7UiJfE+VCzWMdUIuBYp5kalyLXLEWdRLejppfslZJUt67nXdqbrRfCJvKLXv
 LB8rW10NG92BFTfP48ru/4cC7WUnXkjobcPSwa6hs3J/KvzImq/TsQ6DwH2aNNm1t5vR
 uAdK4iU1xRprAzajM21j24SLo03HVk9aRSrolB1gopqK7G40g5XxAdikhQuyXPOx+msX
 CPjohRheohjr2ljfBmynoecY24xqENe/f64KTf5x0EZ4AVvzDlQbxsHKTUVWzjXeJyaS
 2WzOadyW//DbXg1R/fAcucH4re0KWEDcP3qClirAjN4nTqVoJfjDYS8xaT7mxAGmnGzY
 QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKzOS7a1/7VrG1zwCTYqvRSxgc9GTxbO/gKX1CrEEmc=;
 b=LI6pVZLQHBuVglsVUlFXe+gbabUL7jY3pfrgdIzJK3M2aGuGTrd2ktpCc7/KS88Ljb
 KvWYQ5ggjDVKQ83aTMCgZJFqGypsK/GtCm9GmYG+F8+FwphfhSUoixHDVE8p2P2rWJJp
 q53GOCRV6eQFy/UH0yjYTOzB0JV2L6kYbK2VRHTm1xd95bR/QWbnfN7HjAp3CHmHBno8
 XgGGS2pm0Q93ihOEOscdS5SyBvpC9MUeBnKSZph8gRxJyw7219YNztEoFX3sOIlWEwd8
 +pEJMXO5KEDt7TCnsvM2IIZw+3//VRCg17vGgcZ8n83tr4e2afeycifuuTORZCwDGWC6
 rFww==
X-Gm-Message-State: AO0yUKUdfDLlI+myXYyjnJVVOUgAsztZabzVaaQEeD2zIHigHXxtGDb3
 9vzSb7Ttp8KYvMxIkbfMK9C2Uxg/1QOnyvttbJM=
X-Google-Smtp-Source: AK7set9lCYGyhCNPLYRwdXI3d+n3mryCtnOyTJnQT3XMm2D5yhJsbo1keQTzpkS7Nfn4sPV6bhc5IQ==
X-Received: by 2002:a17:90b:33c4:b0:234:8cd:c0e4 with SMTP id
 lk4-20020a17090b33c400b0023408cdc0e4mr891532pjb.23.1677538908475; 
 Mon, 27 Feb 2023 15:01:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 14/21] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 27 Feb 2023 13:01:15 -1000
Message-Id: <20230227230122.816702-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 2eae7a69cb..0177dea0cf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -232,29 +232,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
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


