Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AB3AFED8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:12:46 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbWX-0002Fc-Rt
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvbVg-0001Zs-Dy
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:11:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvbVe-0005X3-1g
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:11:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id a13so736291wrf.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WQPYlz8liuEEqQlvIn0sWASlKh1QWabcyYUdeF/qrs4=;
 b=K+bSYbaHljdw7iTEwAi9QJ31zB1fGi1lnpr3H+D6eXW8sDxoU+ghwpzk1wh8mPruep
 jWxLk9LtS3FvO21extqfGaKdhy3I/4r6EywxcZwCPFtO+lxdEEPkaDje1LaxBjFtZnRA
 H+8QcjVrPTRD1Uksnmfto9OHGadbFk/A5BwcKnzTlEBv6yLOPUT/VBCq19Q3cWEH7oOA
 Tc8j9iiPnY86mD5K1njmGTzrznfo2xqRiOC7v8jpxecD3+fCm/8F3sjhRHB47ivzpJoz
 S/T57oRGResvW+0SJ/EOjh3kR0aud8FicBHtrdXyVHe32Yq6H4geIqnmBChwXAc1/d/9
 iifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WQPYlz8liuEEqQlvIn0sWASlKh1QWabcyYUdeF/qrs4=;
 b=cvup5NcXwhidFFG8dVDG6RRo1ekinGtwmOniLYNV40xai20jwOKLxEdDx5hMODkh7d
 yNNkxa5FWdOMkAzjWcBjjGqJqtMsimzAZ986BvlPJim9CpbS0MPlATVG+BoZvdIMZsFz
 XZvKQWRKxV+vnjHWaNx+x7ks+ll9/abZS9ksQJVBtHOylrT7L2yARaf1cHa+r9eIzbau
 4uGLyYbLiN61rNMR/5+60PpJtWjK3QYzM2tVjTbDgvwK+uWJWLlcqiMNbnMb2lNqi9/C
 wZW/wWiY5aq9spdLPpYhShvVeOEnSkBW2kpunhH6fYE32O6wkeoznx9ANV213SQqKH7g
 W9Qg==
X-Gm-Message-State: AOAM531iK3l0wGx8tgMqz3iWSI9TKwt10bc5uKeYPZcOphiQQJWa33py
 nkeWxqV5r28aVeKp91RlL3ItLA==
X-Google-Smtp-Source: ABdhPJzE9c4sKY4PSj2dd4+671pEWEDPRcvTUhXZykxqMB2q6fL8qKtdk9l4PLFK/gWVJEIgx4eFmA==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr3064074wrb.289.1624349508054; 
 Tue, 22 Jun 2021 01:11:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y14sm14030551wrq.66.2021.06.22.01.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:11:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C4921FF7E;
 Tue, 22 Jun 2021 09:11:46 +0100 (BST)
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
 <20210618132647.07cf2008@redhat.com>
 <2f7ae379-92e0-3274-6944-84a5bce6e82e@suse.de>
 <20210618152943.2009ad82@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
Date: Tue, 22 Jun 2021 09:07:16 +0100
In-reply-to: <20210618152943.2009ad82@redhat.com>
Message-ID: <874kdqtj25.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Math?= =?utf-8?Q?ieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Igor Mammedov <imammedo@redhat.com> writes:

> On Fri, 18 Jun 2021 14:43:46 +0200
> Claudio Fontana <cfontana@suse.de> wrote:
>
>> On 6/18/21 1:26 PM, Igor Mammedov wrote:
>> > On Thu, 17 Jun 2021 18:49:17 +0200
>> > Claudio Fontana <cfontana@suse.de> wrote:
>> >=20=20=20
>> >> On 6/16/21 5:24 PM, Igor Mammedov wrote:=20=20
>> >>>
>> >>> Sometimes it's necessary to execute a test that depends on KVM,
>> >>> however qtest is not aware if tested QEMU binary supports KVM
>> >>> on the host it the test is executed.=20=20=20=20
>> >>
>> >> Hello,
>> >>
>> >> It seems to me that we are constantly re-implementing the same featur=
e with slight variations?
>> >>
>> >> Didn't we have a generic series to introduce qtest_has_accel() from P=
hilippe before?=20=20
>> > It's mentioned in cover letter (PS: part) and in [1/3] with rationale
>> > why this was posted.=20=20
>>=20
>> Thought it was separate, but now I see that it uses query-accel undernea=
th.
>>=20
>> Seems strange to add another check to do the same thing, it may point to=
 qtest_has_accel() needing some update?
