Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A764F404
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:22:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Is1-0001a2-6d; Fri, 16 Dec 2022 17:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Irz-0001Za-03
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:55 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Irx-00066Y-AU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:54 -0500
Received: by mail-ej1-x634.google.com with SMTP id t17so9346542eju.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuvOmgloso2e5NXgsHUei7ptWD2NT1t6KV+3QRSZobI=;
 b=zYWAixXwjDLNsWkPsxwYHCwaJXcbQ/fM/AV4tyCO8jMgSiMySrs25voDToqac55f+X
 eY8QmqBEs837n22ZpNqfdVJkIIOJFxGhqg7oO74Zw3FkXPGDFAzVUgSkLpIw/n9XTZkd
 FKrJRELYL1jYUpS+AXb9iglMUzGmaKlt8bu3wkIngl3sdTHIrjIEh3i8BN0Jzi5nudZR
 /NzUBroaPW4+1SXEOFxPlluDvyZS32fiMOZ2sKWIFT469I6iNSRNlqNJ2Fhrno3HpAMG
 cZzDQasTuyJ3YLqheuj2txiYkShpEWmbHpKCK6rQZko6ywz58IBwXGeOnkLxr721wptF
 hfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuvOmgloso2e5NXgsHUei7ptWD2NT1t6KV+3QRSZobI=;
 b=Wn0Cx1+zolSwrNR54V5Qe7uuMiwkcCFjIhNiyo1ElOy/i327NVxG0WfNJVBy753AAc
 PjXUM1J/HBENFxk1i2jCMcAxrZsgNMmesg4NKfHr4EDUu7bfKCLda8M5CQ7F2dA+ltDG
 HGh6zjtNpSRVAQenNOFCPiyGTk/YGnwUvNGRtuTadrBmIhbSAARZ0MshfQRygi+EaQZP
 pRc+ejAXBQTrgsmJG+LhQ8VARdEt9Re+ToavBCTYBOtFVLCPHr3bsYwg/LaFbECnObkU
 03XaNdh1zmnBmsEpY9udiF97gaJDMGXSj0NtJhoY2BGaZ4w84zJKbXVmFEHcTFz2Rq0b
 SPuw==
X-Gm-Message-State: ANoB5plO506uxguzw9hnu2+bD8YYElgDUD4dwcuS6JPlSTIJmrv7HzW2
 yP+ijA771Xr2UbsL0wYB1KUM7ZYAUPiz/rt25a8=
X-Google-Smtp-Source: AA0mqf43lrvqoVp9kw/H2TDq+nbYIW8SaiNj0yMyvD09B1QPt4yyMI9jDe29obq2nfKAPcYMH8R43w==
X-Received: by 2002:a17:906:4ec3:b0:7c1:5169:3ed6 with SMTP id
 i3-20020a1709064ec300b007c151693ed6mr22045996ejv.48.1671228471882; 
 Fri, 16 Dec 2022 14:07:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 va15-20020a17090711cf00b007c0dacbe00bsm1289082ejb.115.2022.12.16.14.07.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:07:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] sysemu/kvm: Reduce target-specific declarations
Date: Fri, 16 Dec 2022 23:07:38 +0100
Message-Id: <20221216220738.7355-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220738.7355-1-philmd@linaro.org>
References: <20221216220738.7355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Only the declarations using the target_ulong type are
target specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c8281c07a7..a53d6dab49 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -242,9 +242,6 @@ bool kvm_arm_supports_user_irq(void);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 void kvm_flush_coalesced_mmio_buffer(void);
 
 /**
@@ -410,6 +407,9 @@ void kvm_get_apic_state(DeviceState *d, struct kvm_lapic_state *kapic);
 struct kvm_guest_debug;
 struct kvm_debug_exit_arch;
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
 struct kvm_sw_breakpoint {
     target_ulong pc;
     target_ulong saved_insn;
@@ -436,6 +436,15 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg);
 
 bool kvm_arch_stop_on_emulation_error(CPUState *cpu);
 
+uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
+                                      uint32_t index, int reg);
+uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
+
+int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
+                                       hwaddr *phys_addr);
+
+#endif /* NEED_CPU_H */
+
 int kvm_check_extension(KVMState *s, unsigned int extension);
 
 int kvm_vm_check_extension(KVMState *s, unsigned int extension);
@@ -464,18 +473,8 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension);
         kvm_vcpu_ioctl(cpu, KVM_ENABLE_CAP, &cap);                   \
     })
 
-uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
-                                      uint32_t index, int reg);
-uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
-
-
 void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
-int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
-                                       hwaddr *phys_addr);
-
-#endif /* NEED_CPU_H */
-
 void kvm_cpu_synchronize_state(CPUState *cpu);
 
 void kvm_init_cpu_signals(CPUState *cpu);
-- 
2.38.1


