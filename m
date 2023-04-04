Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1356D6571
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhiR-000541-0d; Tue, 04 Apr 2023 10:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pjhiO-00053f-Rd
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pjhiM-0004Qq-NT
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680618769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxbYkw2JinzxDSS40BjlDqxgi00BxF5rz63Ixpi6NJU=;
 b=Br9KMYTgJaVrn3FcBWPwgZV1Gh3lk9g+e0OaVGJK3Dez6vMhpry7EDDk9lvJ9ALf56DCoy
 kHHc1m5jTLFDCK95YH8ezH4jcDEchFZxVtTxfG+PcZXKyxNNVtrPrQw6rjt51Q0WHXxCZJ
 fD6oDCMKSQcbxxvP4EMUl6FfBdmarQQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-Ja7lPt6vNq6k5bzMZh3G4w-1; Tue, 04 Apr 2023 10:32:48 -0400
X-MC-Unique: Ja7lPt6vNq6k5bzMZh3G4w-1
Received: by mail-yb1-f198.google.com with SMTP id
 j11-20020a25230b000000b00b6871c296bdso31880101ybj.5
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TxbYkw2JinzxDSS40BjlDqxgi00BxF5rz63Ixpi6NJU=;
 b=ysdFIi0p+czBtw/t7rBInCkURgOR7kKOMO32v1yB1pLLEM9zpLfLt6Hn13VfIsd50C
 YlQtEPg9Dg3EJ0BZQQHCsjLBKeFz/3joKm16OyfBv1sVPUjkwqNgmV8sxtT440iAsjEH
 9qVxr/YGcJYsoLdGMY/o5UwEmo/koO3xfoM53QYSJWsoGGbbiyOz6lT0gNECHyE/7wK7
 95epo1+C1HKMmyD7j5UkJ4NwOkUEVGisAtvjDiWzQC+q0c9RRYNWSstBVeP42n6YDP90
 CyYP0SuRYUT0WEf11kUfGEG0jVSeUB2k3huChNneFM8WVpkay7rOZTYosDRLoL6rqdOP
 OCzg==
X-Gm-Message-State: AAQBX9dTthXVi6PGtUITQYhTD+ewKAw6+5gpT4+vcnAMj9qE1eCCUodZ
 n2a4BhjzdFO9Rz+L3O9luFk36zISehSPXbODiB0uPPps9mPX70W3PqlssRxKcaXZKA0MvYh4AgB
 xj9yIO7xPFirjPWk=
X-Received: by 2002:a81:6108:0:b0:541:69c4:84b4 with SMTP id
 v8-20020a816108000000b0054169c484b4mr3186213ywb.51.1680618767859; 
 Tue, 04 Apr 2023 07:32:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350YyAQyp1oEQ3i20Ti5Za8fjTo0RIvks5XfRyG95iwTEnFWrsXA5tcLBlaNLjD53ZYa5lpyZaw==
X-Received: by 2002:a81:6108:0:b0:541:69c4:84b4 with SMTP id
 v8-20020a816108000000b0054169c484b4mr3186186ywb.51.1680618767591; 
 Tue, 04 Apr 2023 07:32:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 s186-20020ae9dec3000000b007426e664cdcsm2320500qkf.133.2023.04.04.07.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:32:46 -0700 (PDT)
Message-ID: <dc07d506-283a-b884-1ab5-54f2e1134fb8@redhat.com>
Date: Tue, 4 Apr 2023 16:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
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

[ adding Zoltan ]

On 4/4/23 16:00, Thomas Huth wrote:
> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>> On 30/01/2023 20:45, Alex Bennée wrote:
>>
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>
>>>>>> Testing 32-bit host OS support takes a lot of precious time during the QEMU
>>>>>> contiguous integration tests, and considering that many OS vendors stopped
>>>>>> shipping 32-bit variants of their OS distributions and most hardware from
>>>>>> the past >10 years is capable of 64-bit
>>>>>
>>>>> True for x86, not necessarily true for other architectures.
>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>>
>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>>
>>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>>> or was it 128-bit ints, caused implications for the codebase ?
>>>
>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>> throughout.
>>
>> I am one of an admittedly small group of people still interested in using KVM-PR on ppc32 to boot MacOS, although there is some interest on using 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
>>
>>  From my perspective losing the ability to run 64-bit guests on 32-bit hardware with TCG wouldn't be an issue, as long as it were still possible to use qemu-system-ppc on 32-bit hardware using both TCG and KVM to help debug the remaining issues.
> 
>   Hi Mark!
> 
> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a proper superset of qemu-system-ppc when it comes to building a unified qemu-system binary): What host machine are you using for running KVM-PR? And which QEMU machine are you using for running macOS? The mac99 or the g3beige machine?

Zoltan, what about the pegasos2 and sam460ex machines ? can they be run under KVM ?

Thanks,

C.


