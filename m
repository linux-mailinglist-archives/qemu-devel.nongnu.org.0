Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E638A3513D7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:45:23 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRupG-0003SN-Ux
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulI-00073u-Vb
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulG-0002NU-TM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so1704517otk.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=dpKvgMHTPSzyIKbJhiri2sFTjWxsjGFao1XKwc+U6eEhNSxfpoO7HhWzqAGch+d7TV
 /A9rsjXl4aHUH6N4zrjhhZof+Kd06pyFSVBpgNl+Lj/FmlZtMxEf5gMQtAKGPk8Jl0d8
 NREr0VOGv4u830hUNq18l0SWNdEWal6zrLckKCUzNWlCCSqWgXvyZ9yCEVOoixnlLZQl
 ocG1uyHZv4AVKqJyHTjqKH38Oh2HsRdXp0UlxyqtNkM9XrtfoBf3EFQLlfapItdUJojs
 q3MLJIHDhZAAZkLPab0eGzG37trWEDyO5+sRrEUVIRn9Sir/g5nhLjwrWpnXdVKeANZI
 b/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=BwapS4D2o5rQW+D3k+nB6GIzgp9vWCqe9iiyZZ4V9zWSLYbqP9HUxeo1gZ9AiBtOrv
 JQOl+kkZrJz7OHuYR1HcfdXvXs/RPNL+TM4Kr8jVUvqu7kI1A3s+BgO2FtqZqKjeEmr3
 A+WZSlbqHw++8VWQw9ZuUGPq1ie+ikZHQA6l8jz0dIfq0ilTwYBNEbJu7fjuN9rN5c4j
 jWtfEl/idD6fkagmTQCYbiNOMBiiZnYqurRZ0s0MNc11UEa7QSZtqvsPvgzVHoREg1Rx
 lKQWNSkoQmtNIj8d/X6U0a1KNwxrpzmaY/++BUl5vH9491EnA5pQLTDYG+pA0MKad+0K
 24vg==
X-Gm-Message-State: AOAM532cRCv5EKH5lOtHmkvPuYyY4tTDFx1BavbTk9Kvdd7Ir5+jfIff
 zstAx8F/uVmxmYYBOxE+hvD8iPZT4xz1CKA=
X-Google-Smtp-Source: ABdhPJy1B80o/sZrRHmvqhMGCvWUlBQfEw6N8pxa1uRjYJKoyXizTRH42UEsO2bk1dDCijmAghUpUw==
X-Received: by 2002:a9d:798a:: with SMTP id h10mr6297800otm.170.1617273673703; 
 Thu, 01 Apr 2021 03:41:13 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:13 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/6] target/arm/kvm: Add helper to detect el2 when using KVM
Date: Thu,  1 Apr 2021 10:40:54 +0000
Message-Id: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x32e.google.com
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


