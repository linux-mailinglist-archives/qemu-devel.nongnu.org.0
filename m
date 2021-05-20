Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B838B7E6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:57:10 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljon7-0002E8-St
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljokR-0007si-VD
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljokL-00027I-2p
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aV8t8hZBMfYUOCUVwaLhcEp/v19oEAuJl0Lqr1MH6HY=;
 b=UlxbGOU23MV5BC8/DMBbW8WqBkSNhrqgL5WjsnAly8Ipx+40EhwIsfONHy3CTqfC8P4Vtz
 Ku1Kx32ki8uOFa6FXqrioa8tfURNOZPvjnseqYV+qa1iLdDYcSLkBofAYn2LsDelkG9kzx
 /VJZSUzBLJKVAE6NdIX4o+i+flt6Ddg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-T5OuLSE-O4qqt9yys79Yhg-1; Thu, 20 May 2021 15:54:14 -0400
X-MC-Unique: T5OuLSE-O4qqt9yys79Yhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A7E8802690
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 19:54:13 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3043560CCC;
 Thu, 20 May 2021 19:54:13 +0000 (UTC)
Date: Thu, 20 May 2021 15:49:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 04/19] i386: stop using env->features[] for filling
 Hyper-V CPUIDs
Message-ID: <20210520194905.lomw2obshfy3anad@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-5-vkuznets@redhat.com>
 <20210501003440.xoqjfmvwxu7ykwva@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210501003440.xoqjfmvwxu7ykwva@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 08:34:40PM -0400, Eduardo Habkost wrote:
