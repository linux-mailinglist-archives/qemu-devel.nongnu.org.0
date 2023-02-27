Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535F86A48B7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhjM-0004gO-Go; Mon, 27 Feb 2023 12:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjK-0004Yn-AR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjI-0004SS-Nc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lomllCW7nDN/Y6izMfkHDcPsISnbquKestIO5XNSkbQ=;
 b=ag01ARiYQKr3YXZWlBmzTJ5bdmVAS1ERBKLKN4xUEN8bkgxYNo5ZCxVBLzwKWgCxFvsBM2
 0oBzjE4d8gXtIx8i+357yq4SvMhwkKJgKwOQk/n29btBGVsD06CVq26aZkxgA56qFfEmW5
 sXPlFBSsyY88b2sd79wj4mnwP5TdS7Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-4QnU5h6yPWypdk0APVS0Bg-1; Mon, 27 Feb 2023 12:56:00 -0500
X-MC-Unique: 4QnU5h6yPWypdk0APVS0Bg-1
Received: by mail-ed1-f69.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so9866868edb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lomllCW7nDN/Y6izMfkHDcPsISnbquKestIO5XNSkbQ=;
 b=Dd4fiLTuDG2G4Wer8CFYF5tHVeg7PDTMOPKQt8vnT4hktyLBvPD10BfDwN1h4Qcu2x
 7VceJFzclVZgewhARiQhtpG97q2wDReVgCv+ecCGto+kVbIyAv5OTFoUmJiTxXxunfzd
 X1BAamQHVNvsEUfcugmScUWrem6q+6+bsDnDSUmwYbeHBBSzvxxu8X27un7+me/0HvF0
 gkhn7eR4B9LXfgz2ltnfzahTgcBngOFCKnGys89hQPzwr3OIQsSaP1Lf+92vsbK2g8Tq
 XtST6BVRORcE1kAM/cmisMO4+BmWiWf7G/f8fIttVSCv9zeSLQ4ny0QTCdspSkJu1rcV
 pVvQ==
X-Gm-Message-State: AO0yUKUnC9g7Qeljw2xzJcfDX98by5EwHnvq13aPXE2JzMjB9E8HtG58
 8H65wLy90PRGPs/ubuIT6/iIfwQ+/ek1Og3o7tgakEA+lB9ygfimjiWp0OOmnQON/Z0R3C1xZXe
 CWQdoAJZTwOGZkc9m2Fpe6EdWFhmGZAgdkXENyVevt3zMnFbZRMEHbd8tOSWb1EsZzz60v8Oo
X-Received: by 2002:a17:907:2ce6:b0:8ec:439f:18fb with SMTP id
 hz6-20020a1709072ce600b008ec439f18fbmr328714ejc.29.1677520558669; 
 Mon, 27 Feb 2023 09:55:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/7sBblZV8/EQ0TLeRj781xeXE4ObwD2S+3WNzGDTbu2Bj/OpOrUJGittUF7vEUwtav1KvY6Q==
X-Received: by 2002:a17:907:2ce6:b0:8ec:439f:18fb with SMTP id
 hz6-20020a1709072ce600b008ec439f18fbmr328692ejc.29.1677520558223; 
 Mon, 27 Feb 2023 09:55:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a170906749d00b008c33ebac259sm3450130ejl.127.2023.02.27.09.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 12/13] target/i386: KVM: allow fast string operations if host
 supports them
Date: Mon, 27 Feb 2023 18:55:23 +0100
Message-Id: <20230227175524.710880-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
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

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 587030199192..d18bd2f3e889 100644
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
+        host_cpuid(7, 0, &unused, &ebx, &unused, &unused);
+        ret |= ebx & CPUID_7_0_EBX_ERMS;
+
         if (host_tsx_broken()) {
             ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
         }
     } else if (function == 7 && index == 0 && reg == R_EDX) {
+        /* Not new instructions, just an optimization.  */
+        uint32_t edx;
+        host_cpuid(7, 0, &unused, &unused, &unused, &edx);
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
+        host_cpuid(7, 1, &eax, &unused, &unused, &unused);
+        ret |= eax & (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | CPUID_7_1_EAX_FSRC);
     } else if (function == 0xd && index == 0 &&
                (reg == R_EAX || reg == R_EDX)) {
         /*
-- 
2.39.1


