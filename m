Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79C440AEE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:15:40 +0200 (CEST)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgstH-0002WR-4f
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1o-0001Sz-AA
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1k-0002As-Vm
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id a26so12279429pfr.11
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=vIbEBM7aaprS8d8s+b6EXzgU/N8gttVa9GjS1Xncdw9QArplZ7nQaUreYg4YJaaEvY
 tG1XZCLBGdKaFAZLqy27nU1Xd3YkTGsRNHQbkOnYr+56X6tJaJ7J3ZTAhhf9+UQU+BI8
 SDBZkcVGutSmb3J9jTDTUjnOsN/hHXOFtOOYm4lDhZEWB7K1cDln//Kw1adOlN0JBVaE
 5nyXU6Nk/ndddXlZ6UOC5Q8u7dMRDcRlFX7Ze1MdGbW2Besyl0U5YzPH5R3GtEwi/hpU
 EW6lyizOfbeup6iOoTSJP11rFBFMPFQwAfs/7Sk9DB1Q3EK/U55XEsQP6SceGpu3Sbvh
 8HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=EwMckoGEzDNHW40tNtEI7JKO1tr+EwvppyZ7azuwNq93497NisHMWhGLK6y1JV32NU
 v+FFIMpGbMxjnee2L6IKpTA0H91QT1L0Eo5g+ukV9TrasXWVHKbWHRjE5KewAbnlo0S5
 g2gjwHqEz1OSQDRlG1qBB9d5mvLSX9pvp+UNgbycZTn0OPugm6gqZ3LDx/KZ/U2WnVvP
 tCSqNp7EYNL4DZzB2FZxp59CEGb+my8SPeWLTJrIC4drMyEk1j9QLt2Wt1k6O9tQhfZ+
 9/UGvj7lZsoSV1l47QajCa+WA1lT0P6CU+2Yx3JJbM5N3OpVIJVVX/VQ1Y0FWjkFDgr8
 iaZg==
X-Gm-Message-State: AOAM5331tQtq+kAFMwuwPGY7pAj4Ra43Z4/bsWFteztoRIIYjAk6u+Wc
 u5KXAeltLxvtATYAZjLSpfKw9Pjn2HyPTw==
X-Google-Smtp-Source: ABdhPJx/zGx12wMvzTQftO4eLQlGRq2oft7mLvDizKfGh4deWW/YBpML28XOHes98NeSqKBRqwkxNA==
X-Received: by 2002:a05:6a00:851:b0:47c:288c:88f7 with SMTP id
 q17-20020a056a00085100b0047c288c88f7mr18427405pfk.29.1635614419097; 
 Sat, 30 Oct 2021 10:20:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 46/66] linux-user/hppa: Remove EXCP_UNALIGN handling
Date: Sat, 30 Oct 2021 10:16:15 -0700
Message-Id: <20211030171635.1689530-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index e0a62deeb9..375576c8f0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,13 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-- 
2.25.1


