Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08B644168
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VPq-0000QQ-Fc; Tue, 06 Dec 2022 05:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p2VPm-0000Q4-92
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:43:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p2VPk-0005RI-FL
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:43:05 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so13962687wmb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 02:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZbDkrN4/YnDkZpZpxYB7f4uNuYTsVbOXMjp1WMfiJ4=;
 b=qD3BNHDU6aGS2QNtbteQ8tVH5tkSEB5oNv9vJAsmGhco8xMAxBn0mA4UjLUio3qbGP
 VGHW2+M/OaxfcLBeaqPoe6bck40EAe2tkG7nZ/7nd4XfG+yUL8/0CEKOblWrDkEUo8Qg
 MtFLxP6dLm9gFW7r6Uiw/LIzq6BJVCrxtgDdjr2O/4K/0jXftOLHASZyhiw3HKVltHpb
 ojTmw/PDJtGb0WU0RCzv7//iyaUhb9QYtpHz6tc/tIIE+2ZlzuNsfYIDad3gpzhSu6yD
 oEZoYKA7E1ypxzwZ13NgyOg7zRL2iGah573NmJjkI7m0Lryg8HOd0rt0qwDx1b4h+vY4
 wkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rZbDkrN4/YnDkZpZpxYB7f4uNuYTsVbOXMjp1WMfiJ4=;
 b=PEebbcOBztz7ynP1rWgg25ajVTmW1fWXsu8oJtGSWRErr50EjxlFKyBmbze4moPXaa
 giPX9Oly8h2AREE3qUFYXzjFD8niyqiJO5EBfZBJChxYlbgsqQIJ2VwxsdC/4/8jDZEU
 8PO3xAG/jkfZpdpDb3sIf9GCrXIhUuyYeKdqpTcYfISPO6M9ZI7I3/Ihazdzn72xDGS/
 PBWeaJKJtzlXrsFv21KVeJaghWuWqy4N0DTRal8aGKB/6qbhCB/YCtHm6XQIPfzS8E0F
 eDElXlFo+LogUoxk5655DaeVwHgMLFPrJwwRMorW/DAO6P8aBYYN5u4O4+Jyw4SivS2F
 E+Fg==
X-Gm-Message-State: ANoB5pnWkCW4sQ3kPhMIJfvWL3ml/jzmvLZg9Xltb3LegXa+i//le6r1
 FPsIay0osC+ZHNTXb4XDyMbOvQ==
X-Google-Smtp-Source: AA0mqf7oZsJo8lSb1pxcjFt7JZPnqwxtVl8cQNGc48xw44ef6VdCqtzlkB/NWokcCo2fUg7fZimErQ==
X-Received: by 2002:a05:600c:4a99:b0:3cf:91e5:3d69 with SMTP id
 b25-20020a05600c4a9900b003cf91e53d69mr67415290wmp.160.1670323382697; 
 Tue, 06 Dec 2022 02:43:02 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d624e000000b00241dd5de644sm16146591wrv.97.2022.12.06.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 02:43:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A64A1FFB7;
 Tue,  6 Dec 2022 10:43:01 +0000 (GMT)
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-11-dwmw2@infradead.org>
 <efef965d-3c9b-abc0-ac5f-c252b10722bd@linaro.org>
 <cb4cdc7944c74ee1918667ba455b9afd0fae351c.camel@infradead.org>
 <d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
Date: Tue, 06 Dec 2022 10:41:40 +0000
In-reply-to: <d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org>
Message-ID: <87tu28n77u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> +Thomas
>
> On 6/12/22 02:10, David Woodhouse wrote:
>> On Mon, 2022-12-05 at 23:11 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 5/12/22 18:31, David Woodhouse wrote:
>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>>
>>>> This means handling the new exit reason for Xen but still
>>>> crashing on purpose. As we implement each of the hypercalls
>>>> we will then return the right return code.
>>>>
>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>>> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>> ---
>>>>    target/i386/kvm/kvm.c    |  5 +++++
>>>>    target/i386/trace-events |  3 +++
>>>>    target/i386/xen.c        | 45 +++++++++++++++++++++++++++++++++++++=
+++
>>>>    target/i386/xen.h        |  1 +
>>>>    4 files changed, 54 insertions(+)
>>>>
>>>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>>>> index 4b21d03250..6396d11f1e 100644
>>>> --- a/target/i386/kvm/kvm.c
>>>> +++ b/target/i386/kvm/kvm.c
>>>> @@ -5468,6 +5468,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct k=
vm_run *run)
>>>>            assert(run->msr.reason =3D=3D KVM_MSR_EXIT_REASON_FILTER);
>>>>            ret =3D kvm_handle_wrmsr(cpu, run);
>>>>            break;
>>>> +#ifdef CONFIG_XEN
>>>
>>> CONFIG_XEN is set when the _host_ has Xen development files available.
>>>
>>> IIUC here you want to check if Xen HVM guest support is enabled.
>>>
>>> You might want to use a different CONFIG_XEN_xxx key, which itself
>>> depends on CONFIG_XEN.
>> Yeah, I'd be interested in opinions on that one.
>> Strictly, the only one that *needs* to be a configure option is
>> CONFIG_XEN for the Xen libraries, which is support for actually running
>> on Xen.
>> Any time KVM is present, we *could* pull in the rest of the xenfv
>> machine support unconditionally, since that's no longer dependent on
>> true Xen.
>> But because there's a non-trivial amount of code in the event
>> channel
>> and grant table stuff, *perhaps* we want to make it optional? I don't
>> really want to call that CONFIG_KVM_XEN since as noted, it's
>> theoretically possible to do it with TCG or other accelerators too. So
>> we could call it CONFIG_XEN_EMULATION.
>
> I concur CONFIG_KVM_XEN is confusing; CONFIG_XEN_EMULATION /
> CONFIG_XEN_EMU sounds better.
>
> Is it useful to have the CONFIG_XEN_EMU code under target/i386/ built
> without having the xenfv machine built in?
>
> I rather have hw/ and target/ features disentangled, so I'd use
> CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,
> eventually having CONFIG_XEN_EMU depending on CONFIG_XENFV_MACHINE
> and -- for now -- CONFIG_KVM.

You should also probably be aware of:

  Subject: [QEMU][PATCH v2 00/11] Introduce xenpv machine for arm architect=
ure=20
  Date: Thu, 1 Dec 2022 18:59:52 -0800
  Message-ID: <20221202030003.11441-1-vikram.garhwal@amd.com>

which moves some of the previously i386 only Xen code into common
backend code.

--=20
Alex Benn=C3=A9e

