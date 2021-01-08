Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C882EF51B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:49:40 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu1D-0001vO-Rh
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoh-0004vz-Ta
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:43 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtog-0002wX-9P
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:43 -0500
Received: by mail-wm1-x330.google.com with SMTP id 190so8163288wmz.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J6A1hV47s+jT9+q8dDBSWtFjk7A03IrGyk65mbUm7jM=;
 b=kRrV6FgmB6xukC9rBSMu5vQ+rAW2lVT4Zv6Is8yNaOqM5bFOe7Rt4TphvJLOruptHw
 3rBJSt1pLBhEcbEizUhLMbJk9b3AqEhDmDz9Q4IwRCBJZvoFRE1W7cUCLCGWjsC4tV0r
 JCqkjaETQUBwqsCQGoqbwnapNsHxNdKe1Gy66ryncpxj1+rxFFek/mXk/MWeAdYBBTDq
 6giI4Fv1srCKLcM4z808S5WnxGyjN7RZm7jzFYkvwLjaFsG2dEA0q/NRPP0ElJJIjQnv
 CG409gc5/1S+Vteok0DxG8IiV1/wP+tYgbh+mUFG2v13pW825NS2cIvT/s7P40LAmuxv
 4GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6A1hV47s+jT9+q8dDBSWtFjk7A03IrGyk65mbUm7jM=;
 b=sBOAp7pcQvVpe4WEVbkWltfA24AT3X2xRK9GkeOwJierCgDVMnZ0EAkcJ1liEtsaB4
 9QjhNwMYqm6+Or6LQc/UFtvPSR8sebaJBPvJTqfwuYd+56k+6FQkD8MgEP9MxDDHH2k/
 xnGV8WnfNps+GTpABX7EzJXfZu0ku9Ja+7nh+fW2tYL9LyFXnjD/hqUdIYxUoLXQZiOT
 fMuI7DOIW3dYVwH1sre9xbF6LhLglF5OYeOCmkcLo0Z6V2fESuMf+4M9hZP1BD3IQcFi
 HgBUCUdAD5dwq+B5QBDRvHu2MobgDAK+UTiDIZRQq89F0b1aQbFjA3pHAtckCE84wU8X
 ArLQ==
X-Gm-Message-State: AOAM533sJyOzLh3mtCouOprbPEEWNmOqPNcaQMm3b9bpewv15owX2erI
 JtUbBgWkNMNxKWyvmGoCFNML1VA6AhoN8Q==
X-Google-Smtp-Source: ABdhPJxfowpOC+Sx3kaii6lAz1m9AF2/VEDG6QlTvFGkmz04ARyZFUW1hwwZYpxN22owqMC6f4Lhxg==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr3579665wmi.151.1610120200770; 
 Fri, 08 Jan 2021 07:36:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] target/arm: Remove timer_del()/timer_deinit() before
 timer_free()
Date: Fri,  8 Jan 2021 15:36:10 +0000
Message-Id: <20210108153621.3868-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm CPU finalize function uses a sequence of timer_del(), timer_deinit(),
timer_free() to free the timer. The timer_deinit() step in this was always
unnecessary, and now the timer_del() is implied by timer_free(), so we can
collapse this down to simply calling timer_free().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201215154107.3255-5-peter.maydell@linaro.org
---
 target/arm/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 62e319eb6ad..8387e94b944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1305,8 +1305,6 @@ static void arm_cpu_finalizefn(Object *obj)
     }
 #ifndef CONFIG_USER_ONLY
     if (cpu->pmu_timer) {
-        timer_del(cpu->pmu_timer);
-        timer_deinit(cpu->pmu_timer);
         timer_free(cpu->pmu_timer);
     }
 #endif
-- 
2.20.1


