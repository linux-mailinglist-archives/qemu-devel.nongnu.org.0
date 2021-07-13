Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FB3C7527
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:44:04 +0200 (CEST)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LVr-0000wW-R9
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU9-0006oX-DX
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU7-0005c8-9J
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:17 -0400
Received: by mail-pl1-x633.google.com with SMTP id u3so6275313plf.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpJOU5mZm1ReiYCrMc7/11RGyN8K++oSudXAQV3mu7Q=;
 b=hLxrnRie01rUw0Ssrf52r0Z7c7gQHYYgLUuk6O9Z+ktdE7tbWegJHrZrGrR8OtKQCQ
 8DbXiy7lkDI8Tm/drJLDQGuMxr0wTtK00ms+KrogSyvXFUTQzsrlqTTeuerZxGqWxxj9
 ScYgC22MzCps09HggWbUFGTbOqHRAlGeU7fxOV9MVf79le+ZYset3k3/zEjDIQCa0llf
 d0T8VjAL1+kVp7hDJiGK8sKLUv8YQJFvHpe7RqLQitlpR1ZQdK1BpNitzeMSI7zK/r6W
 ClOoydvo2XlMFPsOD71RTeqnUTby2SOTJ9nGzCykQ3YvEdR1F11PVjAATgY7tpIZZLxg
 0z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpJOU5mZm1ReiYCrMc7/11RGyN8K++oSudXAQV3mu7Q=;
 b=KThmnx8gvz0357cBs1QTcOAVefSUb1wDdJc/B7vMzQwe2/3MTKQOqFYGKIJo2Qh0Zi
 iLaxmIYB4Hsd/bRHVf5JivyLVcMNxv9pi49PCEIX+JUUlcFZ4iYX5C60ScUTI54rBuRz
 En8egvaexCs39pXeA+C5X0dwjNt4qhJqsX8XJfOvWYTSmQ466AVoshQotTEmtiGne37x
 pzqEdUIE+DcV3D+Avkw+TPfhs8Ci84IZLCTRfgwoVJhESftLAuk5QRNtYIxqOA+u4ECs
 tXGvyojsDuLeVpFoqHK9JU0sL7L5ZJVSAYI2sodWS23fmJlkq34E+57jRNi+ktQAEKwa
 SkjA==
X-Gm-Message-State: AOAM53376Ygz5LGJerFWahQxJmpr92uJLJ60WIV78mDSu564U5+eJ7+L
 3eo5W+MQfB0Kea9D3dpnu1//29pHUWbmuw==
X-Google-Smtp-Source: ABdhPJyk2yI6/8TEjO/hixS4ubKKkDn7y8PoXUwov1A473MIK2B3dtTUT+ydhD2fOM3UGHzn1bGgXA==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr236811pjg.218.1626194532823; 
 Tue, 13 Jul 2021 09:42:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] target/i386: Tidy hw_breakpoint_remove
Date: Tue, 13 Jul 2021 09:41:58 -0700
Message-Id: <20210713164211.1520109-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Dmitry Voronetskiy <davoronetskiy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Voronetskiy <davoronetskiy@gmail.com>

Since cpu_breakpoint and cpu_watchpoint are in a union,
the code should access only one of them.

Signed-off-by: Dmitry Voronetskiy <davoronetskiy@gmail.com>
Message-Id: <20210613180838.21349-1-davoronetskiy@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/bpt_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 624f90b789..4d96a48a3c 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -109,9 +109,9 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
     case DR7_TYPE_DATA_RW:
-        if (env->cpu_breakpoint[index]) {
+        if (env->cpu_watchpoint[index]) {
             cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
+            env->cpu_watchpoint[index] = NULL;
         }
         break;
 
-- 
2.25.1


