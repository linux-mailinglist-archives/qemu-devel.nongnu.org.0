Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED754F9AA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:52:44 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DL1-0006O2-Nw
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHa-0003hP-BC
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHY-0008Ce-Bq
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBk6B+Bo0PfX83P4HlyD0NwaXmkNfrQ4M7ZS6wcjkwk=;
 b=QVa8pepOXOlYtn2pQYUCOSu3uK2p5oBjHzZGAkgmbI7ShCNhy8FGEexoR+UDCkyrMuswj6
 rS405sWaUK+1q5Utjy99CpsRO50U2dKlzYe95ZUvhWa0oY5lX+KQ4/AYkXG8NDviqF7kYB
 zN+cURbU4wa0wewaNpMUMF6lE838v2U=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-PfqqNHyQOtKxEZR7Y2WSfw-1; Fri, 17 Jun 2022 10:49:06 -0400
X-MC-Unique: PfqqNHyQOtKxEZR7Y2WSfw-1
Received: by mail-io1-f70.google.com with SMTP id
 i198-20020a6b3bcf000000b0066cf0d427daso821212ioa.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBk6B+Bo0PfX83P4HlyD0NwaXmkNfrQ4M7ZS6wcjkwk=;
 b=Vs3HZgI+6Iqsr6GXPgtsCE5mRNtsUpEGZJOjU49XUdly7AX1XXdgtJjOfohgl3dJK3
 WGPjQY5TWhMMHbpur+MSjMkLV2M4Pffrqsi89jWhyp16573OBmYOugyX+0OjV7i1qot4
 83Y/IdnRtaiPJM3kuRQuXAcUZ7T54yjLQYMCXeCCIxACGWGiSPx/suykQITrUCW5P7pG
 PJM5v7Tm07gN+c0eXAlE5p8fH5xUy/Q4YkeXh77YI0/2JreomND+egzhA3s0mCHc48ss
 uSD0cY/hkhXzYAoBWT7s/IuM4Ysf4CsUqzqa7ttZkjy5/Q+PxPadRC5ticuK1+S5pbs3
 Ts+g==
X-Gm-Message-State: AJIora+fQ7z+GO424iy6wCRKgyPX07P3WNsCVHYpajHDHakmtpgnANVc
 z8BxfQVfoK3gnEF3ZNQPRLZIvq2qxePQTGRHYDGky7A+3Ac6jXWAvcSqa+lKEYYJSjGBplzfOB/
 8kWlySW3NZhwTHIdYu3okOeBadZI4BYkMIslpU6Q4/lSwlZB3Kw6Q14xU5ZhDPcIn
X-Received: by 2002:a05:6e02:1b87:b0:2d6:5e74:217a with SMTP id
 h7-20020a056e021b8700b002d65e74217amr5846250ili.74.1655477345544; 
 Fri, 17 Jun 2022 07:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6yRIwVZ534mz7LIJewh/FPli5QiG3BeAdZA73rhJnm8g8dLaGUAwpm5Gpdbdj2/wIuX4D3w==
X-Received: by 2002:a05:6e02:1b87:b0:2d6:5e74:217a with SMTP id
 h7-20020a056e021b8700b002d65e74217amr5846227ili.74.1655477345236; 
 Fri, 17 Jun 2022 07:49:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.49.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:49:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 3/5] accel: Allow synchronize_post_init() to take an Error**
Date: Fri, 17 Jun 2022 10:48:55 -0400
Message-Id: <20220617144857.34189-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
References: <20220617144857.34189-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It allows accel->synchronize_post_init() hook to return an error upwards.
Add a new cpu_synchronize_post_init_full() for it, then let the existing
cpu_synchronize_post_init() to call it with errp==NULL.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/hvf/hvf-accel-ops.c     |  2 +-
 accel/kvm/kvm-all.c           |  2 +-
 include/sysemu/accel-ops.h    |  2 +-
 include/sysemu/hw_accel.h     |  1 +
 softmmu/cpus.c                | 10 ++++++++--
 stubs/cpu-synchronize-state.c |  3 +++
 target/i386/hax/hax-all.c     |  2 +-
 target/i386/nvmm/nvmm-all.c   |  2 +-
 target/i386/whpx/whpx-all.c   |  2 +-
 9 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..dec4446264 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -228,7 +228,7 @@ static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
-static void hvf_cpu_synchronize_post_init(CPUState *cpu)
+static void hvf_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ba3210b1c1..df4f7c98f3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2777,7 +2777,7 @@ static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
     cpu->vcpu_dirty = false;
 }
 
-void kvm_cpu_synchronize_post_init(CPUState *cpu)
+void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index a0572ea87a..7e526d3c65 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -35,7 +35,7 @@ struct AccelOpsClass {
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
     void (*synchronize_post_reset)(CPUState *cpu);
-    void (*synchronize_post_init)(CPUState *cpu);
+    void (*synchronize_post_init)(CPUState *cpu, Error **errp);
     void (*synchronize_state)(CPUState *cpu);
     void (*synchronize_pre_loadvm)(CPUState *cpu);
     void (*synchronize_pre_resume)(bool step_pending);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 22903a55f7..3ee3508411 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -21,6 +21,7 @@
 void cpu_synchronize_state(CPUState *cpu);
 void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 898363a1d0..464c06201c 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -178,13 +178,19 @@ void cpu_synchronize_post_reset(CPUState *cpu)
     }
 }
 
-void cpu_synchronize_post_init(CPUState *cpu)
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp)
 {
     if (cpus_accel->synchronize_post_init) {
-        cpus_accel->synchronize_post_init(cpu);
+        cpus_accel->synchronize_post_init(cpu, errp);
     }
 }
 
+void cpu_synchronize_post_init(CPUState *cpu)
+{
+    /* errp=NULL means we won't capture any error */
+    cpu_synchronize_post_init_full(cpu, NULL);
+}
+
 void cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
     if (cpus_accel->synchronize_pre_loadvm) {
diff --git a/stubs/cpu-synchronize-state.c b/stubs/cpu-synchronize-state.c
index d9211da66c..6d2c9f509a 100644
--- a/stubs/cpu-synchronize-state.c
+++ b/stubs/cpu-synchronize-state.c
@@ -7,3 +7,6 @@ void cpu_synchronize_state(CPUState *cpu)
 void cpu_synchronize_post_init(CPUState *cpu)
 {
 }
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp)
+{
+}
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index b185ee8de4..782d83b531 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -651,7 +651,7 @@ static void do_hax_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
     cpu->vcpu_dirty = false;
 }
 
-void hax_cpu_synchronize_post_init(CPUState *cpu)
+void hax_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_hax_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b75738ee9c..f429e940af 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -869,7 +869,7 @@ void nvmm_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_nvmm_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-void nvmm_cpu_synchronize_post_init(CPUState *cpu)
+void nvmm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_nvmm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..09bf5681ce 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2123,7 +2123,7 @@ void whpx_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_whpx_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-void whpx_cpu_synchronize_post_init(CPUState *cpu)
+void whpx_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_whpx_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
-- 
2.32.0


