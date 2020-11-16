Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4225F2B4A91
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:18:08 +0100 (CET)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehCh-0007zk-8c
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Z-0008I9-BM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3W-0007o0-00
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:40 -0500
Received: by mail-wm1-x343.google.com with SMTP id s13so24083097wmh.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HNHlpd9eKe0R86UXf9IfUiC/GomRktWtpFHvObtXEPY=;
 b=myxplUlxZsKwkLLtVQ825Qc/NM8+sa+JHfNov/B+Xt66IVg1tqUw7EprGZ8167BCqs
 aCXiUJjY4SXPmOG9NGN6ovh9KYJeIBBEbY1fVUryPqwuF9Wud6RBLydwIwkWkbDKGnyl
 bIh8m18O7ASRzDv/bKBD7eSKqhtn9yO8nxxabxiDN1fg37uc9hONthHUAjSVNtv3upbu
 juMnKgNTLl7CFqx1Pd10xdRNa1Ii5in0d1z4HPWaf/hohj6K7IMYYhqQERc1XdP6IJpi
 g70U+yFb5xZW8mGoxv1QFLSVNPFN9zGNMHhZ9v4zBe2hpCMHZjngCUTuafYhF3yYjlkb
 EDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNHlpd9eKe0R86UXf9IfUiC/GomRktWtpFHvObtXEPY=;
 b=aBdZRigNKG0JX/iBapXf2kaByq15nusDYV8rBtgB91MtYRYkB+bpEK6T+x405oHVPm
 WEr+S+s/yQ8S1siks3DFN5b69689tBQT9SLeg7Mp7yAQy2DOC1O3gGU3EWzw5W5l+2dE
 DM+OaWpQkMz4ayNCJ/PsduDm/RLQo7dlr5TuDmX22YsNqtNEZc5g5LJnCKNm14n0mBGr
 ixk/Gsr4Uj8UQhBI+vettQNtSjOSRi+crfMKirF6mz585TjNq3f47fyTlCj9W9GZ+eRr
 /g+U6y6biR/42z6cNZChOTxmtNjQAeObgNN96W2ny2jbqjrk3cnapYtPp/c6UkR56Hh4
 JFVg==
X-Gm-Message-State: AOAM531FWoICzOw5/gtXnlwwXCKM1Lx0olutVifWGiDO9MA0CpvG6ani
 cZTTPWR355ExOxtk3BOcCCGIvTO2vB7Mtw==
X-Google-Smtp-Source: ABdhPJzAmSwPZjcsxltKL7cFxzT9/Oq/7x+fWv/lVMk7S20MD5BmIhAFrQIZW2JJqXxFTXMvErp8/g==
X-Received: by 2002:a1c:964d:: with SMTP id y74mr15793545wmd.129.1605542915755; 
 Mon, 16 Nov 2020 08:08:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/15] target/arm: Implement v8.1M PXN extension
Date: Mon, 16 Nov 2020 16:08:18 +0000
Message-Id: <20201116160831.31000-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In v8.1M the PXN architecture extension adds a new PXN bit to the
MPU_RLAR registers, which forbids execution of code in the region
from a privileged mode.

This is another feature which is just in the generic "in v8.1M" set
and has no ID register field indicating its presence.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df72..abc470d9f17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
 
         if (m_is_system_region(env, address)) {
             /* System space is always execute never */
@@ -11761,7 +11766,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
 
         *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn) {
+        if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
         /* We don't need to look the attribute up in the MAIR0/MAIR1
-- 
2.20.1


