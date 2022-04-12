Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCA4FC978
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:44:51 +0200 (CEST)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4eI-0001cw-ET
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TS-0001sN-9g
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TQ-0001q1-Ow
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so961918pjn.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8luVauhihyr0PwbhR6mFW3lQ8iZWOtf74oqGGDI3uYM=;
 b=SMDna9xJ/wEfmSYqkkoBDDM6t1ZYkikLVsXMS6cUMcErY080AmRZm3dYRZNuQJpKPN
 tW1IYRPRz4olbl8QY4iJwlv9KQz97qdx0GvJxHpgAP6y3Ei7TO0NgymWLrEvv+bgy6Go
 HKo5LvKxiQEPtue8a03vbHP+DuQbReJGwCrOd1s/pt+Fbkt2Wf8X3CMzcEnTkvunUJ3Z
 BKhkcGOXrQifL3FJLQYgnM0GfMPJRVtzrq0Rhi/QZVI8Au/XEFPtQg3atf2iDA+29BOZ
 5etx7vIMDPoHSaTBJhJ2jyKLH+KWY1e229PAg2bo+EeTUrsUvkm61Lfvd4jxJQ4WmXzP
 awAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8luVauhihyr0PwbhR6mFW3lQ8iZWOtf74oqGGDI3uYM=;
 b=GboVQvcx+THtREyy2CO6zGswu1F+XYLrdMO2hqjuMVA3BEgAt5UA//Ve6p6BdEOeH9
 zAzzFQnbRa7wdPgSC/x3xwFBL6pQlWd0BefVcrOCnt9y14fxu6NjSrdSBiamLz0bGopq
 IWlWxD6ALKgsQr3dVK0IzrygFbiqzAbORKBtDa4G8RVpsgzDgMvsIFu6UhbMyhHKiQud
 PfFvFI1EQgDpwlECTXQbBxT5UnLH7J6ZjQgi4AJXGSNM9cyYGMOpmpBuus3x8ZLdmveB
 hacvBuiGdANbUY0HjqEm4hqNpZ975xZG49Te7Bi/AHR63Cb72S+AoHW0eytUX3fw0m2T
 BklA==
X-Gm-Message-State: AOAM533kZG822UQ+veXJJqhr/tgX+PGqW51qbmfYmpHOR4chsQmYB47n
 NRZ1UgRAA7bqrBO5v6fpR7XJOTGcJjaODw==
X-Google-Smtp-Source: ABdhPJz6Iwm/ZIwgbFIBBLP3jx21pMF+CQUTAFLJB2rKbqh/F6XTwukREA/PQCQRXM05ekP1O6aF6A==
X-Received: by 2002:a17:902:70cc:b0:154:1cc8:9df8 with SMTP id
 l12-20020a17090270cc00b001541cc89df8mr35322752plt.32.1649723615480; 
 Mon, 11 Apr 2022 17:33:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Mon, 11 Apr 2022 17:33:10 -0700
Message-Id: <20220412003326.588530-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..6521f350f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1795,11 +1795,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1830,12 +1832,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


