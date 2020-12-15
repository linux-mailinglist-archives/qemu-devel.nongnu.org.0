Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310A2DB07B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:51:27 +0100 (CET)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCbl-0005Ju-TX
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRy-0003VH-0I
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:18 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRw-0004uR-FP
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:17 -0500
Received: by mail-wm1-x344.google.com with SMTP id 190so7044829wmz.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWg1+cYYQc9yalbndq1Q+pROpZyG/S73S5WbiG4BpFk=;
 b=RoC4eNBkcMlp/083JbdOkrzB1X+Cli7srDhrDdI2IrObReko+QgSvZp0q4zMYg6tTN
 qs3+Dsoa36+nuCayYXOMWENy3jvqkrkhziJhDy/6bFjxYnn5neAVFq16BLuhSJ6HOA+Q
 zyNtA36FrGPTqSVBlnZ1Jtj9LPsi8YD/h1T8YAtQgamtaqCJxSsaUwEcTaSmEmO5o/fv
 43OWrWzmicCAIV2FeLNDYsJfHG8x4NV5M9bDsaKwzp+FtFdr14Q9AsXOrxrxAkwZIrJ8
 dS/eAyORDJkOKOLRcCPSqdiE8B5iFqDGonicz9tZOfF3QxzALd8AOmSJE77GbNn6Bs8x
 2ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWg1+cYYQc9yalbndq1Q+pROpZyG/S73S5WbiG4BpFk=;
 b=UVxvywk6mkRMQfmcXxNTWxFKWu07TeZIexh1C4sTZKVg7tOhuPScs9SRmN/UyoIFnJ
 DpdQmdV6XoNNHYq2LqEOb9PwKrhkYn1fokufEpOWqrtAk7AW5uWllWJ3g5tUSGJTFlqU
 TRBLoIac+LbeJ57qmur2HAytkKZIny7Feb2R180GLNgXX+KNKbwqg4SdmPOBQWUgNOl3
 427pOjuuSMh34E5pZZDu1AmrNPDFG9QVX940v1l4J97RJqj+30l4xhn0ZyzXVSkFuX72
 GEkSpLbsHvnsaBXVPcPnsqPRik2vqCHPMw+lP8YVW1VEr3AT2NX9vuf84yL37mN6lnT6
 2psw==
X-Gm-Message-State: AOAM532sRZN3jb+CV0f9qOrtbkyKXxscFybOp43PZsWLyr7V9gcLXqaz
 DdUhACU4wjKMpFsEAeo88504A9lApvpQzQ==
X-Google-Smtp-Source: ABdhPJzY0RrY5AnUkrV7+k9jibXdVtEYU8uX9aIUUu6TWhEX6W0qtUDS+31520gdQ5ltWf3Cw3GWIw==
X-Received: by 2002:a1c:df85:: with SMTP id
 w127mr34275093wmg.166.1608046874858; 
 Tue, 15 Dec 2020 07:41:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm38259978wrh.78.2020.12.15.07.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:41:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/arm: Remove timer_del()/timer_deinit() before
 timer_free()
Date: Tue, 15 Dec 2020 15:41:07 +0000
Message-Id: <20201215154107.3255-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215154107.3255-1-peter.maydell@linaro.org>
References: <20201215154107.3255-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm CPU finalize function uses a sequence of timer_del(), timer_deinit(),
timer_free() to free the timer. The timer_deinit() step in this was always
unnecessary, and now the timer_del() is implied by timer_free(), so we can
collapse this down to simply calling timer_free().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d6188f6566a..b4795a2bf44 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1304,8 +1304,6 @@ static void arm_cpu_finalizefn(Object *obj)
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


