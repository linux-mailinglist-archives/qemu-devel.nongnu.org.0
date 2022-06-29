Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051C560750
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 19:23:48 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6bPn-000718-Ob
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 13:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6bLZ-0005YY-FK
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:19:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6bLX-0002S7-MA
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:19:25 -0400
Received: by mail-ed1-x529.google.com with SMTP id c13so23120707eds.10
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nUFbiFQ8715a4I5FoVErJI9tXQWEcFpaRRRtuUiZXko=;
 b=edaRQ5Q5jIYvYaeAimqhT5ki+tEwUWCg3QQQjINH4w7V9nIBcatGURjg1V7bblcH6C
 WR6/tgmnruaIZL+qy5Q/HSa7xnDts9TDHDJBPPXApWRpHw1Pg9RHDWvYowZFyiRo1Qc9
 gIqjQu9buTe0KYNU+GG4o65AcjSgweo14Kwt6AL3OcwBpieF3YfPfazg/6Qj6S+jfLvH
 S0wiSlEHHI6NJ6mDtKj4ExpJLIzN2/iQcqDBYTova2k2CwpUqGbnadp62Nnotas5tp6Z
 4MNw1V6R5WL20J7OGjNHq5XbQhU2JFU6zmJM226el7O4QxG1JM79rUCnPgds2vwlTs/8
 uFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nUFbiFQ8715a4I5FoVErJI9tXQWEcFpaRRRtuUiZXko=;
 b=Aj21lkHwqzKLj6IRdlKXZW1LvBOZZZ8zCfgziN2JQxUE+VDdbfU81ZjCdX+pbtwkYY
 aeIJFQbtJlczNCrW/nE6qKZqx2mx9WcP30YLc61U29RYizRc577IG4janXxNyPAqMkJ6
 6vK8c9luGAFOGNTrQYC9ecBcIEUrI6fOj7koHRsWDxWXQcZah9/QcuwVVEbb95n0Fi64
 zZhzIpLVQWkoRgZuyXW593Jir+axR1gSOMqdmmdo79xtfOeRFrVEFEdG9TikXOpMDCnl
 r0kwHn9o+hbiuG3aT9F90Ktg0dPwkKrUcLKdb2HEhre+3N23RgFMcgb3MlicG5/+tHUI
 Bzrg==
X-Gm-Message-State: AJIora9v9uqATKWuk/+PzXQWB3U3x7qTSrMQjTsUsu5CqbsxMkL8emc+
 9b8xu1CbxDYRpLG+nHoIpPjBlA==
X-Google-Smtp-Source: AGRyM1t1xz0JDR1Nuhjv8LohIrs0dSlQ3xHJUC+zlpsyxYrDXHNDjOksuPP34TPByj9U5tBgvJ5zow==
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id
 q13-20020a056402248d00b00437dd4ce70emr4013272eda.75.1656523162087; 
 Wed, 29 Jun 2022 10:19:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a50ef02000000b00435a997303bsm11543619eds.71.2022.06.29.10.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 10:19:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E85831FFB7;
 Wed, 29 Jun 2022 18:19:19 +0100 (BST)
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
 <8735fojukm.fsf@linaro.org>
 <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
 <9c97ae8f-f733-21fc-97d1-99af971e38fd@eldorado.org.br>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: Slowness with multi-thread TCG?
Date: Wed, 29 Jun 2022 18:13:50 +0100
In-reply-to: <9c97ae8f-f733-21fc-97d1-99af971e38fd@eldorado.org.br>
Message-ID: <87ilojgzfs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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


"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 29/06/2022 12:36, Frederic Barrat wrote:
>> [E-MAIL EXTERNO] N=C3=A3o clique em links ou abra anexos, a menos que
>> voc=C3=AA possa confirmar o remetente e saber que o conte=C3=BAdo =C3=A9=
 seguro. Em
>> caso de e-mail suspeito entre imediatamente em contato com o DTI.
>> On 29/06/2022 00:17, Alex Benn=C3=A9e wrote:
>>> If you run the sync-profiler (via the HMP "sync-profile on") you can
>>> then get a breakdown of which mutex's are being held and for how long
>>> ("info sync-profile").
>> Alex, a huge thank you!
>> For the record, the "info sync-profile" showed:
>> Type=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Object=C2=A0 Call site=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Wait Time (s)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Count=C2=A0 Average (us)
>> ------------------------------------------------------------------------=
--------------------------
>> BQL mutex=C2=A0 0x55eb89425540=C2=A0 accel/tcg/cpu-exec.c:744=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> 96.31578
>>  =C2=A0=C2=A0=C2=A0 73589937=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1.31
>> BQL mutex=C2=A0 0x55eb89425540=C2=A0 target/ppc/helper_regs.c:207=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00150
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1178=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27
>> And it points to a lock in the interrupt delivery path, in
>> cpu_handle_interrupt().
>> I now understand the root cause. The interrupt signal for the
>> decrementer interrupt remains set because the interrupt is not being
>> delivered, per the config. I'm not quite sure what the proper fix is yet
>> (there seems to be several implementations of the decrementer on ppc),
>> but at least I understand why we are so slow.
>>=20
>
> To summarize what we talked elsewhere:
> 1 - The threads that are not decompressing the kernel have a pending
> PPC_INTERRUPT_DECR, and cs->interrupt_request is CPU_INTERRUPT_HARD;

I think ppc_set_irq should be doing some gating before calling to set
cs->interrupt_request.

> 2 - cpu_handle_interrupt calls ppc_cpu_exec_interrupt, that calls
> ppc_hw_interrupt to handle the interrupt;
> 3 - ppc_cpu_exec_interrupt decides that the interrupt cannot be
> delivered immediately, so the corresponding bit in
> env->pending_interrupts is not reset;

Is the logic controlled by ppc_hw_interrupt()? The stuff around
async_deliver?

I think maybe some of the logic needs to be factored out and checked
above. Also anywhere where env->msr is updated would need to check if
we've just enabled a load of pending interrupts and then call
ppc_set_irq.

However I'm not super familiar with the PPC code so I'll defer to the
maintainers here ;-)

> 4 - ppc_cpu_exec_interrupt does not change cs->interrupt_request
> because pending_interrupts !=3D 0, so cpu_handle_interrupt will be
> called again.
>
> This loop will acquire and release qemu_mutex_lock_iothread, slowing
> down other threads that need this lock.
>
>> With a quick hack, I could verify that by moving that signal out of the
>> way, the decompression time of the kernel is now peanuts, no matter the
>> number of cpus. Even with one cpu, the 15 seconds measured before was
>> already a huge waste, so it was not really a multiple-cpus problem.
>> Multiple cpus were just highlighting it.
>> Thanks again!
>>  =C2=A0 Fred


--=20
Alex Benn=C3=A9e

