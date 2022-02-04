Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E64A9D82
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:15:04 +0100 (CET)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2Ap-0004Qe-D5
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002y5-Lt
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::431] (port=45626
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rr-0003Cg-Hk
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so12416793wrg.12
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3lEtc5flDNZqu3pjs5Zh2F0vIL0PpXE6vU56vUELAY=;
 b=qMiNaxDCdLYY+0bp2GFATzDbwVh9oh4no7rnM4RUGCQf9bqIOrLdiRabeI7iSA6RUY
 l21pkwzUHwxks9whV8LWWGDO/mcW94f7WkW+cG4ny82IFsweX6il0f3ZiuJfAQzgUQ25
 rSyK1QNlCgao38UCh55GmWx3KuSjJwjD48EWkm8CBirFdgnIbglwbe1PVLjLM8gj7BjN
 L80gq5T8/4chIVC4iG7wYcMvgZGOaokWygDxKeOrBhWHEPVObG9to7eqNuVW+FrVkuWr
 oPy63lppSGJEbzQHJUG0gynqExMBsU0PpmtLS+vNFYA+RK5DN27xKyrIA5uk/OTo/2BX
 mCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3lEtc5flDNZqu3pjs5Zh2F0vIL0PpXE6vU56vUELAY=;
 b=Pqg2GmfaTEJI0gmKME388shhda8fBK/4ECeUjPABk+RzPHFPxsqjc4SOqX8dMYD486
 KRvRI+SOCMSPOYXLjt+zQPz0AhWHeePeHKegCR+naXPV7+qdohqkXlBOP7jSNvH2kNg0
 kV29BPmKrIuWf8tTsk9P/ObgGWyn2cDKU3f9P77Iz4PnrNwlGwmGghRKIQ/PSfmtDt4B
 LbXJlk3wsLCJU1gjaDkvZh4dznjPAXw63gOpOPaprDq7oLHigV+PFUhUcYmE/p7j1KYg
 HRlMRVC9RRhbtwJBZ48hR6hJf+DQomOqPoLtlGrtANQZAlpzZTH4+7uWL1XbaU+v+cy6
 0aXw==
X-Gm-Message-State: AOAM5337Z5cjaUr7JbxdhkGYfFRQwSpd9QaZNr5w5Qux4DMP/56sKS6B
 jgdeLNYBZz/uS/9dYnI4onJ/N8vluEBbKQ==
X-Google-Smtp-Source: ABdhPJyQstj8oRcDwEAVwouyYWZJxElRo5/9RBuWGS5PJHlDTUXbuzOF3Psb7TehPAaE0zmXrvg52w==
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr3204888wri.218.1643993710666; 
 Fri, 04 Feb 2022 08:55:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Make KVM -cpu max exactly like -cpu host
Date: Fri,  4 Feb 2022 16:55:03 +0000
Message-Id: <20220204165506.2846058-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently for KVM the intention is that '-cpu max' and '-cpu host'
are the same thing, but because we did this with two separate
pieces of code they have got a little bit out of sync. Specifically,
'max' has a 'sve-max-vq' property, and 'host' does not.

Bring the two together by having the initfn for 'max' actually
call the initfn for 'host'. This will result in 'max' no longer
exposing the 'sve-max-vq' property when using KVM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 590ac562714..ae2e431247f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,22 +682,22 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void aarch64_host_initfn(Object *obj)
 {
+#if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
     }
-#else
+#elif defined(CONFIG_HVF)
+    ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
+#else
+    g_assert_not_reached();
 #endif
 }
-#endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
@@ -709,7 +709,9 @@ static void aarch64_max_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     if (kvm_enabled()) {
-        kvm_arm_set_cpu_features_from_host(cpu);
+        /* With KVM, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
     } else {
         uint64_t t;
         uint32_t u;
-- 
2.25.1


