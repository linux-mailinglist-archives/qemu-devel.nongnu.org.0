Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AD560473
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:25:12 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ZZ1-0003NO-73
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6ZXI-0002cs-AQ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:23:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6ZXG-00016Z-Ia
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:23:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id i1so18504819wrb.11
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E8dLril/sPEIKP4uoSQRUctLF1kHauClBO1fRvFZs6M=;
 b=S1sh9U6PVDe+Fmvx6KxW/5tkKg2vVShLUzbCF65HnaD0v14693sxNQCMZYtLfbTc15
 zUm5vuapUjne3EvgB1GQk72B2/ZD1fRnzZdYKFt/g4gWsJwM+jfwYsYn1RMWEZZJq/Pk
 pYnop5Jo4N7nKz7dQhNjloPCewcWSFCn8WJJXoXu7KyVYiPn/MRX+O0b4uaYxeImA+f+
 W/deD+MRX9MgVl0O/eRQOhSvKW4bC8G9bSY/vgeW2k/+6alBvtuoFAM0Aj12Qk7JMKpC
 eJ4es7WQwDbnKF7t1MzyRiO2sfJU6riDzo7GvTwYAonldmKb+R/FfixGLvg4Qh6ccOmj
 B0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E8dLril/sPEIKP4uoSQRUctLF1kHauClBO1fRvFZs6M=;
 b=Az1Fbd6xwl/Q38Klr1d9i2wxBgdj8reU38Afse/eeP/WJVtsoD879HAQDk/8Daa4u7
 e5nRbyVx7h6iITj0YIkBqbP+OOm7gIiOIFaHpgUPj6oL+rOvrN5gw1xIRw1qDd23ngnQ
 C6EnPQqFkodxZTiv4kUae5ZovWY3r16qF78tAeeMOPXvR4VwSMFgLsiZH+220hxzqXBZ
 oACPxyJpycJMnL8DeGUDnD3yD6kaNqEDoMFj/foZKgbvfU8t831VEl3E0sFfd9Ho7rC/
 IB3hIIB/e5v1OU8NwhfS/T7cRwvgZ4gC8UDNfzRgTwy1iMjtYs4bTzzDpzrFnWjRGshi
 1OAA==
X-Gm-Message-State: AJIora8rz/6SbvexpWWoM6mHtgZ+zpHP/RJhAHz+bLD5QXGtHZ+3qtlr
 WUkgUbhbOhZ9GoptiW2EviKPiw==
X-Google-Smtp-Source: AGRyM1vhi0GQF8IFjF2fgeTa5JS18xUprpYxhjeuK8Y92lrIegtSvJjuOeTARxIpIjG7hroKViZ1qg==
X-Received: by 2002:a05:6000:144a:b0:21b:c9bc:ec87 with SMTP id
 v10-20020a056000144a00b0021bc9bcec87mr3916725wrx.178.1656516198020; 
 Wed, 29 Jun 2022 08:23:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b003a04a9504b0sm4717677wmb.40.2022.06.29.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 08:23:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE4491FFB7;
 Wed, 29 Jun 2022 16:23:14 +0100 (BST)
References: <20220426150616.3937571-24-Liam.Howlett@oracle.com>
 <20220428201947.GA1912192@roeck-us.net>
 <20220429003841.cx7uenepca22qbdl@revolver>
 <20220428181621.636487e753422ad0faf09bd6@linux-foundation.org>
 <20220502001358.s2azy37zcc27vgdb@revolver>
 <20220501172412.50268e7b217d0963293e7314@linux-foundation.org>
 <Ym+v4lfU5IyxkGc4@osiris> <20220502133050.kuy2kjkzv6msokeb@revolver>
 <YnAn3FI9aVCi/xKd@osiris> <YnGHJ7oroqF+v1u+@osiris>
 <20220503215520.qpaukvjq55o7qwu3@revolver>
 <60a3bc3f-5cd6-79ac-a7a8-4ecc3d7fd3db@linux.ibm.com>
 <15f5f8d6-dc92-d491-d455-dd6b22b34bc3@redhat.com>
 <yt9d5ykkhrvv.fsf_-_@linux.ibm.com> <87pmirj3aq.fsf@linaro.org>
 <yt9dbkubhhna.fsf@linux.ibm.com> <yt9d7d4zhddq.fsf@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>, Liam Howlett <liam.howlett@oracle.com>, Heiko
 Carstens <hca@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, "maple-tree@lists.infradead.org"
 <maple-tree@lists.infradead.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Juergen
 Gross <jgross@suse.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Andreas Krebbel <krebbel@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: qemu-system-s390x hang in tcg
Date: Wed, 29 Jun 2022 15:52:17 +0100
In-reply-to: <yt9d7d4zhddq.fsf@linux.ibm.com>
Message-ID: <87v8sjh4t9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Sven Schnelle <svens@linux.ibm.com> writes:

