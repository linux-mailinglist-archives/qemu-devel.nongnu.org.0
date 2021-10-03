Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4704200A0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:01:58 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwRZ-0001Hg-Tf
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9M-0003jy-VJ
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9L-0000v0-60
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id g8so51965085edt.7
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WoWiryGI2T3SkhDO1+fsiuderDI9swQzYrgJaWsDXkM=;
 b=FjMIYvqm3kSpKey+bTtF81Iv2jo9pAYmjh1VPmRzoLOqmLby3QVWDOq9WAzvjokLcQ
 tIOxiqldqumEhg6dVmXmvb5rVWTKej6lTknaDLiq+0wcIE+BlHAjl4qyG1oGHka59uWk
 zANxmCMA6YO8STt+GisSi+Y0VJgz7PIA1+i8hPirnK7hNWBiE/EQnaqciZh4+H6Pt99e
 7Gc7wwiYoMs5eid0wegtD4Ub3/cBI5HjNFejbhDaOMhiXiiGIFzXP9YABmytUsWY7q4p
 SIp/QHqLLkIz80pL1OYwtovlpOLlLZWWu5HFDqHo/WaxCmbyKiJB8o8J2uDQX6MussLk
 Jl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WoWiryGI2T3SkhDO1+fsiuderDI9swQzYrgJaWsDXkM=;
 b=Ci6JTWfy0fgqZsTEeGAleV1UWUt3qm7wM4pcfJYAt+rYRv14t63dDjg1VUC39062Hk
 6JUUshHJLYBYHdir6XA8dgiDNLmCxnGHeZDMs8KWDQj8/PdrylxAeiak8RIsvssUJAvn
 +410sm1aICF667ngWMer43Kc8b6KeV3h8dDE9hC2KL5R/zW1yUdcII288YgaX/Qclanw
 FVZpdAm1OVlzkOP1MfTDzlsJ1Y/8d/OUUMC1q+rTJMfdVtdXvp1QgD/53i0dvTNFj6Gn
 tI6+e0lRJEy+bZn6+Ibzpmb+wMP7hdqbXhomoq6k4tFwJ7nxt5WzsnPI2WA03HUgYEhW
 zjhA==
X-Gm-Message-State: AOAM531J2Yco33UVhg23wu4e0AshE6fz/JYjgkqzDY8GN+KE34WypRbQ
 vHM+Z/X79pziVE+HQxy6PQJyBiBMI2E=
X-Google-Smtp-Source: ABdhPJzagyFzJGKh8lMe7N6vclUmobooAVdzrLUV4TEyeen/nv5VsBq0M94wDE9ocVTE1igvUQwNVQ==
X-Received: by 2002:a05:6402:713:: with SMTP id
 w19mr9719440edx.366.1633246985887; 
 Sun, 03 Oct 2021 00:43:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
Date: Sun,  3 Oct 2021 09:42:38 +0200
Message-Id: <20211003074250.60869-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

By default, KVM allows the guest to use all currently supported Hyper-V
enlightenments when Hyper-V CPUID interface was exposed, regardless of if
some features were not announced in guest visible CPUIDs. hv-enforce-cpuid
feature alters this behavior and only allows the guest to use exposed
Hyper-V enlightenments. The feature is supported by Linux >= 5.14 and is
not enabled by default in QEMU.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-5-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt       | 17 ++++++++++++++---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c |  9 +++++++++
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 000638a2fd..072709a68f 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -203,8 +203,11 @@ When the option is set to 'on' QEMU will always enable the feature, regardless
 of host setup. To keep guests secure, this can only be used in conjunction with
 exposing correct vCPU topology and vCPU pinning.
 
-4. Development features
-========================
+4. Supplementary features
+=========================
+
+4.1. hv-passthrough
+===================
 In some cases (e.g. during development) it may make sense to use QEMU in
 'pass-through' mode and give Windows guests all enlightenments currently
 supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
@@ -215,8 +218,16 @@ values from KVM to QEMU. "hv-passthrough" overrides all other "hv-*" settings on
 the command line. Also, enabling this flag effectively prevents migration as the
 list of enabled enlightenments may differ between target and destination hosts.
 
+4.2. hv-enforce-cpuid
+=====================
+By default, KVM allows the guest to use all currently supported Hyper-V
+enlightenments when Hyper-V CPUID interface was exposed, regardless of if
+some features were not announced in guest visible CPUIDs. 'hv-enforce-cpuid'
+feature alters this behavior and only allows the guest to use exposed Hyper-V
+enlightenments.
 
-4. Useful links
+
+5. Useful links
 ================
 Hyper-V Top Level Functional specification and other information:
 https://github.com/MicrosoftDocs/Virtualization-Documentation
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 598019de12..2a19eba56d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6834,6 +6834,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
+    DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c990150373..8a7209bbf2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1719,6 +1719,7 @@ struct X86CPU {
     uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
     uint32_t hyperv_nested[4];
+    bool hyperv_enforce_cpuid;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d6a70c27e5..fbe6b7ac72 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1531,6 +1531,15 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         cpu->hyperv_nested[0] = evmcs_version;
     }
 
+    if (cpu->hyperv_enforce_cpuid) {
+        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENFORCE_CPUID, 0, 1);
+        if (ret < 0) {
+            error_report("failed to enable KVM_CAP_HYPERV_ENFORCE_CPUID: %s",
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
     return 0;
 }
 
-- 
2.31.1



