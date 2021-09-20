Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17954128B8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:17:30 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRbN-0005u2-CO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6F-0003OV-LP
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6E-0001jz-6c
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so33569135wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naPHzWGP/6yDNY73WXVrE5ILIKRmkCw8JxXeNmytdeA=;
 b=qEU7DtBipdoVl7ow0AHc7m6ziI8W0+qT7r+IklWK5dj/zMJnLq94wQs1F3mduc/fuj
 EK4nlM29YXIomVtpwTYDwPycJH/c/PCqtGTBew+N0H8lgWwCU/NCYYZPzvxx6p8TsCQb
 dUC6IIaS2VvU+U4knMx7drgUZ3zbbG2HfLrO7JLJOfKdbFkY52JfvMH381kLm0IKjCqn
 TVI6nxEApLWza6/8b3RwmBGkZwrqyfiy7ZmG4jg3tRTPRD3rL37SfXI1WdJ9jFAywle2
 yAv0gYxRYvtzsAtEOQtbjNGFi3/nc/RKU7zrYWQCcJ1HW/dwzujmPB+k0z+OsYp/KMME
 uB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=naPHzWGP/6yDNY73WXVrE5ILIKRmkCw8JxXeNmytdeA=;
 b=PrXVrD4tpIY30a77ReIynRwb+HnNiL7p70E7wSaGBavTDgVQAgpVeyw2JHIIyBXW0E
 zkztlmdD0Lp4HsmABTTWiFmI89gyyfqneGnix0RwAPJC8s8yLvYaYpxkKf/RFt+vvtGz
 3jO8gpFX56zXa9Z980QvX0uO2uXkAUtHhjyxY5V+ZCLXv0xZLT/RKaO17GriFLCKUBIX
 DrDACZ68qJr6Lfu8ibt8Gbfjw4A8f+MEIVYt8M7k5Rqp8ESf77gQDg6MR30B1Upvbv+H
 q/qM2wat3dSpFf2rZEdGFdVs7qclTVtZXxlggwoF2+cxDZ21hm72TInchOZoDRtEkJIy
 ssSg==
X-Gm-Message-State: AOAM531N/UPpYKWegau+6Chpo4U5AFZi6rBIXbrFi3nE6PvwLpf2Bmrk
 GFmWgE66x/MeoSsDjUKC+Kmwc1MEB6A=
X-Google-Smtp-Source: ABdhPJyaYXH2NZetoujDi4+SAio4VhjxVTnNYQMcS7VanbwpAPfd0qMfOvD7PZ4LNDv4G9qxW80RBw==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr1154876wmh.48.1632174316700; 
 Mon, 20 Sep 2021 14:45:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z133sm845447wmc.45.2021.09.20.14.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/31] accel/kvm: Implement AccelOpsClass::has_work()
Date: Mon, 20 Sep 2021 23:44:22 +0200
Message-Id: <20210920214447.2998623-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement KVM has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c | 6 ++++++
 softmmu/cpus.c            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f5..6f4d5df3a0d 100644
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
index e59046ce39c..b22804c4193 100644
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
2.31.1


