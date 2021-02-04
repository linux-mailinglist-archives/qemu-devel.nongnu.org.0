Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245F30F29E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:46:25 +0100 (CET)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7d5b-0005LC-Nq
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7d3m-0004YY-2p
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:44:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7d3h-0005iy-Gd
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:44:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so2728067wml.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FvQS8n9itJ2x7NEm3g/oy7Tb8zZ1r+p8rbSDx7X7wF0=;
 b=L3L+hy5f3lLxy03DztBCP19Gmbp08heLmtDGQNugLVlU1VzoLdv3Z9jffg5jJrvL0w
 QFCTXzeixKWj7IPJYvupxdmA1cWC3rtAdrJquELK2iPlAc0F9A1xb3HKAv5yWQRSEtqL
 C8ICXMvnhFoo8uho8HtjqB6gSHlo1REfrJEU6L5wOZNnRQt/xe3rsKnUS0jrwat8JWHH
 IoSQSL5d2wpYW9f9kOIkxrq10u7Q7i6fuGCYmUAbydO47jrrZ7wigkvBGfgSC+3J2uEe
 PVty2oQahwX3M93NshFSSC6qndBFe8XSW6Y3vS+rzgyw0MtwPbRFqlRRLv0eUl1klxDr
 iwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FvQS8n9itJ2x7NEm3g/oy7Tb8zZ1r+p8rbSDx7X7wF0=;
 b=O1bGwxdxzszoPJrm4e9q1vfsOtuh09BW/XJnCkovC0PE8DlQ6P7x2Ry2iiMHgnsHwW
 AwUqBMj3uPLUNx4ogd3O7FhQ+GmYaJJeBK3wcAoLDsFe/zzyxTqjR5TtoXSRrZNzdEPU
 obb7CMF/xSN7oFdNQQO0V/lgCwD1w7MUBVVePstXpOajFoHDL17c3EZZ3/Kvo3JueRkc
 P3lVc4e8qlPI/4Di4d5oFHqyWZzRuyilW8EcBq0+gfQFWMc+Fp5PvgJgAGlehLtds/XQ
 sKHtvGxxkFiA3vecswmYyL1TU+5/RbZljlr7iJ/gGBp1O2RzvPqyaAY3ynfFrKYVFpbH
 ZPPw==
X-Gm-Message-State: AOAM530EY99LwvkuVf4kcOeHDesc7/aX7HM6uuJ0d3hhshVR9iKqsvlL
 jGSMgVAzhYshjipriFq6yZjAsA==
X-Google-Smtp-Source: ABdhPJzy1NeeuSlufrFxFaileRmvS4qleP9hn6kQOJdKvwYccVMWlOLUPGXQPG3X+8RzGGR/e7ea4g==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr7084742wmh.51.1612439062377;
 Thu, 04 Feb 2021 03:44:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a27sm7407766wrc.94.2021.02.04.03.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:44:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CD6B1FF7E;
 Thu,  4 Feb 2021 11:44:20 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-5-cfontana@suse.de> <87r1lxsblj.fsf@linaro.org>
 <acdec213-e1d1-4ad8-6636-9bd9eb6dddd7@suse.de>
 <3a64b90c-90f5-864d-c432-0412ba429aa1@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 04/23] cpu: Move synchronize_from_tb() to tcg_ops
Date: Thu, 04 Feb 2021 11:44:14 +0000
In-reply-to: <3a64b90c-90f5-864d-c432-0412ba429aa1@suse.de>
Message-ID: <878s84qcq3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/3/21 1:31 PM, Claudio Fontana wrote:
>> On 2/3/21 11:11 AM, Alex Benn=C3=A9e wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>>
>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>
>>>> [claudio: wrapped target code in CONFIG_TCG]
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>  include/hw/core/cpu.h     | 20 +++++++++++---------
>>>>  accel/tcg/cpu-exec.c      |  4 ++--
>>>>  target/arm/cpu.c          |  4 +++-
>>>>  target/avr/cpu.c          |  2 +-
>>>>  target/hppa/cpu.c         |  2 +-
>>>>  target/i386/tcg/tcg-cpu.c |  2 +-
>>>>  target/microblaze/cpu.c   |  2 +-
>>>>  target/mips/cpu.c         |  4 +++-
>>>>  target/riscv/cpu.c        |  2 +-
>>>>  target/rx/cpu.c           |  2 +-
>>>>  target/sh4/cpu.c          |  2 +-
>>>>  target/sparc/cpu.c        |  2 +-
>>>>  target/tricore/cpu.c      |  2 +-
>>>>  13 files changed, 28 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index d0b17dcc4c..b9803885e5 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -86,6 +86,17 @@ typedef struct TcgCpuOperations {
>>>>       * Called when the first CPU is realized.
>>>>       */
>>>>      void (*initialize)(void);
>>>> +    /**
>>>> +     * @synchronize_from_tb: Synchronize state from a TCG #Translatio=
nBlock
>>>> +     *
>>>> +     * This is called when we abandon execution of a TB before
>>>> +     * starting it, and must set all parts of the CPU state which
>>>> +     * the previous TB in the chain may not have updated. This
>>>> +     * will need to do more. If this hook is not implemented then
>>>> +     * the default is to call @set_pc(tb->pc).
>>>> +     */
>>>> +    void (*synchronize_from_tb)(CPUState *cpu,
>>>> +                                const struct TranslationBlock *tb);
>>>
>>> Did you miss my comment last time or just not think it flowed better?
>>>
>>>   ...TB in the chain may not have updated. By default when no hook is
>>>   defined a call is made to @set_pc(tb->pc). If more state needs to be
>>>   restored the front-end must provide a hook function and restore all t=
he
>>>   state there.
>>>
>>> Either way:
>>>
>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>
>>=20
>> Hi Alex, sorry for missing this change, can add it for the next respin,
>>=20
>> and thanks for looking at this,
>>=20
>> Ciao,
>>=20
>> Claudio
>
>     /**=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
>      * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlo=
ck=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      *=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
>      * This is called when we abandon execution of a TB before starting i=
t,=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      * and must set all parts of the CPU state which the previous TB in t=
he=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      * chain may not have updated.=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      * By default, when this is NULL, a call is made to @set_pc(tb->pc).=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      *=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
>      * If more state needs to be restored, the target must implement a=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      * function to restore all the state, and register it here.=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>      */
>
>
> I changed the wording a bit, because to me it is easier to think about "t=
arget" than about "front-end", but maybe I am missing something.
> I am also not in love with the term hook, we are trying to end up with a =
proper interface, as we complete this series,
> a nice struct that the target can provide with all the functions necessar=
y to implement the TCG operations.
>
> Let me know if this requires additional revision,

LGTM

--=20
Alex Benn=C3=A9e

