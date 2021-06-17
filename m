Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32323AB118
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:14:01 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp28-00045V-Ty
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltorN-00038g-Mf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:02:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltorJ-0003PW-HE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:02:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o3so6068010wri.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=o6wU7c8aPG1frv7Aqb0Xakx0kFxe/9S8bPOUTbvlcjo=;
 b=KCkJ/aH/Hi6KZfrwU3Da1Wnrb4IcHSRN3sUxh0RPxfv3fS1LIx/CpZGHant1bdWbZd
 hHWfvZ+Ko91g0hIvcK4XWIoJ6qvwItzmK33ajjy9VrXV25bgJqGZmi2+jAUPjOWCLNAl
 mzfl+BL8UWxSJEYFya5cGTtQouV0fMxPmVN/ADSuA9rkCrnpZ70+xfpktE9IJHUQWLgL
 ZBcEz9Fp2FfTjI/Ri2jIX6QtIAiETS0oQh0EGGOGRupfk/YAP7RK0WIanoXEPJOdWAU/
 aAlb0KfYWCHg4CXrHSh6iJWdtNB3g+p4egq8JFAhGrF+Eu7tdNvBaOPP7WN9HkRQfNza
 6RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=o6wU7c8aPG1frv7Aqb0Xakx0kFxe/9S8bPOUTbvlcjo=;
 b=m2X1kWfjedoDCkGhK4FxeOe3e3OVaDfoVg+DmD5ucp3epXcqtCWsyfveHQiEQmnlDB
 tJEPA8fs+UlcWgpcrY6d7CcDkBwUtC7QGlawEVp2L3z7r6jD3dBHnTWOV344DM2Cahlh
 p/rqbw6xpbeVCvli/tE1uWrl9NgkjPg3EnunTC6Xfh9p+1fqT4+W452M+G/WMtmURaQ7
 92SwyiGZm/QacpRSyBucwp/uD1iqYpMApk0YhQZJb7Dnku5K3y+IGzlKv4UVwZsDf2ZA
 BDnm481WLfSpKiXY7FyfuDcUf+jjXXJjt9f2GNDpJ36QIoWETFJQ1/mqfrGxngi+k+b1
 kBjg==
X-Gm-Message-State: AOAM5312Jit3L/aE8OobIOK8o52B00shg2eidQYNJrThkvV/BEhcQsV+
 x3/zSsr/9098cJvgyKfUjMMa2Q==
X-Google-Smtp-Source: ABdhPJyqAexM4VNam80BKSi89uDaUKmBklO47JJamRktbqPWanCauQPsF8OQqq4bHZ1DthSq9ugbhA==
X-Received: by 2002:adf:eace:: with SMTP id o14mr1294398wrn.159.1623924167298; 
 Thu, 17 Jun 2021 03:02:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm4279650wre.48.2021.06.17.03.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 03:02:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A84931FF7E;
 Thu, 17 Jun 2021 11:02:45 +0100 (BST)
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com>
 <871r93k04f.fsf@linaro.org>
 <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
 <fe85f44b-a7a6-1b59-daa6-c5b6b81a2112@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre IOOSS <erdnaxe@crans.org>
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Thu, 17 Jun 2021 10:55:52 +0100
In-reply-to: <fe85f44b-a7a6-1b59-daa6-c5b6b81a2112@crans.org>
Message-ID: <87fsxgg662.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre IOOSS <erdnaxe@crans.org> writes:

> [[PGP Signed Part:Undecided]]
> On 6/15/21 6:47 PM, Alexandre IOOSS wrote:
>> On 6/15/21 10:22 AM, Alex Benn=C3=A9e wrote:
>>> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>>>> On 14/06/2021 11:01, Alexandre Iooss wrote:
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * Log instruction execution
>>>>> + */
>>>>> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 char *insn_disas =3D (char *)udata;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Add data to execution log */
>>>>> +=C2=A0=C2=A0=C2=A0 fprintf(output, "insn: %s\n", insn_disas);
>>>
>>> =C2=A0=C2=A0 insn, 0x%08lx, disas
>>>
>>> Currently however on a multi-threaded execution you will potentially
>>> loose any synchronisation between the insn_exec and any memory operation
>>> associated with it. If you really just care about what's tickling
>>> hardware you could just drop the insn_exec callback and pass the
>>> instruction information via udata to the vcpu_mem callback. You could
>>> then dump everything in one line:
>>>
>>> =C2=A0=C2=A0 0xPC, ld [x1], x2, 0xADDR, load|store
>>>
>>> you wouldn't dump other instructions leading up to that though.
>> You are correct, this is indeed an issue and it's currently making
>> my life really hard when I try to apply a side-channel model on the
>> memory interactions.
>> I prefer to log all instructions, so I need to use vcpu_mem_cb when
>> it's a memory instruction, or vcpu_insn_exec_cb if it's not.
>
> If I always set vcpu_mem_cb and vcpu_insn_exec_cb, then an user can do
> a bit of postprocessing of the data to merge lines that correspond to
> memory interactions. Example of output (Cortex-M0 in Thumb mode):
>
> ```
> # vaddr, opcode, disassembly, [load/store, memory addr, device]
> 0xa14, 0xf87f42b4, "cmp r4, r6"
> 0xa16, 0xd206, "bhs #0xa26"
> 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]"
> 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
> 0xa1a, 0xf989f000, "bl #0xd30"
> 0xd30, 0xfff9b510, "push {r4, lr}"
> 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM
> 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee4, RAM
> 0xd32, 0xf9893014, "adds r0, #0x14"
> 0xd34, 0xf9c8f000, "bl #0x10c8"
> 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]"
> 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
> ```

To be honest the post-processing is probably as workable solution as
anything else.

>
> If we don't want to call `vcpu_insn_exec_cb` when `vcpu_mem_cb` is
> triggered, then I would have either to:
>
> 1. Implement load/store instructions matchers, similar to what is done
> in `howvec.c` plugin.

This is probably fairly easy for most RISCs with sane encodings.

> 2. Implement instructions mnemonic matchers (using the output of
> qemu_plugin_insn_disas).

I wouldn't rely on textual formatting and reverse parsing the data.

> 3. Use Capstone and disassemble a second time each instructions.

The disassembly memory belongs to the plugin until it frees it so there
is no reason why you can't cache the data. If you share the same
callback data between the insn and mem callbacks you could just cache
the data in the insn callback and only print it out in the memory
callback. If you run another insn callback without having run a memory
callback then you know the last insn was a non-memory affecting one and
you print it out then before caching the current data. For a single
thread this would still look coherent and will be coherent per core if
you take care to cache in a per-cpu aware structure.

> What is your opinion on these solutions? Maybe for a first version we
> can keep it simple?

There is no problem with keeping it simple - and it certainly shouldn't
hold up merging. It can always be improved upon later ;-)

>
> Thanks,
> -- Alexandre
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

