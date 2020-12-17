Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F9C2DDBF5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 00:44:47 +0100 (CET)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq2wv-0001BV-Vp
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 18:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kq2vO-0000kK-3T
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 18:43:10 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kq2vM-00040y-5p
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 18:43:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id y23so571257wmi.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 15:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uLVMjQttdH8c+PKrjJhDveqvf8mlo2SrUBSpChEtzh8=;
 b=JBp9kuGKjsM/ofl7Gb9dKCtquOq6lY6sLTod/XwM0TsS1VtN4r04SCVzV/tN7QmVm9
 /w9gPtORrjBV1Ss8SuKI28YMYjD/7ia8NvukZIBM+CsbKHdyOehzc1xO6vCagPhGd8st
 BnTVXuYSS7fGoWdy0jlOhki7GGyIVkOvXCvUhr/63YXDYsCsdA/DgMssGCV95wXEj6fr
 501YHGHjHPZsNaAMpWodylrJ/bcm0Lp0shwDztQIuPNIWmVTtpgSBjyuwK9K4BBTKY3m
 VFzgnGYLTAHf4pOmOZBZNpHFxh+RBlJFYAeJcHynxU6a1cZ0PyUa1e6OfP1A74raRNdV
 6f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uLVMjQttdH8c+PKrjJhDveqvf8mlo2SrUBSpChEtzh8=;
 b=r4fX7gvAjFOlBg3zG6U30VEOjfM4WMroDn5lsjJgOdmwtp8uBMDRVvf+LX1Gc5V0D2
 0dla3s8aWcXXJwjpO6cZBUVDz2gIEXPCdRdvy8dzJL99tKGrQ0nG3Vp2+PYR5O+kA9dM
 8cBTbYmbXmZso/Gcsmy1RC9k4WM5TlbcEg2k0NeMJn6fqvpTfO92ch1MOQHr5MMt9zeo
 Fqws+xVkMI/i9L6Q4Nfco7oR9SxV7hbs91QeMUUZpMsTRY+f1YAu6f/ml3soojvYN8iQ
 PAAvuWukrGYrUgrDANe8/8zzCv/RdztSDnAR95cgqDVlqwFtPpMho4+Jzj5kdCJFMVqU
 tZew==
X-Gm-Message-State: AOAM530CCbfHqAjefBv1fwZw8PfjnZlsWYuoSWVDdDay0xGFLyaMZu1r
 FP88rSPwy0ogchUFCfmeYMOjtA==
X-Google-Smtp-Source: ABdhPJye48xrO3Za7ulkoyOepa1hc0FLky70Wh499M+bxwHe7sNF0HSM5kijKRBc6iVaR1wHXpFfkA==
X-Received: by 2002:a1c:7710:: with SMTP id t16mr1568500wmi.11.1608248586331; 
 Thu, 17 Dec 2020 15:43:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d187sm9421521wmd.8.2020.12.17.15.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 15:43:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 204621FF7E;
 Thu, 17 Dec 2020 23:43:04 +0000 (GMT)
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] testing and configure updates
Date: Thu, 17 Dec 2020 23:41:58 +0000
In-reply-to: <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
Message-ID: <87v9d0q9rr.fsf@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 17 Dec 2020 at 09:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4=
b6f:
>>
>>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream=
' into staging (2020-12-15 21:24:31 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-171220-2
>>
>> for you to fetch changes up to a1c04860cec798914f8cd8ef77fce195f360d36e:
>>
>>   tests: update for rename of CentOS8 PowerTools repo (2020-12-17 09:38:=
51 +0000)
>>
>> ----------------------------------------------------------------
>> Testing and configure updates:
>>
>>   - add moxie-softmmu to deprecated_targets_list
>>   - improve cross-build KVM coverage
>>   - new --without-default-features configure flag
>>   - add __repr__ for ConsoleSocket for debugging
>>   - build tcg tests with -Werror
>>   - test 32 bit builds with fedora
>>   - remove last traces of debian9
>>   - hotfix for centos8 powertools repo
>
> This seems to fail for x86 builds on my local Linux system with
> errors like this:
> make: Entering directory '/home/petmay01/linaro/qemu-for-merges/build/all=
dbg'
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img
> G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-for-merges/tests/dbus-vms=
tate-daemon.sh
> QTEST_QEMU_BINARY=3D./qemu-system-moxie tests/qtest/qmp-cmd-test --tap
> -k
> sh: 1: exec: ./qemu-system-moxie: not found
> socket_accept failed: Resource temporarily unavailable
> **
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> ../../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
> process but encountered exit status 127 (expected 0)
> ERROR qtest-moxie/qmp-cmd-test - Bail out!
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> Makefile.mtest:2417: recipe for target 'run-test-300' failed
> make: *** [run-test-300] Error 1
> make: Leaving directory '/home/petmay01/linaro/qemu-for-merges/build/alld=
bg'
>
> Something in the Moxie deprecation patch not right?
> If we didn't build the executable we shouldn't try to
> run tests for it...

We shouldn't but I can't replicate the failure here. I'm guessing it
goes away on a "make clean"?

Maybe meson is leaving something behind from the previous iteration?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

