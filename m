Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C12EBED2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:40:08 +0100 (CET)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx92m-0002kU-1M
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kx91n-0002KB-4a
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:39:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kx91i-0002dF-KB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609940341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLMOuqvjH6v80jnfw0Ec/VBW1pu4tESiW9C+SuY9xt4=;
 b=MRXESTcckT4GPa4UGsMEYG0t7Xd0oMdgXoIxsDCSsAwNq8NC9p9nxNJ1kVD5fPnbqFZLPQ
 jc4MmeEA7tH+XSZRAvuYJ+LxWv01qN/L4DKpFWFbM9pGpPV4CNVO1YU5/S/SUO0eXxAsCT
 kH6UXQCBmiHL4dT7y/cLXGuCwA8PGNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-99ScnGl7MciSF00CDychrw-1; Wed, 06 Jan 2021 08:38:59 -0500
X-MC-Unique: 99ScnGl7MciSF00CDychrw-1
Received: by mail-ed1-f69.google.com with SMTP id e12so1905327eds.19
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 05:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DLMOuqvjH6v80jnfw0Ec/VBW1pu4tESiW9C+SuY9xt4=;
 b=FpQlHCkvO1UWDsiscHuARqgMQ2FlLmpBm+sx0pOBCwSCEOnFO4Jmwth742upXhGCKO
 SSXDYESO0yYFq7LJy5Inja7738c2w7qgje/4QVom89WesDvMGPar4UZFeAwQSCMCminX
 yiVxkczTyI5GgNFBWwCD+utZD7dKgNnr2+UcQaPo8kzmk+USouRAp2Hs7Y+ON9RcuKiH
 zk//S9Exv5SsKl9EgpeNCpqAiqAkbc43dVYT+Afw0HjMKVQPhOt2KW0XJjWr6jl9GbAG
 NeJkAzamKvdsxlMr2D/mOzfyJBoh2Lqpm21XCH/5I/17Iv1qtT6HiHu77rEKSRWDD7dW
 BhyQ==
X-Gm-Message-State: AOAM5330AHoa0LuwZxDvuzCunpOgGLcei19DJOLC71rbVA7PYEf/XHLe
 t1BgvsifCUN/4H7XfVcgN3Vq+dK61rMC6hPYQynN4PuHJHmX8jxTouYUghWTLPZ5Dq+3Y4sg/nF
 4cOZUyCjVpGOFCN5UKmi1zD+wOenohvD5B2V+wH6Cj1+TKkUQugESg4xXrdTkjizdCRM=
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr2882225eja.335.1609940337869; 
 Wed, 06 Jan 2021 05:38:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoyw1qXitchhzfVRlRwj0We4iEqGeYkfvrAj5nt599XloVYWC80v9P63Wg0+Cvu//8+XjpDg==
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr2882205eja.335.1609940337590; 
 Wed, 06 Jan 2021 05:38:57 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id k21sm1483233edq.26.2021.01.06.05.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:38:56 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210106141303.145790f7@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com> <87lfd7iowi.fsf@vitty.brq.redhat.com>
 <20210105170312.32cf0e12@redhat.com> <87a6tnibv4.fsf@vitty.brq.redhat.com>
 <20210106141303.145790f7@redhat.com>
Date: Wed, 06 Jan 2021 14:38:56 +0100
Message-ID: <87sg7egp73.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Tue, 05 Jan 2021 17:31:43 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Tue, 05 Jan 2021 12:50:05 +0100
>> >
>> > I think there is a misunderstanding, idea was:
>> >
>> > cpu_initfn() {
>> >     //current set
>> >     cpu->default_hyperv_cpu_features = ACD
>> > }
>> >
>> > compat_props_5.1 {
>> >    cpu.default_hyperv_cpu_features = AB
>> > }
>> >
>> > compat_props_5.2 {
>> >    cpu.default_hyperv_cpu_features = ABC
>> > }
>> >  
>> 
>> ...
>> 
>> > I was talking about CPU features/properties only, it doesn't apply to other devices.
>> > It makes sense for machine to have a knob to create onboard hyperv specific
>> > devices if there is any (do we have any?).
>> >
>> > If there aren't any currently, I wouldn't bother with machine knob
>> > and just use -cpu foo,hv_default=on or -device cpu,hv_default=on
>> > like any other cpu feature.
>> >  
>> 
>> We don't currently have any devices which are not 'CPU features' (in
>> QEMU terminology), however, we already have Vmbus and I can easily
>> imagine us implementing e.g. hartbeat/kvp/vss/... devices on top. We
>> *may* want to enable these 'automatically' and that's what make
>> '-machine' option preferable. It is, however, not a *must* right now and
>> we can indeed wait until these devices appear and be happy with
>> 'hv_default' -cpu option for now. We will, however, need to teach upper
>> layers about the change when/if it happens.
>
> which makes me think we are trying to bite something that we shouldn't.
> Do we really need this patch (QEMU knob) to magically enable subset of
> features and/or devices for a specific OS flavor?
>
> It's job of upper layers to abstract low level QEMU details in to coarse
> grained knobs (libvirt/virt-install/virt-manager/...).
> For example virt-install may know that it installing a specific Windows
> version, and can build a tailored for that OS configuration including
> needed hyperv CPU features and hyperv specific devices.
> (if I'm not mistaken libosinfo is used to get metadata for preferred
> configuration, so perhaps this should become a patch for that library
> and its direct users).
>
> What we actually lack is a documentation for preferred configuration
> in docs/hyperv.txt, currently it just enumerates possible features.
> We can just document a recommended 'best practices' there without
> putting it in QEMU code and let upper layers to do their job in
> the stack.

The problem we're facing here is that when a new enlightenment is
implemented it takes forever to propagate to the whole stack. We don't
have any different recommendations for different Windows versions,
neither does genuine Hyper-V. The 'fine grained' mechanis we have just
contributes to the creation of various Frankenstein configurations
(which look nothing like real Hyper-V), people just google for 'Windows
KVM slow', add something to their scripts and this keeps propagating.

Every time I see a configuration with only a few 'hv_*' options I ask
'why don't you enable the rest?' and I'm yet to receive an answer
different from 'hm, I don't know, I copied it from somewhere and it
worked'.

Setting 'hv_*' options individually should be considered debug only.

-- 
Vitaly


