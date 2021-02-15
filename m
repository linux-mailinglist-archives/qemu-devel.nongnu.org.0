Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09931BDD7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:56:40 +0100 (CET)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgEp-0006iJ-Vb
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBgDW-0006Di-Oi
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBgDQ-0000Oa-LX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613404510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hChexZuSxKUB/bAadHD9L5Ld+TxXIDOozAKZdecAXYM=;
 b=J0547NNHarimaq2jpCvNBs8qTLwZk2oVGu8Mk9DIHCgH++ZO6Vf2NsNTdXpOIJ6A5qizbX
 LEVyMZVVZXpNYmjnD6Qa9I93jo2MnCAG/dxCox+oACBAYDQFIbuOZy/3PLAgE82KgEz8QC
 b2C3bU4lHCnOpsZxxmMIN4m3Gw9uEWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-umpOJF5VNoeW7Y7G6Tjn8A-1; Mon, 15 Feb 2021 10:55:07 -0500
X-MC-Unique: umpOJF5VNoeW7Y7G6Tjn8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D40E107ACED
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 15:55:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 593665C233;
 Mon, 15 Feb 2021 15:55:05 +0000 (UTC)
Date: Mon, 15 Feb 2021 16:55:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210215165502.64e1e629@redhat.com>
In-Reply-To: <87blcllnf0.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <87h7mhl33o.fsf@vitty.brq.redhat.com>
 <20210212170527.0e93e6b2@redhat.com>
 <87blcllnf0.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Mon, 15 Feb 2021 09:56:19 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Fri, 12 Feb 2021 16:26:03 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> >>   
> >> > Igor Mammedov <imammedo@redhat.com> writes:
> >> >    
> >> >>
> >> >> Please try reusing scratch CPU approach, see
> >> >>   kvm_arm_get_host_cpu_features()
> >> >> for an example. You will very likely end up with simpler series,
> >> >> compared to reinventing wheel.    
> >> >
> >> > Even if I do that (and I serioulsy doubt it's going to be easier than
> >> > just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
> >> > lines long) this is not going to give us what we need to distinguish
> >> > between
> >> >
> >> > 'hv-passthrough,hv-evmcs'
> >> >
> >> > and 
> >> >
> >> > 'hv-passthrough'
> >> >
> >> > when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
> >> > don't want to enable it unless it was requested explicitly (former but
> >> > not the later).    
> >> 
> >> ... and if for whatever reason we decide that this is also bad/not
> >> needed, I can just drop patches 16-18 from the series (leaving
> >> 'hv-passthrough,hv-feature=off' problem to better times).  
> > that's also an option,
> > we would need to make sure that hv-passthrough is mutually exclusive
> > with ''all'' other hv- properties to avoid above combination being
> > ever (mis)used.  
> 
> That's an option to finally get these patches merged, not a good option
> for end users. 
> 
> 'hv-passthrough,hv-feature' works today and it's useful. Should we drop
> it?
well,
try suggested idea about using scratch CPU and it might get merged sooner.
(it's not like I'm suggesting you to rewrite half of QEMU, just some of
patches, which most likely would simplify series from my point of view
and would be easier to maintain)

> 
> 'hv-passthrough/hv-default' and 'hv-passthrough/hv-default,hv-evmcs'
> should give us sane results.
> 
> 'hv-passthrough,hv-feature=off' is convenient.
> 
> Why droppping this all? To save 9 (nine) lines of code in the parser? 
it's doing what generic property parsing is capable off, provided you
fish out hv-passthrough value in advance like arm/virt does (I think ppc
does similar hing also), so I consider it as unnecessary code duplication/
complication and maintenance burden.

If it were a hotfix during hard-freeze may be I'd agree (with promise to
rework it later to something more palatable), but it's not, for patches in
state they are now I'm not confident enough to ACK them.


