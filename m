Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D542B2FB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:57:44 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUSd-000524-C2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHr-0004op-Ud
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHo-00050l-6k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id t15so1120130pfl.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7vb1DiY7NwJL2MkD8o8UL44MwU+VnbJvJpghPXqqyM=;
 b=XWDb5YhfbIz70Jj8o+WphdROtQIWTvcduxXRsmRqeTePUm9aDWkQpnfZySRhP5hw1Y
 KILIKXMN1EFOdu/2rb0FIN2yHtdK5lY/jQIfdn6qbvmW2OJnM2IYaLsHer+VoRUVg/v8
 cQub60IdwoPfszXgrm+gSlRxWcTwWm2fK5fac67mJl0PKgiRIhoOb99d1tHw7Jvmqcnh
 VKNJLPzChmCwO9Nrrt4ldw/54aBrzYymaXSp8SB2forO4he/pKPngmvCgEz9w9UZNFcX
 PlAHSc092xzMgHtHtE1CqkjjlMxnwg/V6UjrV+sLo4h6Px8eOeZrT3FOBPxbJo2qttpJ
 lQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7vb1DiY7NwJL2MkD8o8UL44MwU+VnbJvJpghPXqqyM=;
 b=QkJ4ibC17Rl4sI+QOnkcd/EbGdL+MG2yK1mbdLvzzsP7Pu0es7TAN3dGMSVAXjN0q7
 SNsi0oyzzfPnudQ2/yYCkyts2QFp1bB6jOpZOKwx/cd3oe/OxhQJJrxN0csGspLcTyFb
 /KVzfwSdgHfaLAKSt7RqgPPWyK0a077RG7YbuEnfzLqm7vTeSH5AAEXwPXMfk9e/OPNh
 iEna2xWmB88tNopgZS5zYdVe8fFc2DcT9FdXsNRI+u78lifknXMUTI1A5z5fJ/s09aIn
 WKqXQvxVkX+rNR74EH0uRhoH3EE8NSyfpZDKKe15gRYflppeB+vRSdSXg3hzAJoYF6jX
 jCYA==
X-Gm-Message-State: AOAM531DJvUx99d7fQy3GKpKzdpi1dSjfRcxreYrlyMPEZCw8TENh6eh
 ffVjaQEjJLiH2F3Arfj4HzG7RABzZn8HRA==
X-Google-Smtp-Source: ABdhPJzgHGrZT9AnLhaL9fpiPhRir1xpKw7zFqaia2XKK5o1HN7yiWnkeNrY+4ydtSBzkL7d3JShFQ==
X-Received: by 2002:a63:1d10:: with SMTP id d16mr25243290pgd.156.1634093190940; 
 Tue, 12 Oct 2021 19:46:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/48] target/hexagon: Implement cpu_mmu_index
Date: Tue, 12 Oct 2021 19:45:40 -0700
Message-Id: <20211013024607.731881-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is trivial for user-only, but still must be present.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index f7d043865b..f90c187888 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -141,6 +141,15 @@ static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
 #endif
 }
 
+static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
+{
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
 typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
-- 
2.25.1


