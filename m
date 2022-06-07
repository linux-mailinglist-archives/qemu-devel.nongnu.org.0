Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A8541B60
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:47:20 +0200 (CEST)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh2l-0006R6-6q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwu-00076E-49
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwl-0008Jx-NI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o6so10727746plg.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=aAdi6OLy5ihMNxfNDGO5IJIJCakxrBcB5R4b9BIwohKqVkxTl72/7P/hqgjBBA5RVK
 hUjbsulSvIggcZpz6qAjncqQSareUG28d/l2Qxe43ePoBoJgI5GFBTlzpWxNFcqYE1Ql
 uMfjC2lg+CKuHDiOhjHVY/Su2UOJ7Rx2GFVUaC2qK1TaupezCuf0iAuOjX4Z67Th+Nuu
 NhgzUmtUnlWdsgPDBccN0Kr/fLDA+3vKbZycsejsA9t3rrzKU4az3vub6YMbOMHBmewA
 US2A0zYsbyOtZnoX0Kj2mKg+6DGbA/YyRYvRUiNsJzI+QH3hptfAtD0tKtpeFDYiqgOj
 AV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=h2Xk0E87wjG550kP0+iKr+k2+ZtsRd5nRzkFO1RMiKiMmWQ84QiyHUI93PmMfzLLht
 WnSTLk6l0LpIA6sveXRnzefcwunJRxkzVRBR0YEdkSc9XMB5dk2NG15LhYEzd+q6UdTJ
 TlNwMJqY+GcWkglKO4MxCOKfOju5Sik4VYXtqV3mQtiBiSTkdV/h0iCPAtwE2llKCr7/
 x4NGlGmUohFLkBBwKpEbaEKMNpPCZZItBLI6rPWuJfq8TveLUBRp7AY3qWxmNBNnW0bB
 8om2xVQZNYdFmv+0RkmFxx+/FwnQ41E8nwFjkR2q/+qkaQRWlGPqtSW2S9RARYZ6KzuM
 ip+g==
X-Gm-Message-State: AOAM533/JTNYPCXHpF1lEVpxkFhiF1Mt5LkNoQ6Rw8Cv8PUic2nGEPNh
 cubNofjg2gGQrppht19kEkzKM27fVePxUQ==
X-Google-Smtp-Source: ABdhPJyKgc38LiZpr/FcJMwC+OTI2+YwLpPifWKMZCQLx+JURxOk6RLXPg8LI80Kym7bsFInfGhViA==
X-Received: by 2002:a17:902:eb85:b0:167:987e:2686 with SMTP id
 q5-20020a170902eb8500b00167987e2686mr3781103plg.33.1654634222450; 
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 59/71] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Tue,  7 Jun 2022 13:32:54 -0700
Message-Id: <20220607203306.657998-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


