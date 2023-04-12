Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B5B6DF739
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:31:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaZ7-0007Vq-0A; Wed, 12 Apr 2023 09:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmaZ3-0007TU-Mq
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:31:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmaZ1-00037z-4D
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:31:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s12so2441459wrb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681306265; x=1683898265;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOHkvpf7vboRrt49+16hwAFe4ETUZdqcA/+eXi2zykE=;
 b=g++1TSloBpl2PNY+cG61o+FZH7oKdJtIYcICxMl6Qcf0yrTR8kg+Lz81kfzZRSU7SI
 DwvkFvjnApctvgTe502Pk0FO7QjlcT8sMt134vmQ8v5+wMNfRs37UFt48zGEmqwf4sF8
 hbMiKw8VCQ6gpKoqOZhjHdHWw9ryWP9MDqLkxrLIn/8i/xuoTBPioXWFFjRqpQAU5O7y
 2mDi+tspm4lRLyXuijSbmVN4FSKfz/hdX1l4sF4OYf6vyAmcntJoiKdlgv7q6hKzb74s
 YAd0UcQHctZzh5ubXqF6DF2y44O1/QcOf8tph9MgTFeSVOTOf9r5RFbdAytvx3J/tW/U
 sLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306265; x=1683898265;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aOHkvpf7vboRrt49+16hwAFe4ETUZdqcA/+eXi2zykE=;
 b=kGRlRck+PiSQCijshJD3V0C5SJUAZq4DiUs/4TO+K8LhX15kiYiSUDvO5AezmNOoRH
 B2e91uZqBR8iKbYZkq/M00GPuX0EnNhzS2wxQr7ydhbjR6oFaV9l97JEnK2JDSxbRi+E
 B3HUBZk9ovQFuxVCSQ4YksRRak9T5A9eULrx8k/Rp01wkE2uUz+S/WN2byxTvurGf0hj
 scc/EdyWpIxDrOsEBUPA3dHZB4rXGBLS7/f3Ax02G/7HYHol7b5LRVBx6/odeLlVJ4wg
 tPqUcq1a0sntsSAJGKwsudpCx6Yg7JRSXGbgeYDALYlQ+0NIXx3oCavU3cuZgb3uYLHB
 woFA==
X-Gm-Message-State: AAQBX9fDY3WLudiTj6qhBxjH9f4NX8xXst2ALEtLCENGFn40Ur8U9DX8
 xdySOZWRMz8QGdcP84P6eyfPrA==
X-Google-Smtp-Source: AKy350YEJW7KY0NqHk1TLhwR0SiWpdWaMio0P5tr1dfLTDuBJFUKoy13kPqBpXzzl0DKTyBEdJYAeA==
X-Received: by 2002:adf:f644:0:b0:2f5:4345:2e41 with SMTP id
 x4-20020adff644000000b002f543452e41mr89317wrp.63.1681306265693; 
 Wed, 12 Apr 2023 06:31:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adfe0cf000000b002c7163660a9sm17061182wri.105.2023.04.12.06.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 06:31:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD9D91FFB7;
 Wed, 12 Apr 2023 14:31:04 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
 <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com>
 <87v8i2ri3w.fsf@linaro.org>
 <204c0ffc-4798-38f4-41ac-5340a12a8b49@intel.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Wed, 12 Apr 2023 14:28:02 +0100
In-reply-to: <204c0ffc-4798-38f4-41ac-5340a12a8b49@intel.com>
Message-ID: <87ttxlns6f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


"Wu, Fei" <fei2.wu@intel.com> writes:

> On 4/11/2023 3:27 PM, Alex Benn=C3=A9e wrote:
>>=20
>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>=20
>>> On 4/10/2023 6:36 PM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>
>>>>> On 4/6/23 00:46, Alex Benn=C3=A9e wrote:
>>>>>> If your aim is to examine JIT efficiency what is wrong with the curr=
ent
>>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>>> extra data it collects is that expensive.
>>>>>> Richard, what do you think?
>>>>>
>>>>> What is it that you want from CONFIG_PROFILER that you can't get from=
 perf?
>>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>>
>>>> I think perf is pretty good at getting the hot paths in the translator
>>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>>> be dropped. However some of the additional information about TCG ops
>>>> usage and distribution is useful. That said last time I had a tilt at
>>>> this on the back of a GSoC project:
>>>>
>>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integr=
ation
>>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>>
>>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>>> the perf integration stuff was merged maybe there is a simpler series =
to
>>>> be picked out of the remains?
>>>>
>>>> Fei Wu,
>>>>
>>>> Have you looked at the above series? Is that gathering the sort of
>>>> things you need? Is this all in service of examining the translation
>>>> quality of hot code?
>>>>
>>> Yes, it does have what I want, I suppose this wiki is for the series:
>>>     https://wiki.qemu.org/Features/TCGCodeQuality
>>=20
>> Yes.
>>=20
>>>
>>> btw, the archive seems broken and cannot show the whole series:
>>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
>>=20
>> I have a v10 branch here:
>>=20
>>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>=20
>> I think the top two patches can be dropped on a re-base as the JIT/perf
>> integration is already merged. It might be a tricky re-base though.
>> Depends on how much churn there has been in the tree since.
>>=20
> I'd like to try it. Why has it not been merged upstream?

Bits have been merged (the perf jit support) but the original GSoC
student moved on and I ran out of time to work on it. It became yet another
back burner series that awaits some spare hacking time.

>
> Thanks,
> Fei.
>
>>>
>>> Thanks,
>>> Fei.
>>>
>>>>>
>>>>>
>>>>> r~
>>>>
>>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

