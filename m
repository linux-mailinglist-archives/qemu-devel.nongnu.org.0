Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D369D711
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYp-0004eI-MZ; Mon, 20 Feb 2023 18:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYh-0004P6-Cy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:59 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYf-0000M3-Qk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id pt11so3454283pjb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=TUOdBq8xbouISD67Tp0NvVaozs9Bhh6/loj1Byeww6gSDx3TKf4KT8/XkpqD+AMNTd
 eT2cc+p+ri/R1YCaaGWdbTJDkHzeeNc7RT4BCNXXf809f1VEeGq5EbjKeMQM2mJr12VK
 Z4FSa4NH5rcikVDpvGATz3KU7Rz8EbcHC37Q3TBIblxKO/H+UbRCPeM+3MIjW0F8UweS
 R2NkhLcxYODbpY99GUGX7rq+zGD2q5/z0ur8Icl1PTiBCnbOUrMlHHMpj7HhVGCtlI3m
 tBQrzz9pyNwuaQm1HMDzm72TNnc5q0xzDCMy2O/rnk0PiEiKoRFvMFhvHCzFHTg/lrNJ
 Xm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=i4GFXfMsigZzHg/z36BVCC2XpDnvaD3ARRJhb6i3FeoAgP4OzFK0elrkEHdTu1HYoL
 x+kICsiFLqBCmWy+8HZ8D1Y7HfriBqpJ1V76UBfm/mfKjEhhgWstqUhmUMKKfKSmCmNP
 3Ndpa5wRW+TKWbiR670v44cncVepxy4h9fCjXGvHdKqsx6Frg4mP/hH5pe1XDoUTsUlB
 tDzLBjRhseUrT3mqmaWBfXMNXO9tA+c69ZuUBjHH8BFHZFPhcBYc1gQ464hndCiFp5VW
 199sQJPW8V3fT81/cy5UCuyMYEyPEsxFQOh93aOTF9BWBYPU/uQBaABuknxwgb2nMid9
 kbKA==
X-Gm-Message-State: AO0yUKVBxmE/VHkTpi7EkG1tpNQoNj6Gld+/xwjL+RWpxWshrjlVsPaE
 2J9V0XlyioSVQl4+7w24k8vujFj5jjGRqJJys2M=
X-Google-Smtp-Source: AK7set94qzNj2GEQdbBQLQFz2P5HaFHnVRExD36ys8Jy6H9mGkjB2VQdPqZ0sCTOou18+rVFXkyvjA==
X-Received: by 2002:a17:903:32cf:b0:19a:b092:b31a with SMTP id
 i15-20020a17090332cf00b0019ab092b31amr2393748plr.8.1676935616792; 
 Mon, 20 Feb 2023 15:26:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/21] target/arm: Add GPC syndrome
Date: Mon, 20 Feb 2023 13:26:22 -1000
Message-Id: <20230220232626.429947-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..62254d0e51 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -50,6 +50,7 @@ enum arm_exception_class {
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -247,6 +248,15 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    /* TODO: FEAT_NV2 adds VNCR */
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1