>> You mention it is time consuming to use qtest_has_accel(), have you meas=
ured an important overhead?
>> With qtest_has_accel() not even being committed yet, is it already neces=
sary to work around it because it's too slow?=20
>
> Tests are already take a lot of time as is, so I'd try to avoid slowing
> them down.
>
> proposed qtest_has_accel() requires spawning QEMU to probe, which is slow.
> Worst case would be:
>  =3D qemu startup time * number of checks * number of targets
>
> It's fine to run occasionally, I can take a coffee break while tests run.
> But put it in context of CI and it multiplies by the number of push reque=
sts
> and starts to eat not only time but also limited CI resources.
>
> In current form qtest_has_accel() is only marginally better functionality
> wise, as it reports all built in accelerators while qtest_has_kvm() accou=
nts
> only for KVM.
>
> qtest_has_kvm() is collecting info about built-in accelerators at
> configure/build time and that probably could be extended to other
> accelerators (not a thing that I'm interested in at the moment).
> So it could be extended to support the same accelerators
> as currently proposed qtest_has_accel().

One minor downside is this forever ties the tests to the build. I have
spoken with people before about the idea of separating the test
artefacts from the build so they can be used either as a) cached test
objects or b) other testing environments, for example verifying the
kernel has not regressed. However we don't do either of those things at
the moment so it's not a major concern.

If the worry is about extending test times by having an extra round trip
of a spawn and query step for every test could we not consider caching
the information somewhere? Really any given binary should only need to
be queried once per run, not per test.

>
> Given a less expensive approach exists, the qtest_has_accel()
> in its current form might be not justifiable.=20
>
>=20=20=20=20
>> >> Does this series work with --disable-kvm builds? (TCG-only builds?)=
=20=20
>> > I'll test. But on the first glance it should work without issues.
>> > (i.e. kvm only tests will be skipped).
>> >=20=20=20
>> >>
>> >> Thanks,
>> >>
>> >> CLaudio
>> >>
>> >>=20=20
>> >>>
>> >>> For an example:
>> >>>  test q35 machine with intel_iommu
>> >>>  This test will run only is KVM is available and fail
>> >>>  to start QEMU if it fallsback to TCG, thus failing whole test.
>> >>>  So if test is executed in VM where nested KVM is not enabled
>> >>>  or on other than x86 host, it will break 'make check-qtest'
>> >>>
>> >>> Series adds a lightweight qtest_has_kvm() check, which abuses
>> >>> build system and should help to avoid running KVM only tests
>> >>> on hosts that do not support it.
>> >>>
>> >>> PS:
>> >>> there is an alternative 'query-accels' QMP command proposal
>> >>> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020=
.894589-3-philmd@redhat.com/
>> >>> which I think is more robust compared to qtest_has_kvm() and
>> >>> could be extended to take into account machine type.
>> >>> But it's more complex and what I dislike about it most,
>> >>> it requires execution of 'probing' QEMU instance to find
>> >>> execute 'query-accels' QMP command, which is rather resource
>> >>> consuming. So I'd use query-accels approach only when it's
>> >>> the only possible option to minimize load on CI systems.
>> >>>
>> >>> Igor Mammedov (2):
>> >>>   tests: acpi: q35: test for x2APIC entries in SRAT
>> >>>   tests: acpi: update expected tables blobs
>> >>>
>> >>> root (1):
>> >>>   tests: qtest: add qtest_has_kvm() to check if tested bynary suppor=
ts
>> >>>     KVM
>> >>>
>> >>>  tests/qtest/libqos/libqtest.h    |   7 +++++++
>> >>>  meson.build                      |   1 +
>> >>>  tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
>> >>>  tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
>> >>>  tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
>> >>>  tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
>> >>>  tests/qtest/bios-tables-test.c   |  10 +++++++---
>> >>>  tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
>> >>>  8 files changed, 35 insertions(+), 3 deletions(-)
>> >>>  create mode 100644 tests/data/acpi/q35/APIC.numamem
>> >>>  create mode 100644 tests/data/acpi/q35/FACP.numamem
>> >>>=20=20=20=20=20
>> >>=20=20
>> >=20=20=20
>>=20


--=20
Alex Benn=C3=A9e

