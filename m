Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74C3418B4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:48:12 +0100 (CET)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBjn-0006nT-QD
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNBiJ-0006Kb-Jp
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNBiH-0001ao-KX
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VwJMrTMffy+iU7PI35gM/YDKMc250/hvS+cJYKfiK3I=;
 b=DfdEb05R1Ri2Zjr4Q1oKYHDsVZZX26XZZs7xR21iiCuzloNiVdrfrMTsPfpf7woUe8UBn8
 e+ySv+JqgCqU3+UJrAc29VkdUEan8gMdZjbOsVFh+60a1lIuVp60pn6YMSOxlFDC9ltcFC
 n1vEOxbBePnP1FojnH3i5FlV+ypFFu8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-F6YQAmUTN0C-ILvYi5sNQw-1; Fri, 19 Mar 2021 05:46:34 -0400
X-MC-Unique: F6YQAmUTN0C-ILvYi5sNQw-1
Received: by mail-ej1-f70.google.com with SMTP id au15so18103913ejc.8
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VwJMrTMffy+iU7PI35gM/YDKMc250/hvS+cJYKfiK3I=;
 b=SjeWpM4T7fEcLWnKRZfeB5f6KuxajStxkG2Jy+fOFFKaEFxTFTgcKeccsPczgD5MiG
 VKvyAw/EysqXY3adoUtI/Ug72iMxFz/iFwh0ov4r7aJWL+8WGnU2IbTzmOn0oPkbuoW1
 b5ztmaig5cFqguhDM2EqVwfgmjxCfjJDqv02PO839haY+9riR8//eFfnvzzgQ6evJrEY
 jkxUiz1SJaQqpPMrzJcalmafMjAlma0ge2juqE8xDHveMdUUrrJbh+/4BbLRoklj2Guu
 hwrTucztw+Wlkh9eUQKBWbC/7X5ZcbexUQuNUv1FUfuCHIvTHMR3i9o+a3/bhLnOtqd6
 VNwQ==
X-Gm-Message-State: AOAM5314nVUd0fp9YF5ngInYX3IAZX3z2gi9dRlV+AIW9dvLwn68E8r2
 hip623pOX7ujlRQYMvbNvlfMcSfAT2n2OPZnv/NEZfZweSXkhVkc47MyVwQh49+6A+dBELtlctD
 lwcHoVvr5hGevA74=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr8505681edb.204.1616147193541; 
 Fri, 19 Mar 2021 02:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj/Qd2wnGur7+37QrVwjDmifJsXB6hXZDVbXB0BsLB2RuatfPrsI6KAo+366Dl8NThcMmtFw==
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr8505665edb.204.1616147193385; 
 Fri, 19 Mar 2021 02:46:33 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id j14sm3686459edr.97.2021.03.19.02.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:46:33 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
In-Reply-To: <20210318180332.GA39091@fuller.cnet>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com> <20210318180332.GA39091@fuller.cnet>
Date: Fri, 19 Mar 2021 10:46:32 +0100
Message-ID: <87k0q35vd3.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marcelo Tosatti <mtosatti@redhat.com> writes:

> On Thu, Mar 18, 2021 at 05:38:00PM +0100, Vitaly Kuznetsov wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>> > On 18/03/21 17:02, Vitaly Kuznetsov wrote:
>> >> KVM doesn't fully support Hyper-V reenlightenment notifications on
>> >> migration. In particular, it doesn't support emulating TSC frequency
>> >> of the source host by trapping all TSC accesses so unless TSC scaling
>> >> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
>> >> is unsafe to proceed with migration.
>> >> 
>> >> Normally, we only require KVM_SET_TSC_KHZ to succeed when 'user_tsc_khz'
>> >> was set and just 'try' KVM_SET_TSC_KHZ without otherwise.
>> >> 
>> >> Introduce a new vmstate section (which is added when the guest has
>> >> reenlightenment feature enabled) and add env.tsc_khz to it. We already
>> >> have env.tsc_khz packed in 'cpu/tsc_khz' but we don't want to be dependent
>> >> on the section order.
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >
>> > Could we instead fail to load the reenlightenment section if 
>> > user_tsc_khz was not set?  This seems to be user (well, management) 
>> > error really, since reenlightenment has to be enabled manually (or with 
>> > hv-passthrough which blocks migration too).
>
> Seems to match the strategy of the patchset...
>
>> Yes, we certainly could do that but what's the added value of
>> user_tsc_khz which upper layer will have to set explicitly (probably to
>> the tsc frequency of the source host anyway)?
>
> Yes. I think what happened was "evolution":
>
> 1) Added support to set tsc frequency (with hardware multiplier)
> in KVM, so add -tsc-khz VAL (kHz) option to KVM.
>
> 2) Scaling is enabled only if -tsc-khz VAL is supplied.
>
> 3) libvirt switches to using -tsc-khz HVAL, where HVAL it retrieves
> from KVM_GET_TSC_KHZ of newly created KVM_CREATE_VM instance.
>
> It could have been done inside qemu instead.
>
>> In case we just want to avoid calling KVM_SET_TSC_KHZ twice, we can probably achieve that by
>> adding a CPU flag or something.
>
> Avoid calling KVM_SET_TSC_KHZ twice ? Don't see why you would avoid
> that.
>

Actually, we already do KVM_SET_TSC_KHZ twice, my patch adds just
another call for KVM_SET_TSC_KHZ. We already do one call in
kvm_arch_put_registers() but we don't propagate errors from it so in case
TSC scaling is unsupported, migration still succeeds and this is
intentional unless 'tsc-khz' was explicitly specified. When 'tsc-khz' is
specified, the error is propageted from kvm_arch_init_vcpu() (second
call site). We can also achieve the goal of this patch if we follow
Paolo's suggestion: just make 'tsc-khz' a must with reenlightenment.

-- 
Vitaly


