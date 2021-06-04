Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956B39BBD0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:26:52 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBil-0002ow-Oc
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa9-0007xq-Eo
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa7-0008Gs-Dj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id cb9so11615612edb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhI5qK8fOj23ZCs+2zNQ+PPAqZm0E1FwU8STGeClWss=;
 b=GrWUsBre5wSvATEc5MW4mqTBHOBunAnIfsomYQn1fAIj1GdUie8vSc1axrMN1ouGbn
 cHbiFMrhd3ntQ8zSlQJErueaspm4WmYEKap4lv/LA/SUnS+jGo8bKk3rBPvr75bkgwYv
 njckqbyFsNa2unECeI+WgLovCzrClATlysAR9MmJDD4cDgmyHu1gshgU/JSEz884tBu1
 flB65gu50gROoJs4azk1dpMuVEQAeEoAAmpXrrYKDeB9Gc+CeLFS5KGGYf60ovaqShzA
 dffg6rinKYRH/Aq0HfsyzdfEGoCxdqEDL20W7Wx+LYYuiuRvU0KQ8E320f3kfZCHOiu3
 VjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IhI5qK8fOj23ZCs+2zNQ+PPAqZm0E1FwU8STGeClWss=;
 b=Xpzo+FpnK43aHRH8wX1bLpePoVpxnqSRqq3UlShc8ObcWkSYGfEwdBrwf/E8ZnRgnv
 vNptyuuNUmccjO7L46ibUMbPyXhb5s+JZbP6Vr4ysiKVjXlYOj00b5R0Y2ZqmpJYwzYL
 jZJkcH/576nAffdBU7wLRb2bDEADJLPjAdlc4HKiGzbaIuoIexJUaivLEZzWCjbtIKpU
 BS1grwV5NyO/2lWKuSE47G+nYSMj3ChWUMZ4Sp/kW3rXj0wmXexU87TwxSzS+4v+CUsp
 ZiyyXEgO3wxCzNnt8hds+ueN0SNw1T+uMbZy5+ag3EJuBo1f1gmVismN2kwc2fRZkGEB
 QZlQ==
X-Gm-Message-State: AOAM532g7XXePBBcbpmHa75NqQArDzOgfulVfvSuadUiH78pGiDa7IH4
 CeB5oCAoAXf2maGkl1TCvoY4XAqntvyAkg==
X-Google-Smtp-Source: ABdhPJyg/lukOblbpbcYov7Bm9VR6mGZ+QkfwwYDJ+IrMgew4JoQZO6OXAqM3NR72ZB8tCI7RiZTBg==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr5083621edd.321.1622819874065; 
 Fri, 04 Jun 2021 08:17:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] i386: reorder call to cpu_exec_realizefn
Date: Fri,  4 Jun 2021 17:17:41 +0200
Message-Id: <20210604151745.310318-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

i386 realizefn code is sensitive to ordering, and recent commits
aimed at refactoring it, splitting accelerator-specific code,
broke assumptions which need to be fixed.

We need to:

* process hyper-v enlightements first, as they assume features
  not to be expanded

* only then, expand features

* after expanding features, attempt to check them and modify them in the
  accel-specific realizefn code called by cpu_exec_realizefn().

* after the framework has been called via cpu_exec_realizefn,
  the code can check for what has or hasn't been set by accel-specific
  code, or extend its results, ie:

  - check and evenually set code_urev default
  - modify cpu->mwait after potentially being set from host CPUID.
  - finally check for phys_bits assuming all user and accel-specific
    adjustments have already been taken into account.

Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c"...)
Fixes: 30565f10 ("cpu: call AccelCPUClass::cpu_realizefn in"...)
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210603123001.17843-2-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c         | 79 +++++++++++++++++++++++++--------------
 target/i386/kvm/kvm-cpu.c | 12 +++++-
 2 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e0ba36cc23..9c47daa409 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6089,39 +6089,17 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     static bool ht_warned;
 
