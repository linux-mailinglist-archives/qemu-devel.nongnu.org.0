Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7E3514F3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:57:59 +0200 (CEST)
Received: from localhost ([::1]:57914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwta-0003bk-Cy
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrY-0001hN-9e
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:52 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrW-0002yI-9a
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:51 -0400
Received: by mail-oi1-x232.google.com with SMTP id v25so1670603oic.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=KLY2oOlZTJhTWb3UIrY7e18uqGaEK2xvaLysjy7MJtXDUs070MMjii5B4pBurCYFB9
 qySEVXiBaIzM0zCr1wF5LRLFklKjryKdF4V+Ug1skqIkv8ikHCHm+kZ5tpmWtdi5UGu2
 /97WcZu7SwcIDTJ9VvhwmCa4kSEfeYP9+39Ih4ic7s689TE6ePHfbRFrhhF6w6lgZUkI
 ZLw+KHl7q9hCrNC0agH+YU+Yts7W4j2ihJVWC4h/P2XxEFxRwJdARNVx+zRc61IRYOMr
 5pYDPuQG8slq6+QpGrJpgfKnqoe9JhyDu/ob63LNibEFpMHwzlMII2tepurVV8KyYQge
 lNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=nGCtI3msWmXxwvdY8+8rzQYRV/wqyuhKiZwNJQo9l73SZImH8u4zJyriTI9jmq3bQG
 hUAyEFEqt3pmmzsa7WyP8/C6zHFfX92ad9wBb+15ngypOFeC+Ogs7gWB7eQ5/4YjrZ2H
 P+nF9asVpsgmt2lvO11g4vsL/AyNo7n2KND76nHaBNVWyjUvd0Ml3G4L0FgRny2Ff6OE
 HDGaGYmrJc8dBHrHPg2olfjgieiek6nyGidbjI+oCmbf+P3KzW5gAg7h9FQbLLJRFv3z
 9dtT64d+gzLLisPGy1Q8PLG7NpH7GWoN7gdtTmSKKl1CWtmXPyaFSRqE4ddMAdkYR/nf
 E5MQ==
X-Gm-Message-State: AOAM532IRfY/zMEB2By2l8oeWSXinszyUTC9QZhXmHd6Mf3Gp6ufGxM9
 qyN3gQlFy8bZldUwyEd7cqEGF5KI6SibTyg=
X-Google-Smtp-Source: ABdhPJyzuCI+gtU+a8SwPXa6zfIX3j+QFNSdGzYLeTURExLel2W4Zy/HnPcWvTa9wo31FcGnxAkNhA==
X-Received: by 2002:aca:d514:: with SMTP id m20mr5850356oig.47.1617281749029; 
 Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:48 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 2/6] target/arm/kvm: Add helper to detect el2 when
 using KVM
Date: Thu,  1 Apr 2021 12:55:34 +0000
Message-Id: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x232.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..9cacaf2eb8 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -721,6 +721,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_el2_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..7d7fc7981b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -285,6 +285,14 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_el2_supported:
+ *
+ * Returns: true if KVM can enable el2(nested virtualization)
+ * and false otherwise.
+ */
+bool kvm_arm_el2_supported(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -398,6 +406,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_el2_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.17.1


