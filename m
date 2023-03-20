Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB456C1D8E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJ7G-0005pn-3P; Mon, 20 Mar 2023 13:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJ7D-0005pc-Ok
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:16:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJ7B-0000jC-HF
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:16:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j2so11103743wrh.9
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679332568;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+DYmnTYMP1VjRxLhEnT3Rx/yvRX7cX8P/WQfc5FDuQ=;
 b=HJ9jyyJpWytbIpsoWYY/5uln0NVyqrnoAWe6qG4ijZ0Gabw4dZyRmDbga92OFEwI/z
 2+WuoleYbaBX3iRWelCZlYvNnvY7pB5waklvRavGsmRlQOIqfAoq4zEoKrCyuTIOUtab
 zU0+NbSxeTTiOfrDSv5QlZq7n2UMbyaXTaqo5hbHmXwNJ4T/lsQRQiYCVB+EUZ67dw3R
 mN37Nz8dNZcRRMqbw03heAldam5SUBBgGy48UU/SuSvlYn4rfdUz1VwxWp80Apau2hsF
 ofKAD4DWeqz75sSLq5zr6ExdVXiOrVvbup9ska0z0gkuC9Jvq7Yg++nk31kmixhSvOx0
 4Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332568;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p+DYmnTYMP1VjRxLhEnT3Rx/yvRX7cX8P/WQfc5FDuQ=;
 b=PKqpsHNEfoWdBFJXJ8QR73h4ENbhCgCWgtScT36Nk/6Y3y1dQYkkDmD9jJFlSLSOUV
 mnFt9kDzFuOTwfhzE5deQX2le5OfuwH4s1ff0J8StvvGVdlnqLYz0fEPzcsKecmoEIJB
 fIkRBVVpsqqssq6nCzSM6VUdHoeS2l2o/fhTyiSXfbuk5O/tI4ReVSprJA7fUbzRuEre
 XW3gzf4DYA6KRCvCHnkLZYWf5lhodaxb2QplrhMfE2QGhcHXEa0bmYscat+4v5I2oKnG
 +FXnz/B3UH6i5+swty3+5L6SUTCG6Ten+8vPc1/qm7wEHRTd1bPTIy5L5PNeMlN0de/d
 i8Mg==
X-Gm-Message-State: AO0yUKVlh4xg1SSU0JY4FcQDA0WbkaXVXeVE+4arA2BBpoVaT4yJU2YB
 b/1YiVVBgRQWYt81Tg6jcx6E/1EMx/pA4klcNOs=
X-Google-Smtp-Source: AK7set93hWhgjdR07m4O8rY9eenS/nUeuUAXKBmrcW3tf+jQgdeEEXVIYIbR3RGJRGV07EQ2ut/A6A==
X-Received: by 2002:adf:f3d1:0:b0:2ce:ae49:5edb with SMTP id
 g17-20020adff3d1000000b002ceae495edbmr112938wrp.7.1679332567862; 
 Mon, 20 Mar 2023 10:16:07 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b002c55521903bsm9318334wrt.51.2023.03.20.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:16:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 381AB1FFB7;
 Mon, 20 Mar 2023 17:16:07 +0000 (GMT)
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-9-alex.bennee@linaro.org>
 <c49afab1-9842-e90e-7d1b-69b849b1e63e@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 08/10] accel/tcg: push i386 specific hacks into
 handle_cpu_interrupt callback
Date: Mon, 20 Mar 2023 17:14:19 +0000
In-reply-to: <c49afab1-9842-e90e-7d1b-69b849b1e63e@linaro.org>
Message-ID: <87mt47738o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/20/23 03:10, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   include/hw/core/sysemu-cpu-ops.h | 11 +++++++++++
>>   target/i386/cpu-internal.h       |  1 +
>>   accel/tcg/cpu-exec-softmmu.c     | 16 ++++++++++++++++
>>   accel/tcg/cpu-exec.c             | 31 ++++++++++---------------------
>>   target/i386/cpu-sysemu.c         | 17 +++++++++++++++++
>>   target/i386/cpu.c                |  1 +
>>   6 files changed, 56 insertions(+), 21 deletions(-)
>> diff --git a/include/hw/core/sysemu-cpu-ops.h
>> b/include/hw/core/sysemu-cpu-ops.h
>> index c9d30172c4..d53907b517 100644
>> --- a/include/hw/core/sysemu-cpu-ops.h
>> +++ b/include/hw/core/sysemu-cpu-ops.h
>> @@ -53,6 +53,15 @@ typedef struct SysemuCPUOps {
>>        * @cs: The CPUState
>>        */
>>       void (*handle_cpu_halt)(CPUState *cpu);
>> +    /**
>> +     * @handle_cpu_interrupt: handle init/reset interrupts
>> +     * @cs: The CPUState
>> +     * @irq_request: the interrupt request
>> +     *
>> +     * Most architectures share a common handler. Returns true if the
>> +     * handler did indeed handle and interrupt.
>> +     */
>
> and -> the? or any?
>
> This should be a tcg hook, not a sysemu hook, per the previous one.
> I would very much like it to never be NULL, but instead your new
> common_cpu_handle_interrupt function.

I was trying to figure out how to instantiate a default but ran into
const problems eventually forcing me to give up.

Why a TCG hook? Do we not process any interrupts for KVM or HVF?

>
>> -#if defined(TARGET_I386)
>> -        else if (interrupt_request & CPU_INTERRUPT_INIT) {
>> -            X86CPU *x86_cpu =3D X86_CPU(cpu);
>> -            CPUArchState *env =3D &x86_cpu->env;
>> -            replay_interrupt();
>> -            cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
>> -            do_cpu_init(x86_cpu);
>> -            cpu->exception_index =3D EXCP_HALTED;
>> -            return true;
>> -        }
>> -#else
>> -        else if (interrupt_request & CPU_INTERRUPT_RESET) {
>> -            replay_interrupt();
>> -            cpu_reset(cpu);
>> +        else if (cpu->cc->sysemu_ops->handle_cpu_interrupt &&
>> +                 cpu->cc->sysemu_ops->handle_cpu_interrupt(cpu, interru=
pt_request)) {
>> +                return true;
>> +        } else if (common_cpu_handle_interrupt(cpu, interrupt_request))=
 {
>>               return true;
>
> ... because this is pretty ugly, and incorrectly indented.
>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

