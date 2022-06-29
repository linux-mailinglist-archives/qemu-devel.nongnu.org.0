Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8C55FCF5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:17:39 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UlN-0001hS-Hf
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UiR-00082Z-EA
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:14:35 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UiP-0002My-DN
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:14:35 -0400
Received: by mail-ej1-x633.google.com with SMTP id ge10so31568218ejb.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xg0nTnukAQHurqWB9MmujFvl/efYU9L9skID+yBxSJQ=;
 b=NFR6TW9WBYj5QhzVn+id+weya0pyrm6f7Eq99HQOfv5ABiLeDWdb1S5LurEe8ZoRzg
 fdrkFZrujMOK++cpAVdDV8N13XL3WUvPsSci59VSEQLmPt0VASbMjMQFs8iHwZSp+GED
 0wt2ngCVzUo739qvmjA81U2IooX/OBTxLsBJ00Rm5ciBjva1IfdWt2QXUizUjrl9DDQ7
 /UsiJlsBf/CWwDL2gcOsN+mfie5HJZ5MbsMnc3b5gZf5CDpvMu2F0y2nmlSRBliyFfZZ
 kAXya0L5N7gX9V/mG07Of7VTPhD/CoSFgm/c+rD7JKHvlEDSLY4edAxEZUsXi4P/zCbF
 IF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xg0nTnukAQHurqWB9MmujFvl/efYU9L9skID+yBxSJQ=;
 b=j2xMqPtZHuZ7ycHlZ2vB/cH79FcnwyetzM+5Q+kW6nEhdbu2XfiUWCMGzYZvEg9lol
 fSUtb9dgqMDLwZWmLicAiVT6WyjGkaEP4obQoTi9bliIi+Lwk8sMbBvdlsq9G06t6yWS
 2xglpnE5exsWy7HkYS+30MtNUzXlbKZZXDMsBph9pa2YHEpn7DZMipXrfSOHz05FCtGe
 Urjh0X8xMIsE4H9cJKle4R0JVXeazpJwO+oKZI3xL4KQy5I/sk7+owbMFaRrQ8dFXBJh
 5ohd6vUvYl9EZR49QZg2Z7MIKl9j5vwBPrdXF468OcTTyjJ/YVWVPzQv+zcNSyY/tK7Z
 Lhjw==
X-Gm-Message-State: AJIora/qHJIGQ3hMV8+yrgFqC5kmBxbGGplwzI08LIMcL8qKIDOExLUJ
 UwTIIGl0t2Rbuk/DS03pm7sFyA==
X-Google-Smtp-Source: AGRyM1uk/8DzL39Xq9Q80kGt1Kp5BvvQl4f5H2iA57jX+ej902ulNxYni3Ef6Jlr/0wWj9MRj1sK3A==
X-Received: by 2002:a17:906:b1cb:b0:716:89ce:a708 with SMTP id
 bv11-20020a170906b1cb00b0071689cea708mr2614189ejb.667.1656497670599; 
 Wed, 29 Jun 2022 03:14:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 dt16-20020a170906b79000b00704fa2748ffsm7671393ejb.99.2022.06.29.03.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:14:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F4D41FFB7;
 Wed, 29 Jun 2022 11:14:28 +0100 (BST)
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
 <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
 <87tu83j3gx.fsf@linaro.org>
 <CAMo8BfLmQFKh-BuFXWqU2w+T_nVmBjXZ24THHneyJmdgcYPZ5Q@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
Date: Wed, 29 Jun 2022 11:02:27 +0100
In-reply-to: <CAMo8BfLmQFKh-BuFXWqU2w+T_nVmBjXZ24THHneyJmdgcYPZ5Q@mail.gmail.com>
Message-ID: <87h743ixob.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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


Max Filippov <jcmvbkbc@gmail.com> writes:

> On Wed, Jun 29, 2022 at 1:09 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>> > On 6/28/22 19:08, Max Filippov wrote:
>> >> On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
>> >> <richard.henderson@linaro.org> wrote:
>
>> >>>       }
>> >>> -    if (serial_hd(0)) {
>> >>> -        xtensa_sim_open_console(serial_hd(0));
>> >>> -    }
>> >> I've noticed that with this change '-serial stdio' and its variants
>> >> are still
>> >> accepted in the command line, but now they do nothing.
>> >
>> > Pardon?  They certainly will do something, via writes to the serial ha=
rdware.
>> >
>> >
>> >> This quiet
>> >> change of behavior is unfortunate. I wonder if it would be acceptable
>> >> to map the '-serial stdio' option in the presence of '-semihosting' to
>> >> something like '-chardev stdio,id=3Did1 -semihosting-config chardev=
=3Did1'?
>> >
>> > I dunno.  I'm wary of having xtensa be unique here.  Alex, thoughts?
>>
>> Is semihosting *the* serial hardware for xtensa-sim or is it overriding
>> another serial interface? I'm wary of adding more magical behaviour for
>> -serial as it can be confusing enough already what actually gets routed
>> to it if not doing everything explicitly.
>
> There's no notion of 'serial hardware' for the xtensa-sim, all it has is
> the three standard stdio file descriptors.

Which are accessed via semihosting calls? Are they implicitly mapped to
3 chardev devices for stdin, stdout and stderr?

> But it was convenient thinking
> of them as a serial port. I agree that no magic is needed here, but
> the change shouldn't be quiet eiter, so xtensa-sim should warn (or
> maybe even quit with an error code) when it sees the -serial option.

If the default chardevs already map to the 3 FDs then perhaps -serial
should be invalid because it is more explicit to use -chardev to
redirect the stream you want somewhere else. However I don't see them at
the moment:

  =E2=9E=9C  ./qemu-system-xtensa -M sim -semihosting -S -display none -mon=
itor stdio
  QEMU 7.0.50 monitor - type 'help' for more information
  (qemu) info chardev=20
  compat_monitor0: filename=3Dstdio
  parallel0: filename=3Dvc

--=20
Alex Benn=C3=A9e

