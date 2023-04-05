Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C993A6D762A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 10:03:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjy5f-0003j5-Mj; Wed, 05 Apr 2023 04:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjy5b-0003hZ-Pk
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjy5X-000585-QL
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680681709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSK/pBBaakWjepZ3BWn/D3how8j8GL2/EmR11UgPN+4=;
 b=bif+JscdQ2sc+6M4gSWQ5BVS8gQ4Mwrd4HxYF7yflKSRW05maw3iO6GVB3qb+wIyZ10AjV
 YgTwxjTzikeyTTJO/fQm7TiIWGIla4IzVeBn2/Jx1paHQxK8t44UKBcXK9P+s6qH/bw8H6
 WcDfiqB61xZ1/gocvt9kY81rvcYJC7E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-hdnhDTNaOM-L-pSi-O1Yig-1; Wed, 05 Apr 2023 04:01:48 -0400
X-MC-Unique: hdnhDTNaOM-L-pSi-O1Yig-1
Received: by mail-qk1-f197.google.com with SMTP id
 198-20020a370bcf000000b007468cffa4e2so15866297qkl.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 01:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fSK/pBBaakWjepZ3BWn/D3how8j8GL2/EmR11UgPN+4=;
 b=X+r9rT+eGgNrcoVQTy05lbthuDg7NnWc5pDOaSX4dboq5R1rRI2iJi1Tpgu2MUn9vC
 qvuYm721SQbBWi/2oEf28qjBIcjFgWoZquoKyYqfBZ3rM+d+wamkf0bTiqDp1YHekE6Y
 mqgE0wNgsGLmpIN6qWevZ2+9uiSFRXsTM4B/gpAX1KNfBcoWQ/loXwSL86gQYBqxbmVb
 M3WFw3QxEtZ9LaXoQbBrRTC8A73FKdmoVrntYyKcJj5bt2C4+L2V1fcmpplDNEzIy92b
 HpapwrFHwqyPgvNimPu4Q4HgQhY7KpiSRBtltbdQBrZOOeI2SUO7VHQBQjnqgGyOChcG
 +npQ==
X-Gm-Message-State: AAQBX9fvD5Fg1kldXQDb3nMLePlXsNrrVfL8F4hqVdlcYJtUBwCJOgfn
 nFGARm0zXKgouEjWcEBSFA237qo0eQtxptgoj/H9derQJpripnICIgmXZ7yQ7QmLMhydalCK09n
 N6sA8wRf170kMFv0=
X-Received: by 2002:a05:6214:528e:b0:5dd:aee7:e016 with SMTP id
 kj14-20020a056214528e00b005ddaee7e016mr7951174qvb.8.1680681707947; 
 Wed, 05 Apr 2023 01:01:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBYX8ptk50KXX/cd1L0pn6ou0jtiUN64Cjr5uTCTgISDfM9kdap50AGdDJ6AGN0tb1/S52Gw==
X-Received: by 2002:a05:6214:528e:b0:5dd:aee7:e016 with SMTP id
 kj14-20020a056214528e00b005ddaee7e016mr7951145qvb.8.1680681707688; 
 Wed, 05 Apr 2023 01:01:47 -0700 (PDT)
Received: from [192.168.8.101] (tmo-066-157.customers.d1-online.com.
 [80.187.66.157]) by smtp.gmail.com with ESMTPSA id
 jh14-20020a0562141fce00b005dd8b9345b6sm4021282qvb.78.2023.04.05.01.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:01:46 -0700 (PDT)
Message-ID: <55cab42d-19b1-c454-8979-0aaae4a64a00@redhat.com>
Date: Wed, 5 Apr 2023 10:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
 <dc07d506-283a-b884-1ab5-54f2e1134fb8@redhat.com>
 <77c41865-1585-6a3a-f02e-1c072a4368bd@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <77c41865-1585-6a3a-f02e-1c072a4368bd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 04/04/2023 17.42, BALATON Zoltan wrote:
> On Tue, 4 Apr 2023, Cédric Le Goater wrote:
>> [ adding Zoltan ]
>>
>> On 4/4/23 16:00, Thomas Huth wrote:
>>> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>>>> On 30/01/2023 20:45, Alex Bennée wrote:
>>>>
>>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>>
>>>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>
>>>>>>>> Testing 32-bit host OS support takes a lot of precious time during 
>>>>>>>> the QEMU
>>>>>>>> contiguous integration tests, and considering that many OS vendors 
>>>>>>>> stopped
>>>>>>>> shipping 32-bit variants of their OS distributions and most hardware 
>>>>>>>> from
>>>>>>>> the past >10 years is capable of 64-bit
>>>>>>>
>>>>>>> True for x86, not necessarily true for other architectures.
>>>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>>>>
>>>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>>>>
>>>>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>>>>> or was it 128-bit ints, caused implications for the codebase ?
>>>>>
>>>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>>>> throughout.
>>>>
>>>> I am one of an admittedly small group of people still interested in 
>>>> using KVM-PR on ppc32 to boot MacOS, although there is some interest on 
>>>> using 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
>>>>
>>>>  From my perspective losing the ability to run 64-bit guests on 32-bit 
>>>> hardware with TCG wouldn't be an issue, as long as it were still 
>>>> possible to use qemu-system-ppc on 32-bit hardware using both TCG and 
>>>> KVM to help debug the remaining issues.
>>>
>>>   Hi Mark!
>>>
>>> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in 
>>> today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a 
>>> proper superset of qemu-system-ppc when it comes to building a unified 
>>> qemu-system binary): What host machine are you using for running KVM-PR? 
>>> And which QEMU machine are you using for running macOS? The mac99 or the 
>>> g3beige machine?
>>
>> Zoltan, what about the pegasos2 and sam460ex machines ? can they be run 
>> under KVM ?
> 
> I don't know as I don't have PPC hardware to test on but theoretically they 
> should work. Although BookE KVM was dropped from Linux I think so sam460ex 
> could only work with an old kernel on a BookE host which is now rare 
[...]

Thanks for your explanations, that indeed helps to understand the situation!

But are you sure about the BookE KVM removal in the Linux kernel? ... when I 
look at the arch/powerpc/kvm/ folder there, I can still see some files there 
with "booke" in the name?

  Thomas



