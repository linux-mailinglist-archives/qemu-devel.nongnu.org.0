Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24B2CAE16
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:13:52 +0100 (CET)
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCy7-0000VV-5l
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkCwW-0008IS-Ih
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkCwT-0001UI-RR
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606857128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2+M1j+RC0W8KBkzIavXAsQFhBd4EwUIakg7CW55zuzg=;
 b=ir6fp2tg+Zp60ItusSbGRFJ1DI6GEBDN2HkbeH93DYpfTwfA/APERs9/kcsLHN4txFxqlB
 QjA9AXHRSI0Sgp/R9OgMEKa+ABmdtbjCyYvgAqYoUWStdns7JetpQGHlVo9ah9nxast19R
 yobBmjTrlMA48i2lKsSXD393adNbpmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-BK4D9WyrM9Ga-4xr24I6Aw-1; Tue, 01 Dec 2020 16:12:05 -0500
X-MC-Unique: BK4D9WyrM9Ga-4xr24I6Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92985185E486;
 Tue,  1 Dec 2020 21:12:04 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08FA05C1BB;
 Tue,  1 Dec 2020 21:12:03 +0000 (UTC)
Date: Tue, 1 Dec 2020 16:12:02 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luwei Kang <luwei.kang@intel.com>
Subject: Re: [PATCH 1/2] i386/cpu: Add the Intel PT capabilities checking
 before extend the CPUID level
Message-ID: <20201201211202.GA3836@habkost.net>
References: <20201014080443.23751-1-luwei.kang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201014080443.23751-1-luwei.kang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Sorry for the long delay in reviewing this.  Now that 5.2 is
about to be released, we can try to merge this.

Comments below:

On Wed, Oct 14, 2020 at 04:04:42PM +0800, Luwei Kang wrote:
> The current implementation will extend the CPUID level to 0x14 if
> Intel PT is enabled in the guest(in x86_cpu_expand_features()) and
> the Intel PT will be disabled if it can't pass the capabilities
> checking later(in x86_cpu_filter_features()). In this case, the
> level of CPUID will be still 0x14 and the CPUID values from leaf
> 0xe to 0x14 are all zero.
> 
> This patch moves the capabilities checking before setting the
> level of the CPUID.

Why is this patch necessary and what problem does it fix?  Is it
a nice to have feature, or a bug fix?

If you still want to change how the x86_cpu_adjust_level() code
behaves, it should apply to all features filtered by
x86_cpu_filter_features(), not just intel-pt, shouldn't it?

> 
> Signed-off-by: Luwei Kang <luwei.kang@intel.com>
> ---
>  target/i386/cpu.c | 63 ++++++++++++++++++++++++-----------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 9eafbe3690..24644abfd4 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6401,12 +6401,40 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>  
>          /* Intel Processor Trace requires CPUID[0x14] */
>          if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> -            if (cpu->intel_pt_auto_level) {
> -                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
> -            } else if (cpu->env.cpuid_min_level < 0x14) {
> +            uint32_t eax_0, ebx_0, ecx_0, eax_1, ebx_1;
> +
> +            eax_0 = kvm_arch_get_supported_cpuid(kvm_state, 0x14, 0, R_EAX);
> +            ebx_0 = kvm_arch_get_supported_cpuid(kvm_state, 0x14, 0, R_EBX);
> +            ecx_0 = kvm_arch_get_supported_cpuid(kvm_state, 0x14, 0, R_ECX);
> +            eax_1 = kvm_arch_get_supported_cpuid(kvm_state, 0x14, 1, R_EAX);
> +            ebx_1 = kvm_arch_get_supported_cpuid(kvm_state, 0x14, 1, R_EBX);
> +
> +            if (eax_0 &&
> +               ((ebx_0 & INTEL_PT_MINIMAL_EBX) == INTEL_PT_MINIMAL_EBX) &&
> +               ((ecx_0 & INTEL_PT_MINIMAL_ECX) == INTEL_PT_MINIMAL_ECX) &&
> +               ((eax_1 & INTEL_PT_MTC_BITMAP) == INTEL_PT_MTC_BITMAP) &&
> +               ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) >=
> +                                           INTEL_PT_ADDR_RANGES_NUM) &&
> +               ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ==
> +                    (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) &&
> +               !(ecx_0 & INTEL_PT_IP_LIP)) {
> +                if (cpu->intel_pt_auto_level) {
> +                    x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
> +                } else if (cpu->env.cpuid_min_level < 0x14) {
> +                    mark_unavailable_features(cpu, FEAT_7_0_EBX,
> +                        CPUID_7_0_EBX_INTEL_PT,
> +                        "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,+intel-pt,min-level=0x14\"");
> +                }
> +            } else {
> +               /*
> +                * Processor Trace capabilities aren't configurable, so if the
> +                * host can't emulate the capabilities we report on
> +                * cpu_x86_cpuid(), intel-pt can't be enabled on the current
> +                * host.
> +                */
>                  mark_unavailable_features(cpu, FEAT_7_0_EBX,
>                      CPUID_7_0_EBX_INTEL_PT,
> -                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,+intel-pt,min-level=0x14\"");
> +                    "host Intel PT features doesn't satisfy the guest request.");
>              }
>          }
>  
> @@ -6466,33 +6494,6 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>          uint64_t unavailable_features = requested_features & ~host_feat;
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
> -
> -    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
> -        kvm_enabled()) {
> -        KVMState *s = CPU(cpu)->kvm_state;
> -        uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
> -        uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
> -        uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
> -        uint32_t eax_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EAX);
> -        uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);
> -
> -        if (!eax_0 ||
> -           ((ebx_0 & INTEL_PT_MINIMAL_EBX) != INTEL_PT_MINIMAL_EBX) ||
> -           ((ecx_0 & INTEL_PT_MINIMAL_ECX) != INTEL_PT_MINIMAL_ECX) ||
> -           ((eax_1 & INTEL_PT_MTC_BITMAP) != INTEL_PT_MTC_BITMAP) ||
> -           ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
> -                                           INTEL_PT_ADDR_RANGES_NUM) ||
> -           ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
> -                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
> -           (ecx_0 & INTEL_PT_IP_LIP)) {
> -            /*
> -             * Processor Trace capabilities aren't configurable, so if the
> -             * host can't emulate the capabilities we report on
> -             * cpu_x86_cpuid(), intel-pt can't be enabled on the current host.
> -             */
> -            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
> -        }
> -    }
>  }
>  
>  static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> -- 
> 2.18.4
> 

-- 
Eduardo


