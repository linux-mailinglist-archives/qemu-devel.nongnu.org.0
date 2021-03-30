Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3C34ED03
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:59:25 +0200 (CEST)
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGm3-0007lq-VP
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lRGkC-00079D-Ep
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lRGk2-0002zR-8w
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617119834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+pSf73bcchnYr98D5uePLn+RAaE7LYKNCbBF7Or7+Q=;
 b=fAl4wYbMJE08qfZ4HAjkQBd3BoBzLUtJAG+igW53briNNA4/FfFw4Tmul6FfBpB7cuZnyJ
 DcEB4NZgN3aW4QwtgYeWVhf4LI/iIs2r3hESUALFZ4EZSf8LEdrFL5/nxb9gZ9+L4nY6yt
 K2+Rhr8b3sEp8ETsmxBbdu/p4PO0Kq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-kp-50RbKPdq_8O5TQ18FkA-1; Tue, 30 Mar 2021 11:57:12 -0400
X-MC-Unique: kp-50RbKPdq_8O5TQ18FkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F5187A83E;
 Tue, 30 Mar 2021 15:57:11 +0000 (UTC)
Received: from work-vm (ovpn-114-243.ams2.redhat.com [10.36.114.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC19505AE;
 Tue, 30 Mar 2021 15:57:05 +0000 (UTC)
Date: Tue, 30 Mar 2021 16:57:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
Message-ID: <YGNKTsTLH3CNFQc3@work-vm>
References: <20210330123603.284354-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210330123603.284354-1-vkuznets@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
> Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
> was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
> has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
> explicitly on the command line. This works but the migration fail late and
> this may come as an unpleasant surprise. To make things more explicit,
> require 'tsc-frequency=' on the command line when 'hv-reenlightenment' was
> enabled. Make the change affect 6.0+ machine types only to preserve
> previously-valid configurations valid.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

That looks better for me from a migration point of view:


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/hyperv.txt   |  1 +
>  hw/i386/pc.c      |  1 +
>  target/i386/cpu.c | 23 +++++++++++++++++++++--
>  target/i386/cpu.h |  1 +
>  4 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> index e53c581f4586..5b02d341ab25 100644
> --- a/docs/hyperv.txt
> +++ b/docs/hyperv.txt
> @@ -165,6 +165,7 @@ emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
>  be specified to make migration succeed. The destination host has to either have
>  the same TSC frequency or support TSC scaling CPU feature.
>  
> +Requires: tsc-frequency
>  Recommended: hv-frequencies
>  
>  3.16. hv-evmcs
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a031e..47b79e949ad7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@
>  
>  GlobalProperty pc_compat_5_2[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
> +    { TYPE_X86_CPU, "x-hv-reenlightenment-requires-tscfreq", "off"},
>  };
>  const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f177..751636bafac5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6647,10 +6647,23 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  }
>  
> -static void x86_cpu_hyperv_realize(X86CPU *cpu)
> +static void x86_cpu_hyperv_realize(X86CPU *cpu, Error **errp)
>  {
> +    CPUX86State *env = &cpu->env;
>      size_t len;
>  
> +    /*
> +     * Reenlightenment requires explicit 'tsc-frequency' setting for successful
> +     * migration (see hyperv_reenlightenment_post_load(). As 'hv-passthrough'
> +     * mode is not migratable, we can loosen the restriction.
> +     */
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT) &&
> +        !cpu->hyperv_passthrough && !env->user_tsc_khz &&
> +        cpu->hyperv_reenlightenment_requires_tscfreq) {
> +        error_setg(errp, "'hv-reenlightenment' requires 'tsc-frequency=' to be set");
> +        return;
> +    }
> +
>      /* Hyper-V vendor id */
>      if (!cpu->hyperv_vendor) {
>          memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
> @@ -6846,7 +6859,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>      }
>  
>      /* Process Hyper-V enlightenments */
> -    x86_cpu_hyperv_realize(cpu);
> +    x86_cpu_hyperv_realize(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>  
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> @@ -7374,6 +7391,8 @@ static Property x86_cpu_properties[] = {
>      DEFINE_PROP_INT32("x-hv-max-vps", X86CPU, hv_max_vps, -1),
>      DEFINE_PROP_BOOL("x-hv-synic-kvm-only", X86CPU, hyperv_synic_kvm_only,
>                       false),
> +    DEFINE_PROP_BOOL("x-hv-reenlightenment-requires-tscfreq", X86CPU,
> +                     hyperv_reenlightenment_requires_tscfreq, true),
>      DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
>                       true),
>      DEFINE_PROP_END_OF_LIST()
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878f9..0196a300f018 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1677,6 +1677,7 @@ struct X86CPU {
>      uint32_t hyperv_spinlock_attempts;
>      char *hyperv_vendor;
>      bool hyperv_synic_kvm_only;
> +    bool hyperv_reenlightenment_requires_tscfreq;
>      uint64_t hyperv_features;
>      bool hyperv_passthrough;
>      OnOffAuto hyperv_no_nonarch_cs;
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


