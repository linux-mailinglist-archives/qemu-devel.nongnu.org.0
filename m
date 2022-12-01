Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402E63EDB3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gn9-0001Gg-6t; Thu, 01 Dec 2022 05:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gn5-0001Ci-Pp
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:27:39 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gn3-0001UX-Sz
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:27:39 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso4827773pjt.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxFUiqdAJq9zJUGdn0FVmVDZqtniT0uf+dPwrOJEVb0=;
 b=SvwxgkT0mlR8TU2D7UkHvI5KTopI7d3Q7kuWkdTAATevpP+IT/E2Qp1SITch/sC4Oa
 vKI+lEmfxEAA64pL/hJ4hddMKIOwdo3lmE6GWtKUt12KIdDAUUq0qj849+CuoKoOWR5i
 Lw7uGyQy6a3YpV0/QC+YHohcRN/QBhsl8MOTKChIdOLeJxSA0q0P79wTL+xYWzEF1mQq
 piDhXHsptpT26s/9IK2vKjQwcvORX8pOKYUAZRUHKe6jnCsvvjRsl4KvH+gc3bEqJvIS
 3ELNkf1kkn/QdEhidPjZahEKR51ixoVXmlQY8HYnvsVIVF+tFurwB/r0YIApmOhdXzeH
 3Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxFUiqdAJq9zJUGdn0FVmVDZqtniT0uf+dPwrOJEVb0=;
 b=V1C6AVNlDcNKaO3UJsTjY3BYnD6/5r0EzrVYfOugSbZglb8LGtwVoCs0LUBKqqlcAX
 y4cfEKzvbBJtVlG4JF2fdDfk8KvL0SHEJUV0+EbmZ6ZwQFx+HXt3Il5bS1Y4OAeyhYyr
 +J6DG4aVxwYNhWw1rphhLtbzCV/TW7fEAGDSoAhzOlZjEVm8bLmWhwIrJgr7Z66CDXOO
 g7Xl0imc/BhIPXqXgZKJVmhbX935DZOWdJ8/0OvkzYVdImGH48akzbUcCAYLaazXPwWz
 GK3oNrXWvgLUZenfd7CGBBm9x/t0VGTsX3LfBB98whS3SbsvzhxzyrumVQBVY1pAGenV
 lN5A==
X-Gm-Message-State: ANoB5pkX+H/Y4QIy4+1oohKYQsjzrnf7rUD1DCIb4A6mxBulaDawM7Ix
 itc6T5sasACH9QL+qzb3Ad8Ta+RmrPYkgX93
X-Google-Smtp-Source: AA0mqf51XnulmYGgXDPa5v7SpGarx6NnyJ7v5ENHAFkG1WvupdG7YBhpo9GH2WDW/G86CKU6v6tRyA==
X-Received: by 2002:a17:90a:4206:b0:213:2039:64c2 with SMTP id
 o6-20020a17090a420600b00213203964c2mr75959602pjg.165.1669890456205; 
 Thu, 01 Dec 2022 02:27:36 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a1709028f8100b00188fcc4fc00sm3245052plo.79.2022.12.01.02.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:27:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] accel/kvm/kvm-all: Handle register access errors
Date: Thu,  1 Dec 2022 19:27:28 +0900
Message-Id: <20221201102728.69751-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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

A register access error typically means something seriously wrong
happened so that anything bad can happen after that and recovery is
impossible.
Even failing one register access is catastorophic as
architecture-specific code are not written so that it torelates such
failures.

Make sure the VM stop and nothing worse happens if such an error occurs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 accel/kvm/kvm-all.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..9e848f750e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2709,7 +2709,13 @@ bool kvm_cpu_check_are_resettable(void)
 static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     if (!cpu->vcpu_dirty) {
-        kvm_arch_get_registers(cpu);
+        int ret = kvm_arch_get_registers(cpu);
+        if (ret) {
+            error_report("Failed to get registers: %s", strerror(-ret));
+            cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
+            vm_stop(RUN_STATE_INTERNAL_ERROR);
+        }
+
         cpu->vcpu_dirty = true;
     }
 }
@@ -2723,7 +2729,13 @@ void kvm_cpu_synchronize_state(CPUState *cpu)
 
 static void do_kvm_cpu_synchronize_post_reset(CPUState *cpu, run_on_cpu_data arg)
 {
-    kvm_arch_put_registers(cpu, KVM_PUT_RESET_STATE);
+    int ret = kvm_arch_put_registers(cpu, KVM_PUT_RESET_STATE);
+    if (ret) {
+        error_report("Failed to put registers after reset: %s", strerror(-ret));
+        cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
+        vm_stop(RUN_STATE_INTERNAL_ERROR);
+    }
+
     cpu->vcpu_dirty = false;
 }
 
@@ -2734,7 +2746,12 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu)
 
 static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
 {
-    kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+    int ret = kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+    if (ret) {
+        error_report("Failed to put registers after init: %s", strerror(-ret));
+        exit(1);
+    }
+
     cpu->vcpu_dirty = false;
 }
 
@@ -2827,7 +2844,14 @@ int kvm_cpu_exec(CPUState *cpu)
         MemTxAttrs attrs;
 
         if (cpu->vcpu_dirty) {
-            kvm_arch_put_registers(cpu, KVM_PUT_RUNTIME_STATE);
+            ret = kvm_arch_put_registers(cpu, KVM_PUT_RUNTIME_STATE);
+            if (ret) {
+                error_report("Failed to put registers after init: %s",
+                             strerror(-ret));
+                ret = -1;
+                break;
+            }
+
             cpu->vcpu_dirty = false;
         }
 
-- 
2.38.1


