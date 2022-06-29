Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2455FA25
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:12:00 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Snm-0006qs-P7
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6SlH-0005e1-Fr
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:09:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6SlF-0005M4-M2
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:09:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so2692104wme.5
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TabGWHIM8c9rkJ4+E0f8FKSCJ/hlIEym8hMxsb5x2uY=;
 b=tXownbuQpLN6nW0OBH4+YepcSMRoMT/qO/Yha69Rc6D9vcCVBNO6LO2t/RNQzwZlSk
 sxvjm/3q/w11AY5MLaQa0nKDmPNl7mqO0G9Mg3J+kG+HHlMB+LESHjsqOc/F8P9Mpupz
 0otBWp+FgGr6awcbmZt0d86pjdnGjDmDO1ofv09znLjxYA3cwSggaICn/NDns6RaFOKg
 t7tABI6ChZ4F17rctirVNsTeQqDhdNuxxuCYup7YcsfA00ZL24O544YEn0W/teKEmeyl
 jXegbNzYsN6gKiJ0RIuuQhXChgpEIEf9Bs0VGo3HSl4vRHUVo3ZCYxGpno/J+fF1wx1v
 71BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TabGWHIM8c9rkJ4+E0f8FKSCJ/hlIEym8hMxsb5x2uY=;
 b=voIeMhHg2cX47amNVxLxJErZ3TSENgGdJDzeCchX0bTuwxruqainIWPE12HV7jqb//
 hjFe3j+8FcqBOuW4khQn55osGMFrQNyIR8cbx5G7i/2Lwp3g5A5H0egw3PqtShnMeEec
 FeZhJ8BaGDV83SVxsMiVlkHBqBlZ3vXICu1YcnzrqXsMis9CN5GQgQbwN0uRZm4lwL60
 tohgu20N5eab+GYxS77hzJ5PuHlukZ+/wvyb29s6TvfnaXN7fdGm2rxTo/ZVAUfmbkoq
 lUxaiEKS5LaTvSosNT9H2YnWDmVmJfBABgE7GWEtumendFA+gVxzAWmJU7TqNdDIieyl
 qS1w==
X-Gm-Message-State: AJIora92f4cqWLC+J9HXOMlSFhUInkgFDvFo8FA2RQTllvkbvWdeGlRr
 yliBz+qkMLbH+jMZuhP6iqvSJA==
X-Google-Smtp-Source: AGRyM1u28JbsOJwYKV8cv5/YgqGsqXyuUTx8255gWodsWgMNmzT7Pv01U/c1N+YBXFLWf1kDVnbtbg==
X-Received: by 2002:a7b:c5da:0:b0:39c:542a:a07b with SMTP id
 n26-20020a7bc5da000000b0039c542aa07bmr2274882wmk.83.1656490159966; 
 Wed, 29 Jun 2022 01:09:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b00219b391c2d2sm18822824wrj.36.2022.06.29.01.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 01:09:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27F961FFB7;
 Wed, 29 Jun 2022 09:09:18 +0100 (BST)
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
 <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
