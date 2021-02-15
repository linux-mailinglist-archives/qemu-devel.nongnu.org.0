Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DC31C021
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:09:25 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhNE-0007CY-DB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhFP-0001Xr-Bm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhFL-0005Wk-8u
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613408473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYvBcBAK8vtxkk9g9Y9ObdQvN6fIvuA/+COcfL5EPiQ=;
 b=MqLdOpJ2N64xwC2hplxtJnx6+tWkziMC7fQlkautvh5FMja4XlInsSU9ZzAE6mGXMGIbCY
 L1h7pnjWGPS3TUy+uvVUEp8ylKMUJUfW2ukUSuQpV4c3btkBj7bbORKsbqlPfGUcO8622g
 TKzx/OyE7q34XrDekiu1YVD/S/GjgxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-NfW0VCE9PW2pVWEw2JywuQ-1; Mon, 15 Feb 2021 12:01:11 -0500
X-MC-Unique: NfW0VCE9PW2pVWEw2JywuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF3D11005501
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 17:01:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD28B62461;
 Mon, 15 Feb 2021 17:01:08 +0000 (UTC)
Date: Mon, 15 Feb 2021 18:01:06 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210215180106.7e573e6a@redhat.com>
In-Reply-To: <87eehhlnj5.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com>
 <87eehhlnj5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 09:53:50 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> >> >
> >> > Please try reusing scratch CPU approach, see
> >> >   kvm_arm_get_host_cpu_features()
> >> > for an example. You will very likely end up with simpler series,
> >> > compared to reinventing wheel.    
> >> 
> >> Even if I do that (and I serioulsy doubt it's going to be easier than
> >> just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200  
> > it does a lot more then what you need, kvm_arm_create_scratch_host_vcpu()
> > which it uses will do the job and even that could be made smaller
> > for hv usecase.
> >  
> >> lines long) this is not going to give us what we need to distinguish
> >> between
> >> 
> >> 'hv-passthrough,hv-evmcs'
> >> 
> >> and 
> >> 
> >> 'hv-passthrough'
> >> 
> >> when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
> >> don't want to enable it unless it was requested explicitly (former but
> >> not the later).  
> > could you elaborate more on it, i.e. why do we need to distinguish and why
> > do we need evmcs without VMX if user asked for it (will it be usable)
> >  
> 
> We need to distinguish because that would be sane.
> 
> Enlightened VMCS is an extension to VMX, it can't be used without
> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,
...
> That bein said, if
> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
> there is a problem with explicit enablement: what should
> 
> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
> sound sane to me.
based on above I'd error out is user asks for unsupported option
i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out

if later on we find usecase for VMX=off + hv-evmcs=on,
we will be able to drop error without affecting existing users,
but not other way around.

> >> Moreover, instead of just adding two 'u64's we're now doing an ioctl
> >> which can fail, be subject to limits,... Creating and destroying a CPU
> >> is also slow. Sorry, I hardly see how this is better, maybe just from
> >> 'code purity' point of view.  
> > readable and easy to maintain code is not a thing to neglect.  
> 
> Of couse, but 'scratch CPU' idea is not a good design decision, it is an
> ugly hack we should get rid of in ARM land, not try bringing it to other
> architectures. Generally, KVM should allow to query all its capabilities
> without the need to create a vCPU or, if not possible, we should create
> 'real' QEMU VCPUs and use one/all of the to query capabilities, avoiding
> 'scratch' because:
> - Creating and destroying a vCPU makes VM startup slower, much
> slower. E.g. for a single-CPU VM you're doubling the time required to
> create vCPUs!
> - vCPUs in KVM are quite memory consuming. Just 'struct kvm_vcpu_arch'
> was something like 12kb last time I looked at it. 
> 
> I have no clue why scratch vCPUs were implemented on ARM, however, I'd
> very much want us to avoid doing the same on x86. We do have use-cases
> where startup time and consumed memory is important. There is a point in
> limiting ioctls for security reasons (e.g. if I'm creating a single vCPU
> VM I may want to limit userspace process to one and only one
> KVM_CREATE_VCPU call).
it should be possible to reuse scratch VCPU (kvm file descriptor) as
the first CPU of VM, if there is a will/need, without creating unnecessary overhead.
I don't like scratch CPU either but from my pov it's a lesser evil to
spawning custom parser every time someone fills like it.


> Now to the code you complain about. The 'hard to read and maintain' code
> is literaly this:
> 
> +static void x86_hv_feature_set(Object *obj, bool value, int feature)
> +{
> +    X86CPU *cpu = X86_CPU(obj);
> +
> +    if (value) {
> +        cpu->hyperv_features |= BIT(feature);
> +        cpu->hyperv_features_on |= BIT(feature);
> +        cpu->hyperv_features_off &= ~BIT(feature);
> +    } else {
> +        cpu->hyperv_features &= ~BIT(feature);
> +        cpu->hyperv_features_on &= ~BIT(feature);
> +        cpu->hyperv_features_off |= BIT(feature);
> +    }
> +}
It's not just that code but the rest that uses above variables to
get final hyperv_features feature set. There is a lot of invariants
that are hidden in hv specific code that you put in hyperv kvm
specific part.

btw why can't we get supported hyperv_features in passthrough mode
during time we initialize KVM (without a vCPU)?

> I can add as many comments here as needed, however, I don't see what
> requires additional explanaition. We just want to know two things:
> - What's the 'effective' setting of the control
> - Was it explicitly enabled or disabled on the command line.
> 
> Custom parsers are not new in QEMU and they're not going anywhere I
> believe. There are options with simple enablent and there are some with
> additional considerations. Trying to make CPU objects somewhat 'special'
> by forcing all options to be of type-1 (and thus crippling user
> experience) is not the way to go IMHO. I'd very much like us to go in
> another direction, make our option parser better so my very simple
> use-case is covered 'out-of-the-box'.
there is a lot of effort spent on getting rid of custom parsers that
QEMU accumulated over years. Probably there were good reasons to add
them back then, and now someone else has to spend time to clean them up.

hyperv case is not any special in that regard (at least I'm not convinced
at this point). Try alternative(s) first, if that doesn't work out, then
custom parser might be necessary.


