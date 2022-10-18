Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CE603034
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:52:46 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okotY-0001gM-3Z
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okoYu-00025Y-Tm
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:31:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okoYf-0000Dm-0k
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:31:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id bv10so24139709wrb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkTdLiTG8Yh5zk4PMMLgsoKUE8eGc9iz7oUFCVl4q1k=;
 b=oqkOeZvXnACZx4njyq4xwT2j/lGkax6ZX7jDtvzAZamyKXzCdqu+NNNpMMEzjwHdaQ
 KOQkVevgEW3q5Huv6Pkn73c8wr50HRLiuwEnOZI/IQB7G/HykBNupQOvZlYNi4RMHrfN
 fTO0RFAp9suvEqcu6kR7hEqvfh9oMIGmkATCkZh5Y5glQqjduxIHBdFx36BaKkwbhVCo
 Uegn/d8iw5PkLCaU2UTg4quJ7RSgVmPN56w9T9B2KOrawrn+coJFYtHZzUGZbBpGIp0s
 VmjS8pbEDHyozTFjv80WTy3FBQNz7kHZP3BwlJHMnn3LgAy2JeA9WA12NSL92guGlMl7
 KrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qkTdLiTG8Yh5zk4PMMLgsoKUE8eGc9iz7oUFCVl4q1k=;
 b=hjURuzYbJ6T7ulV5/o2OfXTuDWqAbz8yoaQwWlG6Y/+UFMWX0Y++eQUKwxagyLmV+p
 //wi1LQhVGRDb2VUhZR7NkCcYWuKdgjcE/sWgTIfJ3VRQnSflM4sC4dv5J3uG0O25PwC
 C22DOH4Xk5mzU4l8J61u8fbYwn2AAeJXL36109cgZu9g0v0wlncTCwVe3yEn5dUUb+70
 BjJ4EE8RfJabLO56XjsDpa1NDZ8afMm1aWKTIVfxhQUmo09XtP3MZ0HfaPavNpv4i7Gj
 8gMOw1LDnd+AVP0xN2ZePgdHZvb/qPrluLTkRRivNFy6Ogtskp+mq5lCKGJ7SrOEDnLo
 L8JQ==
X-Gm-Message-State: ACrzQf0or4RAWibmkwObhrkcLSYTNLh4yfBdZPFYFKhLz6w3TPH1PDJN
 OW7qjBUMgsxAGJi41yBI/DQ8fQ==
X-Google-Smtp-Source: AMsMyM7XT75p4ZNmqigk96J037AX5f5qoZmAlLKaiAz04L1BHxgdfmkJCsB7lhCzHp9AEbnVcnYYfg==
X-Received: by 2002:adf:e792:0:b0:22e:313d:f590 with SMTP id
 n18-20020adfe792000000b0022e313df590mr2185020wrm.101.1666107067071; 
 Tue, 18 Oct 2022 08:31:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c489400b003c6c2ff7f25sm13115288wmp.15.2022.10.18.08.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:31:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B91D81FFB7;
 Tue, 18 Oct 2022 16:31:05 +0100 (BST)
References: <20221014173508.222823-1-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, John Snow
 <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v4 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Tue, 18 Oct 2022 16:30:26 +0100
