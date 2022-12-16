Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9064EF59
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:38:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DfU-0008VC-Bw; Fri, 16 Dec 2022 11:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6DfH-0008Pe-HM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:34:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6DfE-00039f-FR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:34:27 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso2178667wmp.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Tu6ir/E4R9yVUvEO+9CcxdfIyqW1DjLGs+MHdQc8oA=;
 b=Q38GyUeQGXpJoHAabZi2NMd69+Vr96B+zz14HfFfwzHMSXiPlMcfzeKWj0KkCYameI
 nyu4XjTsWf/G1iXg0KNjXv/RPS6n///xYSOKOLFU2kVLCYG1CSdvklPzEORCzrFL5SNO
 Btkzj8Tv3vHK6bQiNmkqJRe+a1g90MRTr0Pz8B+f7rUSWty/GHzuYWK/q1ydcWC+edN0
 YGqm7z4Hy3lCDaXoYtyIkJW7GUBqfmTuH98Fo3D/DBu0U7ETeWDd4TBLD3yQ1xboR4JO
 4fFb6JOcKLqyrwQ3N2W9+63ALAhHmY4yIe9Ebg+1LPmRb+rT1pu+g2c3ONfbwhb1bo0x
 RCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Tu6ir/E4R9yVUvEO+9CcxdfIyqW1DjLGs+MHdQc8oA=;
 b=BWkXg2p2NT0cLuvQKT/C+JVgm16P1bjNIBjXimAdLpUfRgQzSMwpxSLh3kmw3blPyQ
 QT4WEhIaKq0nvtilvgPruTXHfthgGbEZtE9CbtLhgl8LmJpfmWMi09rKdgrWA0fErUaB
 tcVaoVpi0yPbX+hRj8snGs/1cP+Hsv7vNZmTc1nin2owErg3OHKHVLKM8Q6BQtIIZrp6
 figT3RmDusFG4yckk3hTPn2CnjnEJy+m9iT61tSZo03uWAk0r83VdRLED0zbzCfAvwZm
 DZ/CmQogQ+Gy0cwO8IJVMCW1cjmous+YWBiaWSl2/A+7t975FTzxNkc7O+fua/P9rXiT
 ehmQ==
X-Gm-Message-State: ANoB5pl5o/Yru+F1RpXnSYFxiNZJEGS/Kddmy/WSpCaU74kUazjgNSAT
 FP8Ifp/Pz55Fux+bQkwcfbtLAg==
X-Google-Smtp-Source: AA0mqf5hgB68i9Hb6ASSE2YRKjUOxhpEnKkNTEXSJO74ws5yQSQv2DwPlWvXReboW/Ioa3MJ1i5FYQ==
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr35420371wmc.31.1671208462397; 
 Fri, 16 Dec 2022 08:34:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003d01b84e9b2sm3172438wms.27.2022.12.16.08.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 08:34:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68A0E1FFB7;
 Fri, 16 Dec 2022 16:34:21 +0000 (GMT)
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
 <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
 <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
 <ad7a0620ca3279ab857050b2850f3e1e330539c7.camel@linux.ibm.com>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berran?=
 =?utf-8?Q?g=C3=A9?=
 <berrange@redhat.com>, Philippe  =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas
 Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ulrich Weigand
 <ulrich.weigand@de.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
Date: Fri, 16 Dec 2022 15:10:06 +0000
In-reply-to: <ad7a0620ca3279ab857050b2850f3e1e330539c7.camel@linux.ibm.com>
Message-ID: <877cyrgvea.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On Tue, 2022-07-05 at 15:40 +0100, Peter Maydell wrote:
>> On Tue, 5 Jul 2022 at 15:37, Ilya Leoshkevich <iii@linux.ibm.com>
>> wrote:
>> >=20
>> > On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
>> > > On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrang=C3=A9
>> > > <berrange@redhat.com>
>> > > wrote:
>> > > > If we put this job in QEMU CI someone will have to be able to
>> > > > interpret the results when it fails.
>> > >=20
>> > > In particular since this is qemu-user, the answer is probably
>> > > at least some of the time going to be "oh, well, qemu-user isn't
>> > > reliable
>> > > if you do complicated things in the guest". I'd be pretty wary of
>> > > our
>> > > having
>> > > a "pass a big complicated guest code test suite under linux-user
>> > > mode"
>> > > in the CI path.
>>=20
>> > Actually exercising qemu-user is one of the goals here: just as an
>> > example, one of the things that the test suite found was commit
>> > 9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal
>> > handlers"),
>> > so it's not only about the ISA.
>> >=20
>> > At least for s390x, we've noticed that various projects use
>> > qemu-user-based setups in their CI (either calling it explicitly,
>> > or
>> > via binfmt-misc), and we would like these workflows to be reliable,
>> > even if they try complicated (within reason) things there.
>>=20
>> I also would like them to be reliable. But I don't think
>> *testing* these things is the difficulty: it is having
>> people who are willing to spend time on the often quite
>> difficult tasks of identifying why something intermittently
>> fails and doing the necessary design and implementation work
>> to correct the problem. Sometimes this is easy (as in the
>> s390 regression above) but quite often it is not (eg when
>> multiple threads are in use, or the guest wants to do
>> something complicated with clone(), etc).
>>=20
>> thanks
>> -- PMM
>>=20
>
> For what it's worth, we can help analyzing and fixing failures detected
> by the s390x wasmtime job. If something breaks, we will have to look at
> it anyway, and it's better to do this sooner than later.

Sorry for necroing an old thread but I just wanted to add my 2p.

I think making 3rd party test suites easily available to developers is a wo=
rthy
goal and there are a number that I would like to see including LTP and
kvm-unit-tests. As others have pointed out I'm less sure about adding it
to the gating CI.

If we want to go forward with this we should probably think about how we
would approach this generally:

  - tests/third-party-suites/FOO?
  - should we use avocado as a wrapper or something else?
    - make check-?
  - ensuring the suites output tap for meson
  - document in docs/devel/testing.rst

Also I want to avoid adding stuff to tests/docker/dockerfiles that
aren't directly related to check-tcg and the cross builds. I want to
move away from docker.py so for 3rd party suites lets just call
docker/podman directly.

>
> Best regards,
> Ilya


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

