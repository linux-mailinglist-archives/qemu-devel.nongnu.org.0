Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0E2E01A1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:47:10 +0100 (CET)
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krS5F-0008Pl-GR
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krS2k-0007NV-GB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:44:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krS2g-0006ad-J6
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:44:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id j1so6228319pld.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFR4LkcV43greGLnWx7eNWSmox/r3dl6y5PTWjbtTPg=;
 b=hxGWhDy7899hHSeIFK+aVGTMkOtzpIx5Tm5LbysqMYcY6ANmPEWqPQmzgsbspeIqjg
 8xiMcjC2nqutoduOmSrDbrY1q54nFxgRuV5HqcaN7HzH25UsTeOhyfk1NoFoDsCDP/h3
 vjSuHIJxZ5gc3nYMszPfuPi49wf1yDG7ecTQsXqGcgn7hgt2DVJ+2dAFNtU73MV51L+B
 L9RLdGL/P1nBANbGl67TpbOo1tIettHVXP+4bu6bBHAPkHAFLsei5PpDqzrclLoxWPhI
 t5cUwg93a0iGOpmI4JiDFOfkKkOWzdxUmq34K5YI2XXLFDGvKrM6d8daO2/5Dhh5Q+N7
 obBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFR4LkcV43greGLnWx7eNWSmox/r3dl6y5PTWjbtTPg=;
 b=l1MED1R7HNSrjAehwbNWAPkLfObv/Iqv2GH3tA8005T7A7U2ZYlFUGFBgkNqihUith
 KxzXORkfiQL0wfy+NF6JWmH0miYWyFcFPh5fWpM/4XqU+aDl9qHAvi4d6GOgkJWoDYYG
 +e5ZjNTA6khSCs5wkVKVZlW+Rq746BHDHMW34GD1cgi0NAdAho+QprQ3yS30wvYNWEip
 5sgxOQlHmfNBOVBsGYS38uV0LI7QGrfc522lCbHd3iSuCA0MnbJvHujcXRSDTiY9SCOZ
 8p4WJn9O2bAG+B1H+7P/t+dVEFHa3dx1ZC3pGX+nVOGKBGhfQgOxUoIfkDKStRRe2CEP
 pAUA==
X-Gm-Message-State: AOAM532Ft+CyFy8rrosglFdPCYmkIt8k7MmBGrhiLtulq9u6eEe/XWfg
 Ds6kYMC/lZe2mRY2aR8S6kzZtWigp9nXDg==
X-Google-Smtp-Source: ABdhPJwxWhOdIMY7T4mLIYAquxgOgZoERKpfVMqYUx8d2/rdkV2WI7z5cl21FCkNgEg4YgUX88p1Kw==
X-Received: by 2002:a17:902:7e85:b029:da:726a:3a4f with SMTP id
 z5-20020a1709027e85b02900da726a3a4fmr17979643pla.65.1608583468373; 
 Mon, 21 Dec 2020 12:44:28 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id n5sm16704270pgm.29.2020.12.21.12.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 12:44:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix MTE0_ACTIVE
Date: Mon, 21 Dec 2020 12:44:26 -0800
Message-Id: <20201221204426.88514-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, pcc@google.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 50244cc76abc we updated mte_check_fail to match the ARM
pseudocode, using the correct EL to select the TCF field.
But we failed to update MTE0_ACTIVE the same way, which led
to g_assert_not_reached().

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1907137
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd6903..4597081d5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12932,7 +12932,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF0)
+            && (sctlr & SCTLR_TCF)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
         }
-- 
2.25.1


