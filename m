Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90122702882
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUJ-0004bY-0n; Mon, 15 May 2023 05:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUC-0004Xq-Gz; Mon, 15 May 2023 05:27:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUU9-0002se-EE; Mon, 15 May 2023 05:27:20 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6436e075166so9319260b3a.0; 
 Mon, 15 May 2023 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142834; x=1686734834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTWXVkuOJWURPs9/nfkGg41d3eyk1kYbRxT5nVuGrYE=;
 b=BbZy36pIKf/UKMCUijAbePlVCHl7db3AZ7yzmUw9eUvBUM1QaNsE5w4niQ39+RUKFX
 v9om2U/SgchV6GIHMsTlrpMrrSVRHUJeoKZHhC+/RjYBsqHHFTwPgaAgCR2aaHW96VbC
 Pf0S86Ot99asKr/KRWszqqq4ZdH56QNOEzgLzKhXsGjJMF3Zx3VGnO3dcB1MMhRN4p+f
 KvoYfixv9TCyqV/F84LXhBEjcW7Hsmo4cemXiN3mmCo/P1rzstCLetKv+jZ1rmUzYxoI
 fckoOr1h+V3Z2a0+b1JEbY4+PNQbab73CFDR2aYAXZThqRbRQ+uH2/0Wiu6HyXlBRE2B
 azGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142834; x=1686734834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTWXVkuOJWURPs9/nfkGg41d3eyk1kYbRxT5nVuGrYE=;
 b=PwcCF26AV0EfS+Q3QnRzuPWx3FwT4Jv7JFTcEBCh5LZ2BuTIFjNYP/pww7ptJXjdn+
 nYbWQusK1oEBJPZxWGOEdYzd5LsfS3Ni76qs/Ly4skJ/80XJaGmjYHx5UTj4SU9nFEsg
 vswa+1tkAfIuil58nLF4KtqyZ+tLhuHcuUX/Fcn0yR1hpo6zUyK5yWrzDBXNy6VciCtK
 RvdHT+4Ri4IANIjc6HeLM01mHblNwZkAv/nG4dbLdjzBheKK7jz152z2oowRm+s81C73
 KsAFC+tXtu7jfniSWqKM8/PaFvrgjhyAIZwM2mdCtQgi7bxf6HTG+IAiSb4SzAFnZfvv
 j7wQ==
X-Gm-Message-State: AC+VfDxYmXKQz3HWZ2ozn82sWq4PyOa8kt4f5ulwh+masYXPL0OPN981
 ub4sFDZGyujSURm+Z2JzEbT3b0wctv0=
X-Google-Smtp-Source: ACHHUZ5+fzV8j5Ojo7sI7mdjdz0N1sxddNjcD9BxjSnbKB9NvzBtRQlOZ6FFTbSwCrQA55B+HIXnFA==
X-Received: by 2002:a05:6a00:2396:b0:646:6c71:ee13 with SMTP id
 f22-20020a056a00239600b006466c71ee13mr33070662pfc.24.1684142834050; 
 Mon, 15 May 2023 02:27:14 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/9] target/ppc: Fix PMU MMCR0[PMCjCE] bit in hflags
 calculation
Date: Mon, 15 May 2023 19:26:48 +1000
Message-Id: <20230515092655.171206-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A store to MMCR0 with PMCjCE=1 fails to update hflags correctly and
results in hflags mismatch:

  qemu: fatal: TCG hflags mismatch (current:0x2408003d rebuilt:0x240a003d)

This can be reproduced by running perf on a recent machine.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: new patch.

 target/ppc/power8-pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 64a64865d7..29e0012ed6 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -236,14 +236,16 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     bool hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
     bool hflags_pmcc1 = (value & MMCR0_PMCC1) != 0;
+    bool hflags_pmcjce = (value & MMCR0_PMCjCE) != 0;
 
     pmu_update_cycles(env);
 
     env->spr[SPR_POWER_MMCR0] = value;
 
-    /* MMCR0 writes can change HFLAGS_PMCC[01] and HFLAGS_INSN_CNT */
+    /* MMCR0 writes can change HFLAGS_PMCC[01], PMCjCE, and HFLAGS_INSN_CNT */
     env->hflags = deposit32(env->hflags, HFLAGS_PMCC0, 1, hflags_pmcc0);
     env->hflags = deposit32(env->hflags, HFLAGS_PMCC1, 1, hflags_pmcc1);
+    env->hflags = deposit32(env->hflags, HFLAGS_PMCJCE, 1, hflags_pmcjce);
 
     pmu_update_summaries(env);
 
-- 
2.40.1


