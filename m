Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163B2DE239
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:55:37 +0100 (CET)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEMB-0002yD-Qf
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqELI-0002Vh-1b
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:54:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqELG-00042R-4B
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:54:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id q75so2283029wme.2
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wRKdX8cngjA2pWNr6PNMYltJlN4LP/MVgbah31xqFJw=;
 b=hcl9C/aB5EIJ0kINPSjcuE273/gK+wgC/BFgvRzfYUAMK5/A8GEYIAX/xHgcFUFZEv
 Tv8Inj9/39EH65M+bqVbAAe+aTgV45e//OUm/AH4xXHhnPmUWxcy2FuEIfpcWo4dBoC1
 IWJBp772rpxFEaW2L+ZalK5lWB65E51gvNSaMxVFZOWuEfGwoxmiAQX9t91iTE330TEE
 9EBdllRfnkja0ntAabZVhjN17K+LNLS3QVyENn7/kHSSuSJq4f7KVNAR6A5tIVYra9WO
 e1WSlBPL9U+VtWFcCSuTGgZ28+uFVPYCPSoLAPuJuIImB4delDdh5RCJSxX8RMA8TOyS
 08yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wRKdX8cngjA2pWNr6PNMYltJlN4LP/MVgbah31xqFJw=;
 b=QR8dyclZ1gslbxgj4zui2b+AmWI/XbXuTPt8l+9rNKRlhYGAIhdgvRKGC3mWoaYkHx
 sPdxPNGQ1GmeXCGFx6tybWooMsFlppcxrsatknWIbc62WreK6hUueVYwqhCFOOnWuwek
 SIT4vsUnlJp0VSmgJFQ/3HhAwUur67s9hR/sVuBCUASkqYJaO4c6HEGMc/glU6WgYNgr
 jD1QSjXJXwwLEyVyMn92fKl790Trb/D8c4gOeXHStUvW65pqm+mRiwSExq1mVaJ/IDfl
 umlHzTC6a3bwSXg9Jt7n6j/P9ll4HGgQ/vY01svrRzrbgnl0zwOoxNllRhfGq6wA0bHn
 48WQ==
X-Gm-Message-State: AOAM532i/Evnwzr4OmLI3Ba61h9MoyM4bzLae00DHn002cwpklXidXYg
 p/siSM5lmw/pTqVgZVoQGKWxDg==
X-Google-Smtp-Source: ABdhPJx7pejI2sdwcYr2iIWNeaRXHroZrFnJCfhOGC6lWdYvCJKVWOwwn7UvYsKnxo9Rp5u+EKu2WA==
X-Received: by 2002:a1c:e342:: with SMTP id a63mr3992843wmh.64.1608292476040; 
 Fri, 18 Dec 2020 03:54:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g191sm12666315wmg.39.2020.12.18.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:54:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D3CD1FF7E;
 Fri, 18 Dec 2020 11:54:34 +0000 (GMT)
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
 <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] testing and configure updates
Date: Fri, 18 Dec 2020 11:53:05 +0000
In-reply-to: <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
Message-ID: <87pn37qqh1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> On Thu, 17 Dec 2020 at 23:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 17 Dec 2020 at 09:43, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc6=
4a4b6f:
>> >>
>> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstr=
eam' into staging (2020-12-15 21:24:31 +0000)
>> >>
>> >> are available in the Git repository at:
>> >>
>> >>   https://github.com/stsquad/qemu.git tags/pull-testing-171220-2
>> >>
>> >> for you to fetch changes up to a1c04860cec798914f8cd8ef77fce195f360d3=
6e:
>> >>
>> >>   tests: update for rename of CentOS8 PowerTools repo (2020-12-17 09:=
38:51 +0000)
>> >>
>> >> ----------------------------------------------------------------
>> >> Testing and configure updates:
>> >>
>> >>   - add moxie-softmmu to deprecated_targets_list
>> >>   - improve cross-build KVM coverage
>> >>   - new --without-default-features configure flag
>> >>   - add __repr__ for ConsoleSocket for debugging
>> >>   - build tcg tests with -Werror
>> >>   - test 32 bit builds with fedora
>> >>   - remove last traces of debian9
>> >>   - hotfix for centos8 powertools repo
>> >
>> > This seems to fail for x86 builds on my local Linux system with
>> > errors like this:
>> > make: Entering directory '/home/petmay01/linaro/qemu-for-merges/build/=
alldbg'
>> > MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> > QTEST_QEMU_IMG=3D./qemu-img
>> > G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-for-merges/tests/dbus-=
vmstate-daemon.sh
>> > QTEST_QEMU_BINARY=3D./qemu-system-moxie tests/qtest/qmp-cmd-test --tap
>> > -k
>> > sh: 1: exec: ./qemu-system-moxie: not found
>> > socket_accept failed: Resource temporarily unavailable
>> > **
>> > ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshak=
e:
>> > assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
>> > ../../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
>> > process but encountered exit status 127 (expected 0)
>> > ERROR qtest-moxie/qmp-cmd-test - Bail out!
>> > ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshak=
e:
>> > assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
>> > Makefile.mtest:2417: recipe for target 'run-test-300' failed
>> > make: *** [run-test-300] Error 1
>> > make: Leaving directory '/home/petmay01/linaro/qemu-for-merges/build/a=
lldbg'
>> >
>> > Something in the Moxie deprecation patch not right?
>> > If we didn't build the executable we shouldn't try to
>> > run tests for it...
>>
>> We shouldn't but I can't replicate the failure here. I'm guessing it
>> goes away on a "make clean"?
>
> No, the 'alldbg' build is the one that does do a 'make clean';
> the build-not-from-clean build worked (presumably because the
> old executable was still left in place from the previous build).

Hmm I wonder if it's related to the configure options then. What's your
configure setup for that build?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