> On Thu, Apr 22, 2021 at 06:11:15PM +0200, Vitaly Kuznetsov wrote:
> > As a preparatory patch to dropping Hyper-V CPUID leaves from
> > feature_word_info[] stop using env->features[] as a temporary
> > storage of Hyper-V CPUIDs, just build Hyper-V CPUID leaves directly
> > from kvm_hyperv_properties[] data.
> > 
> > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > ---
> >  target/i386/cpu.h     |  1 +
> >  target/i386/kvm/kvm.c | 80 +++++++++++++++++++++++--------------------
> >  2 files changed, 43 insertions(+), 38 deletions(-)
> > 
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 570f916878f9..c8295aa2a1e7 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1684,6 +1684,7 @@ struct X86CPU {
> >      uint32_t hyperv_interface_id[4];
> >      uint32_t hyperv_version_id[4];
> >      uint32_t hyperv_limits[3];
> > +    uint32_t hyperv_nested[4];
> >  
> >      bool check_cpuid;
> >      bool enforce_cpuid;
> > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > index 7c751185491f..f791baa29acf 100644
> > --- a/target/i386/kvm/kvm.c
> > +++ b/target/i386/kvm/kvm.c
> > @@ -1111,7 +1111,6 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
> >                                    int feature)
> >  {
> >      X86CPU *cpu = X86_CPU(cs);
> > -    CPUX86State *env = &cpu->env;
> >      uint32_t r, fw, bits;
> >      uint64_t deps;
> >      int i, dep_feat;
> > @@ -1151,8 +1150,6 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
> >                  return 0;
> >              }
> >          }
> > -
> > -        env->features[fw] |= bits;
> >      }
> >  
> >      if (cpu->hyperv_passthrough) {
> > @@ -1162,6 +1159,29 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
> >      return 0;
> >  }
> >  
> > +static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t fw)
> > +{
> > +    X86CPU *cpu = X86_CPU(cs);
> > +    uint32_t r = 0;
> > +    int i, j;
> > +
> > +    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties); i++) {
> > +        if (!hyperv_feat_enabled(cpu, i)) {
> > +            continue;
> > +        }
> > +
> > +        for (j = 0; j < ARRAY_SIZE(kvm_hyperv_properties[i].flags); j++) {
> > +            if (kvm_hyperv_properties[i].flags[j].fw != fw) {
> > +                continue;
> > +            }
> > +
> > +            r |= kvm_hyperv_properties[i].flags[j].bits;
> > +        }
> > +    }
> > +
> > +    return r;
> > +}
> > +
> >  /*
> >   * Fill in Hyper-V CPUIDs. Returns the number of entries filled in cpuid_ent in
> >   * case of success, errno < 0 in case of failure and 0 when no Hyper-V
> > @@ -1171,9 +1191,8 @@ static int hyperv_handle_properties(CPUState *cs,
> >                                      struct kvm_cpuid_entry2 *cpuid_ent)
> >  {
> >      X86CPU *cpu = X86_CPU(cs);
> > -    CPUX86State *env = &cpu->env;
> >      struct kvm_cpuid2 *cpuid;
> > -    struct kvm_cpuid_entry2 *c;
> > +    struct kvm_cpuid_entry2 *c, *c2;
> >      uint32_t cpuid_i = 0;
> >      int r;
> >  
> > @@ -1194,9 +1213,7 @@ static int hyperv_handle_properties(CPUState *cs,
> >          }
> >  
> >          if (!r) {
> 
> I think I now I understand why removing FEAT_HYPERV_* makes sense:
> 
> The rules mapping hyperv features to CPUID bits were encoded
> twice in the code: in both hyperv_handle_properties() and
> kvm_hyperv_properties[].  More work to maintain the rules, and
> too easy to accidentally make them inconsistent.
> 
> 
> Now, let me see if I can prove to myself that the new code works:
> 
> > -            env->features[FEAT_HV_RECOMM_EAX] |=
> > -                HV_ENLIGHTENED_VMCS_RECOMMENDED;
> 
> [Line1]
> 
> The only code reading env->features[FEAT_HV_RECOMM_EAX] seems to
> be [Line2] below:
> 
>   eax = env->features[FEAT_HV_RECOMM_EAX];
> 
> which is replaced with [Line3]:
> 
>   c->eax = hv_build_cpuid_leaf(cs, FEAT_HV_RECOMM_EAX);
> 
> so if hv_build_cpuid_leaf() do its job and set return
> HV_ENLIGHTENED_VMCS_RECOMMENDED set at [Line2], we can safely
> delete [Line1].
> 
> Will hv_build_cpuid_leaf() set HV_ENLIGHTENED_VMCS_RECOMMENDED in
> [Line2] for all cases where [Line1] was being executed?
> 
> Let's check what's necessary to make hv_build_cpuid_leaf()
> set HV_ENLIGHTENED_VMCS_RECOMMENDED:
> 
> There's only one entry with
> FEAT_HV_RECOMM_EAX/HV_ENLIGHTENED_VMCS_RECOMMENDED at
> kvm_hyperv_properties:
> 
>     [HYPERV_FEAT_EVMCS] = {
>         .desc = "enlightened VMCS (hv-evmcs)",
>         .flags = {
>             {.fw = FEAT_HV_RECOMM_EAX,
>              .bits = HV_ENLIGHTENED_VMCS_RECOMMENDED}
>         },
>         .dependencies = BIT(HYPERV_FEAT_VAPIC)
>     },
> 
> The logic at hv_build_cpuid_leaf() will make
> HV_ENLIGHTENED_VMCS_RECOMMENDED be set only if
> hyperv_feat_enabled(HYPERV_FEAT_EVMCS) is true.  Which is what I
> expected, because the line of code you are removing is inside a
> hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) conditional.
> 
> For reference, hyperv_feat_enabled(cpu, feat) returns:
>   !!(cpu->hyperv_features & BIT(feat))
> 
> I don't see any code _clearing_ hyperv_features, except for
> properties that could change hyperv_features.  I don't expect the
> "hv-evmcs" QOM property to be touched by this function, so we
> should be safe: if hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)
> returned before executing [Line1], it will return true when
> executing [Line2].
> 
> This means hv_build_cpuid_leaf() will set
> HV_ENLIGHTENED_VMCS_RECOMMENDED if
> hyperv_feat_enabled(HYPERV_FEAT_EVMCS) is true, and
> hyperv_feat_enabled(HYPERV_FEAT_EVMCS) will be true at [Line2] on
> all cases when [Line1] was being executed.
> 
> We also need to be sure the HV_ENLIGHTENED_VMCS_RECOMMENDED will
> be _unset_ at hv_build_cpuid_leaf() when expected, but the rules
> are trickier (due to hyperv_passthrough). I'll try to prove that
> later.
> 
> 
> > -            env->features[FEAT_HV_NESTED_EAX] = evmcs_version;
> 
> [Line4]
> 
> 
> Can we delete [Line4]?
> 
> The only code reading env->features[FEAT_HV_NESTED_EAX]
> is [Line5]:
>     c->eax = env->features[FEAT_HV_NESTED_EAX];
> which is replaced with [Line6]:
>     c->eax = cpu->hyperv_nested[0];
> 
> We are also replacing env->features[FEAT_HV_NESTED_EAX] with
> cpu->hyperv_nested[0], here:
> 
> > +            cpu->hyperv_nested[0] = evmcs_version;
> 
> This will make [Line6] set c->eax to evmcs_version, unless other
> code writes to cpu->hyperv_nested[0].
> 
> I don't see any other code writing to hyperv_nested in this
> patch, so we are good.
> 
> >          }
> >      }
> >  
> > @@ -1235,13 +1252,6 @@ static int hyperv_handle_properties(CPUState *cs,
> >              cpu->hyperv_version_id[3] = c->edx;
> >          }
> >  
> > -        c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
> > -        if (c) {
> > -            env->features[FEAT_HYPERV_EAX] = c->eax;
> 
> [Line7A]
> 
> > -            env->features[FEAT_HYPERV_EBX] = c->ebx;
> 
> [Line7B]
> 
> > -            env->features[FEAT_HYPERV_EDX] = c->edx;
> 
> [Line7D]
> 
> 
> Can we delete [Line7*]?
> 
> The only code reading env->features[FEAT_HYPERV_*] seems to be
> [Line8*]:
>     c->eax = env->features[FEAT_HYPERV_EAX];
>     c->ebx = env->features[FEAT_HYPERV_EBX];
>     c->edx = env->features[FEAT_HYPERV_EDX];
> which is replaced by [Line9*]:
>     c->eax = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EAX);
>     c->ebx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EBX);
>     c->edx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EDX);
> 
> So we need to make sure hv_build_cpuid_leaf() will return the
> right values at [Line9*].
> 
> This one will be trickier to evaluate: there are lots of entries in
> kvm_hyperv_properties[] that affect FEAT_HYPERV_EAX.
> 
> I will pause here and continue next week.   :)
> 

Continuing:

So, [Line7*] above was for hyperv_passthrough mode only.  This
means now hv-passthrough will enable only known features (the
ones at kvm_hyperv_properties).

The same comment I sent to the previous patch applies here:

"""
This makes hv-passthrough less useful for debugging and
development, but safer for using in production.  I assume we want
to eventually make hv-passthrough supported in production when
live migration support isn't required.

I'll trust your judgement here and assume this is really a good
change, but maybe this should be documented more explicitly in
the hv-passthrough section at docs/hyperv.txt?
"""



> This smells like it could have been split into smaller patches,
> but I'm not sure if it would be possible.  Maybe the existing
> code was too tangled for splitting this refactor into smaller
> patches.
> 
> 
> > -        }
> > -
> >          c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
> >          if (c) {
> >              cpu->hv_max_vps = c->eax;
> > @@ -1252,23 +1262,8 @@ static int hyperv_handle_properties(CPUState *cs,
> >  
> >          c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
> >          if (c) {
> > -            env->features[FEAT_HV_RECOMM_EAX] = c->eax;

Same as above: this is hv-passthrough code, and the comment above
applies.

> >              cpu->hyperv_spinlock_attempts = c->ebx;
> >          }
> > -        c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
> > -        if (c) {
> > -            env->features[FEAT_HV_NESTED_EAX] = c->eax;
> > -        }

Same as above: this is hv-passthrough code, and the comment above
applies.

> > -    }
> > -

Now we're outside the hv-passthrough code:

> > -    if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
> > -        env->features[FEAT_HV_RECOMM_EAX] |= HV_NO_NONARCH_CORESHARING;
> > -    } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
> > -        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
> > -        if (c) {
> > -            env->features[FEAT_HV_RECOMM_EAX] |=
> > -                c->eax & HV_NO_NONARCH_CORESHARING;
> > -        }
> >      }

The hack above is copied to [Line10] below.  Looks OK.

> >  
> >      /* Features */
> > @@ -1298,9 +1293,6 @@ static int hyperv_handle_properties(CPUState *cs,
> >          r |= 1;
> >      }
> >  
> > -    /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
> > -    env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;

