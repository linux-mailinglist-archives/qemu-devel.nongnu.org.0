Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D25094EE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 04:05:41 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhMCS-0007XF-Jr
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 22:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nhMBG-0006gK-LI; Wed, 20 Apr 2022 22:04:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nhMBE-0003Y0-Lr; Wed, 20 Apr 2022 22:04:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id q12so3370091pgj.13;
 Wed, 20 Apr 2022 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MwXc6Js8jzlhuh5Dy5rHky3QZ+v49yakUSLIPDtheLE=;
 b=lvxAkV8eR5fbRFlLq2tvzHWn6Cz1YTGq9A/tV1/un+Y0DA/HNRnj1xUvxk4xtrbTqX
 /QdhFI03oAHMnMNEyPoO0vkXbb3GjzFa6BxDF/emra+ocORWj2CR8qHYjaiVp/MLkVv/
 kKQ7h0L47D2BI53hLaVbWfrsYV/H4cLIR/Vb8UzEM94wASyhKibsE3IFRBQn0XYTHg1n
 QTLIQDV2FWSMEAO9Jn+1XLWq/QRarsa0sp2eNL4fmyT0ESCxwv0wpAX5Y0FFBRdFGHbl
 lw/FNWVFPsW7dz9BpOJHdsLoRquD69WrkkK3AjclPsGEZ5vPcCrfYbLivBEY2XkwrTEC
 jRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MwXc6Js8jzlhuh5Dy5rHky3QZ+v49yakUSLIPDtheLE=;
 b=XknUkSXjwdrKFjO8voRYKCbSNy5lJMHzAZ8TXlDBZBHIHGD7JSnGhbBfwomB1RudSw
 0aOfqcSEGTv39xFHIz1Z+bfH2Divbi3t15Wn/kHPjboSbxL2R3R0ERCLNpIudb8fp9hF
 eOzcdVTWEmP45RVAqJAyQKhjFHkD/I10lZ6S/ksELJ0cBXEp7j24LhrW/vCV5w4dKJoS
 5eqpaE25NDw5BYr5DJre2R/H+po9GvBpzl2/UbHlLqsW5wBitVN5fvjuPIjn36bHuZ4L
 wu2Uhe6zTr4HGraXhLOWS3CcO2+bflHD0ZuMwowVYclLWI3uNvp+piS/Kb1IatHJhlSm
 RWVg==
X-Gm-Message-State: AOAM531bV3cbPCrNOchsKQuWoSWjKo6amwoOlfpoXqHQCtg525ZWZf+A
 p1Xo5zX7TINljk3hWVzk7A0=
X-Google-Smtp-Source: ABdhPJwO+HZKRpqykA460xQ5VOl9u6kLpvfpZcIBD0bqEQbvB2Q53pk5DznFDPfQomHqPpVXv0P1CQ==
X-Received: by 2002:a05:6a00:10cc:b0:506:e0:d6c3 with SMTP id
 d12-20020a056a0010cc00b0050600e0d6c3mr26366183pfu.33.1650506662087; 
 Wed, 20 Apr 2022 19:04:22 -0700 (PDT)
Received: from localhost ([203.221.203.144]) by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b00398677b6f25sm21495194pgn.70.2022.04.20.19.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 19:04:21 -0700 (PDT)
Date: Thu, 21 Apr 2022 12:04:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
In-Reply-To: <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
MIME-Version: 1.0
Message-Id: <1650503031.93xsvzlip3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
> On 4/18/22 17:22, C=C3=A9dric Le Goater wrote:
>> On 4/18/22 21:10, Leandro Lupori wrote:
>>> Add semihosting support for PPC64. This implementation is
>>> based on the standard for ARM semihosting version 2.0, as
>>> implemented by QEMU and documented in
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/ARM-software/abi-aa/release=
s
>>>
>>> The PPC64 specific differences are the following:
>>>
>>> Semihosting Trap Instruction: sc 7
>>> Operation Number Register: r3
>>> Parameter Register: r4
>>> Return Register: r3
>>> Data block field size: 64 bits
>>=20
>> 'sc' is a good way to implement semi hosting but we should make sure
>> that it is not colliding with future extensions, at least with the
>> next POWERPC processor. Is that the case ? if not, then the lev could
>> be reserved.
>>=20
>=20
> Power ISA 3.1B says that LEV values greater that 2 are reserved.
> Level 2 is the ultravisor, so I assumed that level 7 was far enough from=20
> current max level. I don't know if POWER11 will introduce new privilege=20
> levels. Is this info publicly available somewhere? Or do you have a=20
> better level in mind to use instead?

It's not available but there are no plans to use LEV=3D7.

It would be fine in practice I think, but it's kind of ugly and not=20
great precedent -- how would we find out all the projects which use=20
reserved instructions or values for something? Nominally the onus is on=20
the software to accept breakage, but in reality important software that
breaks causes a headache for the ISA.

IBM's systemsim emulator actually has an instruction to call out to the=20
emulator to do various things like IO. It uses the opcode

  .long 0x000eaeb0

That is the primary op 0 reserved space, and there is actually another=20
op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in=20
spirit (it calls out to the service processor and/or chip error handling=20
system to deal with a condition out-of-band). You don't want to use attn=20
here because the core under emulation might implement it, I'm just=20
noting the precedent with similar functionality under this primary=20
opcode.

So I think the systemsim emulator instruction should be a good choice.=20
But it should really be documented. I will bring this up at the Open=20
Power ISA working group meeting next week and see what the options are=20
with getting it formally allocated for semihosting emulators (or what=20
the alternatives are).

Thanks,
Nick


