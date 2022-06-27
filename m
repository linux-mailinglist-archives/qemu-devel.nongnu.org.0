Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0655BC48
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:28:23 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xDR-0001I0-VN
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xBe-0008IT-Vo
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xBa-0005jI-WF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656368785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqzq17xhCjqPq5675g9Tj51gHCkQMNPyEp3pkKrzFyY=;
 b=NXC12pay5Ctvb4zHWYCHjwZ40vggc+jMRaUNPKwdrQsQqfwlr0OFNb21hmiQASsezHNO7O
 XmHoXkeq7fBVbb1ZkJ32CnZBTn6WHKFdEXsjPblEQ/zm8U2ULqD5Wpk8lumJiSuZ//PbGz
 vtUcpCLvDJY2nMU6xzMiXgKi1M/A8HU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-ZGkaCMw8Nrit61o8ZiQx9g-1; Mon, 27 Jun 2022 18:26:23 -0400
X-MC-Unique: ZGkaCMw8Nrit61o8ZiQx9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so7969365wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lqzq17xhCjqPq5675g9Tj51gHCkQMNPyEp3pkKrzFyY=;
 b=z94c1binxIJB0tb8NoR/Dql6KSnySCBAULl0o0+fJTSz6l6190pSYUMn1V3LGek49M
 lNV4bzvnVXUpnYuEHmcUllQRU+ds9IrPLXEFHYqsPEz+hNexJXhF70N/SCiv0MsY4MAM
 gLmTOvubFBsAyVDMbUa5JMoajIoMWaUP/6LtHgfQ9d6E0FZE9ATJHTH47Lze+jcctviM
 IohGZg++WA6v87IbcTfPYtWgCxfOmjEt5K0Ya5oTesLWSv0wixjMnDwXF6HMe01hB7MJ
 kC1V8qm49E2zGLPienFlEDgdvdkeGAZT3MT99f0Goii185duVHA28nZdnMoaOzQkxEEK
 bb/Q==
X-Gm-Message-State: AJIora8SGEG6QjnDR7JF/JxlIkWT6Igq9U97VEQx85v3B7E1j3kR6ACz
 13xKvGM08R1T6oo5/LFkEBE5bubLke9Zghv4gIQJExTC1O9zzZ3OsVJga9dyxjjTMliWvzXTwk/
 q5fH7HZCquuJZlu0=
X-Received: by 2002:a5d:584e:0:b0:21c:ea0c:3746 with SMTP id
 i14-20020a5d584e000000b0021cea0c3746mr6257702wrf.199.1656368782208; 
 Mon, 27 Jun 2022 15:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYeNfWiVSVLq6PvMAgSAXSBs92vAWIZwMQhqBKBLgE2JyIHbJi+IJethwMtMZQNNH0y6/gag==
X-Received: by 2002:a5d:584e:0:b0:21c:ea0c:3746 with SMTP id
 i14-20020a5d584e000000b0021cea0c3746mr6257681wrf.199.1656368781839; 
 Mon, 27 Jun 2022 15:26:21 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b00212a83b93f3sm11699161wrs.88.2022.06.27.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 15:26:20 -0700 (PDT)
Date: Mon, 27 Jun 2022 18:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
Message-ID: <20220627182027-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627072856.1529357-12-ani@anisinha.ca>
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

