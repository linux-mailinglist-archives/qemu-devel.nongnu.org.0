Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A34D4661
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:01:47 +0100 (CET)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHUI-0000QG-A7
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxH-00057e-MG
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:39 -0500
Received: from [2607:f8b0:4864:20::435] (port=38551
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxG-0007w9-0h
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:39 -0500
Received: by mail-pf1-x435.google.com with SMTP id f8so4847757pfj.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cj1Mv1TK+d1R4GNVLpYWtLlcIcx/OqQSWvfjy4IfC40=;
 b=TyNW+pRTW0n2lRdUpmRyrzv2a63QvMUHFkGeDvKbCpKE3RLEBRmaE6MMfJYeAryjxu
 V+J5+44WMIL7FWT7BVfvG4VcWGtrhNZa+i+yoX1pDNw8swhoULgwCGvlhNiV+BZtWdNI
 PjqdkJossw9DmX4fA6/PiR8/sVweL610j3czGq2gXzYOVMaKv/ZLYNmGy2l+DQEMCQlF
 sIjShuN+H6/SsWNFPugCPvxJQXbdx2+yoY/NdUfmSIAOx0w1PvZWc5Duq4Mew9GFoPfD
 W953yDjgssbrlzTtdt9M66FjCo+DYXsnPd0SQCwXI2EMSDTh1fwCQ4MHyKKFiJLp+iXj
 y33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cj1Mv1TK+d1R4GNVLpYWtLlcIcx/OqQSWvfjy4IfC40=;
 b=BLwhnrQ8zxJnmZ44fGFs2pL6tW/+WD76oONDjIlZPNsOu/P11KXOiZ6yu3/7KmlExD
 LUFE8dMRfvziX5vfv4s0DkgdPUbfq10GeybW1RVwfI+kifpuWU9d+VxAJtCWvMNY1ers
 Me7bLMoFJdw9W/8OUGPLMqJ3z8EGsSJumP6bRo+x8llSGInktA2Z9fwvTrTbFHsYI79t
 KkAJKroPXkGLtQZyUUCZjXLhyUQ8QO9YeeduTXT1raX/IXPa6AHtadXiLJYp+9wcvzu8
 zSk4P4oMaALAqEnMggXVKQFcc/+9lxlVovvjLXqJpne9ll7q600O5ckerU2JAm9iWLOW
 ED4A==
X-Gm-Message-State: AOAM533DtOJVD/nzrQ9nJXg2T/c1DRqN79q8zkdqYI19GNF2BiaH1wiB
 c1B85PzccfsEJY5TRjputPlR/kDcgUyZKw==
X-Google-Smtp-Source: ABdhPJyDjxkQToW8JUQdOHJgZBlraLjpOzpAHqn7zU3Pluxp+CoPpYYeUrRqWRknmxpDd3XmlaP7xg==
X-Received: by 2002:a63:4403:0:b0:375:6d5b:5aa7 with SMTP id
 r3-20020a634403000000b003756d5b5aa7mr3578406pga.269.1646911656721; 
 Thu, 10 Mar 2022 03:27:36 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/48] target/nios2: Remove cpu_interrupts_enabled
Date: Thu, 10 Mar 2022 03:26:46 -0800
Message-Id: <20220310112725.570053-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

This function is unused.  The real computation of this value
is located in nios2_cpu_exec_interrupt.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 9be128d63a..59e950dae6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -226,11 +226,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 #endif
 
-static inline int cpu_interrupts_enabled(CPUNios2State *env)
-{
-    return env->regs[CR_STATUS] & CR_STATUS_PIE;
-}
-
 typedef CPUNios2State CPUArchState;
 typedef Nios2CPU ArchCPU;
 
-- 
2.25.1


