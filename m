Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2393CF891
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:02:31 +0200 (CEST)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5nW9-0000S1-V1
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5nUY-0007yz-GX
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:00:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5nUW-0002pK-GR
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:00:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id c17so4988656wmb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CI00OkEnnLAtHfqguY3eQIhbQdqBVF00PvzBzl0jDQc=;
 b=R3zWEQ53Jxl4YSWgoHh7lCnnGoMff/vVyy9Uxjw8ylRWYbMINWy70WOhTLYJuCqRdr
 bWwnZCfFtbDaZFSUW09j7AFcLxaDT81CHSai0xRSyXWTQDFjyLrR+danU4S+/wjm2RzY
 VwHJkIKLbnThxHE6DIvIqEiKgW1sEhIVd8VQxOJL7t5QTrOwPod4xPBiClwSlwOcDHt5
 PiDLNVUBkbbzWVcQAIGIzCOD/EXzsxedleLbybvWARtAYwvwrSYshuO9BOBe15CfuVoq
 bMuEl0PKIAIrM/nFuspbeXFrDyItAf7AbsjkV6v4Bg4bXM7+Db8riwdGERPx20ONY+Ox
 PP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CI00OkEnnLAtHfqguY3eQIhbQdqBVF00PvzBzl0jDQc=;
 b=VGsYsWqppeUSw05bCKfIEFAWp8jrsmZUICjD7DCbNTuZ5PwkcLebpwdwSvVXCoDZEw
 fSMbOlaGYzTBmrruzTYqnU9nc7aoyrjN9FBMeA9KuE2P9OOThVwDy0QVjqJMv4eEkJ/6
 ZZrz0VMyFPc1TdSbuXNexSd76C5GIR8/+ZTDuiwHMzrWhI80/y8JiZs+l9Nv0k3I1X5B
 ufUGnNQmA/g5w8C3Uz1DiK/YigaN8GcqlKKtto/B0zjn0oTMr8OFhyuXgvsx2xE3TAIk
 EMkKUSa/4vP9I/i3AaUNmwJykRdlPoi5G2bvfNNiJLW8sEyG8yXYSF2lcebPaFSYsL8z
 hH+Q==
X-Gm-Message-State: AOAM532cPjBBUR2mUOHl/ke8rm4jwPN82fU5TZzGfDcPwd3lRmZlYeKx
 zdV5/AWXz2xpVrkQNDCwqUsZ9Q==
X-Google-Smtp-Source: ABdhPJz6OaMFLW6uoHlGVYY7vVt2fwcOT5/zItHMOfO8B+oW/+qUl9T2ko4rA3vH8n84RMhlETLf4A==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr31027212wml.17.1626778846845; 
 Tue, 20 Jul 2021 04:00:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y197sm2284156wmc.7.2021.07.20.04.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:00:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A5A41FF7E;
 Tue, 20 Jul 2021 12:00:45 +0100 (BST)
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-2-alex.bennee@linaro.org>
 <CAFEAcA8VGYTc2jrdB+ET4xFODDv0SniTjnUAYr+4dgjSZEsmiA@mail.gmail.com>
 <87zguhmi4p.fsf@linaro.org>
 <CAFEAcA_qZEixbcQt_96oqzEzeH5+v4aBqXjYTym7Mj5Xt7VK5A@mail.gmail.com>
 <87r1ftmf9m.fsf@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 1/2] hw/tricore: fix inclusion of tricore_testboard
Date: Tue, 20 Jul 2021 12:00:27 +0100
In-reply-to: <87r1ftmf9m.fsf@linaro.org>
Message-ID: <87o8axmeqq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@armsat.org,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Tue, 20 Jul 2021 at 10:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>> > On Mon, 19 Jul 2021 at 20:52, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>>> >>
>>> >> We inadvertently added a symbol clash causing the build not to inclu=
de
>>> >> the testboard needed for check-tcg.
>>> >>
>>> >> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
>>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> >> ---
>>> >>  configs/devices/tricore-softmmu/default.mak | 1 +
>>> >>  hw/tricore/Kconfig                          | 3 +--
>>> >>  hw/tricore/meson.build                      | 4 ++--
>>> >>  3 files changed, 4 insertions(+), 4 deletions(-)
>>> >
>>> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> > as far as this fix goes (though maybe CONFIG_TRICORE_TESTBOARD would =
be better?)
>>> >
>>> > But I still don't understand and would like to know:
>>> > (1) why doesn't CONFIG_TRICORE get set by Kconfig anyway, as
>>> > f4063f9c31 claims to be doing?
>>>
>>> It does (or should) thanks to meson:
>>>
>>>   'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=3Dy'
>>
>> Yeah, but it doesn't, as you can see if you look at the meson build
>> log: we do pass CONFIG_TRICORE=3Dy on the minikconf command line,
>> but it doesn't appear in minikconf's output!
>>
>>> > (2) what are the CONFIG_$ARCH flags for? Apart from this, we
>>> > don't seem to be using any of them, as demonstrated by the fact
>>> > that nothing else broke :-)
>>>
>>> They need to be declared in Kconfig otherwise minikconf complains about
>>> them not being defined when you pass it in. This is part of minikconf's
>>> sanity checking code.
>>
>> No, I mean, if nothing anywhere in the build system is conditional
>> on these flags, why do we have them at all ? We know we don't
>> have anything that cares about them, because right now we have
>> a bug where they're never set...
>
> Well we have one place at the moment to ensure v7m gets included even if
> you don't include the various M profile boards:
>
>   default y if TCG && (ARM || AARCH64)
>
> which is because translate.c still currently has a dependency on those
> bits. Without that you'll get a linker failure with the following build:
>
>   '../../configure' '--without-default-features' '--target-list=3Darm-sof=
tmmu,aarch64-softmmu' '--with-devices-aarch64=3Dminimal'
>
> I thought I'd added that to the build matrix but I can't find it now.

Ahh still part of the larger series:

  Subject: [PATCH  v16 99/99] gitlab: defend the new stripped down arm64 co=
nfigs
  Date: Fri,  4 Jun 2021 16:53:12 +0100
  Message-Id: <20210604155312.15902-100-alex.bennee@linaro.org>


>
>>
>> -- PMM


--=20
Alex Benn=C3=A9e

