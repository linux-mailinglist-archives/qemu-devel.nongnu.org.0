Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA92DAC68
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:54:15 +0100 (CET)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8uE-0005lq-53
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078W-D5
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8oq-00014j-Il
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:45 -0500
Received: by mail-pg1-x543.google.com with SMTP id v29so15049336pgk.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48nQ9C7mNUNm7fcDy7YOroFTjMlVNdui5r8V9Y1adoE=;
 b=TWzhIVOVFiclMjJ0AK4R9YfoK/cvtep4fIYw2IeqRqXR9906Ifmlw/gzXUZa8mTrNR
 t7Z2y3ea6qCvlUV0mVInvT1PzU1o2RD0+4flVcSOBsCR+8YvADt7aUpYh6GxP42NFSBB
 XiX60b/rW6yLzIAXpU/CZVeOWU3PYmMfwyTqlNobRZegDBgwK4jiwS7ytAze40y3qZKE
 /Uw/vp/a8lyC5cN5SzqXRES5l/pQ8gjhqfmWgg90dgQ2vsAXaI89yK8QH9F450+TpR35
 Crek5aFVzeSca7f8ydm27h3kRIF9QKwk0vZmll0aiQ3mfAurEGGHQbGNKuf1J3cuK5RK
 ZGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48nQ9C7mNUNm7fcDy7YOroFTjMlVNdui5r8V9Y1adoE=;
 b=ARW2fWHz+W8AUvrq/I6LiGfFAhUyK5WNW4oIas8Od4Cn17vDwJoya5sU5Op8z/KRWI
 dcgfjXp+Surh6CdJguaoE8IPPdHlGCcHf35oL56wZQMcS+WAfs3JybRnFlW38oRqdSrL
 ovcXFs3oLYaRi2/K7BTiY1K0Eg17kGXnfCzX48GxlMqUDMjPoYj/aK60ZLB9VyIZ35nL
 T6X3T80vpcOVZUPHyRBT+2aqS6UKhew3I+w1fM578haAXp2Q/5w4g4DflX2KFZysGc7a
 uVkgMe/wTAh7oWvkNFo+BpllpoElkj8r+tyErUGVXUKb6W8XK17PyQd4yf76kocv6Yde
 zilw==
X-Gm-Message-State: AOAM533r8jRXL35TrPzKngfhOIgwsYfCfZVksV+xjqhuMEQr8V+kNnVU
 vID+RdafZtKuAhJwTGTomdpHNw==
X-Google-Smtp-Source: ABdhPJwHUncXSMCwLaVM2PWtD83XkR393IDuJLUCIZERTmfS78PhrUrGgg2c8BO1MwWhchyRlCCkyA==
X-Received: by 2002:a63:f849:: with SMTP id v9mr28754208pgj.247.1608032918783; 
 Tue, 15 Dec 2020 03:48:38 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:38 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/5] target/arm: make ARMCPU.clidr 64-bit
Date: Tue, 15 Dec 2020 11:48:25 +0000
Message-Id: <20201215114828.18076-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x543.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e3cf77ec7..fadd1a47df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1


