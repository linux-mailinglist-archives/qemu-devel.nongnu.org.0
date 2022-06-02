Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7BC53C10C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:49:22 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtd3-0003pN-QW
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskM-0001h6-SA
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskJ-0000re-Hz
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5882494pjq.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=bg3Fli44Ic1XJqkc889xc/WCNbVx6q3cClYbT99/y1umLsyQXql+DpCCpHpPlhzSW+
 mPSGgEAhDZr9iIRxvoMctOimn5t7XqDribZ9c1eDlDUsLZX7n9hObxcqI46o7lJZ+S4X
 wYKyezrm5dF1G/WJmSZMRP9xgDwa1EruQyOzZw3MjFKZbRTkByXK7eWIPuqehCEn9d4w
 AnOg+g8h/SY0A/pfBSZDAxbG7cm/rK5Wiuj3f/CiSpNaTeDD7wofv9yLS6DljbPiJrTJ
 nzaHETacJiE1q6MPzGC8b8IqoyAVxeLiIvwFKJDKG6p48ustslK8j52XTV+urESTL2vc
 4QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=csCxg6zZipOu127HEb6CT3HTHsPIWEYEO+Lwmem8lPTu9IYDIACig4A9vrTrOLFsJM
 D6FdRMtKz8vLQVQr1gg+AnezvrxENyTbrgs5OXgCotvzXk6NrcgdjQQYbTuKqv4ElLYp
 fAlPz3z6MvkcQJVBKm8Ag432NkdR2vvNYKFVxqVH4EF/bTo1XIdI/92jvLycTVT/IsPZ
 6BPKZoIdgGb71yGj7zlwcV+30KX3HbTluOROcukk/0O7dM+QGf6b3mYox/gY7HmqoiZn
 RWq9taPEDu2EkV3/SAxvDN1i+YpnxK3Dv5xnsnQ+y/GZnbwj698jLNBvXeCK3cjG2Vtl
 G0vA==
X-Gm-Message-State: AOAM531NT9Ju37dIUv4wdVFtoqQpt5JLAbLBKLTiz+eAo0FmFppn2ES0
 1t3mgTRKnq81TW9E3JqiU7J0lVInWHCIuQ==
X-Google-Smtp-Source: ABdhPJw8j9fDaO61rwVKjNwBa7b69M5yiPqQQTZ6/3ik1Jb8P9MWHoNUJnz9jImR3Kg9x9B0E3cxmQ==
X-Received: by 2002:a17:90a:cb8c:b0:1e6:715f:ed28 with SMTP id
 a12-20020a17090acb8c00b001e6715fed28mr7447100pju.69.1654206765945; 
 Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 59/71] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Thu,  2 Jun 2022 14:48:41 -0700
Message-Id: <20220602214853.496211-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


