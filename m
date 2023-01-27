Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAAF67E94F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSe-0006R2-OT; Fri, 27 Jan 2023 10:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSR-0006JG-Jx
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:06 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSP-0007hE-N0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5643794wmb.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkDTo9H45EkE/zEGKHtV2OQbE8kpvF6cvdXdghq8wmc=;
 b=AWULx+A5moZZHjX8vWgLG6/vAvORIoPn4ngk0GqgF6O9FD5pP0CBhLp7t1TPo89RS6
 YpvfBcViJjipEe8K8EbJbm0PG4IU8GuXn/57BCx3mTfle77khlq17bXKjRwg+6Xxem9x
 KQ8WlHElNlF7s9t66GH7jPQtob2cG+8QLU12CwVGOqjf4WDeJdiZYsfs6HTaVGMj/QoY
 +96FwmPsFknadXJXPefvyfDsQuOBmT70obTHDYzPER9ShO1jSbdE+CldG2Nr0+yvxdgL
 6SiO8+CYiKMsg5eL2xW/mmbdjfQGCCpgW4rfIXyXMFe9y5Ct7lRHUNCcbD745N6aIUEF
 o+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkDTo9H45EkE/zEGKHtV2OQbE8kpvF6cvdXdghq8wmc=;
 b=3OfBfKviJx9qiGwETC3csIq/mvyKVOY5h5paa2QDe3jm2heRqPfGvilozfwfEpFvzd
 SP1txbJPSBnlOKApV2mZflNv5XwzIm311dUeO5qpc2y2ndr74b0yX4riMu/RlVxh1LVq
 HyGDiKV/huUJnlP7iLDnuxULlKDr8UHVIrEK46GCLeN3KDUoQHgZAA3pqxa4WSh/94Iu
 ijLmjOePC6O8wGOSnfaVZpUCb6hJDFhMj4nh4G2ue+oCy1W724TSG6ey77x4UTjMK0hK
 Mv0U6Z48dvPjsTDmWdC0NHmCGLp9ma1x7Nuphz7jqMTiiBRNYStnFtO3UxoC69WqtUK1
 qA+Q==
X-Gm-Message-State: AFqh2komX/YA7VPSCYJpBOZhYS5/Rg415B38yz0A5gStTho/6EZYLob0
 2xHCfp/DfL+DHwC5/h5WKkWSzw==
X-Google-Smtp-Source: AMrXdXuMpq4rynySX5uXo7SHUNT7onAQa8XisQTwXFy1C1rAWz1KY7cjILStBYd4otmaPbgHS0LHwQ==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr36209817wmq.7.1674832560032; 
 Fri, 27 Jan 2023 07:16:00 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 05/16] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Fri, 27 Jan 2023 15:07:18 +0000
Message-Id: <20230127150727.612594-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The confidential guest support in KVM limits the number of registers
that we can read and write. Split the get/put_registers function to
prepare for it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm64.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..55191496f3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1080,7 +1080,7 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, int level)
+static int kvm_arm_put_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
     uint64_t val;
@@ -1200,6 +1200,19 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_put_core_regs(cs);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -1293,7 +1306,7 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs)
+static int kvm_arm_get_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
     uint64_t val;
@@ -1413,6 +1426,19 @@ int kvm_arch_get_registers(CPUState *cs)
     }
     vfp_set_fpcr(env, fpr);
 
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_get_core_regs(cs);
+    if (ret) {
+        return ret;
+    }
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.39.0


