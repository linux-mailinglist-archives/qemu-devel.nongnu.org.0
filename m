Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D26D821A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:38:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5C5-0004Pr-Js; Wed, 05 Apr 2023 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Bz-0004Pb-8s
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:36:59 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Bu-0008AU-Dh
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:36:59 -0400
Received: by mail-pl1-x62e.google.com with SMTP id le6so34750225plb.12
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680709012; x=1683301012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiXmf18XEU9NEb+9nguIMlwRxC8lm/HhIDPla+UcLec=;
 b=KziuYhk9r/IO9vtcxQqoniTloqieE9v9yREFUBwIiAXDLM7TAVQKZzruGuUtFoMOOI
 BHzgaMjTJGnChl2NzfCCobziCq3yDaMwKwEokMgYIOOBvgQCqHxlyfFqY45T4jNUb39J
 SCapwAsNMlRAlVWwjQptIoL2K7ucVFX8vYF2EEwMEEtKw7wVWdfRXga4Ziq/K848X8+l
 vaWLKi/5HUSOGEyt/ipnfQuLgrc9tJEEC6wZsDFFayRT/kMu9VdvUmLc0gotwM8VNmPR
 cBMTRoIjBRqCaAlQ8MOtZDwPiJ3R4MWND8oOyOjhqYxFwE6ufHkrtH694A+ZSq/4frtd
 d3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709012; x=1683301012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OiXmf18XEU9NEb+9nguIMlwRxC8lm/HhIDPla+UcLec=;
 b=2Jm/uG4uq+/CUNZsoAMPR8qdC+i9PMv0SPwKbhv84jcufwkD8kyQWXYcZ5L/7X0Qpy
 mmjpYoZ664U1Ly5L0KQdfWjBFgTlaxogtUd/DEijmcw9HzhSk1+7sz3FjY4/QBhVO9Xj
 ppv+B8gNjx+CUzR88JtKjoPAV+7MraKywfoyeWRcvbhUYw2MAr3FB5H3/nsW0B8eBR8b
 CG75WVaMBmh7pT/B00rPM3lojAzYD3SdBYBX6GXMVIx9ZFByjeQdKz3gnehOSYssoIfh
 KrrjP42rGdv0r1BSjGdjdkhliy7nvpXyfyxAxQF1xnYameJRpc4EotkB0yA2y6XClIqX
 e9tA==
X-Gm-Message-State: AAQBX9cYb7NiaAjVtTYJNtTYp0rJNU6TNg7JyjcXzFJftCTgXTYMw0SK
 bVYrAHwFrKhJ6YgenLqns4+pXvpo7dIv+gu33LM4ow==
X-Google-Smtp-Source: AKy350ZHAhiTa5LScEKhdm86H5AINIEfTsyPavaqIg/FZsMlaPwfdCPY4mebbQr9swrNlLv9ULUgNw==
X-Received: by 2002:a05:6a20:2db0:b0:d9:237e:9d0b with SMTP id
 bf48-20020a056a202db000b000d9237e9d0bmr5042944pzb.3.1680709012639; 
 Wed, 05 Apr 2023 08:36:52 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a62ee0f000000b00594235980e4sm10801456pfi.181.2023.04.05.08.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:36:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Initialize debug capabilities only once
Date: Thu,  6 Apr 2023 00:36:44 +0900
Message-Id: <20230405153644.25300-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

kvm_arm_init_debug() used to be called several times on a SMP system as
kvm_arch_init_vcpu() calls it. Move the call to kvm_arch_init() to make
sure it will be called only once; otherwise it will overwrite pointers
to memory allocated with the previous call and leak it.

Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Supersedes: <20230405070244.23464-1-akihiko.odaki@daynix.com>
("[PATCH] target/arm: Check if debug is already initialized")

 target/arm/kvm.c     |  2 ++
 target/arm/kvm64.c   | 18 ++++--------------
 target/arm/kvm_arm.h |  8 ++++++++
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..84da49332c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -280,6 +280,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    kvm_arm_init_debug(s);
+
     return ret;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..810db33ccb 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -74,24 +74,16 @@ GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-/**
- * kvm_arm_init_debug() - check for guest debug capabilities
- * @cs: CPUState
- *
- * kvm_check_extension returns the number of debug registers we have
- * or 0 if we have none.
- *
- */
-static void kvm_arm_init_debug(CPUState *cs)
+void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
+    have_guest_debug = kvm_check_extension(s,
                                            KVM_CAP_SET_GUEST_DEBUG);
 
-    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
     return;
@@ -920,8 +912,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
-    kvm_arm_init_debug(cs);
-
     /* Check whether user space can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..330fbe5c72 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,6 +18,14 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
+/**
+ * kvm_arm_init_debug() - initialize guest debug capabilities
+ * @s: KVMState
+ *
+ * Should be called only once before using guest debug capabilities.
+ */
+void kvm_arm_init_debug(KVMState *s);
+
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
-- 
2.40.0


