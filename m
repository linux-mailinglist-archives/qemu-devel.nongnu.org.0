Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A702265158A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7OYZ-0006se-Hb; Mon, 19 Dec 2022 17:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7OYX-0006ru-40
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:24:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7OYU-0006Hs-JY
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:24:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso7559229wmb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JssSNPKpl8eSCuIO5taYL4yJputVw5wjIpl3KDeWP0=;
 b=v1J/fldWSq4x3/rxWENKBa76ZCa8UQBju6pcfWgb4rYnMELCsizE82KWPPIahiCtEy
 WNdD2swTncW+61UZdhWyllgNKUgymLyXlZVSHDatWLsbFaDGGLFhRku086jM1ZjdmtPw
 PENEsy73aJ1bX7Y8Lp6XpmdhMGUh9LGvUOLWoHxAwJnNIpyfaDHPQqirGhihJhnNb3cK
 VnpU6mBB65RKB0b94Aw5nDBderVm4eTO8CUGodpcM6vG1pVe0vzdukVdLYHkeX4v9A+n
 vMU8IVk3DKFwa1nGUFy7DKgin3UMdKUWZvmGPvuJR61fphkyuGrseY2bjYwfIBhHdLsW
 3dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/JssSNPKpl8eSCuIO5taYL4yJputVw5wjIpl3KDeWP0=;
 b=PKGxEi4exYibVIfYCt3+6Jh0ceE9XbHOnMR0N6rJIr0cOipf01dnboMxUMJ6QqiR8O
 w/NBqyUdlVMCj4r3/zL9xp/JMUL4gj0Ak8HbKSW2fwb7Ka/pAjvQtbHQcJacHrmFTNhj
 XDDH4uDnv7007RgioYxdvAFqNxhWmznkDENk5gyWmfoN52ijpTs1EjCqRm/GgNvvyo1K
 OsNKFzgnaGU49NJgXUacb64UdPccHrBDM0hXvtPgRe6ZpqlrcJhDZCvU9VYkowi3EPWT
 7jkKiRfwBTA34ZgBqSlpK8OQgMjsHvbMRA3FZsP+CL921YuOtK+gDZyLTMcnajq5XNjy
 K5rw==
X-Gm-Message-State: ANoB5pk60XKjja2dbQ00RpMrxaVRj5y4ljFSaV/OW+jf3xKzzaG7Vb+P
 1FrzkOnh9viKwbBf5NgVkpFQdQ==
X-Google-Smtp-Source: AA0mqf6anBeuXZ9n5dOI1l4qnXUeYHifkZBm4hyeNi2YiPHDTgFW2UJq5TDfjKZFoRC0nMQ6S5DXqw==
X-Received: by 2002:a1c:4642:0:b0:3d1:f762:da7f with SMTP id
 t63-20020a1c4642000000b003d1f762da7fmr33227787wma.2.1671488656822; 
 Mon, 19 Dec 2022 14:24:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003a84375d0d1sm23043920wms.44.2022.12.19.14.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 14:24:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4D351FFB7;
 Mon, 19 Dec 2022 22:24:15 +0000 (GMT)
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
 <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
 <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
 <ad7a0620ca3279ab857050b2850f3e1e330539c7.camel@linux.ibm.com>
 <877cyrgvea.fsf@linaro.org>
 <a22b5aa0b84306ecdc288762f686bdba81e5f178.camel@linux.ibm.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E__Berra?=
 =?utf-8?Q?ng=C3=A9?=
 <berrange@redhat.com>, Philippe  =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas
 Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ulrich Weigand
 <ulrich.weigand@de.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
Date: Mon, 19 Dec 2022 22:18:39 +0000
In-reply-to: <a22b5aa0b84306ecdc288762f686bdba81e5f178.camel@linux.ibm.com>
Message-ID: <87a63jhw1c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

