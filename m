Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89E604BF1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:44:46 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBFM-0001Tk-R7
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB5Y-0006qp-Fc
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:34:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB5K-0004nq-CN
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:34:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b4so29706024wrs.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jiIFdWVa+HecHrH8PlVv+l1jvYrHEaQya/BO8u+8pPI=;
 b=qHWb+289/c6e75DgXAu8zn/7guZhN/aPT5L1YCmpcPIsHWssZiNT/kFcdQ4z6SSuMa
 HThFDn3y4qF1DGZEbNAN8U/EKC8/fCsQWNXjL0XHyvNGPb6+/j0IJlabynYkEVRmEH3U
 REwPAtZQiQAHH97aBNd8BqOJTvjZ52HqyLh3iqoTOcku7fkF81NnpZPZZaidOnZWEVk3
 GrR8lzrcl2K4xJzTLYNQ/+wd7p/fvfOrj+V3UdYVdUyA57wpLCts2LgkvsqVAvLYqkd2
 PUMIYdmPmHrG6SuodWO7oKQAV3QaRm/U0csVQJhNFR3mZZclRyZhveVenQL/kTr6+P0L
 JBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jiIFdWVa+HecHrH8PlVv+l1jvYrHEaQya/BO8u+8pPI=;
 b=UZdFyod9hlhg496OmgF4+QZpJHjm9OJjc/Ao8+hexX+L4dZnKcOmNVzyLMfD6oJkGP
 ptpc1F1vBldU0hQ5UhoRm1gH/ZEDRo8LUQAeHGh5+YTH2mX0LIqrfnjFH1oQuIP2kxQF
 momkHr2OWNUF77y79AlPXvBe3wTrh6p5dj8lo3VVsmVSHM4QYM8jbV7XszCy/sINvKSo
 PR68mgyWxuXO99m2T6Q6TIzce03ox0Ih9J43XA83Ynlvla8wLp8cx5vnz/Tixz2PZro2
 FSUtxiQRLkgvcDVjVEsvKOBH4MXiNTZwNFGhDJAjOn+LoLAMU6f6CoNvtliqNNycn8XB
 xhMQ==
X-Gm-Message-State: ACrzQf2wfoFw9NPrmjUE/eHKQykm1YuGzizm9t7+YoeN/ahFPFK/fxWK
 zmuA1Q3PIT9WA3zTFKI4TtK+wA==
X-Google-Smtp-Source: AMsMyM5TnH3vTFF3J4lc2Md4IXbC64xDziCRcbrXtqvMFpslWbk/1I0ldp1afJp5eC74kHl6VnM7Ag==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr5466876wre.237.1666193660629; 
 Wed, 19 Oct 2022 08:34:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 dn3-20020a05600c654300b003a5f3f5883dsm259006wmb.17.2022.10.19.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:34:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2392D1FFB7;
 Wed, 19 Oct 2022 16:34:19 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-10-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/10] acpi/tests/avocado/bits: add a README file to
 describe the test
Date: Wed, 19 Oct 2022 16:33:43 +0100
In-reply-to: <20221019025828.683113-10-ani@anisinha.ca>
Message-ID: <87tu3zakuc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Ani Sinha <ani@anisinha.ca> writes:

