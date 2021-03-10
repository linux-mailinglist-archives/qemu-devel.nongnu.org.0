Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC05333F7E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:43:59 +0100 (CET)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJz82-0003QL-As
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJz73-0002Xb-RK; Wed, 10 Mar 2021 08:42:57 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJz6z-0006cM-Bw; Wed, 10 Mar 2021 08:42:55 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b7so28133551edz.8;
 Wed, 10 Mar 2021 05:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q5R1hzF68oWb4AIl7Ru9WL77FUehNGsE3mqDz5p6ROM=;
 b=RrWaL3hS/DHyNmxTFD1uuRDdVz3yb8ITIOK3Tg6SHvSm/AvNXT8+dLCRLue2TxDhex
 FnBQzTASzh64kCeU4Jojy4oQN2atekctoZlBVilrRDJl1mFjeh+3+qeB91X/mkXcYLK2
 8fueNQq2grvHW1ZpHRZFCsrk9ee+gxhG0kyfAkE/qQRe/CJVx0z6HlBn41VyajXbVw9s
 eajUA6x2M7x3iNAOH9qqgY39UwPQSarbl9R12y5QPPaF3JXU+FUJwpfuDoav9Fok4ayP
 MwlIHFtd3XpeQrCxrIT/iI8wCNfNEZs3rGZnWfp8JgwKWzrrknwaGP62zsnMsHHtOH2I
 w6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5R1hzF68oWb4AIl7Ru9WL77FUehNGsE3mqDz5p6ROM=;
 b=Bk7oVV09tsL0Dtu87t/sPBBiuDpsV4Z668mQyzecjwi8JFqQ6LpYwrEwatJUUpAxsE
 zivDj/XCUMPNHf0kdoQgZ4c3NousgzSwQCoNGFaHhSfQ0UNe0KfRvm5WvxnBOU4Xs0+q
 jjtox2zRP8p24pd7PP8PWfnpn/+Rt0AHFPOYVcOby5Xgka58himQ0WNCB1xcfT1z7c3n
 7mYJlcqFmOD9l90gTRCkKoBKcpKO8StJxd/+Gtpm59UzXx4ectf0ujy78zsVbs/60kQX
 3L4Ev6yqFcjTir113bYeOoIVNHJpWKVmUY8A/PVb22td9sFU5DrHZFSPry+E1QqqRu5R
 HYMw==
X-Gm-Message-State: AOAM533h7HTJZo6OZSxWmrN0OmqhuGeYT43Kq3V/AZcpzgPBoQuN1kxe
 +MwRrbcvMbjkX4itseNhuCs=
X-Google-Smtp-Source: ABdhPJySYBrQvFt10L3wGbPzJHYNQvsfX7sNhfP6kVP9f7a+u+nTNXpCU9yO39clLOuyhCPfB8cqbw==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr3413989edt.86.1615383770775; 
 Wed, 10 Mar 2021 05:42:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm9636741ejb.8.2021.03.10.05.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 05:42:50 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
 <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
 <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
 <c1b1838e-4b91-5411-42f6-cea97e1f0e81@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68796aa5-1c75-8a74-fc98-7d929df9478d@amsat.org>
Date: Wed, 10 Mar 2021 14:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c1b1838e-4b91-5411-42f6-cea97e1f0e81@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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

