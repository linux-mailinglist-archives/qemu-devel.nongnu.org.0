Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACA4CEBA7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:12:09 +0100 (CET)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqgC-00082Q-C6
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:12:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVX-0000mu-Gt
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:07 -0500
Received: from [2a00:1450:4864:20::32c] (port=42847
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVU-0003vu-WE
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso7759073wmr.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwXjzSzsl8TDGlKONbb5aSOhR7jvYd4YRdrKNrb6iSw=;
 b=FxnNu7NLPeg1OgnE6k/7ZQEup0+z5Ji/e6J246HMimjVB7GZnvc9P5jvjYlJx3+a5c
 wvDq/hYWm/ZJ9xbfbYEviaIHPpUijwubMyXHlk1NCM1g3tXSvbpI2c76/6VEIEJWayLR
 VW+VHPzXKHb7uXahIB3Vy3R7b/mR/15qoe8QsbDepG4rIbASd2bBc8nuakp/HU1Vxc0i
 hikfhSIhR/zb005LLblK8lZ1M8u6j964/CPf1OT6804A9WP6yy0PTOI24cL/v6wTVHdh
 /GH/Ur0iOA2hfmKLwAdSLv/Ljc42v1f2w/SQECESoRGXiWhWG+KKSzH1ZxXDTgmty4lz
 ciMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwXjzSzsl8TDGlKONbb5aSOhR7jvYd4YRdrKNrb6iSw=;
 b=JaymApvm1/8FiF2BK16EG3StP1whzYZBucwbKdn7TAodLkUVmQazasFiBG+7OrdxJh
 JZPYJP++SQBG5gHHesRdok5lXgSJM0+tKisyL7dhNCMUuoIGNoBN6ZYThnAtSgNowrqn
 tji0YQUolXrPuP5Pg9B3ZmKx/UwHXNAIRXkJwdRMmmWRTpYGcNEiNWGMtzirpgvyUybV
 y+0cSSr1PFkFGAkl2XkHCDU+NuRTJOQerqeR1uYXQ2ba9OD/zlgEn6A2UaQXgfPRS4oS
 jvZEu4U5183r0ziBGjBGiqOOrlb4U5KbMIabk0JaIdKKaEUlVquO18J6Bd9dJqmZbONj
 6rwA==
X-Gm-Message-State: AOAM532wIAUWdRQjiGmRaUzaYtsfa7j3ukSESKBgmAdm4ZEQQb435d2u
 EH/zU+Y77G56B3VOKFuMZwIYev6d2yg=
X-Google-Smtp-Source: ABdhPJxQ6eGy2jX85GPDbrSbIFNDp0qX7AeWkZ2RtWCZvB8wuIdI6KO/dtUgivXX+mLAtCtQR4w17g==
X-Received: by 2002:a05:600c:22c9:b0:381:3b27:89be with SMTP id
 9-20020a05600c22c900b003813b2789bemr5671890wmg.83.1646571662127; 
 Sun, 06 Mar 2022 05:01:02 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 k13-20020a7bc40d000000b00381890032dfsm15786591wmi.1.2022.03.06.05.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] accel: Introduce AccelOpsClass::cpus_are_resettable()
Date: Sun,  6 Mar 2022 13:59:38 +0100
Message-Id: <20220306130000.8104-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add cpus_are_resettable() to AccelOps, and implement it for the
KVM accelerator.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-12-f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 2 ++
 include/sysemu/hw_accel.h  | 5 -----
 accel/kvm/kvm-accel-ops.c  | 6 ++++++
 softmmu/cpus.c             | 5 ++++-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 50c72540c73..6013c9444cc 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -28,6 +28,8 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelOpsClass *ops);
 
+    bool (*cpus_are_resettable)(void);
+
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 01b5ebf442a..22903a55f70 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -23,9 +23,4 @@ void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
-static inline bool cpu_check_are_resettable(void)
-{
-    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
-}
-
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 95b7b080202..c4244a23c65 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -79,12 +79,18 @@ static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
     return !kvm_halt_in_kernel();
 }
 
+static bool kvm_cpus_are_resettable(void)
+{
+    return !kvm_enabled() || kvm_cpu_check_are_resettable();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
+    ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index b17033d3bce..e1d84c8ccb7 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -195,7 +195,10 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
 
 bool cpus_are_resettable(void)
 {
-    return cpu_check_are_resettable();
+    if (cpus_accel->cpus_are_resettable) {
+        return cpus_accel->cpus_are_resettable();
+    }
+    return true;
 }
 
 int64_t cpus_get_virtual_clock(void)
-- 
2.35.1