> Sven Schnelle <svens@linux.ibm.com> writes:
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>>> Sven Schnelle <svens@linux.ibm.com> writes:
>>>
>>>> Hi,
>>>>
>>>> David Hildenbrand <david@redhat.com> writes:
>>>>
>>>>> On 04.05.22 09:37, Janosch Frank wrote:
>>>>>> I had a short look yesterday and the boot usually hangs in the raid6=
=20
>>>>>> code. Disabling vector instructions didn't make a difference but a f=
ew=20
>>>>>> interruptions via GDB solve the problem for some reason.
>>>>>>=20
>>>>>> CCing David and Thomas for TCG
>>>>>>=20
>>>>>
>>>>> I somehow recall that KASAN was always disabled under TCG, I might be
>>>>> wrong (I thought we'd get a message early during boot that the HW
>>>>> doesn't support KASAN).
>>>>>
>>>>> I recall that raid code is a heavy user of vector instructions.
>>>>>
>>>>> How can I reproduce? Compile upstream (or -next?) with kasan support =
and
>>>>> run it under TCG?
>>>>
>>>> I spent some time looking into this. It's usually hanging in
>>>> s390vx8_gen_syndrome(). My first thought was that it is a problem with
>>>> the VX instructions, but turned out that it hangs even if i remove all
>>>> the code from s390vx8_gen_syndrome().
>>>>
>>>> Tracing the execution of TB's, i see that the generated code is always
>>>> jumping between a few TB's, but never exiting the TB's to check for
>>>> interrupts (i.e. return to cpu_tb_exec(). I only see calls to
>>>> helper_lookup_tb_ptr to lookup the tb pointer for the next TB.
>>>>
>>>> The raid6 code is waiting for some time to expire by reading jiffies,
>>>> but interrupts are never processed and therefore jiffies doesn't chang=
e.
>>>> So the raid6 code hangs forever.
>>>>
>>>> As a test, i made a quick change to test:
>>>>
>>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>>> index c997c2e8e0..35819fd5a7 100644
>>>> --- a/accel/tcg/cpu-exec.c
>>>> +++ b/accel/tcg/cpu-exec.c
>>>> @@ -319,7 +319,8 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *en=
v)
>>>>      cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>>>>
>>>>      cflags =3D curr_cflags(cpu);
>>>> -    if (check_for_breakpoints(cpu, pc, &cflags)) {
>>>> +    if (check_for_breakpoints(cpu, pc, &cflags) ||
>>>> +        unlikely(qatomic_read(&cpu->interrupt_request))) {
>>>>          cpu_loop_exit(cpu);
>>>>      }
>>>>
>>>> And that makes the problem go away. But i'm not familiar with the TCG
>>>> internals, so i can't say whether the generated code is incorrect or
>>>> something else is wrong. I have tcg log files of a failing + working r=
un
>>>> if someone wants to take a look. They are rather large so i would have=
 to
>>>> upload them somewhere.
>>>
>>> Whatever is setting cpu->interrupt_request should be calling
>>> cpu_exit(cpu) which sets the exit flag which is checked at the start of
>>> every TB execution (see gen_tb_start).
>>
>> Thanks, that was very helpful. I added debugging and it turned out
>> that the TB is left because of a pending irq. The code then calls
>> s390_cpu_exec_interrupt:
>>
>> bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> {
>>     if (interrupt_request & CPU_INTERRUPT_HARD) {
>>         S390CPU *cpu =3D S390_CPU(cs);
>>         CPUS390XState *env =3D &cpu->env;
>>
>>         if (env->ex_value) {
>>             /* Execution of the target insn is indivisible from
>>                the parent EXECUTE insn.  */
>>             return false;
>>         }
>>         if (s390_cpu_has_int(cpu)) {
>>             s390_cpu_do_interrupt(cs);
>>             return true;
>>         }
>>         if (env->psw.mask & PSW_MASK_WAIT) {
>>             /* Woken up because of a floating interrupt but it has alrea=
dy
>>              * been delivered. Go back to sleep. */
>>             cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HALT);
>>         }
>>     }
>>     return false;
>> }
>>
>> Note the 'if (env->ex_value) { }' check. It looks like this function
>> just returns false in case tcg is executing an EX instruction. After
>> that the information that the TB should be exited because of an
>> interrupt is gone. So the TB's are never exited again, although the
>> interrupt wasn't handled. At least that's my assumption now, if i'm
>> wrong please tell me.
>
> Looking at the code i see CF_NOIRQ to prevent TB's from getting
> interrupted. But i only see that used in the core tcg code. Would
> that be a possibility, or is there something else/better?

Yes CF_NOIRQ is exactly the compiler flag you would use to prevent a
block from exiting early when you absolutely want to execute the next
block. We currently only use it from core code to deal with icount
related things but I can see it's use here. I would probably still wrap
it in a common function in cpu-exec-common.c I'm unsure of the exact
semantics for s390 so I will defer to Richard and others but something
like (untested):

/*
 * Ensure the next N instructions are not interrupted by IRQ checks.
 */
void cpu_loop_exit_unint(CPUState *cpu, uintptr_t pc, int len)
{
    if (pc) {
        cpu_restore_state(cpu, pc, true);
    }
    cpu->cflags_next_tb =3D len | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
    cpu_loop_exit(cpu);
}

And then in HELPER(ex) you can end the helper with:

void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t ad=
dr)
{
   ...

    /*
     * We must execute the next instruction exclusively so exit the loop
     * and trigger a NOIRQ TB which won't check for an interrupt until
     * it finishes executing.
     */
    cpu_loop_exit_unint(cpu, 0, 1);
}

Some notes:

 * Take care to ensure the CPU state is synchronised

  Which means the helper cannot use the flags
  TCG_CALL_NO_(READ_GLOBALS|WRITE_GLOBALS|SIDE_EFFECTS). And you you
  will to make sure you write the current PC in the tcg gen code in
  op_ex()

 * I think the env->ex_value can be removed after this

 * We will actually exit the execution loop (via a sigjmp) but the IRQ
   check in cpu_handle_interrupt() will be skipped due to the custom
   flags. When the next block is looked up (or generated) it will be
   entered but then immediately exit

 * I think even a branch to self should work because the second
   iteration will be interuptable

> Sorry for the dumb questions, i'm not often working on qemu ;-)

There are no dumb questions, just opportunities for better documentation ;-)

--=20
Alex Benn=C3=A9e

