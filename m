Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1D55BF2A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:36:16 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65lf-0007y0-VQ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o653h-0000ju-8l
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o653a-0006tL-L4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656399041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9crZ1SllLNZ1E+dkdR881t7JUFZueG2Z9KZ4mmeNaA=;
 b=eEfYjcJI3rXB9mccdQSZm4cshu49qU2nqes87T0pF6eBlTP6iXVVaExYrU+4+50Y0NyL+9
 1taeTRwFX3RjXj36ztJsymFOXQtWqULtbgxsSEOO6CahJKzH9CSyyn8HmFISIWe6SZIpMb
 9N5tCLNHqeAMtTDhf2vKVQJOhSCfHGo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-A4fGJIT_NxKGR0R4OzB1zQ-1; Tue, 28 Jun 2022 02:50:40 -0400
X-MC-Unique: A4fGJIT_NxKGR0R4OzB1zQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so8856792edd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 23:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p9crZ1SllLNZ1E+dkdR881t7JUFZueG2Z9KZ4mmeNaA=;
 b=60yn1IBWdfffjfhQwcZVDvOAcA/QRpUbm30UcBlLNHs5QrLiSLkAo2nnoJCx/fuUHe
 AzFbPfbC3GSS0SZumEUaDZvvSH6SkBSHktG2gqP4A6t28QkeK0q6D8DqO5EcGy5iISKC
 6MD7QgwvWtZfE+GrIQIG3WNR6KORr4uuHsDGpiK9VziK3UcA2UuYZ7vw+ZoG43bsCMdA
 Z68hiL2R3RZfHigEyO+k/VMkdhUBPNRsp0s1cLdiof/bVrpStuqx9syIvR0rHeR6ECt9
 AePPDtPwodcTksmTTDE3bus443aEMjeh7/Q+vAofp9nbxdo7yNck+E3hFyxlb4yDXTwm
 93fg==
X-Gm-Message-State: AJIora+AIFOprNXMzWvlGq3Foll5GjokBPWEg4tNEocctcKEXIW9BrBo
 VnhY9Ewi9WgkujLe9ddDv4EDtZEj38b58+QHlR2NSW7nPKPx/duGvC1LuKG09+77eny+UX1AuR4
 mZGKCJ5OhG1edGPM=
X-Received: by 2002:a05:6402:5188:b0:437:618c:c124 with SMTP id
 q8-20020a056402518800b00437618cc124mr21386567edd.233.1656399038153; 
 Mon, 27 Jun 2022 23:50:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uxaeKepdxOzPoKGZcN9yacdMRRQrf6TN1NztdF/rEOeKLjm2fbLq/mQWYKuYADkADcJYXSYw==
X-Received: by 2002:a05:6402:5188:b0:437:618c:c124 with SMTP id
 q8-20020a056402518800b00437618cc124mr21386536edd.233.1656399037758; 
 Mon, 27 Jun 2022 23:50:37 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05640214d300b00435bcb87591sm8913360edx.2.2022.06.27.23.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 23:50:37 -0700 (PDT)
Date: Tue, 28 Jun 2022 02:50:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
Message-ID: <20220628024810-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
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

