Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D167D9A1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 00:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLBig-0004nI-0q; Thu, 26 Jan 2023 18:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLBia-0004mT-Q4
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 18:31:44 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLBiY-00020u-1y
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 18:31:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id a18so3346665plm.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 15:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oAq23tFP3V7GoWjZJ9sICzNMmPCjvQ4jyu54tebclPo=;
 b=EYDpxzgkWXyLf26RkuE6EHrBHsT7lhuGUsS/U8KANiorTdyJOrTGGYMBmSIszUzoFl
 xtFplTAZV5GWUJpiJ3i4ffoFT0bLXQGmNg7+w3Eg+ONz8JD/LZgTNS5HOfbwcheHgAkz
 1Iylhy9VF+Rr7p+NdT8J3yn37rkeiZzwtO54BGurPa8HdDvCnxQysHpKKsHy8+FAJlpC
 zWO23fZztBEK3rsDKyCoToBH0KQ4y0dwjS8+7f4nIe849i9J9O2cVzScOvEVzUNPmLoH
 Wj/XhDWGPLcbctXBbc1yKTF/WW0acNxoeWrkE12NTW1lzCkEzFcaraEMbXzF6fXfnCGN
 3oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oAq23tFP3V7GoWjZJ9sICzNMmPCjvQ4jyu54tebclPo=;
 b=MQkj/DSpedoaZ+Tsp1ix0UnLXPz69ze0axmLpZuC2JA5jdLEb5QPqDGyNY1U51hIU7
 9XYpJGsYXrP12u6J+r9k++ca/haPIepTd93SfYPL4JZtJ/u94f3DFu0n7xoIlSGuAFp7
 32ir+mrCOKExBIteERyHv0WkTnxNASNUU9I7+2pxbA8JT6IuEUcelkCpcfq/MbIRG0+r
 HZZIQXWzEILQ2IPsG3d5bIUd/1kQc3K0SGiCutZEdzIgP1YjoSIajnfMQq2vDVR2tQeh
 WywsoH8Q39+JPrfAUs4a6cnuLyomi1N1mBmQ18Hwp1s+m9+ccGwwLajZbNmaQyX5W2XY
 JHwg==
X-Gm-Message-State: AFqh2kqM0uTCRew8KVCH+DSJWbxsR2FIX3CIXWJLyQxyB0uH9m/OYR2O
 ID6c2B8uXn0R5Krozt0E1WOPjqJx5FabfpZb
X-Google-Smtp-Source: AMrXdXsvjl2qZxbL13L/julLwGBqDbqtM6itTlaYYMyr3MTACoZTQmXUs8TkLEocUZDQKynDh/zdfg==
X-Received: by 2002:a05:6a20:958a:b0:b8:6edc:7eac with SMTP id
 iu10-20020a056a20958a00b000b86edc7eacmr42056018pzb.39.1674775900265; 
 Thu, 26 Jan 2023 15:31:40 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c20c00b001963232f49dsm1477791pll.233.2023.01.26.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 15:31:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Sid Manning <sidneym@quicinc.com>
Subject: [PATCH] target/arm: Fix physical address resolution for Stage2
Date: Thu, 26 Jan 2023 13:31:34 -1000
Message-Id: <20230126233134.103193-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Conversion to probe_access_full missed applying the page offset.

Cc: qemu-stable@nongnu.org
Reported-by: Sid Manning <sidneym@quicinc.com>
Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66..2b125fff44 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        ptw->out_phys = full->phys_addr;
+        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
-- 
2.34.1


