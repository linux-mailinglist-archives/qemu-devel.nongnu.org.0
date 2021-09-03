Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B94000C8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:52:42 +0200 (CEST)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9cX-00087x-Ab
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM9bK-0007Pr-2b
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:51:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM9bH-0000xN-FZ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:51:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id q14so8347648wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xjY2rzmssdHUf/lTCNx1TG0MASmPiWa8QjadY1+HQRU=;
 b=EZKHmGSB/JsdX5g7oiDc7z/ibfExZYjtccble0fMJlD8sBfZVvWzqRvgvTEEZcwPCI
 +ss5JhoMGa8vWwvAO437cRXHA2FeKOXhAUcgc+IjuGK15ylU83fzEEgmHb9WJEhrxLb3
 1yD/KiSZ+8djFokTa+PJCdMpQls3nBoJD3JE7V8Sji3yGdmB5tZlSB6tQBI+cv9nzAXT
 yjU4/QIfu/5I6PLmO63ZEUScT70Z+ZTybyPFAwKMM/iBJ0TK9mmIe/KLl4tflS+/S3dW
 EMWjCaPnA1tYTbnBruz0K1iG4yHH4hj+Qn7jB8KX1mCn8zJERwolu22WE0olRZ7NPKZ7
 Z4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xjY2rzmssdHUf/lTCNx1TG0MASmPiWa8QjadY1+HQRU=;
 b=ogGiS6Vvghvaqa4T1GOFdJYjkeS7lunrklbiqvEG6tz8b2blrLhTkVqrYn0QHXJ74/
 4zQ7c/LHaOF0TIZxgTPbQvvRIovtAKmDNVM0z/8yhe/PCXLDk82l9TViKMH2kK0WXfC6
 rMZjLw5jYaLRowX0Jhnj0SeJ3RrLjgqr5Yd0go1jaNQeS65tr2nwTOIJBjSm6Ow4TKGK
 h8AjRLuN18tQVQlIfEeeC6jy70rsrMOAxDYrJ9lL+8kCQcprOKoXC/DvUHG0SGRpzNxp
 6iOE2y5r99booLIPBrUwFZTLWUmL5839gUUK8UGvglZnXRW0OeP0EnIoxjvq6lZgpKtz
 8KrA==
X-Gm-Message-State: AOAM531J6qg85AH7grUXEvTZQWd7h7yI0D9kVu+i8Ih1Iz6o8RpPo1gY
 2AauDZWVS6rl+tv5KfXHiDcK4Q==
X-Google-Smtp-Source: ABdhPJwf04G4g21oJ+gtrOt7uo5+ogTuWofXMpGH6zmjaBCaEWnpTR4L/32Op3lF+IQByMnGLK8v1g==
X-Received: by 2002:a5d:6e84:: with SMTP id k4mr4233769wrz.426.1630677081368; 
 Fri, 03 Sep 2021 06:51:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm4019237wrc.86.2021.09.03.06.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:51:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA1071FF96;
 Fri,  3 Sep 2021 14:51:18 +0100 (BST)
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <CAFEAcA-xg=QEUqsBGqFAHiMVi2vBG_BSoC5nGbzdcpyHb_+Dhw@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/36] linux-user: Signal trampolines and vdsos
Date: Fri, 03 Sep 2021 14:39:30 +0100
In-reply-to: <CAFEAcA-xg=QEUqsBGqFAHiMVi2vBG_BSoC5nGbzdcpyHb_+Dhw@mail.gmail.com>
Message-ID: <87zgstpy21.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 Jul 2021 at 00:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Supercedes: <20210619034329.532318-1-richard.henderson@linaro.org>
>> ("[PATCH 00/12] linux-user: Load a vdso for x86_64 and hppa")
>>
>> Supercedes: <20210618192951.125651-1-richard.henderson@linaro.org>
>> ("[PATCH v2 00/23] linux-user: Move signal trampolines to new page")
>>
>> Changes for v2:
>>   * Add vdsos for aarch64, arm, i386, riscv.
>>   * Drop setup_sigtramp for any target with a vdso.
>>   * Drop arm v1 signal support.
>>   * Simplify ppc encode_trampoline.
>
> I'm not planning to review this series, but a general comment:
> I'm not really enthusiastic about the "vdso binaries checked into
> git and the build mechanism is a random makefile that has to be
> run by hand in the right environment" setup (and distros that
> like to build everything from source probably won't be keen
> either).

AIUI the vdso's are really pretty simple stubs more in line with our
stub launchers we currently have scattered around in our sources as hex
bytes. They are a bit bigger but not by much.

> At a minimum the handling of the cross-environment
> stuff should be more automated and reproducible like 'make check-tcg'.
> It would be useful also to get input from the Debian folks on
> how they'd want to see the build-from-source requirements/setup
> working...

In Debian they require cross compilers so they can build the various
blobs we use. However those blobs are packaged as "noarch" blobs and
only built on x86 where all the cross compilers are functional. This is
the reason you can't do a full build of QEMU packages on non-x86
platforms and why you need:

  apt build-dep -yy -a arm64 --arch-only qemu

so it doesn't barf trying to find cross compilers that haven't been
built for the host arch. So far my attempts to suggest the distros just
simply package all cross compilers on all supported host architectures
have been rebuffed on the basis it does tend to explode the build matrix
a bit.

The check-tcg compiler logic could be used to build the vdso's but it is
currently optional so if we can't run them you don't get any tests. I
suspect we still need to package the binary vdso blobs but use the
check-tcg machinery to rebuild them when we can.

>
> -- PMM


--=20
Alex Benn=C3=A9e