> Add a README file that describes the purpose of the various test files an=
d gives
> guidance to developers on where and how to make changes.
>
> Cc: Daniel P. Berrange" <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits/README | 133 +++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits/README
>
> diff --git a/tests/avocado/acpi-bits/README b/tests/avocado/acpi-bits/REA=
DME
> new file mode 100644
> index 0000000000..4945dfc1f2
> --- /dev/null
> +++ b/tests/avocado/acpi-bits/README
> @@ -0,0 +1,133 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +ACPI/SMBIOS AVOCADO TESTS USING BIOSBITS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Biosbits is a software written by Josh Triplett that can be downloaded
> +from https://biosbits.org/. The github codebase can be found here:
> +https://github.com/biosbits/bits/tree/master. It is a software that exec=
utes
> +the bios components such as acpi and smbios tables directly through acpi=
ca
> +bios interpreter (a freely available C based library written by Intel,
> +downloadable from https://acpica.org/ and is included with biosbits) wit=
hout an
> +operating system getting involved in between.
> +There are several advantages to directly testing the bios in a real phys=
ical
> +machine or VM as opposed to indirectly discovering bios issues through t=
he
> +operating system. For one thing, the OSes tend to hide bios problems fro=
m the
> +end user. The other is that we have more control of what we wanted to te=
st
> +and how by directly using acpica interpreter on top of the bios on a run=
ning
> +system. More details on the inspiration for developing biosbits and its =
real
> +life uses can be found in (a) and (b).
> +This directory contains tests written in python using avocado framework =
that
> +exercizes the QEMU bios components using biosbits and reports test failu=
res.
> +For QEMU, we maintain a fork of bios bits in gitlab along with all the
> +dependent submodules:
> +https://gitlab.com/qemu-project/biosbits-bits
> +This fork contains numerous fixes, a newer acpica and changes specific to
> +running this avocado QEMU tests using bits. The author of this document
> +is the sole maintainer of the QEMU fork of bios bits repo.
> +
> +Under the directory tests/avocado/, acpi-bits.py is a QEMU avocado test =
that
> +drives all this.
> +
> +A brief description of the various test files follows.
> +
> +Under tests/avocado/ as the root we have:
> +
> +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits
> +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smilatency.py2
> +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> +=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> +
> +tests/avocado:
> + - acpi-bits.py: This is the main python avocado test script that genera=
tes a
> +   biosbits iso. It then spawns a QEMU VM with it, collects the log and =
reports
> +   test failures. This is the script one would be interested in if they =
wanted
> +   to add or change some component of the log parsing, add a new command=
 line
> +   to alter how QEMU is spawned etc. Test writers typically would not ne=
ed to
> +   modify this script unless they wanted to enhance or change the log pa=
rsing
> +   for their tests. Following environment variables are used in this tes=
t:
> +     - V=3D1 : This enables verbose mode for the test. It dumps the enti=
re log
> +       from bios bits and also more details in case failure happens. It =
is
> +       useful for debugging the test failures or tests themselves.
> +
> +   In order to run this test, please perform the following steps from th=
e QEMU
> +   build directory:
> +
> +   $ make check-venv (needed only the first time to create the venv)
> +   $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> +
> +   The above will run all acpi avocado tests including this one.
> +   In order to run the individual tests, perform the following:
> +
> +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
> +
> +   The above will produce output in tap format. You can omit "--tap -" i=
n the
> +   end and it will produce output like the following:
> +
> +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> +     Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_ac=
pi_smbios_bits
> +     JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
> +     JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.5=
8-eab2257/job.log
> +     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits=
: PASS (33.09 s)
> +     RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUP=
T 0 | CANCEL 0
> +     JOB TIME   : 39.22 s
> +
> +   You can inspect the log file for more information about the run or in=
 order
> +   to diagnoze issues. If you pass V=3D1 in the environment, more diagno=
stic logs
> +   would be found in the test log.
> +
> +tests/avocado/acpi-bits:
> + - README: This text file.
> +
> +tests/avocado/acpi-bits/bits-config:
> +   This location contains biosbits config files that determine how the s=
oftware
> +   runs the tests.
> + - bits-config.txt: this is the biosbits config file that determines wha=
t tests
> +   or actions are performed by bits. The description of the config optio=
ns are
> +   provided in the file itself.
> +
> +tests/avocado/acpi-bits/bits-tests:
> +   This directory contains biosbits python based tests that are run from=
 within
> +   the biosbits environment in the spawned VM. New additions of test cas=
es can
> +   be made in the appropriate test file. For example, new acpi tests can=
 go
> +   into testacpi.py2 and one would call testsuite.add_test() to register=
 the new
> +   test so that it gets executed as a part of the ACPI tests.
> +   It might be occasionally necessary to disable some subtests or add a =
new
> +   test that belongs to a test suite not already present in this directo=
ry. To
> +   do this, please clone the bits source from
> +   https://gitlab.com/qemu-project/biosbits-bits/-/tree/qemu-bits.
> +   Note that this is the "qemu-bits" branch and not the "bits" branch of=
 the
> +   repository. "qemu-bits" is the branch where we have made all the QEMU
> +   specific enhancements and we must use the source from this branch onl=
y.
> +   Copy the test suite/script that needs modification (addition of new t=
ests
> +   or disabling them) from python directory into this directory. For
> +   example, in order to change cpuid related tests, copy the following
> +   file into this directory and rename it with .py2 extension:
> +   https://gitlab.com/qemu-project/biosbits-bits/-/blob/qemu-bits/python=
/testcpuid.py
> +   Then make your additions and changes here. Hence, the steps are:
> +
> +   step (a): copy unmodified test script to this directory from bits sou=
rce.
> +   step (b): perform modifications to the test.
> +   Commit (a) and (b) should go under separate commits so that the origi=
nal
> +   test script and the changes we have made are separated and clear.
> +
> +   The test framework will then use your modified test script to run the=
 test.
> +   No further changes would be needed. Please check the logs to make sur=
e that
> +   appropriate changes have taken effect.
> +
> +   The tests have an extension .py2 in order to indicate that
> +   (a) they are python2.7 based scripts and not python 3 scripts.
> +   (b) they are run from within the bios bits VM and is not subjected to=
 QEMU
> +       build/test python script maintainance and dependency resolutions.
> +   (c) They need not be loaded by avocado framework when running tests.
> +
> +Author: Ani Sinha <ani@anisinha.ca>
> +
> +References:
> +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867=
/original/bits.pdf
> +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg

This might me better as an RST under docs/devel so it can be included in
the growing developer guide.

--=20
Alex Benn=C3=A9e

