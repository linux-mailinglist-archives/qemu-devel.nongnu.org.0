Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5542D5BAA26
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:14:08 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8MI-0000Y9-VJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ8Js-0006AM-70
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:11:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ8Jq-0006BP-3v
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:11:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id n10so4636861wrw.12
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=mYVrcVE2mjNLDfJVU7pR77nV270YM5SZHi99gyuEWPE=;
 b=tlcxJEyvfUctc0rzU6tWoHOLm8+ZaMmbP0wPb1nG5eqzlseKa80gIUn02evXCgInCL
 zsc615eD4lhT2HqbTWa3QMjtSBAYmVUj7FtNsNGhyTHOrQ+EDwDhRnWRa6r9jFuhKMdW
 g/uk3TxMwDANrJ0FHEOLwdTozh87W13EgVLitQJsJJI3Wei3MyDAHLr9sIjWAsNbldnd
 olgck/vmfFjKWLbvYtSK2jTfZ05HddUmR9BFiyeS7x8cZvNVdTOsip5i3BKTkN4eGSFL
 RtGXEzFV+zSbKBcfCvR4uFY31h+o6FNl6PSB1jIAwLsv3N6PLvC+54utArS53wA1clqp
 8Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=mYVrcVE2mjNLDfJVU7pR77nV270YM5SZHi99gyuEWPE=;
 b=FRYm24X3k6+E2Y3NrEx7g+XNGGynm/JRhXSpJUx7DteBTlR6xqn42v/LCAfz8woCmZ
 A0hRnflBrBp9mTOpMPpm91+sE37FQiwVa+uC6XOyvNWf+djj04ykYdcFoJepVjr3SrHw
 0VPIWWVafkGTbZYoCIpHuyIs+invSNnDx9xebAgQTTFhOqK8cbNfptbjJyHhDe5zW+Af
 utR2ewAIHLIE8IZWPlCBabJYzcSTP0/o2LyqMaf/GkZ9R2w0gc5TiVMBlcgO5duTkB/J
 MXt+pwmwKsXR1ZFb0QC8XNElme8dSRFLY7rWQdnT5xVESrZ6IhKcMXObAEMeWmlqU3+l
 JRaA==
X-Gm-Message-State: ACrzQf0ht5bznZloO79Z31zz0mKtW351hk71+/X6agGh8kc7J4SRz5L7
 rzQbqNnh5NQ4YRoLWXDfLBqiIw==
X-Google-Smtp-Source: AMsMyM5hn+KictlXLttYKvUdbbrLjy9xIISF1rzBeiP8EPFF8hbGKLunmER1Ldxb2zGL77umQG4Etw==
X-Received: by 2002:a5d:45cb:0:b0:22a:94df:f88c with SMTP id
 b11-20020a5d45cb000000b0022a94dff88cmr2280503wrs.229.1663323092215; 
 Fri, 16 Sep 2022 03:11:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v12-20020adfebcc000000b00229b76f872asm5542381wrn.27.2022.09.16.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 03:11:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA2DB1FFB7;
 Fri, 16 Sep 2022 11:11:30 +0100 (BST)
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
 <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierre Muller <pierre@freepascal.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Date: Fri, 16 Sep 2022 10:33:46 +0100
In-reply-to: <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
Message-ID: <87illn8w8d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pierre Muller <pierre@freepascal.org> writes:

>   I am using gcc230 machine for the gcc compile farm.
>
>   This is a big endian mips64 machine runnig Debian Buster.

That's still oldstable, the current release of Debian doesn't support BE
mips in either 32 or 64 bit. As bullseye was released last year buster
will drop out of QEMU support window by August 2023 at the latest
(current LTS + 2 years or upstream drops support whichever comes first).

> When compiling the qemu 7.1.0 release source,
> the generated binaries are 32-bit mips binaries,
> and I did not find out how to generate a 64-bit versions
> of the executables.

I don't think we've ever been able to cross build QEMU BE mips64 - it was
only with buster we stopped relying on sid for access to working cross
compilers for building TCG tests:

  4575a701ea (tests/docker: move our mips64 cross compile to Buster)

>   As mips32 seems to still be the default arch that gcc uses,
> I don't really understand the idea of depreciating big endian mips32.
>
> Is this solely related to cross-compilation issues?

Decent cross-compilation support for building QEMU is the minimum we
need to ensure things don't bitrot. Ideally we would have real HW
running a non-bespoke OS with a gitlab runner so we could build *and*
run tests. However finding such HW is even harder than keeping the cross
compilation working.

>
> Pierre Muller
>
>
> More information on gcc230:
> muller@gcc230:~$ uname -a
> Linux gcc230 4.9.79-UBNT_E300 #9 SMP Tue Jul 13 13:04:47 BST 2021 mips64 =
GNU/Linux
> muller@gcc230:~$ cat /etc/os-release
> PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"
> NAME=3D"Debian GNU/Linux"
> VERSION_ID=3D"10"
> VERSION=3D"10 (buster)"
> VERSION_CODENAME=3Dbuster
> ID=3Ddebian
> HOME_URL=3D"https://www.debian.org/"
> SUPPORT_URL=3D"https://www.debian.org/support"
> BUG_REPORT_URL=3D"https://bugs.debian.org/"
> muller@gcc230:~$ gcc --version
> gcc (Debian 8.3.0-6) 8.3.0
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
>
> muller@gcc230:~$ gcc -print-libgcc-file-name
> /usr/lib/gcc/mips-linux-gnu/8/libgcc.a
> muller@gcc230:~$ gcc -mabi=3D64 -print-libgcc-file-name
> /usr/lib/gcc/mips-linux-gnu/8/64/libgcc.a


--=20
Alex Benn=C3=A9e

