Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80643B41AD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:29:08 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwj59-0002jp-MZ
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwj0u-0007E1-V5
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:24:44 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:62683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwj0g-0005Jv-EF
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1624616670; x=1656152670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=emG7j8fZPGMdCYAjeHFKGkXfq8HitffOpSus8mjL/7E=;
 b=s8Wc15TmtcY4WBrvK2PjiVQLourfga+VZ0w9oxa8m24ZciuS1Zaj4Mfc
 ed5LnjR+puThdmsBKXCL5XezZzG977uotsqUGPlzdt1VGrmSKs1DW4i7D
 zGk1ZntC9usALxZrHLK3r6eV/jRe2FO0CzmT/623yfQ1lDpSZQ9Hx/n/P Q=;
X-IronPort-AV: E=Sophos;i="5.83,298,1616457600"; d="scan'208";a="142145158"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 25 Jun 2021 10:24:21 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id BA5A3220122; Fri, 25 Jun 2021 10:24:20 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.183) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 25 Jun 2021 10:24:16 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH v2 4/6] kvm/i386: Avoid multiple calls to
 check_extension(KVM_CAP_HYPERV)
Date: Fri, 25 Jun 2021 12:23:29 +0200
Message-ID: <c11046833369b3bc006ce4fb95d9657b2d7dbad4.1624615713.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624615713.git.sidcha@amazon.de>
References: <cover.1624615713.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.183]
X-ClientProxiedBy: EX13D05UWC004.ant.amazon.com (10.43.162.223) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=207.171.184.29;
 envelope-from=prvs=8031d3708=sidcha@amazon.de; helo=smtp-fw-9102.amazon.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_CAP_HYPERV is a VM ioctl and can be cached at kvm_arch_init()
instead of performing an ioctl each time in hyperv_enabled() which is
called foreach vCPU. Apart from that, this variable will come in handy
in a subsequent patch.

Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
---
 target/i386/kvm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 03202bd06b..bcf1b4f2d0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -93,6 +93,7 @@ static bool has_msr_misc_enable;
 static bool has_msr_smbase;
 static bool has_msr_bndcfgs;
 static int lm_capable_kernel;
+static bool has_hyperv;
 static bool has_msr_hv_hypercall;
 static bool has_msr_hv_crash;
 static bool has_msr_hv_reset;
@@ -716,7 +717,7 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
 
 static bool hyperv_enabled(X86CPU *cpu)
 {
-    return kvm_check_extension(kvm_state, KVM_CAP_HYPERV) > 0 &&
+    return has_hyperv &&
         ((cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_NOTIFY) ||
          cpu->hyperv_features || cpu->hyperv_passthrough);
 }
@@ -2216,6 +2217,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     has_xsave = kvm_check_extension(s, KVM_CAP_XSAVE);
     has_xcrs = kvm_check_extension(s, KVM_CAP_XCRS);
     has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
+    has_hyperv = kvm_check_extension(s, KVM_CAP_HYPERV);
 
     hv_vpindex_settable = kvm_check_extension(s, KVM_CAP_HYPERV_VP_INDEX);
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