On 3/10/21 12:46 PM, Claudio Fontana wrote:
> On 3/9/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>> On 3/9/21 2:41 PM, Claudio Fontana wrote:
>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>> IDAU is specific to M-profile. KVM only supports A-profile.
>>>> Restrict this interface to TCG, as it is pointless (and
>>>> confusing) on a KVM-only build.
>>>>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>>
>>> This one breaks the KVM tests hard though (most of them).
>>>
>>> I will try to figure out why.
>>>
>>> Ciao,
>>>
>>> Claudio
>>>
>>>
>>>> ---
>>>>  target/arm/cpu.c     | 7 -------
>>>>  target/arm/cpu_tcg.c | 8 ++++++++
>>>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> index b8bc89e71fc..a772fd4926f 100644
>>>> --- a/target/arm/cpu.c
>>>> +++ b/target/arm/cpu.c
>>>> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>>>>      .class_init = arm_cpu_class_init,
>>>>  };
>>>>  
>>>> -static const TypeInfo idau_interface_type_info = {
>>>> -    .name = TYPE_IDAU_INTERFACE,
>>>> -    .parent = TYPE_INTERFACE,
>>
>> Hmm this is an interface...
>>
>> Is a CPU/machine trying to resolve it?
> 
> Well, this fails horribly at any qemu-system-aarch64 startup for the kvm-only build:
> 
> in my view we cannot remove the idau interface until we have removed all the TCG-only boards fronm the build.

Yes, this is a similar bug to the one fixed by commit 8d0bceba24c
("hw/nvram: Always register FW_CFG_DATA_GENERATOR_INTERFACE").

> 
> When calling qemu_init(), and we get into select_machine(),
> 
> the object_class_get_list() tries to initialize all machine types.
> 
> When it does that, it tries to initialize the IDAU interface, and fails.
> 
> #0  0x0000ffffb9e51828 in raise () at /lib64/libc.so.6
> #1  0x0000ffffb9e52e4c in abort () at /lib64/libc.so.6
> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
> #3  0x0000aaaae042c06c in object_class_foreach_tramp (key=0xaaaaf0cb3940, value=0xaaaaf0cb37c0, opaque=0xfffff9f2bac8)
>     at ../qom/object.c:1069
> #4  0x0000ffffbb3d4248 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
> #5  0x0000aaaae042c180 in object_class_foreach (fn=
>     0xaaaae042c324 <object_class_get_list_tramp>, implements_type=0xaaaae089cc90 "machine", include_abstract=false, opaque=0xfffff9f2bb10)
>     at ../qom/object.c:1091
> #6  0x0000aaaae042c3a8 in object_class_get_list (implements_type=0xaaaae089cc90 "machine", include_abstract=false) at ../qom/object.c:1148
> #7  0x0000aaaae03863d8 in select_machine () at ../softmmu/vl.c:1607
> #8  0x0000aaaae038ad74 in qemu_init (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/vl.c:3489
> #9  0x0000aaaadfdcf5a0 in main (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/main.c:49
> 
> 
> (gdb) frame 2
> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
> 333                     abort();
> (gdb) p ti[0]
> $1 = {name = 0xaaaaf0cb3940 "mps2tz", class_size = 408, instance_size = 202224, instance_align = 0, class_init = 
>     0xaaaae0273408 <mps2tz_class_init>, class_base_init = 0x0, class_data = 0x0, instance_init = 0x0, instance_post_init = 0x0, 
>   instance_finalize = 0x0, abstract = true, parent = 0xaaaaf0cb3960 "machine", parent_type = 0xaaaaf0cad860, class = 0xaaaaf0d0d830, 
>   num_interfaces = 1, interfaces = {{typename = 0xaaaaf0cb3980 "idau-interface"}, {typename = 0x0} <repeats 31 times>}}
> 
> 
> In my view we should revert this until all incompatible boards are disabled

My view is this is a QOM design problem. Others might hit the
same issue. It is hard to debug. It should be fixed upfront.

> In this case, the one failing is MPS2, so the offender is
> 
> devices/arm-softmmu.mak:CONFIG_MPS2=y
> 
> from the point of view of the kvm-only build.
> 
> What I'd suggest is (but I am open to alternatives):
> 
> * revert this one
> * complete my arm cleanup series, with now all tests passing
> * disable the non-KVM boards for KVM-only builds (basically your series)
> * apply the accelerator classes specializations to ARM

MPS2TZ uses a Cortex-M33 which is requires TCG.
The machine shouldn't be present if TCG is not built-in.

Previous attempt which you acked :)
"target/arm: Restrict ARMv7 M-profile cpus to TCG accel"
https://www.mail-archive.com/qemu-block@nongnu.org/msg79943.html

