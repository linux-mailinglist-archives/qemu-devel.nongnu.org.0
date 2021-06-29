Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7293B7210
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:29:27 +0200 (CEST)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyCrn-000314-0s
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyCpM-0001UH-0t
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:26:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyCpK-0007Av-2B
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:26:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so1674525wms.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5Ujafvg5r/PF5trIB8mTsYkmLGtKRIh5yX5uAJE+yqI=;
 b=aVm3tcBacbqs/WSLF6KJ/1ChNf6Ti7/RjDI0A+zDysbANT1w7yE6jsyBifmy3mGUEe
 592NZMEwMoqJhnWbb56ychS/Uj42gaautAAxG3TmCJ6q/XBNHakeH7JdJeRiZ4gBLJYy
 k2oEVTR2vW4TMHmjEjycWUPKbNMnDixESbfeJgveJA40Ut2GM7Im4jScskNpTqLOLkht
 b5ZDriDOPlWfnEb8mmQwVTX3JUrp2y+XaXVVh7OBESnjxXiFZrpN/qAhsag82h1ZSE+C
 Qq++/JvRtK9xmZef6V2v21rdgRfAu/q1n/RIbWb9jOVOWO9R17fb0UJyrb8XvW/WPUe8
 7V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5Ujafvg5r/PF5trIB8mTsYkmLGtKRIh5yX5uAJE+yqI=;
 b=tBErq0p1pUybrcFUKWxjBX1YzTLuWZG4bCX+xbTT327bfAMn3E2RCdmuh/HGwkP0/u
 tjNAzzsg6KCVW07BmazvHUvSJJV5pdP7ms1JkZ6l0xnMTFLKsxyWZUNMeLeu7ilPaNDj
 Tc7RlgqKwfPIwkaK2CixHifRCzOBOryhUo1J2EJW3Ynnxu1N3s14XDK3oexfDDeaGwTf
 Uwlpx0qA7GHndBzAhQdr/c3Wsfp2V2JMd3843Ntjwi+N4TAXNbfz/lEJTwBJoeADODT7
 mePvN5M8MSmW8wCRKlr13FKH2V467F1trAOfMMsVxpWJ2GeYhBcj4bHY3Q2rRGEBZBLH
 VOJg==
X-Gm-Message-State: AOAM532/eX085eiL3ECZHnP7S76BHzVipCEV5nWlwcI5mefo6lfvIz9u
 AxDOKCbU2OAscw46oVTqBSHMKA==
X-Google-Smtp-Source: ABdhPJwhcs7ZhHKgcMrtAzvsXGSHJbyMih5haL73hpGbDL4bAsV7soNPvM4bovLHO7J6V2mm8ieIFA==
X-Received: by 2002:a1c:5413:: with SMTP id i19mr33174595wmb.12.1624969611011; 
 Tue, 29 Jun 2021 05:26:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm9966011wmb.40.2021.06.29.05.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:26:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45C8F1FF7E;
 Tue, 29 Jun 2021 13:26:49 +0100 (BST)
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
 <3b3ad9db-ed86-1ef4-5653-1c7106bc5bfd@amsat.org>
 <88f8eaba-f99a-5865-898f-29a9f4b418f2@loongson.cn>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH 06/20] target/loongarch: Add main translation routines
Date: Tue, 29 Jun 2021 13:26:16 +0100
In-reply-to: <88f8eaba-f99a-5865-898f-29a9f4b418f2@loongson.cn>
Message-ID: <871r8krh4m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, maobibo@loongson.cn,
 laurent@vivier.eu, alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Song Gao <gaosong@loongson.cn> writes:

> Hi, Philippe,
>
> On 06/29/2021 02:46 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 6/28/21 2:04 PM, Song Gao wrote:
>>> This patch add main translation routines and
>>> basic functions for translation.
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>  target/loongarch/helper.h    |  10 +
>>>  target/loongarch/op_helper.c |  28 +++
>>>  target/loongarch/translate.c | 537 +++++++++++++++++++++++++++++++++++=
++++++++
>>>  target/loongarch/translate.h |  58 +++++
>>>  4 files changed, 633 insertions(+)
>>>  create mode 100644 target/loongarch/helper.h
>>>  create mode 100644 target/loongarch/op_helper.c
>>>  create mode 100644 target/loongarch/translate.c
>>>  create mode 100644 target/loongarch/translate.h
>>=20
>>> +/* 128 and 256 msa vector instructions are not supported yet */
>>> +static bool decode_lsx(uint32_t opcode)
>>> +{
>>> +    uint32_t value =3D (opcode & 0xff000000);
>>> +
>>> +    if ((opcode & 0xf0000000) =3D=3D 0x70000000) {
>>> +        return true;
>>> +    } else if ((opcode & 0xfff00000) =3D=3D 0x38400000) {
>>> +        return true;
>>> +    } else {
>>> +        switch (value) {
>>> +        case 0x09000000:
>>> +        case 0x0a000000:
>>> +        case 0x0e000000:
>>> +        case 0x0f000000:
>>> +        case 0x2c000000:
>>> +        case 0x30000000:
>>> +        case 0x31000000:
>>> +        case 0x32000000:
>>> +        case 0x33000000:
>>> +            return true;
>>> +        }
>>> +    }
>>> +    return false;
>>> +}
>>=20
>> Why not generate that with the decodetree script?
>>=20
> These instructions are privileged instructions=EF=BC=8C user mode does no=
t need these instructions.
> I'll delete these codes.

Are you intending to include system emulation in due course?

--=20
Alex Benn=C3=A9e

