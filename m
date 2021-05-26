Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A2391DA5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:14:17 +0200 (CEST)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx6m-0008Jv-HF
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwyh-0007OD-3L
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwyU-0004OS-8n
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GctZcgq7AFX2XuG40j0XSS2NfTtS9uBcAEW/HASgVIw=;
 b=gr2k2tZyGXF2Csc3LQbbDzPFWiwcVub1/+iZ16z7rMH7BypjOyqNLpHG9Ym3GJl7Vx3qJ2
 Pzu93tEgjD2s7xsH3eTXbbhAe7sCHALrtTzpJnFY+5Y8OQ5I+ukHRyr0WzBfe5MTVxJEit
 oRaW/2S4tj9V5wY237Fg/nbXAcGeKQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-4xqb3f-cMUOe72bq-iU2hA-1; Wed, 26 May 2021 13:05:38 -0400
X-MC-Unique: 4xqb3f-cMUOe72bq-iU2hA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BECA9F92B
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 17:05:37 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7714A5D723;
 Wed, 26 May 2021 17:05:31 +0000 (UTC)
Date: Wed, 26 May 2021 13:05:30 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is
 always needed
Message-ID: <20210526170530.ugirlteyzamogysz@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-18-vkuznets@redhat.com>
 <20210521220637.kg6g7lfvpwasnzez@habkost.net>
 <878s44723s.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <878s44723s.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, May 24, 2021 at 02:22:47PM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Apr 22, 2021 at 06:11:28PM +0200, Vitaly Kuznetsov wrote:
> >> According to TLFS, Hyper-V guest is supposed to check
> >> HV_HYPERCALL_AVAILABLE privilege bit before accessing
> >> HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
> >> Windows versions ignore that. As KVM is very permissive and allows
> >> accessing these MSRs unconditionally, no issue is observed. We may,
> >> however, want to tighten the checks eventually. Conforming to the
> >> spec is probably also a good idea.
> >> 
> >> Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >
> > Are all VMs being created with HV_HYPERCALL_AVAILABLE unset,
> > today?
> >
> 
> No, we have HV_HYPERCALL_AVAILABLE encoded in 'hv-relaxed','hv-vapic'
> and 'hv-time' features but not 
> 
> 
> > Wouldn't it be simpler to simply add a new
> > HYPERV_FEAT_HYPERCALL_AVAILABLE bit to hyperv_features, and
> > enabling it by default?
> >
> 
> We could do that but as I note above, we already have it for three
> features.

Do we have any cases where we do not want to enable
HV_HYPERCALL_AVAILABLE?

Would it be OK to just hardcoded it in hyperv_fill_cpuids() like
we do with HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE?

> 
> 
> > We don't necessarily need to make it configurable by the user,
> > but probably it would be a good idea to keep the bit unset by
> > default on older machine types.  Even if guests don't mind seeing
> > the bit changing under their feet, it would make it easier for
> > automated test cases that check for unexpected changes in raw
> > CPUID data.
> 
> I see current situation as a bug. While most likely nobody runs with
> a configuration like 'hv-vpindexem,hv-synic' it is still valid. And if KVM
> was enforcing the features (not yet), Windows would've just crashed in
> early boot. Normal configurations will likely always include at least
> 'hv-time' which has HYPERV_FEAT_HYPERCALL_AVAILABLE enabled.
> 
> That being said, I'm not sure we need to maintain 'bug compatibility'
> even for older machine types. I'm also not aware of any specific tests
> for such 'crazy' configurations out there. The last patch of the series
> adds a very simple test to qtest but this is about it.

If you are 100% sure the CPUID change can't crash or confuse a
guest, then that's OK.  I agree that bug compatibility is not a
must if the bit is simply ignored by most guests and by KVM
emulation code.


> 
> >
> >
> >> ---
> >>  target/i386/kvm/kvm.c | 15 +++++++++------
> >>  1 file changed, 9 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >> index 2c1a77f9b00f..d81451276cd8 100644
> >> --- a/target/i386/kvm/kvm.c
> >> +++ b/target/i386/kvm/kvm.c
> >> @@ -835,6 +835,8 @@ static struct {
> >>      [HYPERV_FEAT_CRASH] = {
> >>          .desc = "crash MSRs (hv-crash)",
> >>          .flags = {
> >> +            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> +             .bits = HV_HYPERCALL_AVAILABLE},
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
> >>               .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
> >>          }
> >> @@ -843,28 +845,28 @@ static struct {
> >>          .desc = "reset MSR (hv-reset)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_RESET_AVAILABLE}
> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_RESET_AVAILABLE}
> >>          }
> >>      },
> >>      [HYPERV_FEAT_VPINDEX] = {
> >>          .desc = "VP_INDEX MSR (hv-vpindex)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_VP_INDEX_AVAILABLE}
> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_INDEX_AVAILABLE}
> >>          }
> >>      },
> >>      [HYPERV_FEAT_RUNTIME] = {
> >>          .desc = "VP_RUNTIME MSR (hv-runtime)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_VP_RUNTIME_AVAILABLE}
> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_RUNTIME_AVAILABLE}
> >>          }
> >>      },
> >>      [HYPERV_FEAT_SYNIC] = {
> >>          .desc = "synthetic interrupt controller (hv-synic)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_SYNIC_AVAILABLE}
> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_SYNIC_AVAILABLE}
> >>          }
> >>      },
> >>      [HYPERV_FEAT_STIMER] = {
> >> @@ -879,7 +881,7 @@ static struct {
> >>          .desc = "frequency MSRs (hv-frequencies)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_ACCESS_FREQUENCY_MSRS},
> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_ACCESS_FREQUENCY_MSRS},
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
> >>               .bits = HV_FREQUENCY_MSRS_AVAILABLE}
> >>          }
> >> @@ -888,7 +890,8 @@ static struct {
> >>          .desc = "reenlightenment MSRs (hv-reenlightenment)",
> >>          .flags = {
> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> >> -             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
> >> +             .bits = HV_HYPERCALL_AVAILABLE |
> >> +             HV_ACCESS_REENLIGHTENMENTS_CONTROL}
> >>          }
> >>      },
> >>      [HYPERV_FEAT_TLBFLUSH] = {
> >> -- 
> >> 2.30.2
> >> 
> 
> -- 
> Vitaly
> 

-- 
Eduardo