> On Fri, 2022-12-16 at 15:10 +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>>=20
>> > On Tue, 2022-07-05 at 15:40 +0100, Peter Maydell wrote:
>> > > On Tue, 5 Jul 2022 at 15:37, Ilya Leoshkevich <iii@linux.ibm.com>
>> > > wrote:
>> > > >=20
>> > > > On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
>> > > > > On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrang=C3=A9
>> > > > > <berrange@redhat.com>
>> > > > > wrote:
>> > > > > > If we put this job in QEMU CI someone will have to be able
>> > > > > > to
>> > > > > > interpret the results when it fails.
>> > > > >=20
>> > > > > In particular since this is qemu-user, the answer is probably
>> > > > > at least some of the time going to be "oh, well, qemu-user
>> > > > > isn't
>> > > > > reliable
>> > > > > if you do complicated things in the guest". I'd be pretty
>> > > > > wary of
>> > > > > our
>> > > > > having
>> > > > > a "pass a big complicated guest code test suite under linux-
>> > > > > user
>> > > > > mode"
>> > > > > in the CI path.
>> > >=20
>> > > > Actually exercising qemu-user is one of the goals here: just as
>> > > > an
>> > > > example, one of the things that the test suite found was commit
>> > > > 9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal
>> > > > handlers"),
>> > > > so it's not only about the ISA.
>> > > >=20
>> > > > At least for s390x, we've noticed that various projects use
>> > > > qemu-user-based setups in their CI (either calling it
>> > > > explicitly,
>> > > > or
>> > > > via binfmt-misc), and we would like these workflows to be
>> > > > reliable,
>> > > > even if they try complicated (within reason) things there.
>> > >=20
>> > > I also would like them to be reliable. But I don't think
>> > > *testing* these things is the difficulty: it is having
>> > > people who are willing to spend time on the often quite
>> > > difficult tasks of identifying why something intermittently
>> > > fails and doing the necessary design and implementation work
>> > > to correct the problem. Sometimes this is easy (as in the
>> > > s390 regression above) but quite often it is not (eg when
>> > > multiple threads are in use, or the guest wants to do
>> > > something complicated with clone(), etc).
>> > >=20
>> > > thanks
>> > > -- PMM
>> > >=20
>> >=20
>> > For what it's worth, we can help analyzing and fixing failures
>> > detected
>> > by the s390x wasmtime job. If something breaks, we will have to
>> > look at
>> > it anyway, and it's better to do this sooner than later.
>>=20
>> Sorry for necroing an old thread but I just wanted to add my 2p.
>
> Thanks for that though; I've been cherry-picking this patch into my
> private trees for some time now, and would be happy to see it go
> upstream in some form.
>
>> I think making 3rd party test suites easily available to developers
>> is a worthy
>> goal and there are a number that I would like to see including LTP
>> and
>> kvm-unit-tests. As others have pointed out I'm less sure about adding
>> it
>> to the gating CI.
>
> Another third-party test suite that I found useful was the valgrind's
> one. I'll post my thoughts about integrating wasmtime's and valgrind's
> test suites below, unfortunately I'm not too familiar with LTP and
> kvm-unit-tests.
>
> Not touching the gating CI is fine for me.
>
>> If we want to go forward with this we should probably think about how
>> we
>> would approach this generally:
>>=20
>> =C2=A0 - tests/third-party-suites/FOO?
>
> Sounds good to me.
>
>> =C2=A0 - should we use avocado as a wrapper or something else?
>> =C2=A0=C2=A0=C2=A0 - make check-?
>
> avocado sounds good; we might have to add a second wrapper for
> producing tap output (see below).
>
> One should definitely be able to specify the testsuite and the
> architecture, e.g. `make check-third-party-wasmtime-s390x`.
>
> In addition, we need to either hardcode or let the user choose
> the way the testsuite it built and executed. I see 3 possibilities:
>
> - Fully on the host. Easiest to implement, the results are also easy
>   to debug. But this requires installing cross-toolchains manually,
>   which is simple on some distros and not-so-simple on the others.
>
> - Provide the toolchain as a Docker image. For wasmtime, the toolchain
>   would include the Rust compiler and Cargo. This solves the problem
>   with configuring the host, but introduces the next choice one has to
>   make:
>
>   - Build qemu on the host. Then qemu binary would have to be
>     compatible with the container (e.g. no references to the latest
>     greatest=C2=A0glibc functions).
>
>     This is because wastime testsuite needs to run inside the
>     container: it's driven by Cargo, which is not available on the=C2=A0
>     host. It is possible to only build tests with Cargo and then run
>     the resulting binaries manually, but there is more than one and I'm
>     not sure how to get a list of them (if we decide to do this, in the
>     worst case the list can be hardcoded).
>
>     For valgrind it's a bit easier, since the test runner is not as
>     complex as Cargo, and can therefore just follow the check-tcg
>     approach.
>
>   - Build qemu inside the container. 2x space and time required, one
>     might also have to install additional -dev packages for extra qemu
>     features. Also, a decision needs to be made on whether the qemu
>     build directory ends up in the container (needs a rebuild on every
>     run), in a volume (volume lifetime needs to be managed) or in a
>     mounted host directory (this can cause selinux/ownership issues if
>     not done carefully).

