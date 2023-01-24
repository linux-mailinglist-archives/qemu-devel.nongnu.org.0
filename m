Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F8678C71
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:02:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kd-0001F3-SB; Mon, 23 Jan 2023 19:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kZ-00010G-T2
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:20 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kT-0001xa-Rp
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 200so10108948pfx.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCmbkLa0yYr0QBg1CfQR5sNbcMWAWJk89TMhy0bc8HA=;
 b=W1QFLQHUNk4auQyvGViV6iqYI7eysC7CXKLkFOJFx0wc+v8K6cqxnFf5WJ2Xif9tdd
 cNApj9VkWMtNMeV9obPZwB//Hjahx62jn9hGY/knjuPi1C26E+1yKAlrQKJ1ANvtVjaV
 Tuy6OZnV6H2gNV8sMqi2zpWDZ0ISD5GyNjyr4WryiO+pnFPjA8jFiSlPV7Y8pqgVX8A8
 K0iSfdBmgHK7VuVdVhZhMmcJayycmXjqQ840R53TihEASppUWa3RnRFOhRQV5mp/1ZyU
 iA44pNlcOH6xX07Q0iJnhYbRC/4UlBBCGekES3vV4NZ7LDq6/becB5VWTukxT6iItn3D
 iPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCmbkLa0yYr0QBg1CfQR5sNbcMWAWJk89TMhy0bc8HA=;
 b=JMzWPtgC2G3m9/IgLBw6IuDzz6F8pPq8gBh9mvPQ9CPkl/2ViBBJMTe5hoE/S8Q0IP
 sQjCfGrkWJ9BnTBYK09fenMVEbFmL1gzZe2XNh4rN/jFlMFxCQ7WnlXJ40kT81QSDkjp
 hRvZo0JhJ6ydhYyJgFogAaDR0pLdRG8t0olOexFWwho91IToMx9V2Sf3pnCd0f90zmnd
 /2RGH0rtV97NeMyzgveZaFfNl38E8fgfLhMwjwzRtsmzbb577eJmsSZuGWyaCe9AsTxS
 vESda1RXQegc9O1YGPvuVAOdmXk897t93G/oyFViGG9qTTzbdrdn2cEnsjVREuYEfhXH
 pQCw==
X-Gm-Message-State: AFqh2kqV8/3NBCCAXjfyLEhHEp7qZi7SK1C5E8aX4ePXyqxgYo0xXk6k
 ZfHTRUb10eUV9DieWdLhl2DwFoY3EYV164cv
X-Google-Smtp-Source: AMrXdXtMCCFq72IvBju6RydlxAvVYXMbRrt9zeHI+IftANjm40L+RNpD2q/kGNN0MtC91jtTCs6HCw==
X-Received: by 2002:a62:1ac9:0:b0:57a:7b74:4ec5 with SMTP id
 a192-20020a621ac9000000b0057a7b744ec5mr26366412pfa.13.1674518472501; 
 Mon, 23 Jan 2023 16:01:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 15/22] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 23 Jan 2023 14:00:20 -1000
Message-Id: <20230124000027.3565716-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6b6f8195eb..37f5ff220c 100644
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


