Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C43D149F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:52:41 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FSa-0003or-EB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6FRD-00021M-3H
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:51:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6FRB-0003Mh-6S
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:51:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id f190so1707422wmf.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TNo0pAoX13WZAT1hDBvjLtEGN0r8750yyPDt/988t0o=;
 b=HP5kfRfwehXk26wHWcq+tOol2g1UQDGLj5yAIeBU1Xh9Pa3U/qYHAbiCX+ENTwMSlA
 aepMLxf/MkrIpH14d43/RcYZHCIXHrB6SwIcgw3++CWaBNTf+KPDK8Pi4RSiNy53rs9i
 Jzlnh6Ee3Eby0EWn2PKJt9tOxBFP7r/fukpT6qXrXMMTNrcWg6D0O/4zFdqVAtLfmrBa
 Vg1tx8O41l3NSfHZxZX9kXw5eJuHWo65XgFJp86tHqZs9aJx/V4geRPblRvlIVDUk9as
 WZ3uCkPzplumtRGMcrmd9LBdy4Mwh+7BJJpQWcIVBvNzk41lfVDrx4M+NEszN/Ud6x/c
 5TSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TNo0pAoX13WZAT1hDBvjLtEGN0r8750yyPDt/988t0o=;
 b=GZVxBDYLwQgSuEemCHr4qszs/95UuS1fveNpO7+YPX2Q2YL27bPGlLQ2zFQ8Y4uYGi
 7ZmvsSbVDyWM2hJYQMXTVxMWkY+KcOsKFkZyeA6ddosPEQVgkoeHxV4j0XJ5dzX2Obpe
 7roim7U7KR+3EXne6TKJvpxr5S3ZAOB/4whO22lCiZypZPcOgV5LpRb6ioZJu2hPhYIL
 ITzZ6IWk6vCjqWXskIZUW4ZtdCp4eAWUjL+T/vVftt0UMFg3pFFI41QPmhpqe29o6+4A
 6xnZKd7u62wWE7Cm9aoblaEBlW6k7pibG79pC8zGR3LPFFFbwBjQkJtHqxEHopSHcWto
 jncQ==
X-Gm-Message-State: AOAM530HEKsG/Dn1wHY/dDQP2S3H6V0Um1h6EDKw5XyADkEWQsPQAEID
 uOOSbptg0AsA2U4moqKQeZS2/w==
X-Google-Smtp-Source: ABdhPJyFVnw+D7O0JZMvVXh5PyfiHjy3102a6GNP/IgS6AvTMJ0Tnl0uFcYHGunaG6BudIS8SFfXAg==
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr4921462wmj.75.1626886271524; 
 Wed, 21 Jul 2021 09:51:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm439827wmm.37.2021.07.21.09.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:51:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 305DB1FF7E;
 Wed, 21 Jul 2021 17:51:10 +0100 (BST)
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-18-richard.henderson@linaro.org>
 <878s20kkmv.fsf@linaro.org>
 <0c4a0e4d-faf1-3843-edf5-2ae807a33b94@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v6 17/17] accel/tcg: Record singlestep_enabled
 in tb->cflags
Date: Wed, 21 Jul 2021 17:48:32 +0100
In-reply-to: <0c4a0e4d-faf1-3843-edf5-2ae807a33b94@linaro.org>
Message-ID: <87lf5zy5j6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/21/21 12:38 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Set CF_SINGLE_STEP when single-stepping is enabled.
>>> This avoids the need to flush all tb's when turning
>>> single-stepping on or off.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/exec/exec-all.h   | 1 +
>>>   accel/tcg/cpu-exec.c      | 7 ++++++-
>>>   accel/tcg/translate-all.c | 4 ----
>>>   accel/tcg/translator.c    | 7 +------
>>>   cpu.c                     | 4 ----
>>>   5 files changed, 8 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index 6873cce8df..5d1b6d80fb 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -497,6 +497,7 @@ struct TranslationBlock {
>>>   #define CF_COUNT_MASK    0x000001ff
>>>   #define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
>>>   #define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
>>> +#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
>>>   #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.=
  */
>>>   #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
>>>   #define CF_USE_ICOUNT    0x00020000
>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index 5cc6363f4c..fc895cf51e 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -150,10 +150,15 @@ uint32_t curr_cflags(CPUState *cpu)
>>>       uint32_t cflags =3D cpu->tcg_cflags;
>>>         /*
>>> +     * Record gdb single-step.  We should be exiting the TB by raising
>>> +     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
>>> +     *
>>>        * For singlestep and -d nochain, suppress goto_tb so that
>>>        * we can log -d cpu,exec after every TB.
>>>        */
>>> -    if (singlestep) {
>>> +    if (unlikely(cpu->singlestep_enabled)) {
>>> +        cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP |
>>>       1;
>> What does CF_SINGLE_STEP achieve that isn't already handled by
>> having:
>>    cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
>
> It sets DisasContextBase.singlestep_enabled.

Ahh fair enough... I was only thinking of the effect on stored and
looked up translations. I guess we still have bits we can rob if we need
to until the day we expand cflags and flags to full 64 bit values.

> With only this patch set, we still check that and emit EXCP_DEBUG at
> the end of every TB.   After the 6.2 singlestep cleanup, we still have
> one reference to DisasContextBase.singlestep_enabled in target/mips
> for the branch delay slot thing that we discussed on IRC yesterday.
>
>> (btw did we mask CF_COUNT_MASK somewhere else?). Because surely the
>> CF_COUNT is part of cflags so limits the TB's that could be returned
>> anyway?
>
> Here in curr_cflags(), CF_COUNT_MASK begins at zero.

OK:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

