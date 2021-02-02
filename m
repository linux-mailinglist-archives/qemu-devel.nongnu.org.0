Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2F30BEFA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:04:03 +0100 (CET)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vLe-0000fX-Ju
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6v90-0001dE-E5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:50:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6v8y-00024e-NN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:50:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id l12so1282020wmq.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KS4tZtPSTAROjf8PD6XFdC6uWa3X3gulX1/ylUr8EE8=;
 b=Z8i1t0Gy8rTWAIRoVlymjBCC2OY930NxCg0x0GDRAOpyON3IspuMTP7Jb5dwig9tqT
 xQm8iDcCdDC+L0b2B8crzXDQOhc2ADbZ36JJkC01RfVrSH0FxIqp49Oq05yQ+qh06ozM
 vZDt1f7MLcS1/G4HdvMePaQi6LJCoUWvzeH6wUffQ8ETU4WfaGY9J5Mfu0FI768KTU7y
 a9dsPwSoGeINSUotxt+eIpJ3t/7MJTBOZKPeuPp4NosalSt26BHwPeOr4g6d7GJvYZ6Z
 PSP5XI4DHqbWoHp9IP7ul58lRxktWnAQcSL4u1PkA/aEi6C8ZZUxNzcG0HBtd742Q91u
 rRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=KS4tZtPSTAROjf8PD6XFdC6uWa3X3gulX1/ylUr8EE8=;
 b=bKqrTI09yPYTUZBZ3s6zzgnPcieTqIy3Kg314UPTh/qGQbZu7e04It14B4QserZBpT
 gyN/DXM2ibFaNZIfZhhM1l+Sn/aft3luWNZyh1fvZIohX8upLV4Vxx0mLoPiEh9O1hfw
 tq5MCUlqmZ9F3GtfE/fpj0znCd0kd1l4B/v6fZCx6UjdJ5R+D8P6XZYM25Xy4i0NgDof
 FUpDh94U9ygxEQ+3s2zE4NkW4rAYbhG1WmPjJorRSw4Z4B4D+Z+dY7AuKK5JXhLgvHh5
 pTQ06esGh380u9/H9lUNyhrTFFL8/1ggAY5qRy2q7jSyVNhfPSZ8HgYBf+gbOrk9Edt+
 3/bQ==
X-Gm-Message-State: AOAM533wLswCMk16yKug7v90X7vaGauKxz/eg9CUAKHIswvUOY5l6YAL
 t9ZtK4Ja479+aFdzyMZYha8vxg==
X-Google-Smtp-Source: ABdhPJxRoUf1dH39ffjm8f3IzgBTb7PsMhUFasqlLD32X0uQtE+XBSwq9qE3fFO3kb5df6s4zD+dRA==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr3495944wml.41.1612270254804;
 Tue, 02 Feb 2021 04:50:54 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id n5sm2790259wmq.7.2021.02.02.04.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 04:50:54 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 88e95b9d;
 Tue, 2 Feb 2021 12:50:53 +0000 (UTC)
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 2/4] target/i386: define CPU models to model x86-64
 ABI levels
In-Reply-To: <20210202123239.GE4168502@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-3-berrange@redhat.com> <cunsg6els34.fsf@dme.org>
 <20210202123239.GE4168502@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Tue, 02 Feb 2021 12:50:53 +0000
Message-ID: <cun35yeljki.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::332;
 envelope-from=dme@dme.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-02 at 12:32:39 GMT, Daniel P. Berrang=C3=A9 wrote:

> On Tue, Feb 02, 2021 at 09:46:55AM +0000, David Edmondson wrote:
>> On Monday, 2021-02-01 at 15:36:04 GMT, Daniel P. Berrang=C3=A9 wrote:
>>=20
>> > To paraphrase:
>> >
>> >   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enter=
prise-linux-9-for-the-x86-64-v2-microarchitecture-level/
>> >
>> > In 2020, AMD, Intel, Red Hat, and SUSE worked together to define
>> > three microarchitecture levels on top of the historical x86-64
>> > baseline:
>> >
>> >   * x86-64:    original x86_64 baseline instruction set
>> >   * x86-64-v2: vector instructions up to Streaming SIMD
>> >                Extensions 4.2 (SSE4.2)  and Supplemental
>> > 	       Streaming SIMD Extensions 3 (SSSE3), the
>> > 	       POPCNT instruction, and CMPXCHG16B
>> >   * x86-64-v3: vector instructions up to AVX2, MOVBE,
>> >                and additional bit-manipulation instructions.
>> >   * x86-64-v4: vector instructions from some of the
>> >                AVX-512 variants.
>> >
>> > This list of features is defined in the doc at:
>> >
>> >   https://gitlab.com/x86-psABIs/x86-64-ABI/
>> >
>> > QEMU has historically defaulted to the "qemu64" CPU model on
>> > x86_64 targets, which is approximately the x86-64 baseline
>> > ABI, with 'SVM' added.
>> >
>> > It is thought it might be desirable if QEMU could provide CPU models
>> > that closely correspond to the ABI levels, while offering portability
>> > across the maximum number of physical CPUs.
>> >
>> > Historically we've found that defining CPU models with an arbitrary
>> > combination of CPU features can be problematic, as some guest OS
>> > will not check all features they use, and instead assume that if
>> > they see feature "XX", then "YY" will always exist. This is reasonable
>> > in bare metal, but subject to breakage in virtualization.
>> >
>> > Thus in defining the CPI models for the ABI levels, this patch attempt=
ed
>>=20
>> s/CPI/CPU/
>>=20
>> > to base them off an existing CPU model.
>> >
>> > While each x86-64-abiNNN has a designated vendor, they are designed
>> > to be vendor agnostic models. ie they are capable of running on any
>> > AMD or Intel physical CPU model that satisfies the ABI level. eg
>>=20
>> Only AMD or Intel? (You mention the Hugon chips elsewhere.)
>
> In theory any x86 CPU that meets the ABI level, regardless of vendor
> but if any vendor's set of CPUID features diverges too far from other
> CPUs of similar level we might have problems.

Understood - so why say "AMD or Intel"?

> For example, I had to specially avoid including "aes" in the
> x86-64-abi3 because of the Hugon chips lacking it. There might
> be other cases like this, since I've only compared CPUID sets
> for named CPUs that QEMU includes.
>
>> > None of the CPU models declare any VMX/SVM features. This would
>> > make them unable to support nested virtualization with live
>> > migration.
>>=20
>> How about "Unable to support hardware accelerated nested
>> virtualization." ?
>>=20
>> Is live migration relevant?
>
> Choice of CPU models is a critical decision in your future ability
> to live migrate, so I wanted to call that out specifically.

But the restriction, I believe, is not that you won't be able to live
migrate with nested VMs, it's that you don't get support for nested VMs
(well, hardware accelerated - you could still run a fully emulated
nested VM). Live migration with nested VMs is irrelevant if I don't
*get* nested VMs.

dme.
--=20
I don't care 'bout your other girls, just be good to me.