On Tue, Jun 28, 2022 at 12:06:31PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 11:46:13AM +0530, Ani Sinha wrote:
> > > On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
> > > > > On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> > > > > > > The README file is added describing the directory structure and the purpose
> > > > > > > of every file it contains. It also describes how to add new tests, make changes
> > > > > > > to existing tests or bits config files or regenerate the bits software.
> > > > > > >
> > > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > > ---
> > > > > > >  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 168 insertions(+)
> > > > > > >  create mode 100644 tests/qtest/acpi-bits/README
> > > > > > >
> > > > > > > diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bits/README
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..97b15f1665
> > > > > > > --- /dev/null
> > > > > > > +++ b/tests/qtest/acpi-bits/README
> > > > > > > @@ -0,0 +1,168 @@
> > > > > > > +=============================================================================
> > > > > > > +ACPI/SMBIOS QTESTS USING BIOSBITS
> > > > > > > +=============================================================================
> > > > > > > +
> > > > > > > +Biosbits is a software written by Josh Triplett that can be downloaded by
> > > > > > > +visiting https://biosbits.org/. The github codebase can be found here:
> > > > > > > +https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> > > > > > > +the bios components such as acpi and smbios tables directly through acpica
> > > > > > > +bios interpreter (a freely available C based library written by Intel,
> > > > > > > +downloadable from https://acpica.org/ and is included with biosbits) without an
> > > > > > > +operating system getting involved in between.
> > > > > > > +There are several advantages to directly testing the bios in a real physical
> > > > > > > +machine or VM as opposed to indirectly discovering bios issues through the
> > > > > > > +operating system. For one thing, the OSes tend to hide bios problems from the
> > > > > > > +end user. The other is that we have more control of what we wanted to test
> > > > > > > +and how by directly using acpica interpreter on top of the bios on a running
> > > > > > > +system. More details on the inspiration for developing biosbits and its real
> > > > > > > +life uses can be found in (a) and (b).
> > > > > > > +This directory contains QEMU qtests written in python that exercizes the QEMU
> > > > > > > +bios components using biosbits and reports test failures.
> > > > > > > +
> > > > > > > +These tests use python virtual environment. In debian/ubuntu system, the tests
> > > > > > > +would require python3.8-venv and python3-pip packages to be installed.
> > > > > >
> > > > > > Why do we mess with venv and pip? Certainly possible but
> > > > > > what's wrong with using distro provided packages?
> > > > >
> > > > > There are two things:
> > > > > (a) We are already using pip and venv for our avocado based
> > > > > integration tests. Look for TESTS_VENV_DIR in Makefile.include under
> > > > > tests.
> > > > > (b) the venv is primarily needed because I wanted to take advantage of
> > > > > our rich python library that handles QEMU based machines. There are
> > > > > python qtest libraries as well. These are well tested and used with
> > > > > integration tests and I wanted to keep the test part of the code
> > > > > simple by simply reusing them. however, in order to use them, we need
> > > > > a venv environment within which these qemu python libraries are
> > > > > installed. Integration tests does the same thing.
> > > > >
> > > > > A note about my language of choice - python. I gave a lot of thoughts
> > > > > on this. We do not do a lot of stuff here. All we do is:
> > > > > (a) generate bits iso.
> > > > > (b) spawn a QEMU vm with the iso which then runs a bunch of tests within the vm.
> > > > > (c) collect and analyze logs.
> > > > >
> > > > > We are not inspecting guest memory or manipulating devices or pci
> > > > > buses. We do not need the power of C here. We need something that is
> > > > > simple to write, easy to maintain and understand and can deal with
> > > > > things like manipulating text files and configs easily. Python seems a
> > > > > better fit for the role.
> > > >
> > > > No problem with that. So that's venv. But do we need pip and pulling
> > > > packages from the net during testing?
> > >
> > > We do that too. See requirements.txt in tests/
> > > Following two are downloaded:
> > > avocado-framework==88.1
> > > pycdlib==1.11.0
> > >
> > > Also see this line in Makefie.include:
> > >
> > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> >
> > Right but that's avocado since it pulls lots of stuff from
> > the net anyway.
> > Are the libraries in question not packaged on major distros?
> 
> Currently I only need this:
> https://github.com/python-tap/tappy
> which is the basic TAP processing library for python.
> 
> It seems its only installed through pip:
> https://tappy.readthedocs.io/en/latest/
> 
> I do not think this is packaged by default. It's such a basic library
> for parsing test output that maybe we can keep this somewhere within
> the python src tree? Not sure ...

It's pretty small for sure. Another submodule?

> >
> > > >
> > > > > >
> > > > > > > +
> > > > > > > +A brief description of the contents of this directory follows:
> > > > > > > +
> > > > > > > +├── acpi-bits-test.py
> > > > > > > +├── acpi-bits-test-venv.sh
> > > > > > > +├── bits-config
> > > > > > > +│   ├── bits-cfg.txt
> > > > > > > +│   └── meson.build
> > > > > > > +├── bits-tests
> > > > > > > +│   ├── meson.build
> > > > > > > +│   ├── smbios.py
> > > > > > > +│   ├── smilatency.py
> > > > > > > +│   ├── testacpi.py
> > > > > > > +│   └── testcpuid.py
> > > > > > > +├── meson.build
> > > > > > > +├── prebuilt
> > > > > > > +│   ├── bits-2095-grub.tar.gz
> > > > > > > +│   ├── bits-2095.zip
> > > > > > > +│   └── meson.build
> > > > > > > +├── README
> > > > > > > +└── requirements.txt
> > > > > > > +
> > > > > > > +acpi-bits:
> > > > > > > + - acpi-bits-test-venv.sh: This is a shell script that sets up the virtual
> > > > > > > +   environment necessary for the actual python test script to run. Amongst
> > > > > > > +   other things, it makes sure that QEMU python library is available within
> > > > > > > +   that venv so that QEMU machines can be forked. QEMU python library can be
> > > > > > > +   found within python/ directory in QEMU source.
> > > > > > > +   After setting up the virtual environment, it runs the python test script
> > > > > > > +   from within that environment.
> > > > > > > +   If you want to enable verbose mode only for bits test and run make check,
> > > > > > > +   one trick is to add V=1 before the call to execute the python script in
> > > > > > > +   this file.
> > > > > > > + - acpi-bits-test.py: This is the main python test script that generates a
> > > > > > > +   biosbits iso. It then spawns a QEMU VM with it, collects the logs and reports
> > > > > > > +   test failures. This is the script one would be interested in if they wanted
> > > > > > > +   to add or change some component of the log parsing, add a new commandline to
> > > > > > > +   how QEMU is spawned etc. Test writers typically would not need to modify
> > > > > > > +   this script unless they wanted to enhance or change the log parsing for
> > > > > > > +   their tests.
> > > > > > > + - requirements.txt: This text file contains the dependent python libraries
> > > > > > > +   needed for the tests to run. If a new dependent library is needed, it would
> > > > > > > +   be added here as a new entry and then acpi-bits-test-venv.sh would install
> > > > > > > +   it when setting up the python virtual environment using pip.
> > > > > > > + - README: This text file.
> > > > > > > +
> > > > > > > +acpi-bits/bits-config:
> > > > > > > +   This location contains biosbits config files that determine how the software
> > > > > > > +   runs the tests.
> > > > > > > + - bits-config.txt: this is the biosbits config file that determines what tests
> > > > > > > +   or actions are performed by bits. The description of the config options are
> > > > > > > +   provided in the file itself.
> > > > > > > +
> > > > > > > +acpi-bits/prebuilt:
> > > > > > > +   This location contains prebuilt biosbits binaries that are used to generate
> > > > > > > +   the bits iso file for testing.
> > > > > > > + - bits-2095.zip: The contents from this zip archive are the main contents of
> > > > > > > +    the iso file that are used for testing. This binary zip archive also
> > > > > > > +    contains the full source of the bits software including the full text of
> > > > > > > +    the license agreement listed here:
> > > > > > > +    https://github.com/biosbits/bits/blob/master/COPYING
> > > > > > > +    The source tarball can be found in this location in the zip file:
> > > > > > > +    boot/src/bits-2095.tar.gz
> > > > > > > +    The additional changes beyond those that are present in the official
> > > > > > > +    biosbits github repository can be found here:
> > > > > > > +    https://github.com/ani-sinha/bits/tree/bits-qemu-logging
> > > > > > > +
> > > > > > > +    Basically these changes can be categorized into the following:
> > > > > > > +    (a) changes to make sure biosbits builds with the latest gcc compiler
> > > > > > > +    (gcc 9.4).
> > > > > > > +    (b) upgrade of acpica to the latest version (march 2022).
> > > > > > > +    (c) send bits logs to the debug IO port at addresss 0x403 so that isa
> > > > > > > +    debugcon can be used to collect the logs.
> > > > > > > +    (d) send a gub halt command to shutdown the VM once all the tests have been
> > > > > > > +    executed.
> > > > > > > +
> > > > > > > +    This zip file is automatically generated by the bits build system. It can
> > > > > > > +    be found in the bits build directory and it is suffixed by the bits build
> > > > > > > +    number.
> > > > > > > +    Normally, there is no need to make any alteration to this zip archive
> > > > > > > +    unless one wanted to change the bits software itself (for example to add
> > > > > > > +    a new config option or change actions of existing options or change the
> > > > > > > +    debug IO port etc). When such changes are made and a new biosbits software
> > > > > > > +    is needed to be generated, please refresh this zip archive as well as the
> > > > > > > +    grub tarball at the same time. Tests will break if changes are made to bits
> > > > > > > +    that are incompatible with existing behavior. So care must be taken to make
> > > > > > > +    sure that the change is compatible with existing bits software as much as
> > > > > > > +    possible. When a new config option is introduced for example, bits must
> > > > > > > +    be upadated here first before introducing the new config option through
> > > > > > > +    a later commit.
> > > > > >
> > > > > > I don't think playing with source tarballs is a reasonable work environment.
> > > > >
> > > > > I agree. However, we do not do much with the source tarball. It is
> > > > > there as part of bits to satisfy the license requirement. If we need
> > > > > to manipulate any test script that is in the source file, we would
> > > > > copy it over and keep it in the bits-test directory and change it
> > > > > there.
> > > > >
> > > > > > Let's use submodules just like e.g. firmware does?
> > > > >
> > > > > Yes I also proposed this to Igor on IRC. We can/maybe need to figure
> > > > > out a place to store the bits source if we think my github is not the
> > > > > best place. However, we need the source only if/when we need to
> > > > > rebuild bits. I suspect it won't be too often if at all.
> > > >
> > > > Why not on git.qemu.org ?
> > >
> > > Sounds good to me. Do I get push access? :-)
> > >
> > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > > + - prebuilt/bits-2095-grub.tar.gz: This tarbball contains bits generated grub
> > > > > > > +    scripts and modules to the prebuilt directory. These prebuilt grub
> > > > > > > +    artifacts are required in order to generate a bootable bits iso file that
> > > > > > > +    can run tests.
> > > > > > > +    In order to generate this tar archive, please put the following two
> > > > > > > +    directories that can be found in the bits build directory in a single
> > > > > > > +    tar archive file named as bits-<n>-grub.tar.gz where n is the version of
> > > > > > > +    bits that generated the archive:
> > > > > > > +
> > > > > > > +    grub-inst-x86_64-efi
> > > > > > > +    grub-inst
> > > > > > > +
> > > > > > > +    This version should be the same as the version number of bits that generated
> > > > > > > +    bits-<n>.zip file. In other words, the two files must be in sync and should
> > > > > > > +    come from the same build of biosbits of the same version. Things may still
> > > > > > > +    work if they come from different versions but mixing version numbers are
> > > > > > > +    not recommended.
> > > > > > > +    There is normally no need to regenerate this archive unless some fixes or
> > > > > > > +    changes have gone into the grub that are part of biosbits.
> > > > > > > +
> > > > > > > +acpi-bits/bits-tests:
> > > > > > > +   This directory contains biosbits python based tests that are run from within
> > > > > > > +   the biosbits environment in the spawned VM. New additions of test cases can
> > > > > > > +   be made in the appropriate test file. For example, new acpi tests can go
> > > > > > > +   into testacpi.py and one would call testsuite.add_test() to register the new
> > > > > > > +   test so that it gets executed as a part of the ACPI tests.
> > > > > > > +   It might be occassionally necessary to disable some subtests or add a new
> > > > > > > +   test that belongs to a test suite not already present in this directory. To
> > > > > > > +   do this, please extract the bits source from the zip file mentioned above.
> > > > > > > +   Copy the test suite/script that needs modification (addition of new tests
> > > > > > > +   or disabling them) from boot/python location of the extracted directory
> > > > > > > +   into this directory.
> > > > > > > +
> > > > > > > +   step (a): copy unmodified test script to this directory.
> > > > > > > +   step (b): update meson.build and add this file to the list.
> > > > > > > +   Commit (a) and (b) together in the same commit.
> > > > > > > +
> > > > > > > +   step (c): perform modifications to the test.
> > > > > > > +   Commit (c) in a separate commit.
> > > > > > > +
> > > > > > > +   The test framework will then use your modified test script to run the test.
> > > > > > > +   No further changes would be needed. Please check the logs to make sure that
> > > > > > > +   appropriate changes have taken effect.
> > > > > > > +
> > > > > > > +meson.build files makes sure that the bits qtests are appropriately integrated
> > > > > > > +into the QEMU qtest framework and are run with "make check-qtest".
> > > > > > > +Currently, the bits test is configured to run only for x86_64 architectures. Bits
> > > > > > > +has been built only for this architecture.
> > > > > > > +
> > > > > > > +
> > > > > > > +Author: Ani Sinha <ani@anisinha.ca>
> > > > > > > +
> > > > > > > +References:
> > > > > > > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> > > > > > > +(b) https://www.youtube.com/watch?v=36QIepyUuhg
> > > > > > > --
> > > > > > > 2.25.1
> > > > > >
> > > >
> >