Date: Wed, 29 Jun 2022 09:06:53 +0100
In-reply-to: <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
Message-ID: <87tu83j3gx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/28/22 19:08, Max Filippov wrote:
>> On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> This separates guest file descriptors from host file descriptors,
>>> and utilizes shared infrastructure for integration with gdbstub.
>>> Remove the xtensa custom console handing and rely on the
>>> generic -semihosting-config handling of chardevs.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/xtensa/cpu.h         |   1 -
>>>   hw/xtensa/sim.c             |   3 -
>>>   target/xtensa/xtensa-semi.c | 226 ++++++++----------------------------
>>>   3 files changed, 50 insertions(+), 180 deletions(-)
>>>
>>> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
>>> index ea66895e7f..99ac3efd71 100644
>>> --- a/target/xtensa/cpu.h
>>> +++ b/target/xtensa/cpu.h
>>> @@ -612,7 +612,6 @@ void xtensa_translate_init(void);
>>>   void **xtensa_get_regfile_by_name(const char *name, int entries, int =
bits);
>>>   void xtensa_breakpoint_handler(CPUState *cs);
>>>   void xtensa_register_core(XtensaConfigList *node);
>>> -void xtensa_sim_open_console(Chardev *chr);
>>>   void check_interrupts(CPUXtensaState *s);
>>>   void xtensa_irq_init(CPUXtensaState *env);
>>>   qemu_irq *xtensa_get_extints(CPUXtensaState *env);
>>> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
>>> index 946c71cb5b..5cca6a170e 100644
>>> --- a/hw/xtensa/sim.c
>>> +++ b/hw/xtensa/sim.c
>>> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machi=
ne)
>>>           xtensa_create_memory_regions(&sysram, "xtensa.sysram",
>>>                                        get_system_memory());
>>>       }
>>> -    if (serial_hd(0)) {
>>> -        xtensa_sim_open_console(serial_hd(0));
>>> -    }
>> I've noticed that with this change '-serial stdio' and its variants
>> are still
>> accepted in the command line, but now they do nothing.
>
> Pardon?  They certainly will do something, via writes to the serial hardw=
are.
>
>
>> This quiet
>> change of behavior is unfortunate. I wonder if it would be acceptable
>> to map the '-serial stdio' option in the presence of '-semihosting' to
>> something like '-chardev stdio,id=3Did1 -semihosting-config chardev=3Did=
1'?
>
> I dunno.  I'm wary of having xtensa be unique here.  Alex, thoughts?

Is semihosting *the* serial hardware for xtensa-sim or is it overriding
another serial interface? I'm wary of adding more magical behaviour for
-serial as it can be confusing enough already what actually gets routed
to it if not doing everything explicitly.

>
>>> +                if (get_user_u32(tv_sec, regs[5]) ||
>>> +                    get_user_u32(tv_usec, regs[5])) {
>> get_user_u32(tv_usec, regs[5] + 4)?
>
> Oops, yes.
>
>>> -                regs[2] =3D select(fd + 1,
>>> -                                 rq =3D=3D SELECT_ONE_READ   ? &fdset =
: NULL,
>>> -                                 rq =3D=3D SELECT_ONE_WRITE  ? &fdset =
: NULL,
>>> -                                 rq =3D=3D SELECT_ONE_EXCEPT ? &fdset =
: NULL,
>>> -                                 target_tv ? &tv : NULL);
>>> -                regs[3] =3D errno_h2g(errno);
>>> +                /* Poll timeout is in milliseconds; overflow to infini=
ty. */
>>> +                msec =3D tv_sec * 1000ull + DIV_ROUND_UP(tv_usec, 1000=
ull);
>>> +                timeout =3D msec <=3D INT32_MAX ? msec : -1;
>>> +            } else {
>>> +                timeout =3D -1;
>>>               }
>>> +
>>> +            switch (regs[4]) {
>>> +            case SELECT_ONE_READ:
>>> +                events =3D G_IO_IN;
>>> +                break;
>>> +            case SELECT_ONE_WRITE:
>>> +                events =3D G_IO_OUT;
>>> +                break;
>>> +            case SELECT_ONE_EXCEPT:
>>> +                events =3D G_IO_PRI;
>>> +                break;
>>> +            default:
>>> +                xtensa_cb(cs, -1, EINVAL);
>> This doesn't match what there used to be: it was possible to call
>> select_one with rq other than SELECT_ONE_* and that would've
>> passed NULL for all fd sets in the select invocation turning it into
>> a sleep. It would return 0 after the timeout.
>
> Hmm.  Is there any documentation of what it was *supposed* to do?
> Passing rq =3D=3D 0xdeadbeef and expecting a specific behaviour seems odd.
>
>
> r~


--=20
Alex Benn=C3=A9e

