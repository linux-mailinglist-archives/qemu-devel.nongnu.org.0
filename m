Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B104A9983
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:55:31 +0100 (CET)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFy7e-0006Ez-Ng
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFxuH-0003NZ-V7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:41:45 -0500
Received: from [2a00:1450:4864:20::62a] (port=40714
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFxtw-0006Ky-PE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:41:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p15so19018160ejc.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fo4pu+8PfY1FeFlkifo4PqLhXJHq8XMaEDaAKkBuNQQ=;
 b=idv9+KW8TGfzmCHfJsGpcm5O8K7g6sA/G6g9SbVeVBMoa3SovCWJblwlZsDFCF8OMg
 UEzdH5zhXNVWAQKTWcEoRbXTnaeqqm+1PR3Ee6j5aBu3kAOm4DOrxPswMTshePURCgVm
 k5IE+gAIbKI84alodecV1knP/EZaO3FggeuJkEv6IDPMzvZfv7QGXgwafqMTibu2TIms
 8amh2xTq8KIX+pPiXXmDxcklMP9nl9KcGJud7qTYxKuYdjDkvtScvWrdHjhvVy54FMs7
 q2JHLRK2rb6crsgkc5SKtBT2o61U9ng6WG2BCUHTV+E/AT1VSmvZKeAYs+2Rrj8m2fJC
 wu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fo4pu+8PfY1FeFlkifo4PqLhXJHq8XMaEDaAKkBuNQQ=;
 b=mHFKxNTEE3GKxsjlcJHkXQ6FmWWISncU3/S/tmcgGgwdb/kSJNR2H/Wh7RjoFkvoQA
 9oE8swgqJBFhj4cNct2+noQLOtvRdWuodYARvrl20O7MI5zv+F4/yjh1ZOR7KA0B9xJu
 cEFiyq4ep5TA2uh5rBGQzq0OZQSRHdXw5+QGt2V1HUpMxB1Qq4MIaT+gTRKlsNIHzrOy
 LgdV2FNg1q0BmuUwcKPDPuUp32wf1/6aMfnVmUpjCXJ7IXgJcMCfst5T3A/k43LvjAq6
 LUzmGrKw9Q+eshaPIJp25rE3jlv+by2QLu6H62+U8lKsQc/j6VidvSViievM8Irv6uaB
 nTqA==
X-Gm-Message-State: AOAM530mfiSTgPCoausx2ZNCMlif5JgZ28mNrZtDT+MNMbo8jg7Fe9HV
 FmGcHwmaadKdmnJHyBj3rQPZzw==
X-Google-Smtp-Source: ABdhPJwcTWdEE1xdsmq24xOgF1Pxjp7b/doKEczxXd9HRHDRyfh2V6fcePwZzkeGIl5c0AMos3UfPw==
X-Received: by 2002:a17:906:730c:: with SMTP id
 di12mr2269873ejc.640.1643978462393; 
 Fri, 04 Feb 2022 04:41:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a14sm774220edx.96.2022.02.04.04.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:41:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 169211FFB7;
 Fri,  4 Feb 2022 12:41:01 +0000 (GMT)
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org>
 <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
Date: Fri, 04 Feb 2022 12:33:46 +0000
In-reply-to: <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
Message-ID: <878ruqst2a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Valentin Ghita <valentinghita@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> Assuming you are happy for the device to act as though a external
>> debugger is attached regardless of the gdbstub state you could use a CPU
>> property on the command line to enable this behaviour. We have some
>> examples for SVE for the 64 bit CPUs (see object_property_add for
>> sve-max-vq). So something like:
>>
>>   -cpu cortex-m3,dhscr=3Dtrue
>>
>> You would probably want to model the behaviour of DHSCR.C_HALT as well
>> because that is something the core might do to itself if it detects it
>> is running under debug.
>
> This is sounding pretty hacky to me. I think we should either have
> a proper implementation of all of halting debug (probably opt-in,
> with the default being that the gdbstub is transparent to the guest),

So we could flip it and make it a property of gdbstub with transparency
being the default. Then any architecture that wanted to have this
behaviour could query the stub if enabled.

> or we should just say that no, this isn't something we support,
> and if you want gdb to get control when a particular bit of code
> is executed then you should set a breakpoint there.

It's a fairly niche use case but I don't see why we shouldn't assuming
someone is willing to write the code. However I suspect there is quite a
wide range of potential behaviours to model.

> We don't even implement the guest-visible debug parts of the
> architecture (eg architected single-step) yet, incidentally.

Is this just for Aarch32? Because for Aarch64 as far as I'm aware the
v8.0 debug works fine modulo bugs which I sent a fix for:

  Subject: [RFC PATCH] arm: force flag recalculation when messing with DAIF
  Date: Wed,  2 Feb 2022 12:23:53 +0000
  Message-Id: <20220202122353.457084-1-alex.bennee@linaro.org>

Implementing more of the debug functionality is on the list for
supporting Neoverse. We don't currently have a plan for how to deal with
the slowly growing series of PMU features though.

>
> -- PMM


--=20
Alex Benn=C3=A9e

