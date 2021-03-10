Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A5334035
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:21:15 +0100 (CET)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzi6-0000YV-K4
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJzgh-0007t9-9k; Wed, 10 Mar 2021 09:19:47 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJzgf-0002I7-E8; Wed, 10 Mar 2021 09:19:47 -0500
Received: by mail-ej1-x62c.google.com with SMTP id dx17so39045188ejb.2;
 Wed, 10 Mar 2021 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NyPuHjJrob1DSMBQpU2+xyqUojxbVPrS3GDfCo0eBM4=;
 b=GeuYUZlv8VXlfAX4a3UozDBWl2mBb7TzJZmSZenr1EZeEgHDjsBxOa5TFOX/i7E+RE
 kk4nwaUdddHUZfc85yMA1zVZ8U38hvsyz5TaoyApLbK0QiqJzt1gsg+HzUGmc+BZLGg8
 eTwFXZiLyBzEiXiQq2+y9tHwGG1ZTm0w3ZF1VRM6X+7/v5kaB9pHELiUilAlDdU7TJZu
 +86Uqjl60VxXZubH2zeY8CKPpiGTDJZ1cz5H3nLswqKQPWAxM0faNBeiJEmR4GHZnYmv
 fExp6izVp+ncZFAz5gVv9y7WruLJ6KIH2OZFhOTcEk663RLbVs5k2SfkkrC+mrOs2ri/
 sFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NyPuHjJrob1DSMBQpU2+xyqUojxbVPrS3GDfCo0eBM4=;
 b=jns/PCQj77XgWgBMAj6JY2VNmbj42asByFVUWhEbHKM0jVRQZ3JeEc1/jjHPkNgC0m
 u3omkeijnDKLHhmtxqtjx/4AkPiEHmgCMbQ7MVnZv/fwW8EN1EkO4xlaRDtIRFFM0whR
 emYO9KTZaP8rLk9nWyf71+6kKVWrdxZhfSBZJJ+Q02ocfarmVU/npPM4Atm2Z1vu2gMt
 tiMdG/YjQOBVg0Nnt5gM5ykIdzhPo8yQnk4YtipQI8xHpyPtNuolpjYhUs+Ep0nD5q1V
 6CjW3p5WvIZMrviVtL3X626dnBrbYotJmO8lMrRkHkYKeK8KxoMkdz0I0ESKhcXjl8jm
 xbaA==
X-Gm-Message-State: AOAM533mgEzn+lzRIu0aaJjJye5xYV2P69j3T96ArfxTYinB0axUBTeR
 YbOEsnxSLFWnWphXiJRBO6s=
X-Google-Smtp-Source: ABdhPJxlE0GdTJIjXbztkHvQ43H4uxL6yDW4FxerLGhejhOGKYBAULjtMViuXgaiftGUQv6xbm095Q==
X-Received: by 2002:a17:906:e2d4:: with SMTP id
 gr20mr3975800ejb.432.1615385983624; 
 Wed, 10 Mar 2021 06:19:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id be27sm11158426edb.47.2021.03.10.06.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:19:43 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
 <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
 <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
 <c1b1838e-4b91-5411-42f6-cea97e1f0e81@suse.de>
 <68796aa5-1c75-8a74-fc98-7d929df9478d@amsat.org>
 <c7a46e45-1682-ad76-a9eb-a155729e8d8f@suse.de>
 <b79d147d-85e8-6631-53dd-9feecb3e7729@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5238da6e-ace9-7e88-a5a5-9922a3554f3e@amsat.org>
