Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DFE2522AC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:21:48 +0200 (CEST)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgO3-0007S9-3J
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3t-0008Sx-U7
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:57 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3r-0001ym-W3
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:57 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ds1so127720pjb.1
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lr71+uB2rqlQWi1mZS+Omspl/b6K02nPk8zKl55dRRU=;
 b=xJwhO4GkFEIATLuB40u5lM7hIblRgfF2xH+g39N9MOv4qzLRNC1VSzJFU5snBvfZPO
 8piLzuBeOwlB4uxhCMZBnV67tVpc0NhvPAsyStYU6eBpm2fWm7IaybIsz6iZsCO5IhQD
 jZo0UHcp2CTmRjLRbTcr+VUX2Zx9303xYJqjbOVW2yFz7bZ2PLZgLscDiBbJx9TrMNk6
 Lzw7dp2gXSLBiZJ/JujiqDZHI4IVPwPG7j8gLLbr+7FUzBCR1twaVDziTzuPknw0r7Su
 YAOrwkFfZqm0KxwlM06TZSdXW9MxPo1ba3HCxNpb7HiKUcvDXhc57Gna+nOLFTDDSyur
 aSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lr71+uB2rqlQWi1mZS+Omspl/b6K02nPk8zKl55dRRU=;
 b=RfmdvJ2D+pkM6qBon/e8CNILbWnzcfdxOcyEjAuQqTyslo6AydMJF2NypQvkGYNB4t
 fpqhH+jm6CSnAD9JahvUZVeqCiX0DmkRpmt6mFUZoEOc60vlTO82dSnDiTRxBjtikhB3
 28fnIsd8We9EYk4xPoMqjrGXeZVuucyDmHNISWyG0EIz+LVHwN6npz47fAT9zvyatk14
 P7e0/W6HQzUXCh0k3uuGhK4SgiHq+XVjzOsX9+1uqoXS4GVuIaOZh0+TA08HcpuJo0/J
 Qmeilmi7IGtQdrA031YC4ts/O84ikuBVrloT3iypRm3sjodZ78+7CGhPk0zG3+xYPY+A
 8nsQ==
X-Gm-Message-State: AOAM530sY8tJ114D2fVgpUt/y1HiEh8xPr9zjysdg6hImdlSJ23sXNi5
 pKwPOYRxRJscZos7VwmB7EYsk2zoFidfUg==
X-Google-Smtp-Source: ABdhPJybxn0bSrvHQxhD25Ecqmr2CfBs1e0P+0m9EHTCmfE90SeiQfnRhhx1PF+dTvOQj2wI6p8QzA==
X-Received: by 2002:a17:90a:d510:: with SMTP id
 t16mr3293775pju.210.1598389254287; 
 Tue, 25 Aug 2020 14:00:54 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 50/77] target/microblaze: Replace MSR_EE_FLAG with MSR_EE
Date: Tue, 25 Aug 2020 13:59:23 -0700
Message-Id: <20200825205950.730499-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason to define MSR_EE_FLAG; we can just use the
original MSR_EE define.  Document the other flags copied into
tb_flags with iflag to reserve those bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       | 4 +++-
 target/microblaze/translate.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 013858b8e0..594501e4e7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -254,7 +254,9 @@ struct CPUMBState {
 
     /* Internal flags.  */
 #define IMM_FLAG	4
-#define MSR_EE_FLAG     (1 << 8)
+/* MSR_EE               (1 << 8)  */
+/* MSR_UM               (1 << 11) */
+/* MSR_VM               (1 << 13) */
 #define DRTI_FLAG	(1 << 16)
 #define DRTE_FLAG	(1 << 17)
 #define DRTB_FLAG	(1 << 18)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7d1ada7aad..cb490488a6 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -162,7 +162,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
  */
 static bool trap_illegal(DisasContext *dc, bool cond)
 {
-    if (cond && (dc->tb_flags & MSR_EE_FLAG)
+    if (cond && (dc->tb_flags & MSR_EE)
         && dc->cpu->cfg.illegal_opcode_exception) {
         gen_raise_hw_excp(dc, ESR_EC_ILLEGAL_OP);
     }
@@ -178,7 +178,7 @@ static bool trap_userspace(DisasContext *dc, bool cond)
     int mem_index = cpu_mmu_index(&dc->cpu->env, false);
     bool cond_user = cond && mem_index == MMU_USER_IDX;
 
-    if (cond_user && (dc->tb_flags & MSR_EE_FLAG)) {
+    if (cond_user && (dc->tb_flags & MSR_EE)) {
         gen_raise_hw_excp(dc, ESR_EC_PRIVINSN);
     }
     return cond_user;
-- 
2.25.1


