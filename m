Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473A3D9AB8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:00:57 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uPw-0008Ie-AU
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCY-0004FJ-Dr
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:06 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCW-0002VV-Me
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id t21so4820182plr.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2hRhZVNp9BeoKX1Zle9XByXKmFM2EsSbQBT6FZfwUEg=;
 b=zrv9SKVRMugrecd61FvR/FmGyBNDFEGZ7KEvmKP4RyKuibL3pMiEUw2pHmrefG1lnl
 puJh25RkHpcvco5aCF8vHNLmYiIDLO2NuLTOCfSjWcFIEH5QXlod0fhWX8ENe8VU+HDS
 rp2ZZ7C4zgcM/UCdGNgyxB0+pttQ7CYcfI2++jtLqNocI1cEo1yWZ+X90VXLTjItdGuO
 lbT6rSkAFSHjl+53vCfIOlMpciOiwlfk9JiNNuXBK/nkI1C+stjAyo889vJhpA85nPtT
 +Q5wHPPmsxYsyI2ZmBmwQftyqiVs8nj23EDcazWE3Mv1mzpuOV9FjtYKle2tLwRzfN7I
 cK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hRhZVNp9BeoKX1Zle9XByXKmFM2EsSbQBT6FZfwUEg=;
 b=rIEsO9Y7xafQh8ieMsGxX0Wi2MhsKnPP5uy4P1lQsnsFxZwki0Zje5JBO5znSeBdIh
 2D2+d6EFGpcE7xOHyn3QsKnPicquF5tSXP3mf7UynN2prsoh6VVc/cU3DNiMMKzbsqvG
 Jx9c6h58q80Lb+eFT/wrXFS4xzwVBM0bVskMW/hH/fqlPEbFBtR28+m3IJuckTKpURK2
 FhAMrm0JwG2bUSyrOA+hbMWgbKz9Lt25tLM8eR62aqJ0TJKvXHuOyFlLl/0NisNtr6e+
 68ksAasaPdO6GnhPOquqsJ6euYvcnZEULaNceeuh7XB5vwJQKwYL6NWXeD9W5X8HB5K+
 5A8Q==
X-Gm-Message-State: AOAM530V9RfFF4pLVJtCbe25e832CxisqzZyO0HUUgLAAzWzZtgNmeQO
 aOFdYLMLY8T4sIHQIdwiCivs8b38nsUWcw==
X-Google-Smtp-Source: ABdhPJzi//zZKbSsxpBLcgZUihVCdNW7Z7JKXLdbAsiTmVa685k1ok0iiRP8goZ+0i8TSjYsBX/RMg==
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr3832232pjb.203.1627519623477; 
 Wed, 28 Jul 2021 17:47:03 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/43] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Wed, 28 Jul 2021 14:46:15 -1000
Message-Id: <20210729004647.282017-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..d6d70c339f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