-    /* Process Hyper-V enlightenments */
-    x86_cpu_hyperv_realize(cpu);
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
-        g_autofree char *name = x86_cpu_class_get_model_name(xcc);
-        error_setg(&local_err, "CPU model '%s' requires KVM or HVF", name);
-        goto out;
-    }
-
-    if (cpu->ucode_rev == 0) {
-        /* The default is the same as KVM's.  */
-        if (IS_AMD_CPU(env)) {
-            cpu->ucode_rev = 0x01000065;
-        } else {
-            cpu->ucode_rev = 0x100000000ULL;
-        }
-    }
-
-    /* mwait extended info: needed for Core compatibility */
-    /* We always wake on interrupt even if host does not have the capability */
-    cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
-
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
     }
 
+    /*
+     * Process Hyper-V enlightenments.
+     * Note: this currently has to happen before the expansion of CPU features.
+     */
+    x86_cpu_hyperv_realize(cpu);
+
     x86_cpu_expand_features(cpu, &local_err);
     if (local_err) {
         goto out;
@@ -6146,11 +6124,56 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
            & CPUID_EXT2_AMD_ALIASES);
     }
 
+    /*
+     * note: the call to the framework needs to happen after feature expansion,
+     * but before the checks/modifications to ucode_rev, mwait, phys_bits.
+     * These may be set by the accel-specific code,
+     * and the results are subsequently checked / assumed in this function.
+     */
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
+        g_autofree char *name = x86_cpu_class_get_model_name(xcc);
+        error_setg(&local_err, "CPU model '%s' requires KVM or HVF", name);
+        goto out;
+    }
+
+    if (cpu->ucode_rev == 0) {
+        /*
+         * The default is the same as KVM's. Note that this check
+         * needs to happen after the evenual setting of ucode_rev in
+         * accel-specific code in cpu_exec_realizefn.
+         */
+        if (IS_AMD_CPU(env)) {
+            cpu->ucode_rev = 0x01000065;
+        } else {
+            cpu->ucode_rev = 0x100000000ULL;
+        }
+    }
+
+    /*
+     * mwait extended info: needed for Core compatibility
+     * We always wake on interrupt even if host does not have the capability.
+     *
+     * requires the accel-specific code in cpu_exec_realizefn to
+     * have already acquired the CPUID data into cpu->mwait.
+     */
+    cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
+
     /* For 64bit systems think about the number of physical bits to present.
      * ideally this should be the same as the host; anything other than matching
      * the host can cause incorrect guest behaviour.
      * QEMU used to pick the magic value of 40 bits that corresponds to
      * consumer AMD devices but nothing else.
+     *
+     * Note that this code assumes features expansion has already been done
+     * (as it checks for CPUID_EXT2_LM), and also assumes that potential
+     * phys_bits adjustments to match the host have been already done in
+     * accel-specific code in cpu_exec_realizefn.
      */
     if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
         if (cpu->phys_bits &&
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 5235bce8dc..00369c2000 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -26,10 +26,18 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
     /*
      * The realize order is important, since x86_cpu_realize() checks if
      * nothing else has been set by the user (or by accelerators) in
-     * cpu->ucode_rev and cpu->phys_bits.
+     * cpu->ucode_rev and cpu->phys_bits, and updates the CPUID results in
+     * mwait.ecx.
+     * This accel realization code also assumes cpu features are already expanded.
      *
      * realize order:
-     * kvm_cpu -> host_cpu -> x86_cpu
+     *
+     * x86_cpu_realize():
+     *  -> x86_cpu_expand_features()
+     *  -> cpu_exec_realizefn():
+     *            -> accel_cpu_realizefn()
+     *               kvm_cpu_realizefn() -> host_cpu_realizefn()
+     *  -> check/update ucode_rev, phys_bits, mwait
      */
     if (cpu->max_features) {
         if (enable_cpu_pm && kvm_has_waitpkg()) {
-- 
2.31.1



