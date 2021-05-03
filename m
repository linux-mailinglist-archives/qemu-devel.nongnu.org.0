Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD89371F20
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:04:21 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcvY-0002CR-EL
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldclj-00043L-Ht
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldclg-0001k1-16
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620064441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H55+nwgV4uceI6HEPkLh4JnIy49sQqWx2wpD+LjGIuU=;
 b=DGXwvDRr0uVGe1PeRMU4CKauooo78hzjawKMtRCQblOR7Tvr3568i8UOikwRbHqeWRrzI9
 nIGiUS81uqVFNllrM9erZBInWeifF0LuSakbAKPdmk+Qqd1/D9+auEG2fCM6qLQwwrV8xe
 UvzIohuMBOWfiINZ2Zz86+ZTMzhAjGc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-_SsHgyEeOEegBKVIMraniQ-1; Mon, 03 May 2021 13:53:59 -0400
X-MC-Unique: _SsHgyEeOEegBKVIMraniQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so2650584wmb.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H55+nwgV4uceI6HEPkLh4JnIy49sQqWx2wpD+LjGIuU=;
 b=NTeqOliKTMyfDNV+zLqpwBAYArE7RVSKFI2/yYoo65qwp9/BsQ9vTzo/Pvkd9Gjd3+
 MWBaPSKWPvGSJakmG+sRRgEl7PapODH74yt9c+ENePgWYiuEbGzAJi2o9MIiYQKvATMS
 /ak3w0/zj9intGifcjBd44h4gM9UdtCkp60NRttytf6pC245oiAnWAlEbPu0T96S6/aG
 p2uCS8kXAngvtPtwTpC/vp92WlUguTF3jEupdagVEC5372ZLJoYB/GfgbHMlgw3Wggrv
 J452BFHS12EDdKuUA5yxTyXpAC9nWJttXWbuscY9bW7pWJbIiNzRlaPjvGfjmcyCU3qF
 ZcIQ==
X-Gm-Message-State: AOAM5319SzzQLFSizlG83dFTM/90cvuVjKS1BlwrG4T8aW8dmUpasiSl
 xWow8lEzZfpGtk7SdsrVsqCsCM9LS9DiGd8RokqPKmCEJTFKxqBN6visUBC8c9n/oiZ4XxbqtAZ
 4UTA3QWpLL6fYAZ4=
X-Received: by 2002:a5d:4386:: with SMTP id i6mr21094939wrq.207.1620064438742; 
 Mon, 03 May 2021 10:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtMKxY0sP5aKWcoIN73dTPY42ZC1FcUrOic3kyX+5utrAVXxo1rMJIl9Z/iYMd9Bdw/Bwr8Q==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr21094920wrq.207.1620064438557; 
 Mon, 03 May 2021 10:53:58 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u2sm397755wmm.5.2021.05.03.10.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:53:58 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
 <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
 <YIkpXqg5/wV1QNZB@stefanha-x1.localdomain>
 <87mtti1oie.fsf@dusky.pond.sub.org>
 <YImsxg/G2u659nkI@stefanha-x1.localdomain>
 <87h7jpipwq.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acaec225-beab-efc6-2417-7842772b0b58@redhat.com>
Date: Mon, 3 May 2021 19:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87h7jpipwq.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Elena,

+Mark

You asked to use the next KVM-external call slot to talk about
the ISA bus issues. I haven't scheduled the call because it seems
this thread helped to figure the problems and Markus's analysis
resumed them all. From here it should be clearer to see what has
to be done to go where we want to be from where we are :)

What do you think (in particular, from Markus list)?

On 4/29/21 8:08 AM, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
>> On Wed, Apr 28, 2021 at 04:18:17PM +0200, Markus Armbruster wrote:
>>> Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
> [...]
> 
>>>> The approach in this patch is okay but we should keep in mind it only
>>>> solves piix3-ide. ISA provides a non-qdev backdoor API and there may be
>>>> more instances of this type of bug.
>>>>
>>>> A qdev fix would address the root cause and make it possible to drop the
>>>> backdoor API, but that's probably too much work for little benefit.
>>>
>>> What do you mean by backdoor API?  Global @isabus?
>>
>> Yes. It's also strange that isa_get_irq(ISADevice *dev, unsigned isairq)
>> accepts dev = NULL as a valid argument.
> 
> @isabus is static in hw/isa/isa-bus.c.  Uses:
> 
> * Limit isa_bus_new() to one ISA bus.  Arbitrary restriction; multiple
>   ISA buses could work with suitable memory mapping and IRQ wiring.
>   "Single ISA bus" assumptions could of course hide elsewhere in the
>   code.
> 
> * Implied argument to isa_get_irq(), isa_register_ioport(),
>   isa_register_portio_list(), isa_address_space(),
>   isa_address_space_io().
> 
>   isa_get_irq() asserts that a non-null @dev is a child of @isabus.
>   This means we don't actually need @isabus, except when @dev is null.
>   I suspect two separate functions would be cleaner: one taking an
>   ISABus * argument, and a wrapper taking an ISADevice * argument.
> 
>   isa_address_space() and isa_address_space_io() work the same, less the
>   assertion.
> 
>   isa_register_ioport() and isa_register_portio_list() take a non-null
>   @dev argument.  They don't actually need @isabus.
> 
> To eliminate global @isabus, we need to fix up the callers passing null
> @dev.  Clean solution: plumb the ISABus returned by isa_bus_new() to the
> call sites.  Where that's impractical, we can also get it from QOM, like
> build_dsdt_microvm() does.
> 


