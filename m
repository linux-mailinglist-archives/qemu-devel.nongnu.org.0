Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CA4D461B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:44:25 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHDU-000270-VL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:44:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxj-0006Ev-HN
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:08 -0500
Received: from [2607:f8b0:4864:20::42f] (port=42634
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxi-00081X-7p
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:07 -0500
Received: by mail-pf1-x42f.google.com with SMTP id g19so4839499pfc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGnYRwLa1Sdp2FVEXMpjEqak7lSPIuu/eJVT8HDcZLI=;
 b=t8ugzzGh13hhzZytrFxNNz1j5VkeLVl5fucfXPS6xKlXoQKx6LizIzxJXmG5yqmIPH
 +WGbtryS4gevTA8bfsJEVgE1TC6Y5Cjg284JNaiOdlNG5z9ZwSR4DnKCYGniuFGePXuG
 JA6iZnbUOS7RrEb67tG5HaumwwP62AvZi6o2jCXqc9peNobDCZ5bnxiU1YZhEDFCGhKJ
 o3PcVfyvH9GD+OySY3GKKSkKffwuKiGw8qFVsLAmEhAug30fhtMPfnn5Iox5xnKpghbd
 1TPeWqxIYYykJ7cD7vmeJcdYDy9+CI5QlnFMcNIVUC0hebNy1adpBz+V2g6joyz7j1eV
 LqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGnYRwLa1Sdp2FVEXMpjEqak7lSPIuu/eJVT8HDcZLI=;
 b=ZCH329eCaebLFAyIJwhemeu3o1FI7xsQ1hHbxUfgq9YbAtNwNESlsequ45r08kgj7+
 /TpYRL3fyu3XIY9LTxA0SQPUIZ91z/O1L94y/qNrHGBG6XJsrPQuQ8u7QfAxdk0C+3id
 Cbfj0giRTSdRcZ/6MfJFYT3klJ/uOWud1QL+GnRhqhgRq5nmETIS3E5MLgxaSE32BNgD
 Ma0DvefBq64gK6Qg6qk7swIrgfbsvMWtPabluCMwqGNE5UElvxIC34po9CnMP8rUzndb
 Ykip+89CZxBA1xSkRODX+IQ4GtcZuW7z0caLvNAyqnNbyPBu7NBM4GB6zcq8msEyJFUO
 zDJA==
X-Gm-Message-State: AOAM533FH4WIGWeQl6FaIEHA8kHTUKBbfEbZGMY+CkxLKRkivDzr0fLu
 KUJCPgLmu1EUF2x2AoyNSgiX8fpZ1sq73g==
X-Google-Smtp-Source: ABdhPJzfkBNJpDfKciZFLszPP/Zi5YayxrRyG8BdqCZsg6qyVKV+JRZEvlw2K55Y4uyhDbpH19FpoA==
X-Received: by 2002:a05:6a00:acf:b0:4e1:9222:1ef3 with SMTP id
 c15-20020a056a000acf00b004e192221ef3mr4355358pfl.18.1646911685015; 
 Thu, 10 Mar 2022 03:28:05 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 33/48] target/nios2: Drop CR_STATUS_EH from tb->flags
Date: Thu, 10 Mar 2022 03:27:10 -0800
Message-Id: <20220310112725.570053-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing about EH that affects translation,
so there's no need to include it in tb->flags.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 95079c186c..d5255e9e76 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -276,7 +276,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->ctrl[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U);
+    *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
 }
 
 #endif /* NIOS2_CPU_H */
-- 
2.25.1