Date: Wed, 10 Mar 2021 15:19:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b79d147d-85e8-6631-53dd-9feecb3e7729@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 3:00 PM, Claudio Fontana wrote:
> On 3/10/21 2:45 PM, Claudio Fontana wrote:
>> On 3/10/21 2:42 PM, Philippe Mathieu-Daudé wrote:
>>> On 3/10/21 12:46 PM, Claudio Fontana wrote:
>>>> On 3/9/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 3/9/21 2:41 PM, Claudio Fontana wrote:
>>>>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>>>>> IDAU is specific to M-profile. KVM only supports A-profile.
>>>>>>> Restrict this interface to TCG, as it is pointless (and
>>>>>>> confusing) on a KVM-only build.
>>>>>>>
>>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>
>>>>>>
>>>>>> This one breaks the KVM tests hard though (most of them).
>>>>>>
>>>>>> I will try to figure out why.
>>>>>>
>>>>>> Ciao,
>>>>>>
>>>>>> Claudio
>>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>  target/arm/cpu.c     | 7 -------
>>>>>>>  target/arm/cpu_tcg.c | 8 ++++++++
>>>>>>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>>>>> index b8bc89e71fc..a772fd4926f 100644
>>>>>>> --- a/target/arm/cpu.c
>>>>>>> +++ b/target/arm/cpu.c
>>>>>>> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>>>>>>>      .class_init = arm_cpu_class_init,
>>>>>>>  };
>>>>>>>  
>>>>>>> -static const TypeInfo idau_interface_type_info = {
>>>>>>> -    .name = TYPE_IDAU_INTERFACE,
>>>>>>> -    .parent = TYPE_INTERFACE,
>>>>>
>>>>> Hmm this is an interface...
>>>>>
>>>>> Is a CPU/machine trying to resolve it?
>>>>
>>>> Well, this fails horribly at any qemu-system-aarch64 startup for the kvm-only build:
>>>>
>>>> in my view we cannot remove the idau interface until we have removed all the TCG-only boards fronm the build.
>>>
>>> Yes, this is a similar bug to the one fixed by commit 8d0bceba24c
>>> ("hw/nvram: Always register FW_CFG_DATA_GENERATOR_INTERFACE").
>>>
>>>>
>>>> When calling qemu_init(), and we get into select_machine(),
>>>>
>>>> the object_class_get_list() tries to initialize all machine types.
>>>>
>>>> When it does that, it tries to initialize the IDAU interface, and fails.
>>>>
>>>> #0  0x0000ffffb9e51828 in raise () at /lib64/libc.so.6
>>>> #1  0x0000ffffb9e52e4c in abort () at /lib64/libc.so.6
>>>> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
>>>> #3  0x0000aaaae042c06c in object_class_foreach_tramp (key=0xaaaaf0cb3940, value=0xaaaaf0cb37c0, opaque=0xfffff9f2bac8)
>>>>     at ../qom/object.c:1069
>>>> #4  0x0000ffffbb3d4248 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
>>>> #5  0x0000aaaae042c180 in object_class_foreach (fn=
>>>>     0xaaaae042c324 <object_class_get_list_tramp>, implements_type=0xaaaae089cc90 "machine", include_abstract=false, opaque=0xfffff9f2bb10)
>>>>     at ../qom/object.c:1091
>>>> #6  0x0000aaaae042c3a8 in object_class_get_list (implements_type=0xaaaae089cc90 "machine", include_abstract=false) at ../qom/object.c:1148
>>>> #7  0x0000aaaae03863d8 in select_machine () at ../softmmu/vl.c:1607
>>>> #8  0x0000aaaae038ad74 in qemu_init (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/vl.c:3489
>>>> #9  0x0000aaaadfdcf5a0 in main (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/main.c:49
>>>>
>>>>
>>>> (gdb) frame 2
>>>> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
>>>> 333                     abort();
>>>> (gdb) p ti[0]
>>>> $1 = {name = 0xaaaaf0cb3940 "mps2tz", class_size = 408, instance_size = 202224, instance_align = 0, class_init = 
>>>>     0xaaaae0273408 <mps2tz_class_init>, class_base_init = 0x0, class_data = 0x0, instance_init = 0x0, instance_post_init = 0x0, 
>>>>   instance_finalize = 0x0, abstract = true, parent = 0xaaaaf0cb3960 "machine", parent_type = 0xaaaaf0cad860, class = 0xaaaaf0d0d830, 
>>>>   num_interfaces = 1, interfaces = {{typename = 0xaaaaf0cb3980 "idau-interface"}, {typename = 0x0} <repeats 31 times>}}
>>>>
>>>>
>>>> In my view we should revert this until all incompatible boards are disabled
>>>
>>> My view is this is a QOM design problem. Others might hit the
>>> same issue. It is hard to debug. It should be fixed upfront.
> 
> What is the QOM design problem to fix exactly?

It is hard to follow where interface types are registered,
they can be easily removed from a binary by deselecting options
with Kconfig.

There is an strict Implementation -> Interface QOM dependency
which is hard to match with Kconfig and modularized builds.

> And in any case, I think this small change "target/arm: Restrict v8M IDAU to TCG",
> when applied on its own, does not get us any closer to the goal, it actually hinders us, as we do not have a working buildable and testable kvm-only build to base on.
> 
> That is why I added a revert of this to my series.

No problem with that!

> My suggestion is just to postpone your change to later on,
> when we have the other pieces in place (ie after we can disable incompabile boards).
> 
> A working kvm-only build is a good starting point I think.
> 
> After we are able to disable incompatible boards,
> we can reapply "target/arm: Restrict v8M IDAU to TCG",
> and we can also remove a lot of additional stubs and V7M-only code and such from the KVM-only build.
> 
> But I'd rather have a functional, make check-able starting point..

At least you have tests ;)

