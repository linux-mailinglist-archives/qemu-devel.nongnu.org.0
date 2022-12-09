Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E766487E7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hOD-0006WW-BR; Fri, 09 Dec 2022 12:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3hO8-0006Vt-Qr
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:42:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3hO6-00040f-VX
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670607737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghNla1yptXda6e5GZFtxg5N4F0gCoxp0oiupUy7uWQQ=;
 b=SIyfbR7cJHOwXca5irYBJEZeyV4Ru+FcNOfBKSLKov8sMZcRkGplbTh5OSyg8+c0aEImrS
 iXzyddsBl68RZPDU2LoV9Dp6JYR9/9q7dWAx/Yc3sDvGXJy7zeRh4fIKmvGo58EcoZU8pg
 szRv7vzzIlSXKSPYwSU6bcdHmm2hqT0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-yA6OdoseNAKDbkTWtBxZuw-1; Fri, 09 Dec 2022 12:42:16 -0500
X-MC-Unique: yA6OdoseNAKDbkTWtBxZuw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f17-20020a056402355100b00466481256f6so1772063edd.19
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ghNla1yptXda6e5GZFtxg5N4F0gCoxp0oiupUy7uWQQ=;
 b=PiGmg3Y9ut/1l/lbGUhcBs1CecOYzLG/dwU9qvZJSREh88AlRCs1Uf9iPXkbI5vowX
 i3GUEjlvdvLeQrV3qtINmewUsHbJW2NcAVtH1CCdkVw/rdoyrikc6+Kdnq+IyxQZTnAs
 wrbYFHigth01wX0kMUR8yuWBWnTSvtLGCbkkZMvd0yM6CVaOnFwuB5zr62W/8BqH84qn
 WwL3nKxmtVrubi+9WcJbgeDf6Uta3jih9qPNMjBmTjs+RTDPr7JteA48XdOgltXhY1EE
 iWPQm5zd3OS9NTTyy2HSex3mt+CyYCRoKuOtda4Y8l9zwmR6sqy/V0Wt7dGuHBEYfBA6
 nOog==
X-Gm-Message-State: ANoB5pmNDLjTPq6CIC17651k6N54MXQxNLklVhgowXfC52imvumM0Vxg
 GDzlfsCFJ4fepXCLMq/WAclhKWrpv83OVm5Llyfkx0SUFw9B1Eha+evZBh0XLvXZMFgoQCysQB/
 qhMtaCVv5D9eJEdg=
X-Received: by 2002:a05:6402:4011:b0:46c:b2a7:1e03 with SMTP id
 d17-20020a056402401100b0046cb2a71e03mr6698896eda.36.1670607735034; 
 Fri, 09 Dec 2022 09:42:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4bLGQahvulVeOYextbASQvkhPo1eBIULI2JiQwT4o+TdBbJkf7KmFScaT2JFKz1iph5r/VKw==
X-Received: by 2002:a05:6402:4011:b0:46c:b2a7:1e03 with SMTP id
 d17-20020a056402401100b0046cb2a71e03mr6698878eda.36.1670607734810; 
 Fri, 09 Dec 2022 09:42:14 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s9-20020a508d09000000b00462e1d8e914sm881299eds.68.2022.12.09.09.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 09:42:14 -0800 (PST)
Message-ID: <a14c2624-36fa-b5c1-a358-95694e01a339@redhat.com>
Date: Fri, 9 Dec 2022 18:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
 <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
 <CAFEAcA8MrUwOt+gaSVF6tMpG_HO_wCN_O11Ezst97-_52PR9pQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8MrUwOt+gaSVF6tMpG_HO_wCN_O11Ezst97-_52PR9pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 17:52, Peter Maydell wrote:
>> Dependencies are usually added near the .c files that use them.  That's
>> a bit messy of course if you have an "#include <>" in a heavily-included
>> QEMU header.  You can consider it a way to discourage heavily-included
>> headers.
> This has always seemed to me to be a recipe for bugs that only
> show up in the uncommon case of "some dependent library's
> header files have been installed somewhere other than in
> a system include directory". Is it possible to get meson to do
> things the more standard way, where if a binary has a dependency
> declared then the CFLAGS for that dependency get used for all
> objects that go into it?

This *is* what Meson does, it's QEMU that has always done non-standard 
things in order to share the .o files for target-independent sources. 
Back in the day is was -Wl,--whole-archive, then it became foo-obj-y. 
Now it's foo_ss but it's the same thing as foo-obj-y in the end.

Once the relation between objects and binaries becomes many-to-many, you 
can't really apply "the CFLAGS for the binaries' dependencies" to all 
the objects.  Pre-Meson, there were three ways to declare dependencies:

- placing pkg-config output directly in $(QEMU_CFLAGS) and $(LIBS). 
This caused binaries to have unnecessary dependencies at times.

- mentioning dependencies in $(obj)/foo.o_{CFLAGS,LIBS} or something 
like that, declaring dependencies in objects and applying them to 
binaries.  The Makefile implementation was very buggy.

- a mix of the two, with the include path added to QEMU_CFLAGS and a 
target variable definition "foo$(EXESUF): LIBS += ..." that avoided the 
unnecessary dependencies.

The sourceset thing was added to Meson specifically for QEMU, inspired 
by the second option.  Without the bugs[1], everything could become 
fine-grained.  Only glib stayed in QEMU_CFLAGS (the third option); 
anything else was unnecessary because everything includes glib.h through 
osdep.h anyway.

The closest thing to what you're suggesting is to keep LIBS fine-grained 
while making CFLAGS coarse-grained, i.e. the third option above.  That 
is what the patches I sent today do when moving the glib tests to Meson, 
so it is not hard to expand it to other dependencies; but while it might 
avoid the gnutls issues, it will probably cause other issues---think of 
SDL messing with "#define main".  Overall, I'm not sure it's a win.

Thanks,

Paolo

[1] there is the gnutls issue on macOS, but IIRC the dependency CFLAGS 
are just the manifestation of a bug somewhere else that I forgot the 
details about (the Meson issue tracker and wiki page has the info, I'll 
get back to it some day).  This bug only affects gnutls because we do 
tend to "#include <>" in .c files only, and did so even before the 
switch to Meson.


