Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E34E4A45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:01:37 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpNY-0001Uu-7d
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:01:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKo-0007qH-8b
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:46 -0400
Received: from [2607:f8b0:4864:20::62a] (port=36438
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKm-0001UK-In
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q5so150050plg.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+5z+wqi2rxnK6aMMyUHgsuTb072LmLznpqr7TVA2Ek=;
 b=rY01lwXIo8Zhx5tAVaR3PTWgGZvCxW1bfFi6rbDvFCsm6ML7tmAelPntDZuOXIvzco
 cagmpgmaG4oS9V9eGNLbMIqGZpo/6iz2O4WKkUZoHQRtTWr/qqG89lA79YvUzLLlzw2S
 YGb6kShyr0XINoi/ycWYnQiKPny9Z0kgbOJ1UuGPCHp7Qw8t/xuSvV+I6JPwxv6E+iPF
 ZxOQUEPjgE/Jv/60stgu8bzEw59ShVKA96Lrz/ML3vJmz8HrJx1pP5mFqWUpDRWQG3uk
 aXVQhKIrX5kImo9dbZDTJxd89gQqBcqdfYNDlWYG82uI7GqWNZUPbwud0uO11AIrVhBi
 h7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+5z+wqi2rxnK6aMMyUHgsuTb072LmLznpqr7TVA2Ek=;
 b=YtPoNCfs/g1UJVGOYkDN2Uhug2BD57wgbHlbhVYE9t7lqCU+OsgNpOpRbPoK8qubXE
 51QbhqBFovAL3HUXJf85vNYnwIg0RDNAJkk+wGvvvK/4EgMqCBeItcpXF0BW2DrilkG4
 UuHMzMPpnvfxDOqn/qBPDWBBLny5wzuAPYmgngOXcYNtQLbrBB531Smi9eF7voUK8VHs
 QIppc0pkYUoIU0A4vvHAsOYsZv/V0j4NtRmFiGW4qmSLeM2bcmvby36SfruWsauQEz6i
 DHTxsAEe7som37DY9aRYxSRifZrMSWhsNWsrwfO8H37oGYoGMOVhHPhHB5iUx6m7R6op
 R7dg==
X-Gm-Message-State: AOAM530w+SHmTYLVh5mSFxnsBidNIRBgr4D5NwAh0Vy7wl/i+aC37hay
 UHbu1VEN0oKOjzkSHrl5JWmhyAvAQgsGdg==
X-Google-Smtp-Source: ABdhPJwk9/Iw1J/0jtA27hRIZdbIabnftOisNgfD1oh2+9GwEGFlVfOxjnl2UgU9Hryi/gx3j/1CBQ==
X-Received: by 2002:a17:902:f54c:b0:154:8227:a387 with SMTP id
 h12-20020a170902f54c00b001548227a387mr6542544plf.42.1647997123188; 
 Tue, 22 Mar 2022 17:58:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm11569167pgc.64.2022.03.22.17.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 17:58:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] linux-user/arm: Implement __kernel_memory_barrier
Date: Tue, 22 Mar 2022 17:58:37 -0700
Message-Id: <20220323005839.94327-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323005839.94327-1-richard.henderson@linaro.org>
References: <20220323005839.94327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fallback syscall was stubbed out.
It would only matter for emulating pre-armv6.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 032e1ffddf..a0e43b261c 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -158,7 +158,7 @@ do_kernel_trap(CPUARMState *env)
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
-        /* ??? No-op. Will need to do better for SMP.  */
+        smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
          /* XXX: This only works between threads, not between processes.
-- 
2.25.1


