Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497C626109
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiq-00083X-4x; Fri, 11 Nov 2022 13:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-00081D-Hy
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005FH-9e
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id h9so7561652wrt.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G49Mn+39h2vPHN4AzQaatrKwexURVZpgkUVTRaS+5Pc=;
 b=WB/wwEOIACBjbBhKnyfseiSz3pDcL9oZTsaYCULkUqK3NEvW0UQwVPMxFjZ6EBZLBa
 epcz/PYPc+SWbDx2qfiyXulkJo0Tmc6G0c4IEY52tTo7MF7SL/hTwoQn1pyR3J7pHu6K
 12gNv78rx8nYNn6Xhlnm0u+lsZ9P4GNJ8g2ohlNkDb1Z553J2IqQOLizgZmzkYCx5b9v
 OPg7jOUuOgzbd4GyUJ0DDJ4Y9M7+lQoYivaRYQAtt9MPVrl7pXdoMAHvBe77mMwzsRaB
 b11UK9xHiz8WTKIxB4ZaapVY7+7CYkn2rLnQ6fQ5a5wwXeTYDEVi45qMMACsMWYMbE58
 X1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G49Mn+39h2vPHN4AzQaatrKwexURVZpgkUVTRaS+5Pc=;
 b=CjFFFM+gp9+D4SOkg+lCOe57TASp2AG6gOWRGYDpghbsAsaoqsBfwIOUaxtJbglOWz
 lWCGXtVApgiNjSiYoVqUnSAoKEPNCfiEyAxdWklCi2QR/UDxn+xsgooUq6CP4dG303YW
 lVvpVsg8YRGkDMHMJSnupjybBN3BhTE14GdeF5kPbAP5ANEUVShwID0V5NL7KCyXIq2O
 9G7dnsha/9KfJulezPD8ZxcbNdb7InVjxIIq5b2ems4l40QwQo3NVzcp7Ik4odkqoeK2
 naaMjGSWICeV+Do5TbedYPyd+7dZVQiy6smluiP7/lJRlfVqzrsHkTrlzeP3ejPj3vnm
 Fnag==
X-Gm-Message-State: ANoB5pk4MDbcenvrUd5xmDp8gQOrTt+jCPOqtqhsJpgrcBSMeDIm3lzq
 jCaE6gmXrb8SyQ9erWyuOp3SWd0ijVoFLg==
X-Google-Smtp-Source: AA0mqf649pn/4HiKtJfKmwJfm2X7mYbRMg2bPJtphdYBi2AHk6GnUw0/kw8d4Q/eRXLE0FMEOrggXA==
X-Received: by 2002:adf:ea4d:0:b0:236:8fa1:47cf with SMTP id
 j13-20020adfea4d000000b002368fa147cfmr2101859wrn.50.1668191139036; 
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b002366f9bd717sm2921843wrr.45.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B9BF1FFBC;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM KVM CPUs),
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH v5 04/20] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:19 +0000
Message-Id: <20221111182535.64844-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Although most KVM users will use the in-kernel GIC emulation it is
perfectly possible not to. In this case we need to ensure the
MemTxAttrs are correctly populated so the GIC can divine the source
CPU of the operation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - new for v3
v5
  - tags
  - use MEMTXATTRS_PCI
---
 target/arm/kvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..bb4cdbfbd5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -803,13 +803,14 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     ARMCPU *cpu;
     uint32_t switched_level;
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
 
     if (kvm_irqchip_in_kernel()) {
         /*
          * We only need to sync timer states with user-space interrupt
          * controllers, so return early and save cycles if we don't.
          */
-        return MEMTXATTRS_UNSPECIFIED;
+        return attrs;
     }
 
     cpu = ARM_CPU(cs);
@@ -850,7 +851,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
         qemu_mutex_unlock_iothread();
     }
 
-    return MEMTXATTRS_UNSPECIFIED;
+    return attrs;
 }
 
 void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
@@ -1005,6 +1006,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
+    MemTxAttrs attrs = MEMTXATTRS_PCI(dev);
 
     if (as == &address_space_memory) {
         return 0;
@@ -1014,8 +1016,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     RCU_READ_LOCK_GUARD();
 
-    mr = address_space_translate(as, address, &xlat, &len, true,
-                                 MEMTXATTRS_UNSPECIFIED);
+    mr = address_space_translate(as, address, &xlat, &len, true, attrs);
 
     if (!mr) {
         return 1;
-- 
2.34.1


