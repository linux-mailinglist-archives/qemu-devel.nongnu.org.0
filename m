Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108B41EF5A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 16:21:32 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWJPl-0006OY-8X
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 10:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWJNN-0004Nw-50
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWJNJ-0003UO-6H
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633097935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNSz6eTbguUg6P1u0sD1nDyXl5pDzCepmkjG557LLY4=;
 b=A+50VOr+p6kM+6eWkutMXG+QozLY2clKZK7bup7Zzz+VlghlfipS9xlruSLYAqRZr7gZib
 Udn7KtYTRRsfbgucmrU1rcqwE6lRTv9+2s0DLxK2T0X1piXXxoJYzyc0ZZRFpvvmO1X1h4
 pBzH5AYSeUJ1IhvbbAQVA47lQMkg/Ww=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-d90qF6vpNfyiCZDL6KU_Ag-1; Fri, 01 Oct 2021 10:18:54 -0400
X-MC-Unique: d90qF6vpNfyiCZDL6KU_Ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d1000000b0030d4041f73eso1391489wmk.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bNSz6eTbguUg6P1u0sD1nDyXl5pDzCepmkjG557LLY4=;
 b=1s2NDOTSysGM8Qa7dGfMKXMsZjNoO2hf1LSGQI8HhFxsbg2hQZEHi7wSunilfYiy6S
 USQsUa2eKK+kpvc5O4IJdB/A1ILNCazIHSry++lTTUwpLdidyJPj3ifjPLSiNw7RGE6r
 wCe/6M3dwhqkpow+5rF1RD7CP1+fmgLQ6cu83ahJF1/QlKwsSVpMQxlrdOmF2A1NzTeu
 1/7xlap3EHYzMuIJmzSii+M+RxSUIrnQgp0XlQIZMYH/XYptbYfJIO+xHNwj+bF8V+D6
 qCJJs33MCZQp6QraRM96xpb3wtlPvVYMDbuB9i8GhPmC8Hj1olfHn8eQmR7sNuOQB5n+
 QXDQ==
X-Gm-Message-State: AOAM531fgpfqd1Cl7cgSK8s/YoJR+AJnkYiaESKmNF4vk0Oa3yitatkA
 mSSfloZkpA+QT6gm6uUoOmBy9t2bjzSGpoDseZgc1upiK+Bhwu+0MQhRWSpBJlEhEqVQSkHoR6w
 4bsU7+AD5/Bbl5SY=
X-Received: by 2002:a05:600c:288:: with SMTP id
 8mr2104928wmk.172.1633097933447; 
 Fri, 01 Oct 2021 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoprW5wGRIVaQ7cBpzLH5eW2izA3Pyq261wOpNFb8J0hWZnbetLCie/MAf/nicbiVlPZeMyg==
X-Received: by 2002:a05:600c:288:: with SMTP id
 8mr2104892wmk.172.1633097933206; 
 Fri, 01 Oct 2021 07:18:53 -0700 (PDT)
Received: from thuth.remote.csb (tmo-099-118.customers.d1-online.com.
 [80.187.99.118])
 by smtp.gmail.com with ESMTPSA id y8sm2669218wrr.21.2021.10.01.07.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 07:18:52 -0700 (PDT)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com>
Date: Fri, 1 Oct 2021 16:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 15.04, Christophe Leroy wrote:
> 
> 
> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>> On 01/10/2021 13.12, Peter Maydell wrote:
>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>> Nevertheless, as long as nobody has a hint where to find that
>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
>>>> can see, they do not work without the bios at all, so it's also not 
>>>> possible
>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>
>>> It is at least in theory possible to run bare-metal code on
>>> either board, by passing either a pflash or a bios argument.
>>
>> True. I did some more research, and seems like there was once support for 
>> those boards in u-boot, but it got removed there a couple of years ago 
>> already:
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>
>>> But I agree that there seem to be no signs of anybody actually
>>> successfully using these boards for anything, so we should
>>> deprecate-and-delete them.
>>
>> Yes, let's mark them as deprecated now ... if someone still uses them and 
>> speaks up, we can still revert the deprecation again.
> 
> I really would like to be able to use them to validate Linux Kernel changes, 
> hence looking for that missing BIOS.
> 
> If we remove ppc405 from QEMU, we won't be able to do any regression tests 
> of Linux Kernel on those processors.

If you/someone managed to compile an old version of u-boot for one of these 
two boards, so that we would finally have something for regression testing, 
we can of course also keep the boards in QEMU...

  Thomas


