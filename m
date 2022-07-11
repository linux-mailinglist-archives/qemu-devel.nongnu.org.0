Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DAB56FBE9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:36:53 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApqW-0000QK-9m
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oApoQ-0006EJ-3s
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oApoM-0004zq-Np
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eKxkEYIvlnSupJ4OR2aX+aKWQ3V4zBL6U/37QrvFcx8=;
 b=P6vOkGG3SyDzAC5G+GZear6Jmc5Y9q+tI9yX8eqZwdcnMxNM/4SbCuZuAjsWO1Dbbj1lW4
 agK45VcgKZxvpiPUffheiIDMQGG6JqbskQYmLpGbD9vEjt6GA+e9d37xDJaIFr0H57sqQt
 e6XeNdyoiLYjYr1WJh3FrkfGFZTzOao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-TuklxRleMsSS03Q1bMDHGQ-1; Mon, 11 Jul 2022 05:34:31 -0400
X-MC-Unique: TuklxRleMsSS03Q1bMDHGQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v67-20020a1cac46000000b003a2be9fa09cso2505898wme.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eKxkEYIvlnSupJ4OR2aX+aKWQ3V4zBL6U/37QrvFcx8=;
 b=Zhv2QLVG99jJT/b9b9szlpIoP2hgex39q+UOz4IWl3ft3WBGIusCxK7ZBOqNHkg5Od
 /Gn2XJF3HD89mRrtPlXBQRjmHEhkJKrEnXIEPZW4ORPBZ8wKBkyCjMs5d/bfEpH4Sg/N
 IsfdOZogHHJkBZgjNmSBJNw1qnM2lnPBM+ASr5Cl1QmBafkNJy8eMo+7b/lGoIsb+/HM
 EU8+fyrm0XdIFbf4j2/b84fgWxEjFvBOFZYm4H3AJQGX0tPDvf/sTzOu51FnLU1kHeo0
 EuJpbE6NvSs5izLQFGYyWzoY6j+vpHrmMVgsWA5mSTUGTgtoLv4XbNElXEYkRh25+1Gf
 a/Mw==
X-Gm-Message-State: AJIora97UTJx2mzWRA+qT93ZN3g4hfCDSYApeBO/a+v4uYBDMBegYEIQ
 8JZm126Y5XgL76axVXP74STpPP3fjgdNahnuVPuk0VvYzkyiZHcfisTNFiJkqS/ZCmIjBTz8h7w
 EBYJ+zEsJbHBS+D0=
X-Received: by 2002:a05:6000:1cc:b0:21d:a352:116b with SMTP id
 t12-20020a05600001cc00b0021da352116bmr5869103wrx.418.1657532070663; 
 Mon, 11 Jul 2022 02:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKLqDT6rdCHLZ/7vDnOC50dRYnwxEoBjd/RkkEpc+4r9wjbFtrxaotzfd4gvTXuopQnIAK4Q==
X-Received: by 2002:a05:6000:1cc:b0:21d:a352:116b with SMTP id
 t12-20020a05600001cc00b0021da352116bmr5869086wrx.418.1657532070455; 
 Mon, 11 Jul 2022 02:34:30 -0700 (PDT)
Received: from redhat.com ([2.52.154.68]) by smtp.gmail.com with ESMTPSA id
 u3-20020a5d6da3000000b0021d66cf9547sm6647941wrs.0.2022.07.11.02.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:34:30 -0700 (PDT)
Date: Mon, 11 Jul 2022 05:33:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 berrange@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <20220711044032-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> Changelog:
> v2:
>  - a new class of python based tests introduced that is separate from avocado
>    tests or qtests. Can be run by using "make check-pytest".
>  - acpi biosbits tests are the first tests to use pytest environment.
>  - bios bits tests now download the bits binary archives from a remote
>    repository if they are not found locally. The test skips if download
>    fails.
>  - A new environment variable is introduced that can be passed by the tester
>    to specify the location of the bits archives locally. test skips if the
>    bits binaries are not found in that location.
>  - if pip install of python module fails for whatever reaoson, the test skips.
>  - misc code fixes including spell check of the README doc. README has been
>    updated as well.
>  - addition of SPDX license headers to bits test files.
>  - update MAINTAINERS to reflect the new pytest test class.
> 
> For biosbits repo:
>  - added Dockerfile and build script. Made bios bits build on gcc 11.
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
>    The build script generates the zip archive and tarball used by the test.

So far so good, I think it's ok for a start. It's probably a good idea
to host the source on qemu.org. Peter - any objection to this?


> v1: initial patchset. uses qtest to implement the bios bits tests.
> 
> Ani Sinha (11):
>   acpi/tests/bits: initial commit of test scripts that are run by
>     biosbits
>   acpi/tests/bits: add SPDX license identifiers for bios bits tests
>   acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
>   acpi/tests/bits: add smilatency test suite from bits in order to
>     disable it
>   acpi/tests/bits: add SPDX license identifiers for bios bits smilatency
>     tests
>   acpi/tests/bits: disable smilatency test since it does not pass
>     everytime
>   acpi/tests/bits: add python test that exercizes QEMU bios tables using
>     biosbits
>   acpi/tests/bits: add biosbits config file for running bios tests
>   acpi/tests/bits: add a README file describing bits pytests
>   pytest: add pytest to the meson build system
>   MAINTAINERS: add myself as the maintainer for acpi biosbits pytests
> 
>  MAINTAINERS                                   |    5 +
>  tests/Makefile.include                        |    4 +-
>  tests/meson.build                             |    1 +
>  tests/pytest/acpi-bits/README                 |  129 +
>  tests/pytest/acpi-bits/acpi-bits-test-venv.sh |   59 +
>  tests/pytest/acpi-bits/acpi-bits-test.py      |  382 +++
>  .../pytest/acpi-bits/bits-config/bits-cfg.txt |   18 +
>  .../pytest/acpi-bits/bits-config/meson.build  |   11 +
>  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
>  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2432 +++++++++++++++++
>  .../pytest/acpi-bits/bits-tests/smilatency.py |  105 +
>  tests/pytest/acpi-bits/bits-tests/testacpi.py |  285 ++
>  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   85 +
>  tests/pytest/acpi-bits/meson.build            |   33 +
>  tests/pytest/acpi-bits/requirements.txt       |    1 +
>  tests/pytest/meson.build                      |   49 +
>  16 files changed, 3609 insertions(+), 1 deletion(-)
>  create mode 100644 tests/pytest/acpi-bits/README
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
>  create mode 100644 tests/pytest/acpi-bits/bits-config/bits-cfg.txt
>  create mode 100644 tests/pytest/acpi-bits/bits-config/meson.build
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/smilatency.py
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
>  create mode 100644 tests/pytest/acpi-bits/meson.build
>  create mode 100644 tests/pytest/acpi-bits/requirements.txt
>  create mode 100644 tests/pytest/meson.build
> 
> -- 
> 2.25.1


