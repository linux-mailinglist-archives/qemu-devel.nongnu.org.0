Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46866A3F48
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaW9-0005Cy-7g; Mon, 27 Feb 2023 05:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaW1-0005Cd-8m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVz-00011i-Q8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677492831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/9ZO/RR+v2UnWUWmj7R34j/p8x5ynjq0gGM6XKdYvU=;
 b=eBlWCmaMyMOZdMUcFOMa7tfODUuisoVKYnQUcIuRZ4O7H7oyhY0AhDcliaSrS7acOikxyi
 0qVZ7DBbLYGncgTesfGJpaCOOWARNu8UH4nOxn+UJtRlczkwZKx7tgsSPhDOwTaCc5kUK7
 P14T6gv7QcAtlYIAJlWYrRsi33+dvRg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-lP6KgyowNMKuBAqb8-XWjw-1; Mon, 27 Feb 2023 05:13:47 -0500
X-MC-Unique: lP6KgyowNMKuBAqb8-XWjw-1
Received: by mail-ed1-f70.google.com with SMTP id
 r6-20020aa7c146000000b004acd97105ffso7789568edp.19
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/9ZO/RR+v2UnWUWmj7R34j/p8x5ynjq0gGM6XKdYvU=;
 b=qohSEU8UllXeimq390nSAoGuNMUpasw5OoDleYSCqJZ8tRQ7dHJaA3ykCc3m0Gblh1
 iOZSVTpVGsAohdkCO3eIoO0H0XvGGyrWqNkwfmGmPsC6iGF+yyYdscM780qfQkDySARO
 ZOcbI29LLQP8MQTMX1e0nvryaJMMzkeKVadEG4j+le3KK8SKleG10Kt/qREFFDHvikTI
 oyI3o+jHHgkgaFTaNp/c/NV9TNfJR37UT8AOe1UEQiF8k5cP9vAOweaY+n/KwVxtk4gr
 HATgZcC9n8T2iN686zyJI5UfkjnxA5OQjjzzc5F5QG2st/LkaYKF2LLr3ppBWZJKJIX1
 w15Q==
X-Gm-Message-State: AO0yUKWBhgb/55mJVJiiWhfm3zwnYSmZ4/KpYg56E5+yOEGR4LH1PBfg
 Z9ua1dxFRnN/R7EM/4sIr+PYhFGmeN4HQXRquMHOzmmkRoc4UqDdP43/EKnfQIZtQxon01wkhfH
 GAYQJhPsoIJx21cFacHmB2jxgMGQbUhmKCPG3mS0u0BMNLx1zJTF9E++vV7ehMBS73cNAGcIr
X-Received: by 2002:a05:6402:401:b0:4ab:4011:ff3d with SMTP id
 q1-20020a056402040100b004ab4011ff3dmr23866308edv.0.1677492825839; 
 Mon, 27 Feb 2023 02:13:45 -0800 (PST)
X-Google-Smtp-Source: AK7set99uuIgTlt6hf8aJS68QGkThyOU4YUxquU/mBrPfgViONehj3Ug7qyLefYdl7bdKB0qDB8yBg==
X-Received: by 2002:a05:6402:401:b0:4ab:4011:ff3d with SMTP id
 q1-20020a056402040100b004ab4011ff3dmr23866287edv.0.1677492825573; 
 Mon, 27 Feb 2023 02:13:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a50aac3000000b004acc6cbc451sm2941573edc.36.2023.02.27.02.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:13:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
Subject: [PATCH v4 3/4] target/i386: KVM: allow fast string operations if host
 supports them
Date: Mon, 27 Feb 2023 11:13:30 +0100
Message-Id: <20230227101332.636203-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227101332.636203-1-pbonzini@redhat.com>
References: <20230227101332.636203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

These are just a flag that documents the performance characteristic of
an instruction; it needs no hypervisor support.  So include them even
if KVM does not show them.  In particular, FZRM/FSRS/FSRC have only
been added very recently, but they are available on Sapphire Rapids
processors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 587030199192..fe66a4953d41 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -352,7 +352,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
 {
     struct kvm_cpuid2 *cpuid;
     uint32_t ret = 0;
-    uint32_t cpuid_1_edx;
+    uint32_t cpuid_1_edx, unused;
     uint64_t bitmask;
 
     cpuid = get_supported_cpuid(s);
@@ -399,10 +399,20 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     } else if (function == 6 && reg == R_EAX) {
         ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
     } else if (function == 7 && index == 0 && reg == R_EBX) {
+        /* Not new instructions, just an optimization.  */
+        uint32_t ebx;
+        host_cpuid(1, 0, &unused, &ebx, &unused, &unused);
+        ret |= ebx & CPUID_7_0_EBX_ERMS;
+
         if (host_tsx_broken()) {
             ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
         }
     } else if (function == 7 && index == 0 && reg == R_EDX) {
+        /* Not new instructions, just an optimization.  */
+        uint32_t edx;
+        host_cpuid(1, 0, &unused, &unused, &unused, &edx);
+        ret |= edx & CPUID_7_0_EDX_FSRM;
+
         /*
          * Linux v4.17-v4.20 incorrectly return ARCH_CAPABILITIES on SVM hosts.
          * We can detect the bug by checking if MSR_IA32_ARCH_CAPABILITIES is
@@ -411,6 +421,11 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!has_msr_arch_capabs) {
             ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
         }
+    } else if (function == 7 && index == 1 && reg == R_EAX) {
+        /* Not new instructions, just an optimization.  */
+        uint32_t eax;
+        host_cpuid(1, 0, &eax, &unused, &unused, &unused);
+        ret |= eax & (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | CPUID_7_1_EAX_FSRC);
     } else if (function == 0xd && index == 0 &&
                (reg == R_EAX || reg == R_EDX)) {
         /*
-- 
2.39.1


