Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B64E60F0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:15:34 +0100 (CET)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJZ7-0002uj-Ao
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:15:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJX1-00025r-6s
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJWx-0007fo-6m
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648113197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zSbR2A9iVUhydJj8RIeOuBxFFNZ15r0M8y7EQnzB6Ik=;
 b=MlYXizzlkGP/4+mNcjTMg+LVl7OgDeTCmGb9f2ibcSWB8HLWSjw5Jc41E9L8SHfBn0RUMc
 ZhnvyK8KsU2ob2edZdGbm2XqnGW8bZCXSOh6k171mB3MJpX5pG2gLfmVQU/jk2RjUU3FJu
 6qIFkrmtWrsNt1uGHdz0/QS4OAs2aQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-5UYmMxrYPeGxuQ8DT8fdpg-1; Thu, 24 Mar 2022 05:13:16 -0400
X-MC-Unique: 5UYmMxrYPeGxuQ8DT8fdpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3430C18E531C
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 09:13:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90BD6C27D86;
 Thu, 24 Mar 2022 09:13:15 +0000 (UTC)
Date: Thu, 24 Mar 2022 09:13:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: introduce CPU property to work around
 Windows reset bug
Message-ID: <Yjw2KG4y8fK5Dw4F@redhat.com>
References: <20220324082346.72180-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324082346.72180-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 09:23:46AM +0100, Paolo Bonzini wrote:
> Some versions of Windows hang on reboot if their TSC value is greater
> than 2^54.  The calibration of the Hyper-V reference time overflows
> and fails; as a result the processors' clock sources are out of sync.
> As a workaround, reset the TSC to a small value.  Do not do this
> unconditionally and require a special property to be set.

What's the problem with doing it unconditionally ?

Requiring this special niche property means that it'll have to be
enabled by management apps. Most will never learn it exists, and
of those that do, many will take years to get this enabled and
into usage by users, and many won't even bother.

IMHO, this is the kind of situation where we need the fix to be
enabled by default, or we might as well not bother.

> 
> Reported-by: Vadim Rozenfeld <vrozenfe@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c | 10 ++++++++++
>  target/i386/cpu.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ec3b50bf6e..9b29cea8c4 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5931,6 +5931,15 @@ static void x86_cpu_reset(DeviceState *dev)
>      env->xstate_bv = 0;
>  
>      env->pat = 0x0007040600070406ULL;
> +
> +    /*
> +     * Some versions of Windows hang on reboot if their TSC value is greater
> +     * than 2^54.  As a workaround, reset the TSC to a small value.  Do not use
> +     * zero, KVM applies special heuristics for CPU startup when TSC is cleared.
> +     */
> +    if (cpu->tsc_clear_on_reset) {
> +        env->tsc = 1;
> +    }
>      env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
>      if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
>          env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
> @@ -6957,6 +6966,7 @@ static Property x86_cpu_properties[] = {
>                       false),
>      DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
>      DEFINE_PROP_BOOL("tcg-cpuid", X86CPU, expose_tcg, true),
> +    DEFINE_PROP_BOOL("tsc-clear-on-reset", X86CPU, tsc_clear_on_reset, true),
>      DEFINE_PROP_BOOL("x-migrate-smi-count", X86CPU, migrate_smi_count,
>                       true),
>      /*
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index e31e6bd8b8..66f7901729 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1864,6 +1864,9 @@ struct ArchCPU {
>      /* Forcefully disable KVM PV features not exposed in guest CPUIDs */
>      bool kvm_pv_enforce_cpuid;
>  
> +    /* Clear TSC on reset */
> +    bool tsc_clear_on_reset;
> +
>      /* Number of physical address bits supported */
>      uint32_t phys_bits;
>  
> -- 
> 2.35.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


