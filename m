Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AB5905BF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:22:52 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBtT-00046C-3u
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnI-0006pM-VI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0000uW-52
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l4so22016496wrm.13
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=xIpHKKN+tPPlk9zHLorB4jiMN60VN0Gc9hDUeByyUhY=;
 b=ESIKAthsjp+1hELU+BXHhSyiHuRJmO327ujRsD5l6uq1uRK4pkjG4CekhvJEMBCwOO
 dYwPD5OXTHf3THJ3qJe5NNRz1X2K4O1GnDo1HlcMMDc4VdlmjO0ZeOgkfYz7WbCci3XR
 26XzTGl1q/etsn2E5Q0P8xiNek6/Jhi3KbChpG08hkW4ZnBcP+EPsnZ3EXbSOqn5W+Ib
 ex5N3IMReBhGcqlQ7IDm2JKEwpSqIHtP9LAFe9Ikl+7feOTNsk+RTtKEKsheiE7OZYz/
 MvUSa0JAnqY2MKFYpIfC0AN3/8rQbkHjXJora/aJdlrIPAkpWIpTWOY+5MnqAa6e0YKS
 X7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=xIpHKKN+tPPlk9zHLorB4jiMN60VN0Gc9hDUeByyUhY=;
 b=ixmY2eLHIjuAYHr5bpZkuMGBro2kb9p6+QHQw36D50x9vZQoFCJJZLAqKBKTzXSmKo
 3SROfJr0QKjvgJnrTHCEptpHHtkokPt4CVQTeRtGMotLcf7UfGGej9osO2FtCP2mpq9Z
 cnq6QeA+dVNsaDsD8dOt/lCcqtJaJ+r2ma2VctfWRHep1aGalL+ZDe3B+Gp/41uavoqa
 eHnoAoUKVc9VKUa7iaB3NXsXp4bvo0+7wcSwX7dkV4oRUlr3EJJ9mHAIJnaFaPuV+OOP
 uMLGtUjUGbCA2+nX9NZCKuCbZEeRh5INIUr6vkJEL7B4lqUp4G8sMFTHK5JUb87dn8Qd
 /LLQ==
X-Gm-Message-State: ACgBeo1ZIpBzYGgTAUmMxh+h4MCjiMk38lGnLqzar8pUBqzlEYIrW5t/
 /qnoV9Pl6kIGCBA05BRjwvaauibSNypelQ==
X-Google-Smtp-Source: AA6agR7HIO5ssJURkbr53eWKJHoNPSAsJXxQE00bRtH2JgE8o5LBlO7opZSFn93DnrldbEX/z3t7YA==
X-Received: by 2002:a05:6000:1379:b0:21f:c4d:957a with SMTP id
 q25-20020a056000137900b0021f0c4d957amr36011wrz.210.1660238185410; 
 Thu, 11 Aug 2022 10:16:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Date: Thu, 11 Aug 2022 18:16:14 +0100
Message-Id: <20220811171619.1154755-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic in pmu_counter_enabled() for handling the 'prohibit event
counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
that assumes that EL2 is never Secure.  This used to be true, but the
architecture now permits Secure EL2, and QEMU can emulate this.

Refactor the prohibit logic so that we effectively OR together
the various prohibit bits when they apply, rather than trying to
construct an if-else ladder where any particular state of the CPU
ends up in exactly one branch of the ladder.

This fixes the Secure EL2 case and also is a better structure for
adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 41def52cf7b..434885d024a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     uint64_t filter;
     bool e, p, u, nsk, nsu, nsh, m;
-    bool enabled, prohibited, filtered;
+    bool enabled, prohibited = false, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
     uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
@@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
-    if (!secure) {
-        if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = mdcr_el2 & MDCR_HPMD;
-        } else {
-            prohibited = false;
-        }
-    } else {
-        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
-           !(env->cp15.mdcr_el3 & MDCR_SPME);
+    /* Is event counting prohibited? */
+    if (el == 2 && (counter < hpmn || counter == 31)) {
+        prohibited = mdcr_el2 & MDCR_HPMD;
+    }
+    if (secure) {
+        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
     if (prohibited && counter == 31) {
-- 
2.25.1


