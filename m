Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3334D2DA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:52:08 +0200 (CEST)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtFP-0004CB-76
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lQtCu-00030y-GC
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lQtCp-0002yS-QE
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617029366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mPOxFs9jHTEG/2pU3P/BqdEJcn3SM758fByuuvtdLrQ=;
 b=IKtB/sqTcz/tOJXPQ1sUdFgjg/0iVnhQ8CSFeickHUH8nvpfqAWUkwcTc7n6J6Xapq1qSD
 fH1T8fglMz56PEm43KZYDvHctk2QKzUK+u0TPaKMdKV5B2ig7Q8FakdYPo4sygXb7r48PQ
 r+WdRq3j0RF9j98p3695sAOcIr0XpJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-b9sEbFWvNxuZtyW81djcXA-1; Mon, 29 Mar 2021 10:49:24 -0400
X-MC-Unique: b9sEbFWvNxuZtyW81djcXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23890108BD0D;
 Mon, 29 Mar 2021 14:49:23 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A855B10016FD;
 Mon, 29 Mar 2021 14:49:15 +0000 (UTC)
Date: Mon, 29 Mar 2021 15:49:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v2] i386: Make migration fail when Hyper-V
 reenlightenment was enabled but 'user_tsc_khz' is unset
Message-ID: <YGHo6WiRVcmVrnSZ@work-vm>
References: <20210319123801.1111090-1-vkuznets@redhat.com>
 <YGHGR9LkV92k0IF2@work-vm> <87y2e69lg8.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87y2e69lg8.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
> >> KVM doesn't fully support Hyper-V reenlightenment notifications on
> >> migration. In particular, it doesn't support emulating TSC frequency
> >> of the source host by trapping all TSC accesses so unless TSC scaling
> >> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
> >> is unsafe to proceed with migration.
> >> 
> >> KVM_SET_TSC_KHZ is called from two sites: kvm_arch_init_vcpu() and
> >> kvm_arch_put_registers(). The later (intentionally) doesn't propagate
> >> errors allowing migrations to succeed even when TSC scaling is not
> >> supported on the destination. This doesn't suit 're-enlightenment'
> >> use-case as we have to guarantee that TSC frequency stays constant.
> >> 
> >> Require 'tsc-frequency=' command line option to be specified for successful
> >> migration when re-enlightenment was enabled by the guest.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >> This patch is a successor of "[PATCH 3/3] i386: Make sure
> >> kvm_arch_set_tsc_khz() succeeds on migration when 'hv-reenlightenment'
> >> was exposed" taking a different approach suggested by Paolo.
> >> ---
> >>  docs/hyperv.txt                |  5 +++++
> >>  target/i386/kvm/hyperv-proto.h |  1 +
> >>  target/i386/machine.c          | 20 ++++++++++++++++++++
> >>  3 files changed, 26 insertions(+)
> >> 
> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> >> index 5df00da54fc4..e53c581f4586 100644
> >> --- a/docs/hyperv.txt
> >> +++ b/docs/hyperv.txt
> >> @@ -160,6 +160,11 @@ the hypervisor) until it is ready to switch to the new one. This, in conjunction
> >>  with hv-frequencies, allows Hyper-V on KVM to pass stable clocksource (Reference
> >>  TSC page) to its own guests.
> >>  
> >> +Note, KVM doesn't fully support re-enlightenment notifications and doesn't
> >> +emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
> >> +be specified to make migration succeed. The destination host has to either have
> >> +the same TSC frequency or support TSC scaling CPU feature.
> >> +
> >>  Recommended: hv-frequencies
> >>  
> >>  3.16. hv-evmcs
> >> diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
> >> index 056a305be38c..e30d64b4ade4 100644
> >> --- a/target/i386/kvm/hyperv-proto.h
> >> +++ b/target/i386/kvm/hyperv-proto.h
> >> @@ -139,6 +139,7 @@
> >>   * Reenlightenment notification MSRs
> >>   */
> >>  #define HV_X64_MSR_REENLIGHTENMENT_CONTROL      0x40000106
> >> +#define HV_REENLIGHTENMENT_ENABLE_BIT           (1u << 16)
> >>  #define HV_X64_MSR_TSC_EMULATION_CONTROL        0x40000107
> >>  #define HV_X64_MSR_TSC_EMULATION_STATUS         0x40000108
> >>  
> >> diff --git a/target/i386/machine.c b/target/i386/machine.c
> >> index 7259fe6868c6..137604ddb898 100644
> >> --- a/target/i386/machine.c
> >> +++ b/target/i386/machine.c
> >> @@ -883,11 +883,31 @@ static bool hyperv_reenlightenment_enable_needed(void *opaque)
> >>          env->msr_hv_tsc_emulation_status != 0;
> >>  }
> >>  
> >> +static int hyperv_reenlightenment_post_load(void *opaque, int version_id)
> >> +{
> >> +    X86CPU *cpu = opaque;
> >> +    CPUX86State *env = &cpu->env;
> >> +
> >> +    /*
> >> +     * KVM doesn't fully support re-enlightenment notifications so we need to
> >> +     * make sure TSC frequency doesn't change upon migration.
> >> +     */
> >> +    if ((env->msr_hv_reenlightenment_control & HV_REENLIGHTENMENT_ENABLE_BIT) &&
> >> +        !env->user_tsc_khz) {
> >> +        error_report("Guest enabled re-enlightenment notifications, "
> >> +                     "'tsc-frequency=' has to be specified");
> >
> > It's unusual to fail on the destination for a valid configuration but
> > guest state;  wouldn't it be better to always insist on tsc-frequency if
> > that hv feature is exposed; failing early before reeiving the state?
> >
> 
> Doing so would make a number of currently existing configurations
> invalid, even when re-enlightenment is not to be used by the
> guest. AFAIR Windows without Hyper-V doesn't enable it. Generally, we
> just advise people to 'enable all currently supported hyper-v
> enlightenments' to make things easier so reenlightenment may end up
> being added for no particular reason.

Ouch, that's difficult - the problem with testing this late is that the
migration fails right at the end so it's an unpleasent surprise.

Could you disallow re-enlightenment without tsc-frequency on new machine
types?

Dave

> FWIW, v1 of this patch used a slightly different approach: I was
> requiring kvm_arch_set_tsc_khz() to succeed. This is not exactly the
> same as e.g. even when the destination host doesn't support TSC scaling,
> it may happen to have the same TSC frequency.
> 
> -- 
> Vitaly
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


