Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E13BA3AC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:34:17 +0200 (CEST)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzN3Q-0006YZ-Az
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lzN1m-00051z-6u
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lzN1i-0002ve-Pp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625247148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDEWrTP/+0cvsPxrN9xUDP75devV7BvqIH+Yc7KG/7E=;
 b=c4PWrhK84OgkbOrKGGQ/bt2ZhXaDuCCNl/3Acz5UMkcGPDp2TiBVVmaklOjwwDi8y5EPoW
 ZkQijc6w71ujD56xCUHKECzL6Jf3Jn9GRq1ysuOtTLHElMa0NFMig37t4wIHxxF3O5xkrl
 F8ns0gwrEW/5Phfkx94toUbpMtPynw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-SMJLnFawOjq3wUwFy5YSSQ-1; Fri, 02 Jul 2021 13:32:26 -0400
X-MC-Unique: SMJLnFawOjq3wUwFy5YSSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C7C801B0A;
 Fri,  2 Jul 2021 17:32:24 +0000 (UTC)
Received: from localhost (unknown [10.22.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AFD19D7C;
 Fri,  2 Jul 2021 17:32:23 +0000 (UTC)
Date: Fri, 2 Jul 2021 13:32:23 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210702173223.vjb2gfwxfnphrv3y@habkost.net>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
MIME-Version: 1.0
In-Reply-To: <162508068941.526217.2563710865841096339@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: like.xu@linux.intel.com, armbru@redhat.com, wei.huang2@amd.com,
 richard.henderson@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 02:18:09PM -0500, Michael Roth wrote:
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

If the change doesn't affect runnability of the CPU in a given
host (i.e. it doesn't introduce or remove host software or
hardware dependencies), it can be enabled for all CPU types in
newer machine types.

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

KVM has a hack that changes the CPUID vendor info depending on
the host (ignoring X86CPUDefinition.vendor completely).  For that
reason, I would make the new behavior tied to the actual CPU
vendor seen by the guest, not to the CPU type.  It will be a bit
more complicated, but less likely to cause problems when
management software tries to auto-detect the CPU model and
guesses a model from the wrong vendor.

We still need to keep compatibility somehow, though:

> 
> So in general I think maybe this change should be similarly controlled by
> this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
> okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
> range after a guest has already booted (which might happen with old->new
> migration for instance), since it might continue treating values in the range
> as valid afterward (but again, not sure that's the case here or not).

I agree, especially if the planned CPUID changes are more
intrusive than just CPUID level adjustments.

I suggest adding a "vendor-cpuid-only" property, that would
hide CPUID leaves depending on the actual CPUID vendor seen by
the guest.  Older machine types can set vendor-cpuid-only=off,
and newer machine-types would have vendor-cpuid-only=on by
default.


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

-- 
Eduardo


