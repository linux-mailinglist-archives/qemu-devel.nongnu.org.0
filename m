Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7A6A7351
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR1A-0007a8-FS; Wed, 01 Mar 2023 13:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXR18-0007Xs-By
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:17:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXR16-0005Cq-Iu
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:17:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so70457wmb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+kRBjcIl6F5pkN8xzl7OqfcrGbC+/4sRCvVB/NdvTI=;
 b=LUv5BzB2XO3mlDnQ3xracybLCZil9JxYkwvAVe8CTHMIr7JMhwPU0qqo8I2rRmVMl8
 PZ2YH3jmU67SA1M1ueZaIPC9wS3r4nhL7MA8Z4Wc7sk/u6JntgJZidvJK7Md/4eiYWP/
 61AZNPQMp294ndQDTLZy+YFF4QcKWgvsC90qO2lSkIs60pARTxohaIMRDu88s0xwnyc8
 kqMhi3EaagDl6y9K58yfHj5DdcTEsIdDQC/byFT/eAV69NB1W60DeZU5CAApOMsAXIpW
 1Ci2Ny7noX8/CBQzIqPBsMf2jZMH4vwL4YIUqh0ncFnKO1jVq7EthY0AQ0hqMGYzoCIx
 PHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9+kRBjcIl6F5pkN8xzl7OqfcrGbC+/4sRCvVB/NdvTI=;
 b=E430DWaH3556/FThi9hfS4sC/Jxm6qISGUXBbol/ym7Km+HsEohAX/IbzT3sO9WRHd
 S2Ht9iUFLNXhicZCAlhxw19X+h+bsfFrlqdV14zlvxx1VCUXDqTHDxradkJwdxLSnsJJ
 9WB2ye2eTWtwKyR4LnQMgmWEJRe+G8Rl3KFO0Jw2B0HWxH3MmJ0kX8C6KIr1KEkkslwg
 pLKiMkz0vmPLTH5A/YYUyPejqxZngN0ZVt4VQXBPy5v/EoRj3YBtTI5kKlgswR3yMmhT
 lgq+LTIKvpihnDzH0rS9jVWV21FjzfG+mr2SUGwN8dW7ZtGyqR+pd7uH3risUFL2lG0r
 +ZPg==
X-Gm-Message-State: AO0yUKUQYY9q0O8tTr3UWQoMZLI/gOP3KPX0wXRnTNdbE8Uu0wmXSVlR
 zu1ynqIZFW8yw7WOjlPcaSGVVA==
X-Google-Smtp-Source: AK7set8jJcfsszklvWR/KyZ099W6/pYwR//z1BsFubw5UgD/CjQuZ3UtKBebwcH2gxCT349g+CFVyA==
X-Received: by 2002:a05:600c:5119:b0:3e2:1a01:3a7c with SMTP id
 o25-20020a05600c511900b003e21a013a7cmr11838509wms.6.1677694646710; 
 Wed, 01 Mar 2023 10:17:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a7bcb87000000b003dc4a47605fsm346886wmi.8.2023.03.01.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:17:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9B501FFB7;
 Wed,  1 Mar 2023 18:17:25 +0000 (GMT)
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Date: Wed, 01 Mar 2023 18:17:03 +0000
In-reply-to: <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
Message-ID: <87356ocp56.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The following changes since commit 627634031092e1514f363fd8659a579398de0=
f0e:
>>
>>   Merge tag 'buildsys-qom-qdev-ui-20230227' of
>> https://github.com/philmd/qemu into staging (2023-02-28 15:09:18
>> +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
>>
>> for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb:
>>
>>   tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01 12:51:01 =
+0000)
>>
>> ----------------------------------------------------------------
>> testing updates:
>>
>>   - ensure socat available for tests
>>   - skip socat tests for MacOS
>>   - properly clean up fifos after use
>>   - make fp-test less chatty
>>   - store test artefacts on Cirrus
>>   - control custom runners with QEMU_CI knobs
>>   - disable benchmark runs under tsan build
>>   - update ubuntu 2004 to 2204
>>   - skip nios2 kernel replay test
>>   - add tuxrun baselines to avocado
>>   - binary build of tricore tools
>>   - export test results on cross builds
>>   - improve windows builds
>>   - ensure we properly print TAP headers
>>   - migrate away from docker.py for building containers
>>   - be more efficient in our handling of build artefacts between stages
>>   - enable ztsd in containers so we can run tux_baselines
>>   - disable heavyweight PPC64 Boot Linux test in CI
>
> This still won't merge:
>
> e104462:jammy:qemu-for-merges$ apply-pullreq
> https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
> Switched to branch 'master'
> Your branch is up-to-date with 'origin/master'.
> Already up-to-date.
> Switched to branch 'staging'
> fetching from remote https://gitlab.com/stsquad/qemu.git
> tags/pull-testing-next-010323-1
> remote: Enumerating objects: 288, done.
> remote: Counting objects: 100% (288/288), done.
> remote: Compressing objects: 100% (135/135), done.
> remote: Total 221 (delta 182), reused 114 (delta 84), pack-reused 0
> Receiving objects: 100% (221/221), 43.20 KiB | 3.08 MiB/s, done.
> Resolving deltas: 100% (182/182), completed with 57 local objects.
> From https://gitlab.com/stsquad/qemu
>  * tag                       pull-testing-next-010323-1 -> FETCH_HEAD
> Fetching submodule tests/fp/berkeley-testfloat-3
> fatal: unable to connect to github.com:
> github.com[0: 140.82.121.3]: errno=3DConnection timed out
>
> fatal: unable to connect to github.com:
> github.com[0: 140.82.114.4]: errno=3DConnection timed out
>
> Errors during submodule fetch:
>         tests/fp/berkeley-testfloat-3
>         tests/fp/berkeley-testfloat-3

You'll need to do a fresh checkout or manually fix up the .git/ metadata

>
> (The script is doing 'git fetch  https://gitlab.com/stsquad/qemu.git
> tags/pull-testing-next-010323-1')
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

