Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13840DE40
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:38:44 +0200 (CEST)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtTH-0005Ty-Er
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLQ-0001F0-C6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLM-0002PL-N3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v2so4089174plp.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OAb8lar0gsn2p9u8wn1vUp6jj9gu5rLadFKsG/mZhGI=;
 b=iCf6s4eRJxBD75pQDp5vtzub8JQjh60bfdnsaGVpJK7PcJdEUQTLvFi/DRrqeCJEil
 gS61h9B+cCwm+NPCf/XAo6Tw1dU8Hph2STqVGRWJIAckocH7YhUUE5xovXgwi4KHY6s0
 rgVBDUUZqErL+Ep1Drji3w52L53FGhnjjJgqHvxqaMJo802wYypk97n+ck6ChhnujcmD
 cXzt8/n+ifZokIvO5cjXgdJCUhb0nruc6gLMNegT/3+nc6ooAvvlClTgsKH8PE7Wkgkl
 1qHeJkpiKpuw4YzU8XXr4SW9vOzm4NqvFAl54ruFQQfiMmykOYpW1iBR9l4bQTRx9pnl
 d8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OAb8lar0gsn2p9u8wn1vUp6jj9gu5rLadFKsG/mZhGI=;
 b=CzGo15JYpzbQvQQ7EXdgbWjHKXAQJpTFIwWGMO4+uoQuv+M3y5wNdjuelm4MvKTdu7
 OqgSnQUnBAIiXqANhKdGyKr+bZGfMJ502xVElbhkb1d+b61lFwc7yKkMRgsRwypXi0Pp
 YhtXrM8AaUuT4yJbfJ6o7vTNSRTLvJyP+QGye0wppMQLRfuLQF1EYGYSkfeNsSnYN39g
 rZNH6sDYG6X9alRlTiMxjNDEV7gMicDEkZUlcBejmfzh+AUYaQjjNgz/M6R2GDvmxOjw
 D/28x4Yoj2nNjuIgsrdYe4wLHy1Pcxiaftdzic6Mg7S40gDq40WHAVA3+riREuiT02JY
 G3KQ==
X-Gm-Message-State: AOAM531leo+zbGwVGTtk5rtLJ9NXx2ASab5TK6msR44Si/u5Zqx7X5iS
 XtBM+sW39k50ezYnde/q7TEkLUwTHrM96Q==
X-Google-Smtp-Source: ABdhPJxmcH+5vY+dSSBpzzXiKyIFFuVf50wnDJuTddffSr+CwGjroYOGRdKiVn6wrr5yc9agFZcu0A==
X-Received: by 2002:a17:90a:1950:: with SMTP id
 16mr6530482pjh.126.1631806230214; 
 Thu, 16 Sep 2021 08:30:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/35] accel/kvm: Implement AccelOpsClass::has_work()
Date: Thu, 16 Sep 2021 08:29:56 -0700
Message-Id: <20210916153025.1944763-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Implement KVM has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-accel-ops.c | 6 ++++++
 softmmu/cpus.c            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f..6f4d5df3a0 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,6 +74,11 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool kvm_cpu_has_work(CPUState *cpu)
+{
+    return kvm_halt_in_kernel();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -83,6 +88,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->has_work = kvm_cpu_has_work;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 2a61dfd628..3db7bd4eb4 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -90,7 +90,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
         return true;
     }
     if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
+        whpx_apic_in_platform()) {
         return false;
     }
     return true;
-- 
2.25.1


