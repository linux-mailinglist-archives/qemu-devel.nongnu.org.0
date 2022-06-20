Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FAE55241D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:38:50 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MIT-0008Bb-Mn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaP-0006Or-GO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaN-0001Xb-16
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id d13so10358877plh.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=FqLHtufPEwI0ojuZqGeNtIQtjwSNgoGGTvDt1Dim4lGMA57q58elUyQaWfk1gChB/6
 zg/k9/dLV+qP4FmYntJ1OGVUO31llx3vYcFr8Fh9qTV91tjecVTsidkOUnXGh4YKfENc
 PNf6FgeCZQNjm4UL0vbEKZjESL9zQOfT4gwNnRbkU1u5Rx0ml/WjXrkzwGvvJ1PmL+V6
 v4YijvMxarVpKPzmUxhuF6adHjIsHIins+WBkAdl8V6OWPs24Fx5RYzmhDhTrJjsahnH
 MMeYFbOEXgwCqA9rU29oA01XUvfqEXh+7FJOlPEKS8VBtSUWbnU6ybijD2nTwEyifHtk
 DwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=Usr5m3CyqmfCfBjoxEmNo7OnQt2qwz1C0rt214A1v2PWsbzJd8cO9OguT/ep62oj43
 eRcja6mMG1gDNSnWiowV1C5wdWSZ1NKPXzFB076ja8iZzU76txA7RFpbkhgXPub6QJrV
 XMuj14a/LlL2Bv7/AdmH2QwMVE+o9eWdyV7e3bWJ4adi+HqhEUdLucxn0VuUXg9T8Hnm
 q2EPKZu7seVeZrSq97Q29CvDqSeJV9zAjH4AD2byo3btg93XC/laNXyWlOsAPUB8HSVg
 8GHtVw5CNFv6qFD9X/uG1nvLMDp5pW/ZnGrBt82HxzcfYFtFDVVUqg5rXkpotl+/7FBV
 HY3A==
X-Gm-Message-State: AJIora96m+U8K67ncRQY1Awkl6RDNH94vpdJ40I4QJyPw9AOPfGnItik
 /JEBYI/Ra0qU7NCphuAPvHC4txWTB5DLmA==
X-Google-Smtp-Source: AGRyM1tzQNl/pBsOxExONTMbrIpakb3x7n+ceddHyZ8uT6vHKQT9s9hiZoqnH7AKIiukjdceAGvVJg==
X-Received: by 2002:a17:902:f54c:b0:16a:e9d:c495 with SMTP id
 h12-20020a170902f54c00b0016a0e9dc495mr15129417plf.28.1655747589938; 
 Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 39/51] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Mon, 20 Jun 2022 10:52:23 -0700
Message-Id: <20220620175235.60881-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1


