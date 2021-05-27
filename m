Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82023393625
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:17:44 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLVn-0007wY-2L
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLUY-00075B-FA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLUV-0004HD-Nv
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622142981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pQhOwTAJsAt36JZLdQ0s2bequzSp3gnDs2ZlgT9r+7A=;
 b=DFLedzz86Px8GzEzTIbcQjX9SGwLTnJvZTeIPdEb6xC253M6QwQaYDT7ByS0Y6VUTPuebq
 Nj68VOuKEaxV8SLuvGsOxicDkIpuLWwTa5fnoIiRVBrjFGf0L6N38sD12OPe6xalGVEb1J
 Usrt+n4uO9/yI9j9sZB44r3QQ54FBlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-YOSmGRGeOOy20U3DDOj3wA-1; Thu, 27 May 2021 15:16:19 -0400
X-MC-Unique: YOSmGRGeOOy20U3DDOj3wA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C7419253C2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 19:16:18 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B5E560CC9;
 Thu, 27 May 2021 19:16:18 +0000 (UTC)
Date: Thu, 27 May 2021 15:16:17 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 10/19] i386: move eVMCS enablement to hyperv_init_vcpu()
Message-ID: <20210527191617.ypldw2e4ax6fpkan@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-11-vkuznets@redhat.com>
 <20210521212021.lsf2pzfu647ocqj3@habkost.net>
 <87mtsk734q.fsf@vitty.brq.redhat.com>
 <20210526163514.izh52clpynbte747@habkost.net>
 <87pmxc7i2i.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87pmxc7i2i.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On Thu, May 27, 2021 at 09:27:01AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Mon, May 24, 2021 at 02:00:37PM +0200, Vitaly Kuznetsov wrote:
> > [...]
> >> >> @@ -1455,6 +1454,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
> >> >>          }
> >> >>      }
> >> >>  
> >> >> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> >> >> +        uint16_t evmcs_version;
> >> >> +
> >> >> +        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> >> >> +                                  (uintptr_t)&evmcs_version);
> >> >> +
> >> >> +        if (ret < 0) {
> >> >> +            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> >> >> +                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> >> >> +            return ret;
> >> >> +        }
> >> >> +
> >> >> +        cpu->hyperv_nested[0] = evmcs_version;
> >> >
> >> > Wait, won't this break guest ABI?  Do we want to make
> >> > HYPERV_FEAT_EVMCS a migration blocker until this is fixed?
> >> >
> >> 
> >> Could you please elaborate on the issue? I read the above is: when 
> >> evmcs' feature was requested, make an attempt to enable
> >> KVM_CAP_HYPERV_ENLIGHTENED_VMCS, and bail out if this fails. Propagate
> >> the the acquired evmcs version to 'cpu->hyperv_nested[]' otherwise.
> >
> > This will be visible to the guest at CPUID[0x4000000A].EAX,
> > correct?  You are initializing CPUID data with a value that
> > change depending on the host.
> >
> > What is supposed to happen if live migrating to to a host with a
> > different evmcs_version?
> 
> (Note: 'evmcs_version' here is the 'maximum supported evmcs version',
> not 'used evmcs version').
> 
> This is a purely theoretical question at this moment as there's only one
> existing (and supported) eVMCS version: 1.

Good to know.  :)

> 
> In future, when (and if) e.g. EVMCSv2 appears, we'll have to introduce a
> different QEMU option for it most likely (or something like
> 'hv-evmcs=1', 'hv-evmcs=2' ... ) as how else would we prevent migration
> to a host which doesn't support certain eVMCS version (e.g. EVMCSv2 ->
> EVMCSv1)?
> 
> I'd be fine with hardcoding '1' and just checking that the returned
> version is >= 1 for now. Migration blocker seems to be an overkill (as
> there's no real problem, we're just trying to make the code future
> proof). 

Sounds good to me.  I agree a migration blocker is not the right
solution if currently all hosts have evmcs_version==1.

-- 
Eduardo


