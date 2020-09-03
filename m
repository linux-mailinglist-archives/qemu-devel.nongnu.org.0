Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0F25CBD5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 23:07:48 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDwSR-0006Ef-Rx
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 17:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1kDwL8-0003jY-EQ; Thu, 03 Sep 2020 17:00:14 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1kDwL6-0007RB-IP; Thu, 03 Sep 2020 17:00:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id c10so3973471otm.13;
 Thu, 03 Sep 2020 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zl94h+JEwFYHtOa8NK8LtKSrwdxSjFyOtdM3NqVIwV8=;
 b=Xh5MWP8MW/HvNcD9TwlDOk51UAS4Jt/YKgfbXABNKvIGkaXmcRqJs5LmOPKDWMW+Mb
 gwdk8EAtEvcjC9xNqwOUp8h7Xz0e206cbmd7gH3gKOMfTfphwaWjqk68U5tjuNL4Sr3x
 QgqlubfkZ7KT1CgsJdVIa41A+6UvZDU9EmQ0Imm8/p8APBXLdukRxG+SOba3su/MlY3a
 qYqokwsKeXZgIUKsIiAOki3rsz6rGZeDPrEyNw+trATuDYyWSnr2Zt1zT5/gwaO1aNul
 B3cX7D+xVHs8mHt9NUeTUkqoXXCCaf/GGnGczE72xqejEGOrnuJAZfnMTfShmEullInq
 /z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Zl94h+JEwFYHtOa8NK8LtKSrwdxSjFyOtdM3NqVIwV8=;
 b=ELW+xjt8P8Utycc0T3m+Jok9PI/2BVOXrd3b8heeOyiaC8XFHs2qsF0Z06BrUb16So
 R6VRmgbbvRscqbi3YqLdGY2qg9Lx5pu45Z3NePGun8fEtPgkhRSgnPZp1vRdX7Q3B/ea
 6gqCr7bTT8nu7ggrDIbRTQFyC3grMn3oXtJlXNWIR7ejSoKPbrWJZuy7AkhSrqy1rOWQ
 JZx51t4up2eVBLoV58LKiXlC9CQHkXU7rlMc4boPz2JHfbEOYElvTpqY3rUHtjl45yu9
 uK1KcJiTb3wP1aGkRmlGsQkgLOkOTp3G9NMkV7RilduLaxfo1TpLTcCImZnwdxLoxhj8
 K61w==
X-Gm-Message-State: AOAM531atdUa4tElEgVqjudVw485xeO8Qit2aB9/iUpghpLqDi9ezCWn
 m9P6VzfEsJeZF09PTrz/7l//JFzUNro=
X-Google-Smtp-Source: ABdhPJxDTnOLfoq67xc1VrZXc9OEErwBbHmUTOeU0jbI5ygkWlfbHXRnq0EVOBHcdTJsHHzIIdi23g==
X-Received: by 2002:a05:6830:19ee:: with SMTP id
 t14mr3082333ott.171.1599166810293; 
 Thu, 03 Sep 2020 14:00:10 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id w125sm710943oia.57.2020.09.03.14.00.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Sep 2020 14:00:09 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/77] KVM: x86: believe what KVM says about WAITPKG
Date: Thu,  3 Sep 2020 15:58:41 -0500
Message-Id: <20200903205935.27832-24-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Currently, QEMU is overriding KVM_GET_SUPPORTED_CPUID's answer for
the WAITPKG bit depending on the "-overcommit cpu-pm" setting.  This is a
bad idea because it does not even check if the host supports it, but it
can be done in x86_cpu_realizefn just like we do for the MONITOR bit.

This patch moves it there, while making it conditional on host
support for the related UMWAIT MSR.

Cc: qemu-stable@nongnu.org
Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit e1e43813e7908b063938a3d01f172f88f6190c80)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/i386/cpu.c      |  3 +++
 target/i386/kvm.c      | 11 +++++------
 target/i386/kvm_i386.h |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 90ffc5f3b1..471db0724f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6491,6 +6491,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
             host_cpuid(5, 0, &cpu->mwait.eax, &cpu->mwait.ebx,
                        &cpu->mwait.ecx, &cpu->mwait.edx);
             env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
+            if (kvm_enabled() && kvm_has_waitpkg()) {
+                env->features[FEAT_7_0_ECX] |= CPUID_7_0_ECX_WAITPKG;
+            }
         }
         if (kvm_enabled() && cpu->ucode_rev == 0) {
             cpu->ucode_rev = kvm_arch_get_supported_msr_feature(kvm_state,
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 4901c6dd74..f9c873bcad 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -407,12 +407,6 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (host_tsx_blacklisted()) {
             ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
         }
-    } else if (function == 7 && index == 0 && reg == R_ECX) {
-        if (enable_cpu_pm) {
-            ret |= CPUID_7_0_ECX_WAITPKG;
-        } else {
-            ret &= ~CPUID_7_0_ECX_WAITPKG;
-        }
     } else if (function == 7 && index == 0 && reg == R_EDX) {
         /*
          * Linux v4.17-v4.20 incorrectly return ARCH_CAPABILITIES on SVM hosts.
@@ -4678,3 +4672,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     abort();
 }
+
+bool kvm_has_waitpkg(void)
+{
+    return has_msr_umwait;
+}
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index 00bde7acaf..064b8798a2 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -44,6 +44,7 @@ void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
 
 bool kvm_enable_x2apic(void);
 bool kvm_has_x2apic_api(void);
+bool kvm_has_waitpkg(void);
 
 bool kvm_hv_vpindex_settable(void);
 
-- 
2.17.1


