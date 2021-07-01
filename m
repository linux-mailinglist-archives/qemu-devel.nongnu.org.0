Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085D3B8F09
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:44:25 +0200 (CEST)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysJ6-0008Ed-8d
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lysI7-0006np-SP
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lysI5-0005NX-Ra
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625129001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Wr3EmZzKKStRdV2oLsZlvZV0Q6FvXuTSxE1GRkVw+4=;
 b=ieLHJkfBRTkguQaSB+BmSc03SrFc0rwUp3yEmOd8tn+xBf0M5Q0Zqlf8iXtwzFoOZw9RIp
 JwB2hAVDwA7xzlqsp0Dg7F/xcLqw9I401LjF3czwlmnKuA4VTslAIyFmUC+TGuMy4CjFMF
 iq5fcxAouWXt7Vvn1GIcb/mKg7sXyyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-_M0lymPJMJSaQzViSzyM9w-1; Thu, 01 Jul 2021 04:43:18 -0400
X-MC-Unique: _M0lymPJMJSaQzViSzyM9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D940E800D62;
 Thu,  1 Jul 2021 08:43:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88D025D6AB;
 Thu,  1 Jul 2021 08:43:14 +0000 (UTC)
Date: Thu, 1 Jul 2021 10:43:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210701104313.5b64a9b4@redhat.com>
In-Reply-To: <162508068941.526217.2563710865841096339@amd.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, armbru@redhat.com,
 wei.huang2@amd.com, richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 14:18:09 -0500
Michael Roth <michael.roth@amd.com> wrote:

> Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> > * zhenwei pi (pizhenwei@bytedance.com) wrote:  
> > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> > > should not be changed to 0x1f in multi-dies case.
> > > 
> > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> > > for multi-dies PCMachine)
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>  
> > 
> > (Copying in Babu)
> > 
> > Hmm I think you're right.  I've cc'd in Babu and Wei.
> > 
> > Eduardo: What do we need to do about compatibility, do we need to wire
> > this to machine type or CPU version?  
> 
> FWIW, there are some other CPUID entries like leaves 2 and 4 that are
> also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
> guests will result in failures when host SNP firmware checks the
> hypervisor-provided CPUID values against the host-supported ones.
> 
> To address this we've been planning to add an 'amd-cpuid-only' property
> to suppress them:
> 
>   https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
> 
> My thinking is this property should be off by default, and only defined
> either via explicit command-line option, or via new CPU types. We're also
> planning to add new CPU versions for EPYC* CPU types that set this
> 'amd-cpuid-only' property by default:
> 
>   https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
It look like having new cpu versions is enough to change behavior,
maybe keep 'amd-cpuid-only' as internal field and not expose it to users
as a property.

> So in general I think maybe this change should be similarly controlled by
> this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
> okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
> range after a guest has already booted (which might happen with old->new
> migration for instance), since it might continue treating values in the range
> as valid afterward (but again, not sure that's the case here or not).
> 
> There's some other changes with the new CPU types that we're still
> considering/testing internally, but should be able to post them in some form
> next week.
> 
> -Mike
> 
> > 
> > Dave
> >   
> > > ---
> > >  target/i386/cpu.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > index a9fe1662d3..3934c559e4 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
> > >              }
> > >          }
> > >  
> > > -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
> > > -        if (env->nr_dies > 1) {
> > > +        /*
> > > +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> > > +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
> > > +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
> > > +         */
> > > +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
> > >              x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> > >          }
> > >  
> > > -- 
> > > 2.25.1
> > > 
> > >   
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> >  
> 


