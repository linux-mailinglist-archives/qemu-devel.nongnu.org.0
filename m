Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C134D625C32
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otUZo-0006Kd-5a; Fri, 11 Nov 2022 09:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otUZj-0006EL-Ez
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:00:07 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otUZh-0006nk-FF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:00:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id l14so6610254wrw.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOWe5QJc3sWt2ZkD0nhq9fhHt1/tkSM+eIhBq9wfcsI=;
 b=iLstJbYVtEcQSbckK+EDKWO+x1PX4M4eAK+w5uwtEhi+sSZOf3t3/8XPqw7n8V41jR
 /80ocCVXBrInqJyet3k7tQy024vaZXW3KRyJxp/wf8cMYZyti/G9BCmSeAsOUf22Hpfb
 vlxHrl6If/yOSJn2hmumsDDyU+lD3cEGZB+3ZncDm83x6Zd12n/S2J3dGR4/XlVnfeRr
 CSGbaof+GPjJzyOjN/MI/WhkOZFShc9tFBH8zu4VOHD3f4KZc1voFvqr1+5hRrHK9Kgf
 K8TRk/juFCieVq+oMBDiX6nwJpBZT9G/7V6MtdFBNCsDl0MnpLB+J5r7ZfmjlAr7KUKY
 b54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZOWe5QJc3sWt2ZkD0nhq9fhHt1/tkSM+eIhBq9wfcsI=;
 b=eUQ8Zd9dwGrjIXVYRU9PIKkAbL47K3ArkM3/U8if1im591n6IbaXWhFJQcSl9UQehY
 naXRSYDgRq/wrgpx9UI8dHEu8IUJ4HGAoTyEf5jjimkKYuGjEobpxx2vOSi5wM6DP18n
 oNNY/64f+wP3zjkLqq3uh/4jCvgzzbQ+3j/0glbDKeEt3hRRle0c9/vPQWN2c0697okD
 rx5alQdOQ8BXEaoRiFESswHIHHbHLNWS+yZeC6sd3OD336K3AzeYLNYmXvsiHCZsof66
 bSKOBf6QLRNR2KdyNzlXhj4Bax+esr20BrglXnRORxjhytqqCybikiGFQ2oururzi5GB
 eTpQ==
X-Gm-Message-State: ANoB5pmpEZR8T+1zdxtStjkInm0DwmQHez/Zc9hAGbHC9uczFMi3foEL
 qoibaInsbflhrUC5r2ROxynPEw==
X-Google-Smtp-Source: AA0mqf7Kp1tt1wIKteitKf3og6/XNINPKUA4yIF+F4to9j4/OQwNI1q922sD+9r7kJtve3kfyByjfg==
X-Received: by 2002:a5d:4110:0:b0:236:7cdb:3c8b with SMTP id
 l16-20020a5d4110000000b002367cdb3c8bmr1294153wrp.280.1668175203556; 
 Fri, 11 Nov 2022 06:00:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t7-20020adff047000000b0022e57e66824sm2298574wro.99.2022.11.11.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:00:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1E481FFB7;
 Fri, 11 Nov 2022 14:00:01 +0000 (GMT)
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
 <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
 <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Date: Fri, 11 Nov 2022 13:58:04 +0000
In-reply-to: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
Message-ID: <87mt8xd21q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> On 31/10/22 14:03, Peter Maydell wrote:
>> On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
>>>
>>> On 4/10/22 16:54, Peter Maydell wrote:
>>>> On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>>
>>>>>
>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>>> The MSC is in the address map like most other stuff, and thus there =
is
>>>>>> no restriction on whether it can be accessed by other things than CP=
Us
>>>>>> (DMAing to it would be silly but is perfectly possible).
>>>>>>
>>>>>> The intent of the code is "pass this transaction through, but force
>>>>>> it to be Secure/NonSecure regardless of what it was before". That
>>>>>> should not involve a change of the requester type.
>>>>>
>>>>> Should we assert (or warn) when the requester_type is unspecified?
>>>>
>>>> Not in the design of MemTxAttrs that's currently in git, no:
>>>> in that design it's perfectly fine for something generating
>>>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
>>>> to meaning a bunch of things including "not secure").
>>>
>>> In tz_mpc_handle_block():
>>>
>>> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
>>> attrs)
>>> {
>>>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
>>>       if (!s->int_stat) {
>>>
>>>           s->int_info1 =3D addr;
>>>           s->int_info2 =3D 0;
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>>>                                     attrs.requester_id & 0xffff);
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>>>                                     ~attrs.secure);
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>>>                                     tz_mpc_cfg_ns(s, addr));
>>>
>>>
>>> Should we check whether the requester is MTRT_CPU?
>> That code is basically assuming that the requester_id is the AMBA
>> AHB
>> 'HMASTER' field (i.e. something hopefully unique to all things that
>> send out transactions, not necessarily limited only to CPUs), which is a
>> somewhat bogus assumption given that it isn't currently any such thing...
>> I'm not sure if/how this patchset plans to model generic "ID of
>> transaction
>> generator".
>
> Does your 'generic "ID of transaction generator"' fit into
> MTRT_MACHINE described as "for more complex encoding":
>
>   'MACHINE indicates a machine specific encoding which needs further
>    processing to decode into its constituent parts.'
>
> ?

Yes - I've just done something similar to model the IOAPIC on x86.
Currently that uses a magic number of requester_id that is unique to the
"machine bus" but it could multiplex multiple bits of data on more
complex topologies.

I'll post v5 soon now I have x86 working.

--=20
Alex Benn=C3=A9e

