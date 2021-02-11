Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC0318C3C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:41:04 +0100 (CET)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACDP-0007gs-H6
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZQ-0008Ve-0I
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZF-00007H-Jm
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id g10so4124694wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KWSycCSx4+GuKx3YydDF8ApKFvT897T9h34Lsj16JAU=;
 b=XcaxXpSK5sCGx8njMBxe1++Z56ssR4g+hFV3EgdGzm4YMBrxo9qrPCguCPrKrKrZem
 /WViudHEAxyCcg4RRpM7uKOvYYNOzMo0TOFoF5gJREYgyQXabZC8cWgUIrSfO4Q9MxpR
 Y570xkOKJJo/gmkTxQ2P35VDcjHwY8IcRdg5yMYGirh+Ju/zygzBCbdWPubG1NaAdvr7
 tenRAcDNMW7flQkihJIwsKAmXBcTtf2ablz5ucXKms0N62FNewD9sIFhc5V1kVsB9afZ
 hZ8R+Muw95q/2L1OEupLq7sSvXRTpKw96qzETO2z2lYcvJ1Mf32YlViqmD2uvXWid+8+
 nEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KWSycCSx4+GuKx3YydDF8ApKFvT897T9h34Lsj16JAU=;
 b=Y2kbvBLJ86QDE60zp0CiHgrRYZ1J+dmnC6wo5G9kbqg2r+tTxhWmlFsYQzngHK2K9h
 BGVY2sr7urnXRBjfGh/s34/q+FOz501PYcqwEYi+IJorIa/FQTwACsB4prb5+QRYw4Qm
 E/Eu6aZXa1EYixtn04F6wbpfdS6PfzuiXKSPcYKMBjklKW5XCHZsQYhB/CYQ1cUuDWcM
 nKBAp9yT3ewWZb02PhsDwKX7A/nT8DbiAeiva63u82N3LC373WNkD69zEAij/Nf1EF/o
 S42vbruBkXJAC3XzRPtthj0A5HqtF2zjSmr9ee+mTmhfKP/T64nfTwDLuWC/o9sQmXhC
 N/eQ==
X-Gm-Message-State: AOAM530TiV2wd86Lge6tmWBNBC8IQZ6SAf/9ehXhZScUTI3nImzcQ7Xj
 omz4W4TDAuZUbbfTa8C75elIOLvd+DSTwg==
X-Google-Smtp-Source: ABdhPJxJsa65pO/n/FouY6xX5qz2wjpQaT2VPGr+WNVHJsm9JI55ogU+jzIG0NN+BnBNUWNsrNjt1g==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr5400483wrt.324.1613048371853; 
 Thu, 11 Feb 2021 04:59:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/45] target/arm: Enable MTE for user-only
Date: Thu, 11 Feb 2021 12:58:54 +0000
Message-Id: <20210211125900.22777-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 70cfcbc9181..b8bc89e71fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.20.1


