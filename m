Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FB2ECC7C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 10:16:25 +0100 (CET)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxRP6-0003MQ-Qo
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 04:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxRNh-0002mk-J1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxRNd-00078v-Ai
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610010891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/+2fkg7auRaHeJXPM2KYlL9TzxkbdvMwUooySRG7tU=;
 b=iHhTJcF1Rv1dmw/hp3zsH6u6r51AY7SfZOXsO2O2hmCFqBIWOxM6/JUBwMGCcMkhTd38hJ
 HyAdctpjahNcZ5K4YeTVX4+kBn4MPZWhBLLFFALoSmFBpJt/KcyAkHtuZ0xsXljFHFMWxQ
 HQe0GcKBV6L92qn1Q8QB5A5gI29regM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-QwAMC0qUOl6RAREkW4aLRg-1; Thu, 07 Jan 2021 04:14:50 -0500
X-MC-Unique: QwAMC0qUOl6RAREkW4aLRg-1
Received: by mail-ej1-f71.google.com with SMTP id s17so2187779ejm.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 01:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Q/+2fkg7auRaHeJXPM2KYlL9TzxkbdvMwUooySRG7tU=;
 b=kO/gPmyIJ+9WKagebyC6tl8s11AghKDgjvotC8hr5mF8ndHS4Z5X4tGNo6CGKqeEmU
 V/we69FnXazUn9qB8/FGqmmPuMYD3VC3fEwg7OlZ+0eaveQt+j1r9i+UOKgIQ6wZRc7F
 G/aZxC5heU7uXebxRJaKZ9R2lg7sIK7PXieJbJOonBdsq1IUe8MrevO4mqEVFX6WNLsm
 uyib8o125TwpUhE6bLT6+k+0t0+FWqJXo2mM7CYE/EewHwVeOexEqJNmPtacmdOk/aZD
 voytpD8rvpHM+MKbAMSfR6crMFlktZ2Hv4sueIhxTjoo4XExFx04lz/buadjhQBq/r++
 RHAg==
X-Gm-Message-State: AOAM532zQtWxYYjj0UgE2KCWmpgjumcRXP1UuUfbJWot39s4HgrQBbO1
 aqbm9F3+9aRvrbf0z5MVQcX4Q+aYheInSTS34xbrhzdIed3jqNg42beECdUpqULNQj+tLmiqsRs
 9inpS2Cpuhx/I/wEycwAzvxjS2CgLueDZuL8iyFpyVwkVMiTKp8jJATmpfXfXsrorKK0=
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr999312edz.26.1610010889346; 
 Thu, 07 Jan 2021 01:14:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyftaHqSglzM9AMTstbrzTImu6qN1sLQKCcRnrZz+8YJ7t3d04PiqqeuSlVfz4GkpP3YmDWXQ==
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr999296edz.26.1610010889134; 
 Thu, 07 Jan 2021 01:14:49 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id t26sm2233039eji.22.2021.01.07.01.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:14:48 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210106172557.GP18467@habkost.net>
References: <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com> <87lfd7iowi.fsf@vitty.brq.redhat.com>
 <20210105170312.32cf0e12@redhat.com> <87a6tnibv4.fsf@vitty.brq.redhat.com>
 <20210106141303.145790f7@redhat.com> <87sg7egp73.fsf@vitty.brq.redhat.com>
 <20210106174542.496f9f6e@redhat.com> <20210106172557.GP18467@habkost.net>
Date: Thu, 07 Jan 2021 10:14:47 +0100
Message-ID: <87eeixglbs.fsf@vitty.brq.redhat.com>
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Igor Mammedov wrote:

> my preferred approach is still -cpu hyperv=on, since it doesn't
> depend on order CLI is currently parsed (which is fragile thing),
> but rather on what user asked us to do with CPU.

I think I'm OK with this solution for the time being. When non-CPU
devices arrive and if we decide that it is a good idea to have them
enabled by default, we can make -machine hyperv=on option implying
'hv_default' CPU option. The real benefit I see from -cpu option is
simplification of debug configurations (to find out what would happen
if certain enlightenments are disabled) and making it possible to use
'hv_default' with older kernels lacking some enlightenments (by
disabling them). Not that this is impossible with -machine option, just
not very straitforward ('-cpu host,hv-default,hv-evmcs=off' vs '-machine
q35,hyperv=on -cpu host,hv-evmcs=off').

I'll send out v3 shortly and I'll include patches from "i386: KVM:
expand Hyper-V features early" which were waiting for Linux-5.11 merge
window.

Eduardo Habkost <ehabkost@redhat.com> writes:

>> > On Tue, 05 Jan 2021 17:31:43 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> 
>> Every time I see a configuration with only a few 'hv_*' options I ask
>> 'why don't you enable the rest?' and I'm yet to receive an answer
>> different from 'hm, I don't know, I copied it from somewhere and it
>> worked'.
>> 
>> Setting 'hv_*' options individually should be considered debug only.
>
> They can also be useful in production to work around
> unexpected issues (not just debugging).
>

Right, by 'debugging' I meant 'dealing with issues' :-)

> I don't think we should prevent other layers from controlling low
> level knobs.  We just shouldn't make the low level knobs
> necessary for making the feature work.

Let me give an exaggerated example. Why do we have named cpu models
(e.g. 'Skylake')? We could've exposed basic CPU model and all the knobs
to upper layers of the stack to deal with. I don't even want to imagine
the chaos this would've created. Low level knobs are necessary when
issues arise (e.g. it's easy to ask 'could you please try "-cpu
Skylake,-vmx" and see what happens?') but mandating that upper layers
(btw, all of them -- we don't have 'one libvirt to rule them all') have
to set them is non-practical IMO.

-- 
Vitaly