The hack above is copied to [Line10] below.  Looks OK.

> > -
> >      if (r) {
> >          r = -ENOSYS;
> >          goto free;
> > @@ -1330,15 +1322,27 @@ static int hyperv_handle_properties(CPUState *cs,
> >  
> >      c = &cpuid_ent[cpuid_i++];
> >      c->function = HV_CPUID_FEATURES;
> > -    c->eax = env->features[FEAT_HYPERV_EAX];
> 
> [Line8A]
> 
> > -    c->ebx = env->features[FEAT_HYPERV_EBX];
> 
> [Line8B]
> 
> > -    c->edx = env->features[FEAT_HYPERV_EDX];
> 
> [Line8D]
> 
> > +    c->eax = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EAX);
> 
> [Line9A]
> 
> > +    c->ebx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EBX);
> 
> [Line9B]
> 
> > +    c->edx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EDX);
> 
> [Line9D]

Already reviewed at [Line7*] above.

> 
> > +
> > +    /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
> > +    c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;

[Line11]

Looks OK, but I wonder if this could be encoded in
kvm_hyperv_properties somehow.


> >  
> >      c = &cpuid_ent[cpuid_i++];
> >      c->function = HV_CPUID_ENLIGHTMENT_INFO;
> > -    c->eax = env->features[FEAT_HV_RECOMM_EAX];
> 
> [Line2]
> 
> > +    c->eax = hv_build_cpuid_leaf(cs, FEAT_HV_RECOMM_EAX);
> 
> [Line3]
> 
> >      c->ebx = cpu->hyperv_spinlock_attempts;
> >  
> > +    if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
> > +        c->eax |= HV_NO_NONARCH_CORESHARING;
> > +    } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
> > +        c2 = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
> > +        if (c2) {
> > +            c->eax |= c2->eax & HV_NO_NONARCH_CORESHARING;
> > +        }
> > +    }

[Line10]

Matches the code above.

> > +
> >      c = &cpuid_ent[cpuid_i++];
> >      c->function = HV_CPUID_IMPLEMENT_LIMITS;
> >      c->eax = cpu->hv_max_vps;
> > @@ -1358,7 +1362,7 @@ static int hyperv_handle_properties(CPUState *cs,
> >  
> >          c = &cpuid_ent[cpuid_i++];
> >          c->function = HV_CPUID_NESTED_FEATURES;
> > -        c->eax = env->features[FEAT_HV_NESTED_EAX];
> > +        c->eax = cpu->hyperv_nested[0];
> >      }
> >      r = cpuid_i;
> >  
> > -- 
> > 2.30.2
> > 
> 

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Sorry for the long delay in reviewing this!

-- 
Eduardo