On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> The README file is added describing the directory structure and the purpose
> of every file it contains. It also describes how to add new tests, make changes
> to existing tests or bits config files or regenerate the bits software.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 tests/qtest/acpi-bits/README
> 
> diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bits/README
> new file mode 100644
> index 0000000000..97b15f1665
> --- /dev/null
> +++ b/tests/qtest/acpi-bits/README
> @@ -0,0 +1,168 @@
> +=============================================================================
> +ACPI/SMBIOS QTESTS USING BIOSBITS
> +=============================================================================
> +
> +Biosbits is a software written by Josh Triplett that can be downloaded by
> +visiting https://biosbits.org/. The github codebase can be found here:
> +https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> +the bios components such as acpi and smbios tables directly through acpica
> +bios interpreter (a freely available C based library written by Intel,
> +downloadable from https://acpica.org/ and is included with biosbits) without an
> +operating system getting involved in between.
> +There are several advantages to directly testing the bios in a real physical
> +machine or VM as opposed to indirectly discovering bios issues through the
> +operating system. For one thing, the OSes tend to hide bios problems from the
> +end user. The other is that we have more control of what we wanted to test
> +and how by directly using acpica interpreter on top of the bios on a running
> +system. More details on the inspiration for developing biosbits and its real
> +life uses can be found in (a) and (b).
> +This directory contains QEMU qtests written in python that exercizes the QEMU
> +bios components using biosbits and reports test failures.
> +
> +These tests use python virtual environment. In debian/ubuntu system, the tests
> +would require python3.8-venv and python3-pip packages to be installed.

Why do we mess with venv and pip? Certainly possible but
what's wrong with using distro provided packages?

> +
> +A brief description of the contents of this directory follows:
> +
> +├── acpi-bits-test.py
> +├── acpi-bits-test-venv.sh
> +├── bits-config
> +│   ├── bits-cfg.txt
> +│   └── meson.build
> +├── bits-tests
> +│   ├── meson.build
> +│   ├── smbios.py
> +│   ├── smilatency.py
> +│   ├── testacpi.py
> +│   └── testcpuid.py
> +├── meson.build
> +├── prebuilt
> +│   ├── bits-2095-grub.tar.gz
> +│   ├── bits-2095.zip
> +│   └── meson.build
> +├── README
> +└── requirements.txt
> +
> +acpi-bits:
> + - acpi-bits-test-venv.sh: This is a shell script that sets up the virtual
> +   environment necessary for the actual python test script to run. Amongst
> +   other things, it makes sure that QEMU python library is available within
> +   that venv so that QEMU machines can be forked. QEMU python library can be
> +   found within python/ directory in QEMU source.
> +   After setting up the virtual environment, it runs the python test script
> +   from within that environment.
> +   If you want to enable verbose mode only for bits test and run make check,
> +   one trick is to add V=1 before the call to execute the python script in
> +   this file.
> + - acpi-bits-test.py: This is the main python test script that generates a
> +   biosbits iso. It then spawns a QEMU VM with it, collects the logs and reports
> +   test failures. This is the script one would be interested in if they wanted
> +   to add or change some component of the log parsing, add a new commandline to
> +   how QEMU is spawned etc. Test writers typically would not need to modify
> +   this script unless they wanted to enhance or change the log parsing for
> +   their tests.
> + - requirements.txt: This text file contains the dependent python libraries
> +   needed for the tests to run. If a new dependent library is needed, it would
> +   be added here as a new entry and then acpi-bits-test-venv.sh would install
> +   it when setting up the python virtual environment using pip.
> + - README: This text file.
> +
> +acpi-bits/bits-config:
> +   This location contains biosbits config files that determine how the software
> +   runs the tests.
> + - bits-config.txt: this is the biosbits config file that determines what tests
> +   or actions are performed by bits. The description of the config options are
> +   provided in the file itself.
> +
> +acpi-bits/prebuilt:
> +   This location contains prebuilt biosbits binaries that are used to generate
> +   the bits iso file for testing.
> + - bits-2095.zip: The contents from this zip archive are the main contents of
> +    the iso file that are used for testing. This binary zip archive also
> +    contains the full source of the bits software including the full text of
> +    the license agreement listed here:
> +    https://github.com/biosbits/bits/blob/master/COPYING
> +    The source tarball can be found in this location in the zip file:
> +    boot/src/bits-2095.tar.gz
> +    The additional changes beyond those that are present in the official
> +    biosbits github repository can be found here:
> +    https://github.com/ani-sinha/bits/tree/bits-qemu-logging
> +
> +    Basically these changes can be categorized into the following:
> +    (a) changes to make sure biosbits builds with the latest gcc compiler
> +    (gcc 9.4).
> +    (b) upgrade of acpica to the latest version (march 2022).
> +    (c) send bits logs to the debug IO port at addresss 0x403 so that isa
> +    debugcon can be used to collect the logs.
> +    (d) send a gub halt command to shutdown the VM once all the tests have been
> +    executed.
> +
> +    This zip file is automatically generated by the bits build system. It can
> +    be found in the bits build directory and it is suffixed by the bits build
> +    number.
> +    Normally, there is no need to make any alteration to this zip archive
> +    unless one wanted to change the bits software itself (for example to add
> +    a new config option or change actions of existing options or change the
> +    debug IO port etc). When such changes are made and a new biosbits software
> +    is needed to be generated, please refresh this zip archive as well as the
> +    grub tarball at the same time. Tests will break if changes are made to bits
> +    that are incompatible with existing behavior. So care must be taken to make
> +    sure that the change is compatible with existing bits software as much as
> +    possible. When a new config option is introduced for example, bits must
> +    be upadated here first before introducing the new config option through
> +    a later commit.

I don't think playing with source tarballs is a reasonable work environment.
Let's use submodules just like e.g. firmware does?



> + - prebuilt/bits-2095-grub.tar.gz: This tarbball contains bits generated grub
> +    scripts and modules to the prebuilt directory. These prebuilt grub
> +    artifacts are required in order to generate a bootable bits iso file that
> +    can run tests.
> +    In order to generate this tar archive, please put the following two
> +    directories that can be found in the bits build directory in a single
> +    tar archive file named as bits-<n>-grub.tar.gz where n is the version of
> +    bits that generated the archive:
> +
> +    grub-inst-x86_64-efi
> +    grub-inst
> +
> +    This version should be the same as the version number of bits that generated
> +    bits-<n>.zip file. In other words, the two files must be in sync and should
> +    come from the same build of biosbits of the same version. Things may still
> +    work if they come from different versions but mixing version numbers are
> +    not recommended.
> +    There is normally no need to regenerate this archive unless some fixes or
> +    changes have gone into the grub that are part of biosbits.
> +
> +acpi-bits/bits-tests:
> +   This directory contains biosbits python based tests that are run from within
> +   the biosbits environment in the spawned VM. New additions of test cases can
> +   be made in the appropriate test file. For example, new acpi tests can go
> +   into testacpi.py and one would call testsuite.add_test() to register the new
> +   test so that it gets executed as a part of the ACPI tests.
> +   It might be occassionally necessary to disable some subtests or add a new
> +   test that belongs to a test suite not already present in this directory. To
> +   do this, please extract the bits source from the zip file mentioned above.
> +   Copy the test suite/script that needs modification (addition of new tests
> +   or disabling them) from boot/python location of the extracted directory
> +   into this directory.
> +
> +   step (a): copy unmodified test script to this directory.
> +   step (b): update meson.build and add this file to the list.
> +   Commit (a) and (b) together in the same commit.
> +
> +   step (c): perform modifications to the test.
> +   Commit (c) in a separate commit.
> +
> +   The test framework will then use your modified test script to run the test.
> +   No further changes would be needed. Please check the logs to make sure that
> +   appropriate changes have taken effect.
> +
> +meson.build files makes sure that the bits qtests are appropriately integrated
> +into the QEMU qtest framework and are run with "make check-qtest".
> +Currently, the bits test is configured to run only for x86_64 architectures. Bits
> +has been built only for this architecture.
> +
> +
> +Author: Ani Sinha <ani@anisinha.ca>
> +
> +References:
> +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> +(b) https://www.youtube.com/watch?v=36QIepyUuhg
> -- 
> 2.25.1


