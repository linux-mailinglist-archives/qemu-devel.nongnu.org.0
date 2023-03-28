Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825706CBF01
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:27:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8PL-00076F-Ul; Tue, 28 Mar 2023 08:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph8PI-00075t-9u
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph8PG-0004fa-9G
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id e18so11995943wra.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680006388;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UGlRxiGkMpFp1UPSI0NKpCH9yLRLo5kpXZgtPn0j2Qo=;
 b=exOQStBccaVD7Ebbp7R5OjNvmB8SESlUdSj+H05JegIEKYe0S9M7kUODydUOqL7ggx
 qpZypOYVzK9nZTaBGdXIxTuKziJfXDiLAcAUz7x+LY1PcWuEk+CK1m0r7Lrkuy5DcWlf
 p93gKyK1ss3jBRiCbYIgrZlQowHQroboJbOhYtyPeqNMi5xuF+LLibGZf4afaB0jCA//
 3Mn96j24+YGTYeJ7h4rcaE3itlw2Ks62vy6hyvnLmwU5ThUn8kj/igftA/uxSeAa7dLw
 SMczkXLmzsA+z4TmJ84CwNjoqG8DjRwECpwQEFrQIiHtPX5h2ce3bMFLwPruXAIhG3Rv
 SDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680006388;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UGlRxiGkMpFp1UPSI0NKpCH9yLRLo5kpXZgtPn0j2Qo=;
 b=EHc8O/mIowDTlA87b7+skOXelpBg9QlzG9sv1RNRJa76e6JiD1/D50fg/K4+kbmu4M
 XU/HN/+2maC2wz7KjOtEFgY25sokYXkR8IdAWdzOlTKjc0u8PdcSDOrMVHPeQVFxDq4S
 GK5NuuTY2R0oD/3dLnixZVmSpdFJI9PWJjFwkdDHiPziIuE/6DYq9coOMSSR13T7HnLk
 OAL22I5z7Cs7aBJg+1g+kdPuSxcklYEpFc6sluUXxw5a0tKUZujfYruX621q6fb3hY1R
 jeYHyjhU+PWIv4E8ijHNDSvTPTd6kqdQtROzrxKwq1qsBTtpaIOvWfR9FYEyiNHq+bhF
 P/ow==
X-Gm-Message-State: AAQBX9ddNel6mh1kHsy8D1moFF2jmNN4BV1N8/YIiUhn4TNUqNQGGC/L
 l8qOYgCJ1seKaJmwszHscRxk8g==
X-Google-Smtp-Source: AKy350b/d/e6W93iZys30ISo7uC+t66xUCGQq1qePGlQWXtByukulH9Ddqp7S82kcXolb1lNZ/QiIg==
X-Received: by 2002:a5d:6612:0:b0:2d0:7545:a544 with SMTP id
 n18-20020a5d6612000000b002d07545a544mr12127539wru.7.1680006388478; 
 Tue, 28 Mar 2023 05:26:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003ef5bb63f13sm12603617wms.10.2023.03.28.05.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:26:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0E9D1FFB7;
 Tue, 28 Mar 2023 13:26:27 +0100 (BST)
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
 <87r0tarx7u.fsf@linaro.org>
 <ZCLOi5RKIMGfjWRj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] tests/avocado/boot_linux.py: re-enable test-case
 for ppc64
Date: Tue, 28 Mar 2023 13:21:10 +0100
In-reply-to: <ZCLOi5RKIMGfjWRj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Message-ID: <87sfdpqcy4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> On 2023-03-27 17:07:30, Alex Benn=C3=A9e wrote:
>>=20
>> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>>=20
>> > Fixes c0c8687ef0("tests/avocado: disable BootLinuxPPC64 test in CI").
>> >
>> > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the test-case
>> > for PPC64. On investigation, this turns out to be an issue with the
>> > time taken for downloading the Fedora 31 qcow2 image being included
>> > within the test-case timeout.
>> > Re-enable this test-case by setting the timeout to 360 seconds just
>> > before launching the downloaded VM image.
>> >
>> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> > Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Tested-by: Hariharan T S hariharan.ts@linux.vnet.ibm.com
>>=20
>> It doesn't really address the principle problem that the
>> boot_linux.py:BootLinuxPPC64.test_pseries_tcg is super heavyweight for
>> only 2% extra coverage of the executed lines.
> By re-enabling this test-case we will ensure that PPC64 part of qemu
> works okay in terms of basic linux boot. Without this we will have
> a regression in the sense that there won't be any way to test out
> basic linux boot for PPC64.

Sure we do:

  =E2=9E=9C  ./tests/venv/bin/avocado list ./tests/avocado/tuxrun_baselines=
.py:TuxRunBaselineTest.test_p
  INSTRUMENTED ./tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_=
ppc32
  INSTRUMENTED ./tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_=
ppc64
  INSTRUMENTED ./tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_=
ppc64le

boot 3 different ppc configurations.

>>=20
>> What we really need is a script so we can compare the output between the
>> two jsons:
>>=20
>>   gcovr --json --exclude-unreachable-branches --print-summary -o coverag=
e.json --root ../../ . *.p
>>=20
>> because I suspect we could make up that missing few % noodling the
>> baseline test a bit more.
> Can you tell me how you check code coverage with and without this
> test-case ?

I use two build directories, both configured with --enable-gcov. e.g.:

 ../../configure' '--disable-docs' '--enable-gcov' '--target-list=3Dppc64-s=
oftmmu'

and run a different set of tests in each build dir. You can then run:

  make coverage-html V=3D1

for the initial report. See:

  https://qemu.readthedocs.io/en/latest/devel/testing.html#gcc-gcov-support
=20=20
> I am kind of new to qemu so it would be nice to know how you
> do this. And I am trying to increase the code coverage by improving
> the baseline test by including more devices in the qemu-system-ppc64
> command line so I would appreciate any tips on how to do that also.

The only problem is eyeballing the html reports is a very fuzzy way of
comparing coverage. However the gcovr report generates some useful
machine readable json which could be compared with a script.

>>=20
>> > ---
>> >  tests/avocado/boot_linux.py | 6 +++++-
>> >  1 file changed, 5 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
>> > index be30dcbd58..c3869a987c 100644
>> > --- a/tests/avocado/boot_linux.py
>> > +++ b/tests/avocado/boot_linux.py
>> > @@ -91,9 +91,9 @@ class BootLinuxPPC64(LinuxTest):
>> >      :avocado: tags=3Darch:ppc64
>> >      """
>> >=20=20
>> > +    # timeout for downloading new VM image.
>> >      timeout =3D 360
>> >=20=20
>> > -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> >      def test_pseries_tcg(self):
>> >          """
>> >          :avocado: tags=3Dmachine:pseries
>> > @@ -101,6 +101,10 @@ def test_pseries_tcg(self):
>> >          """
>> >          self.require_accelerator("tcg")
>> >          self.vm.add_args("-accel", "tcg")
>> > +
>> > +        # timeout for actual Linux PPC boot test
>> > +        self.timeout =3D 360
>> > +
>> >          self.launch_and_wait(set_up_ssh_connection=3DFalse)
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