I think building inside the container is the easiest to ensure you have
all the bits. We can provide a persistent ccache and follow the same
TARGET_LIST and option rules as the cross builds to allow for selecting
a minimal subset.

> - Provide both toolchain and testsuite as a Docker image. Essentially
>   same as above, but trades build time for download time. Also the
>   results are slightly harder to debug, since the test binaries are
>   now located inside the container.

There certainly seems some millage in having the test binaries in a
volume that is on the host system - especially if they are
self-contained or build statically.

> Sorry for the long list, it's just that since we are discussing how to
> enable this for a larger audience, I felt I needed to enumerate all the
> options and pitfalls I could think of.
>
>> =C2=A0 - ensuring the suites output tap for meson
>
> At the moment Rust can output either json like this:
>
> $ cargo test -- -Z unstable-options --format=3Djson
> { "type": "suite", "event": "started", "test_count": 1 }
> { "type": "test", "event": "started", "name": "test::hello" }
> { "type": "test", "name": "test::hello", "event": "ok" }
> { "type": "suite", "event": "ok", "passed": 1, "failed": 0, "ignored":
> 0, "measured": 0, "filtered_out": 0, "exec_time": 0.001460307 }
>
> or xUnit like this:
>
> $ cargo test -- -Z unstable-options --format=3Djunit
>
> # the following is on a single line; formatted for clarity
>
> <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> <testsuites>
>   <testsuite name=3D"test" package=3D"test" id=3D"0" errors=3D"0" failure=
s=3D"0"
> tests=3D"1" skipped=3D"0">
>     <testcase classname=3D"integration" name=3D"test::hello" time=3D"0"/>
>     <system-out/>
>     <system-err/>
>   </testsuite>
> </testsuites>
>
> I skimmed the avocado docs and couldn't find whether it can convert
> between different test output formats.=C2=A0Based on the source code, we =
can
> add an XUnitRunner the same way the TAPRunner was added.
>
> In the worst case we can pipe json to a script that would output tap.

That certainly works, there are plenty of interoperation solutions.

>
> Enhancing Rust is also an option, of course, even though this might
> take some time.
>
>> =C2=A0 - document in docs/devel/testing.rst
>
> Right, we need this too; I totally ignored it in this patch.
>
>> Also I want to avoid adding stuff to tests/docker/dockerfiles that
>> aren't directly related to check-tcg and the cross builds. I want to
>> move away from docker.py so for 3rd party suites lets just call
>> docker/podman directly.
>
> We could add the dockerfiles (if we decide we need them based on
> the discussion above) to tests/third-party-suites/FOO. My question is,
> would it be possible to build and publish the images on GitLab? Or
> is it better to build them on developers' machines?

Probably assume the developers especially as the actual CI currently
hammers our GitLab storage quotas and we are not expecting everyone to
be interested in such detail.

>
>> > Best regards,
>> > Ilya


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

