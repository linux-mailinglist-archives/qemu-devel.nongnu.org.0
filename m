Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775C516249
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:46:58 +0200 (CEST)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3M9-0004QJ-L6
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tz-0006uT-DZ
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tx-0001Lv-I7
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id c23so10322309plo.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=zo8ZOnOYe5x9TL0vqrWTngMo2610HN43KkwZyAQqNw1bl4HYNcCJDbapL1zhZ9shcT
 Tsop9dpNFpkv4HTNodpBjvK39L5gmYUCh/5ftEYPcJT13BOVFBK/FtUmvNviBYDSmRDV
 vNa0akZX4UUY8eWFs/fKqUV7cfVkukI5TFoCBbgep2EF8z7DQFhch0Ha4vHhEyH6jVQm
 wDWxn6F4u5OP7DbR4iaCyJ6F9SGcejsJw0ZVSUkIrGGI3vwcZzZjzaDv7IReD03iYrr5
 NwggZQsyzoPHVRY0+1kVQi2mc8G+eQ5PeugmQSeNvRvVyd95sQS5DpUwYAE5C9kz2hCD
 6v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=ju7hBE7wFCIcJtlEcRC62hl/eALCBXq7p6MZicKsUxTOTuux1RuaraxUVSYzeO5TbE
 VzN1/Z2wMz7aHzBlmFauSsFYzJakW0Jwp0LELyHYJ2MnOIBpwqnnISr8mGFAHtBF8x51
 oG71ipY+fxbxzjfBUTTrwZPX52kqlVcW2fp183w5Hq6HzyvAxyv714KYsWSiwE3QVjRk
 2ffyq9LkjbTivK3vYZDtiaNvktnZSdBkXzPEqovZ5JfsaaRjSqJci98AlOY28IUlihJ7
 T6R/bGgMG3z3oMAOQXQoKviu8VigYuEaGNvatHeQyF8jguB0ohsioyQ0IJ0pTKfZ+wbt
 7vpA==
X-Gm-Message-State: AOAM533MUB+ogIpjkdfndKj1GMZWp/96HSbL7iEv+NYZiDmz7gGXSMnZ
 2AxbmstCJ4wEs7f+QmdEuiK2h7FOLcyhfg==
X-Google-Smtp-Source: ABdhPJzjKzWlXwDCaqZVPs7eGKpHQRQLBuw6JCjicGssQlyNUYfrsr67fUrx3xz4ZQatkpocb6ADJg==
X-Received: by 2002:a17:90a:884:b0:1d9:531c:9cd6 with SMTP id
 v4-20020a17090a088400b001d9531c9cd6mr6907382pjc.211.1651384256275; 
 Sat, 30 Apr 2022 22:50:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/45] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Sat, 30 Apr 2022 22:50:09 -0700
Message-Id: <20220501055028.646596-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1