In-reply-to: <20221014173508.222823-1-ani@anisinha.ca>
Message-ID: <875yghcfnq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> Please see the README file in patch 9 for more details.
> Sample runs are as follows:
>
> Passed tests:
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smb=
ios_bits
> JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-e95c=
741/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PAS=
S (33.08 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 39.18 s

Hmm something went wrong:

  =E2=9E=9C  ./tests/venv/bin/avocado run -t acpi tests/avocado
  Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smb=
ios_bits
  JOB ID     : 08b6d26bf52a22ccbe1908b14d5b7b27f76ad7fa
  JOB LOG    : /home/alex/avocado/job-results/job-2022-10-18T16.29-08b6d26/=
job.log
   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: ERR=
OR: Error while generating the bits iso. Pass V=3D1 in the environment to g=
et more details. Command '[
  '/var/tmp/acpi-bits-yy4mfxrz.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue',=
 '-o', '/var/tmp/acpi-bits-yy4mfxrz.tmp/bits-2020.iso', '/var/tmp/acpi-bits=
-yy4mfxrz.t... (7.21 s)
  RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
  JOB TIME   : 7.79 s

have we added another binary dependency?

>
>
> $ ./tests/venv/bin/avocado run ./tests/avocado/acpi-bits.py=20
> Fetching asset from ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_s=
mbios_bits
> JOB ID     : c6e588594bceb2c5fdbdf45095559c58e4030f9c
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.13-c6e5=
885/job.log
>  (1/1) ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: P=
ASS (32.29 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 39.27 s
>
> When PSS tests are enabled:
>
> $ git diff
> diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avoc=
ado/acpi-bits/bits-tests/testacpi.py2
> index f818a9cce6..18dc818d62 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> @@ -40,8 +40,8 @@ import time
>=20=20
>  def register_tests():
>      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Proc=
essor objects", test_mat, submenu=3D"ACPI Tests")
> -#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", te=
st_pss, submenu=3D"ACPI Tests")
> -#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates=
, submenu=3D"ACPI Tests")
> +    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", tes=
t_pss, submenu=3D"ACPI Tests")
> +    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates,=
 submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI DSDT (Differentiated System Description Tab=
le)", test_dsdt, submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_=
facp, submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", t=
est_hpet, submenu=3D"ACPI Tests")
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smb=
ios_bits
> JOB ID     : 16a8b8c7f8dc87c4b84f8a2f95135bb63464a71e
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T22.43-16a8=
b8c/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: FAI=
L: '1' !=3D '0'\n- 1\n+ 0\n : Some bits tests seems to have failed. Please =
check the test logs for more info. (33.01 s)
> RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 39.17 s
>
>
> Changelog:
> v4:
>   - renamed the bits test files as .py2.
>   - fixed a bug with missing log file parsing. dump bits logs automatical=
ly
>     for test failures (no need to re-run with V=3D1).
>   - fixed issues with README file and enhanced it.
>   - cosmetic comment updates.
> v3:
>   - converted the existing test to avocado tests as per the popular
>     recommendation. Added appropriate tags.
>   - artifact download URL modified based on gitlab-CI URL.
>
>   For biosbits repo:
>   - moved to a gitlab repo with me being the maintainer.
>   - added .gitlab-ci.yml file to generate the artifacts.
> v2:
>  - a new class of python based tests introduced that is separate from avo=
cado
>    tests or qtests. Can be run by using "make check-pytest".
>  - acpi biosbits tests are the first tests to use pytest environment.
>  - bios bits tests now download the bits binary archives from a remote
>    repository if they are not found locally. The test skips if download
>    fails.
>  - A new environment variable is introduced that can be passed by the tes=
ter
>    to specify the location of the bits archives locally. test skips if the
>    bits binaries are not found in that location.
>  - if pip install of python module fails for whatever reaoson, the test s=
kips.
>  - misc code fixes including spell check of the README doc. README has be=
en
>    updated as well.
>  - addition of SPDX license headers to bits test files.
>  - update MAINTAINERS to reflect the new pytest test class.
>
> For biosbits repo:
>  - added Dockerfile and build script. Made bios bits build on gcc 11.
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifac=
ts.sh
>    The build script generates the zip archive and tarball used by the tes=
t.
>
> v1: initial patchset. uses qtest to implement the bios bits tests.
>
> Cc: Qemu Devel <qemu-devel@nongnu.org>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
>
>
> Ani Sinha (10):
>   acpi/tests/avocado/bits: initial commit of test scripts that are run
>     by biosbits
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     tests
>   acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
>     biosbits
>   acpi/tests/avocado/bits: add smilatency test suite from bits in order
>     to disable it
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     smilatency tests
>   acpi/tests/avocado/bits: disable smilatency test since it does not
>     pass everytime
>   acpi/tests/avocado/bits: add biosbits config file for running bios
>     tests
>   acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
>     biosbits
>   acpi/tests/avocado/bits: add a README file to describe the test
>   MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
>     tests
>
>  MAINTAINERS                                   |    6 +
>  tests/avocado/acpi-bits.py                    |  353 +++
>  tests/avocado/acpi-bits/README                |  128 +
>  .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
>  tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
>  .../acpi-bits/bits-tests/smilatency.py2       |  107 +
>  .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
>  .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
>  8 files changed, 3420 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>  create mode 100644 tests/avocado/acpi-bits/README
>  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2


--=20
Alex Benn=C3=A9e

