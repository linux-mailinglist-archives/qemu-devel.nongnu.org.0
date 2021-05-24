Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758038F3FA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:59:34 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGjd-0001H4-3X
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGgE-0004Rp-1V
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:56:03 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGgA-0001kA-Qq
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1621886159; x=1653422159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5pzt10yIIjzwUF6BelVfnSNpnXyncgMpqkanGTHNZ9E=;
 b=Z74vSDASyr5qdoUCxYMlJ8TgtQbIV1iyj8xezQg7qlavOiETkDyAM2T7
 9s1Lnmq8pVWowZawFHD7mYKWV1lt2AfSpdQxVElvOcIRxEhSNuV469Ej1
 AVJllZNAi4s1/9PRLRgwuEEWVgUwr8SKvQrdPTH5mIIX78mc5bOx5EHN8 A=;
X-IronPort-AV: E=Sophos;i="5.82,325,1613433600"; d="scan'208";a="136607583"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 24 May 2021 19:55:49 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 66646100B25; Mon, 24 May 2021 19:55:47 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.253) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 24 May 2021 19:55:43 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH 4/6] kvm/i386: Avoid multiple calls to
 check_extension(KVM_CAP_HYPERV)
Date: Mon, 24 May 2021 21:54:07 +0200
Message-ID: <ff4e06369b32aa715ac37fb51d151681cd66e401.1621885749.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621885749.git.sidcha@amazon.de>
References: <cover.1621885749.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D10UWB004.ant.amazon.com (10.43.161.121) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=207.171.184.29;
 envelope-from=prvs=771b08666=sidcha@amazon.de; helo=smtp-fw-9102.amazon.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 target/i386/kvm/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d19a2913fd..362f04ab3f 100644
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
@@ -715,8 +716,7 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
 
 static bool hyperv_enabled(X86CPU *cpu)
 {
-    CPUState *cs = CPU(cpu);
-    return kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0 &&
+    return has_hyperv &&
         ((cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_NOTIFY) ||
          cpu->hyperv_features || cpu->hyperv_passthrough);
 }
@@ -2172,6 +2172,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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




