Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E56DD43E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:31:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm8Sb-0007zf-1k; Tue, 11 Apr 2023 03:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8SX-0007zV-46
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:30:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8SV-0004ah-7E
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:30:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso8770454wmr.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681198229; x=1683790229;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOpoKmC3+3OmcjkQYxNqONVraRTpX5hW2o+6Eu1hwwQ=;
 b=inM8KFMJoaitO7WggkbbuXi+GX+iMsb65GS0jjXmP2QRV1fJHscW8AgxTdfD16vasw
 Dz6I7axZcYbDYOZOgE7fc8QRLgT77Hk4Wiu5puzQ2LFRtG7e3J7hnCEUxaHHrZ5IciOY
 jPyOkSCW4JswmucnfztMbj0/knbVkxJN01xOjNWKqzSZ2ODfYcCn+kZI8bza80mOEC9L
 QtTgx5Lp34hNtIUiqyx3KGYWRE++wQUZxXJOFS8MfpAAZFivuKtcW7lFPq2gJsTebo2/
 Xaa7enBOEtSsEGlAuDqU8Ab/TRU1gKo6QJSCHFiHpnAmGkOnKzA+mU2K1jtnGtlg7Sgd
 v9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681198229; x=1683790229;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fOpoKmC3+3OmcjkQYxNqONVraRTpX5hW2o+6Eu1hwwQ=;
 b=gB0FK9LlISSaplzkfZ9xpx8nb3t+RUfz93RVHSIx0uATdoCJsPU4ilxC+aceW16teK
 v1ahECT6qQ3FjhwzgdpwciXlD6wK3tYomqU7m0pp+qkhFAvtCUvfeBdVIF/mb9/L8cor
 xYzyAm5JAJQUo/dOzP4yPOSDGcQ/chsJt7CTW51VYrMye1AMtc8I8PVBzJ5Ncz6jd/Qy
 C3ctae2RfT3cvnc5oY5zEeB+JJViP20cA26D06ikEsqOEFng53b80iodfjfhFgS8PrDB
 bE8vSb8t9GCdpQQtHVTHMQ11rtl8jXLjCwQm/uf2Xh1lvBt0IfPpAzkbAorkmAMttYdJ
 qI4A==
X-Gm-Message-State: AAQBX9dNghAEj501OBBLiMrVzp+n5Zz/GRNGAE/Hs0Br+yA2PmCu+gtl
 eywQLSG8VK5f9aPqFVAM1A0Jzw==
X-Google-Smtp-Source: AKy350Y+ycRYAs4vpcFFJKEtd4tPGAdFeyu8Yddp4EChQaqrsj6Fjzi9V/Z9nI9wCxKo2RxkYXE6Pw==
X-Received: by 2002:a7b:c3d6:0:b0:3eb:3104:efef with SMTP id
 t22-20020a7bc3d6000000b003eb3104efefmr6405420wmj.31.1681198228130; 
 Tue, 11 Apr 2023 00:30:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a1ce908000000b003ed2276cd0dsm16022906wmc.38.2023.04.11.00.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:30:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FB111FFB7;
 Tue, 11 Apr 2023 08:30:27 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
 <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Tue, 11 Apr 2023 08:27:14 +0100
In-reply-to: <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com>
Message-ID: <87v8i2ri3w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> On 4/10/2023 6:36 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 4/6/23 00:46, Alex Benn=C3=A9e wrote:
>>>> If your aim is to examine JIT efficiency what is wrong with the current
>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>> extra data it collects is that expensive.
>>>> Richard, what do you think?
>>>
>>> What is it that you want from CONFIG_PROFILER that you can't get from p=
erf?
>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>=20
>> I think perf is pretty good at getting the hot paths in the translator
>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>> be dropped. However some of the additional information about TCG ops
>> usage and distribution is useful. That said last time I had a tilt at
>> this on the back of a GSoC project:
>>=20
>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integrat=
ion
>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>=20
>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>> tb stats which was dynamically controlled on a per TB basis. Now that
>> the perf integration stuff was merged maybe there is a simpler series to
>> be picked out of the remains?
>>=20
>> Fei Wu,
>>=20
>> Have you looked at the above series? Is that gathering the sort of
>> things you need? Is this all in service of examining the translation
>> quality of hot code?
>>=20
> Yes, it does have what I want, I suppose this wiki is for the series:
>     https://wiki.qemu.org/Features/TCGCodeQuality

Yes.

>
> btw, the archive seems broken and cannot show the whole series:
>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html

I have a v10 branch here:

  https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10

I think the top two patches can be dropped on a re-base as the JIT/perf
integration is already merged. It might be a tricky re-base though.
Depends on how much churn there has been in the tree since.

>
> Thanks,
> Fei.
>
>>>
>>>
>>> r~
>>=20
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

