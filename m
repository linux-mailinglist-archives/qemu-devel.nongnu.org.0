Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421F52E6D8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 10:01:10 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrxZM-00032W-1U
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 04:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1nrxVQ-00019q-LC
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:57:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:49166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1nrxVN-0000xX-GQ
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653033421; x=1684569421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K66iNWUluPW9Kwal4hSKalQR56Ch2PBL7m4eEpj9Jzk=;
 b=Q/nJyREKzgz3rDdjtFclIPUUiJbG3Bu1IzZdmq40Wl8lX7ELCFzjTR1b
 o2l0FswcXwZDyPazhwy4ehRkol4UCOvKmSFqPi2qPML2U9OQ6IZF1E63n
 dIxj1/6zaAvfgfy8QMo5YIrkqp1tHzRXaHKBKsjd3ccxnAkEHzWH9B0By
 DRPgwdPt2spDkBDR9u376w1beiGcDfm07n5XBKTMhh7OgOIS1FfOna/Ni
 LeyRAvHEsOVLjBisG2txh+S/mJP6p1XFcnL+M+zwVPAkS4BYXhmt/L72+
 gcGkIJzqm4vRmjmhSIPCV9OCrtwngJ+8UxD/ToiJ/0PvZa+Q9XfXHkExz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="270113852"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="270113852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 00:56:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="701628535"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 00:56:55 -0700
Date: Fri, 20 May 2022 15:56:46 +0800
From: Chao Gao <chao.gao@intel.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [QEMU PATCH] x86: Set maximum APIC ID to KVM prior to vCPU
 creation
Message-ID: <20220520075641.GA22216@gao-cwp>
References: <20220520063928.23645-1-guang.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520063928.23645-1-guang.zeng@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chao.gao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 20, 2022 at 02:39:28PM +0800, Zeng Guang wrote:
>Specify maximum possible APIC ID assigned for current VM session prior to
>the creation of vCPUs. KVM need set up VM-scoped data structure indexed by
>the APIC ID, e.g. Posted-Interrupt Descriptor table to support Intel IPI
>virtualization.
>
>It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
>capability once KVM has already enabled it. Otherwise, simply prompts
>that KVM doesn't support this capability yet.
>
>Signed-off-by: Zeng Guang <guang.zeng@intel.com>
>---
> hw/i386/x86.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>index 4cf107baea..ff74492325 100644
>--- a/hw/i386/x86.c
>+++ b/hw/i386/x86.c
>@@ -106,7 +106,7 @@ out:
> 
> void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
> {
>-    int i;
>+    int i, ret;
>     const CPUArchIdList *possible_cpus;
>     MachineState *ms = MACHINE(x86ms);
>     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>@@ -123,6 +123,13 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>      */
>     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
>                                                       ms->smp.max_cpus - 1) + 1;
>+
>+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID,
>+                            0, x86ms->apic_id_limit);
>+    if (ret < 0) {
>+        error_report("kvm: Set max vcpu id not supported: %s", strerror(-ret));
>+    }

This piece of code is specific to KVM. Please move it to kvm-all.c and
invoke a wrapper function here. As kvm accelerator isn't necessarily
enabled, the function call should be guarded by kvm_enabled().

And I think the error message can be omitted because the failure doesn't
impact functionality; just a few more pages will be allocated by KVM.

