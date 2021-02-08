Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A6314326
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:44:24 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FGZ-00086V-Mq
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCw-0003rw-Es
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCs-0006Og-Ae
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id o24so43993wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRe5TX+f+L3jUgrUwCLZinuCJxOTVhrSWj3PptppQT8=;
 b=TMcKqt0vxF11AbCa7nWxm3nsSkW+1Mck1XV/UYPwOwdC3sMWdUaiqrVu1K83ydTY9G
 0NJy2f4AD9zYX218pxnjMwpsHho9dPWCHChnHQu1LAf2lGtj+GftT38F6uGi2jA92GKn
 VrSmQKiqdSlLYYgkwzJXUhmKmyKBTSMrlHC/X3dwJwvA8BRT0PJXSc/6UdJXTKY5Jj4I
 cWtwK/8MzzcrSCBa2gnarK0dIk8ShMW9/IcONfxRDkL0oGVuauqMgN8N891ZC4LTgOqc
 OIwGj8b18YVI2vE530TVeAuIbORfxnpeKzq3WYcFZncdKWy24rx+2sWqtp2yiLiDxbMX
 Yk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRe5TX+f+L3jUgrUwCLZinuCJxOTVhrSWj3PptppQT8=;
 b=lt5MTk+2BR/38n+eq88Io/Mooiiezg/ktAKnay/vb3kQcelCuzBK0+JE/KUhwovLhY
 /b5NG8mjfSyZAST49sbzZVC0aDlUnsAn+PirXWGJCZwSx4wu6mJ4/BJ9JjNPCiUcvQz1
 7kIfJK8+3n2Ngx0EKVlBQWdmEi1XDXV+mfapjWUqSX4Wj/WIqWYf4NbOXsWLshVXoe6G
 ZKcVRk9YFjYgaZbSztUBuc9iJluqs00orkTEoirR+e4lMr2fL8dj9pyOMefXD5h0m8YY
 XwKo/49g7HlRwXxZW7p16qEL+IHSve8KyfI7/xosMvgDRQZQYPCTjcQWh6wFKspgZbsZ
 jwcw==
X-Gm-Message-State: AOAM5320i7dJmJLZ9NvT57uR1sy0XlOSvZkxf6QgsucrrRRv2MoNe1RY
 kepONEaQorTN9PwNis6ZlLLhSy72ci+WTQ==
X-Google-Smtp-Source: ABdhPJwE9eP2oW51x0aQmeMLyArOAlkY2aJUx2OISNs5ltC6Iq5JejbzrhUvAadZ6gFLC6Qxr8rj1A==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr76341wmi.158.1612808656159;
 Mon, 08 Feb 2021 10:24:16 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/46] target/i386: Add support for save/load IA32_PKRS MSR
Date: Mon,  8 Feb 2021 19:23:30 +0100
Message-Id: <20210208182331.58897-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

PKS introduces MSR IA32_PKRS(0x6e1) to manage the supervisor protection
key rights. Page access and writes can be managed via the MSR update
without TLB flushes when permissions change.

Add the support to save/load IA32_PKRS MSR in guest.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20210205083325.13880-2-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4788139128..e97f841757 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -113,6 +113,7 @@ static bool has_msr_vmx_vmfunc;
 static bool has_msr_ucode_rev;
 static bool has_msr_vmx_procbased_ctls2;
 static bool has_msr_perf_capabs;
+static bool has_msr_pkrs;
 
 static uint32_t has_architectural_pmu_version;
 static uint32_t num_architectural_pmu_gp_counters;
@@ -2087,6 +2088,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case MSR_IA32_VMX_PROCBASED_CTLS2:
                 has_msr_vmx_procbased_ctls2 = true;
                 break;
+            case MSR_IA32_PKRS:
+                has_msr_pkrs = true;
+                break;
             }
         }
     }
@@ -2814,6 +2818,9 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
     if (has_msr_smi_count) {
         kvm_msr_entry_add(cpu, MSR_SMI_COUNT, env->msr_smi_count);
     }
+    if (has_msr_pkrs) {
+        kvm_msr_entry_add(cpu, MSR_IA32_PKRS, env->pkrs);
+    }
     if (has_msr_bndcfgs) {
         kvm_msr_entry_add(cpu, MSR_IA32_BNDCFGS, env->msr_bndcfgs);
     }
@@ -3205,6 +3212,9 @@ static int kvm_get_msrs(X86CPU *cpu)
     if (has_msr_feature_control) {
         kvm_msr_entry_add(cpu, MSR_IA32_FEATURE_CONTROL, 0);
     }
+    if (has_msr_pkrs) {
+        kvm_msr_entry_add(cpu, MSR_IA32_PKRS, 0);
+    }
     if (has_msr_bndcfgs) {
         kvm_msr_entry_add(cpu, MSR_IA32_BNDCFGS, 0);
     }
@@ -3475,6 +3485,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_UMWAIT_CONTROL:
             env->umwait = msrs[i].data;
             break;
+        case MSR_IA32_PKRS:
+            env->pkrs = msrs[i].data;
+            break;
         default:
             if (msrs[i].index >= MSR_MC0_CTL &&
                 msrs[i].index < MSR_MC0_CTL + (env->mcg_cap & 0xff) * 4) {
-- 
2.29.2



