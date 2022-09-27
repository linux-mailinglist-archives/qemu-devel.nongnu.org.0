Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808685ECF79
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:48:39 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIRR-00057a-OL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odIOH-0003bG-8G
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odIO7-0000IW-Nc
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664315110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX9NTtxsnfxUVCBd6mpemQhV6HHmRtGcCtPAKC5+584=;
 b=fuMbDGU45w9qTL9bl45GO50CvTXLV8wBaoDxRReeS1Gv/bBY16EQkJFbW4uGWBvL3NwM5g
 WR0c/XEngnyaev29Wb0MEZRfdfP+PJ3uUsDh8uZBBGj8qZ0DzpdFR6rRSBygnMlDwHynhC
 O0jrOgxKcaX4OW/c+MXpdEGynd8UFc8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-QuO9jiEFPYSMNdy0IIf1Xg-1; Tue, 27 Sep 2022 17:45:09 -0400
X-MC-Unique: QuO9jiEFPYSMNdy0IIf1Xg-1
Received: by mail-ua1-f70.google.com with SMTP id
 l37-20020ab01668000000b003c644c12130so2306706uae.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gX9NTtxsnfxUVCBd6mpemQhV6HHmRtGcCtPAKC5+584=;
 b=j5inrKE24xKdCM5wf6e1IaOU1EoT9oEZGVWmzqGU9Gx0NEXZgu7VuFsnc3QmkdYfF7
 +pTacSH8ASWbTxCJw7Etp9CSd76a/qltZaX974oYFEA8RYqXYmxN2GHNCjbCWqcNeDsv
 uNjbTFrf2Q6A7w9tbwI5Ob7DcFmKQZ5CBGYKk0E99uuK1hunIX0rtqcfxHGtlr0N3mF4
 En2SUftBO++tZ70ZAnVQFBRJG0oJIxUjSaaXEMQNv2MBf79OWWYQQsRsDkxyiawFLVib
 /SXbQWtX3rTCEuSWROFzU2jVblvZWVAHDDbEiiNSDUHFpdtRUGd9sRZdfF3FBqYmr6Yy
 y2HA==
X-Gm-Message-State: ACrzQf2n0Zg7nIjDe5OU7RhGpLJSZE4HbPhDriaH2W5shSeknFQ2HNRy
 6Bu7z3ZHPJl6w9YSNBLwROY5GkSRoyYJXh9DZ1na0dsPrXbcnxHGo+sP9hSd5nUv5W0ahvTO3Vq
 6XvOfDPHIJGlWXPjMXaXiSffI/Fi9Wz8=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr13152600uar.109.1664315108497; 
 Tue, 27 Sep 2022 14:45:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YF4REh0UYtdRgNNieOi+avXvO8TaF2hWYVzUcBVd1dEENB0EsFfknt5CEcei5+23SaIcHwuLovB7cYDb8F5I=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr13152581uar.109.1664315107944; Tue, 27
 Sep 2022 14:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
In-Reply-To: <20220710170014.1673480-8-ani@anisinha.ca>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 27 Sep 2022 23:44:56 +0200
Message-ID: <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 "Maydell, Peter" <peter.maydell@linaro.org>, "P. Berrange,
 Daniel" <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, "Mammedov, Igor" <imammedo@redhat.com>, 
 "S. Tsirkin, Michael" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cdbddb05e9af8ead"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000cdbddb05e9af8ead
Content-Type: text/plain; charset="UTF-8"

Il dom 10 lug 2022, 19:01 Ani Sinha <ani@anisinha.ca> ha scritto:

> This change adds python based test environment that can be used to run
> pytest
> from within a virtual environment. A bash script sets up a virtual
> environment
> and then runs the python based tests from within that environment.
> All dependent python packages are installed in the virtual environment
> using
> pip python module. QEMU python test modules are also available in the
> environment
> for spawning the QEMU based VMs.
>
> It also introduces QEMU acpi/smbios biosbits python test script which is
> run
> from within the python virtual environment. When the bios bits tests are
> run,
> bios bits binaries are downloaded from an external repo/location.
> Currently, the test points to an external private github repo where the
> bits
> archives are checked in.


The virtual environment should be set up from configure, similar to git
submodules. John was working on it and probably can point you at some
earlier discussions in the archives about how to do it.

I also second the idea of using avocado instead of pytest, by the way.

Paolo


> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/pytest/acpi-bits/acpi-bits-test-venv.sh |  59 +++
>  tests/pytest/acpi-bits/acpi-bits-test.py      | 382 ++++++++++++++++++
>  tests/pytest/acpi-bits/meson.build            |  33 ++
>  tests/pytest/acpi-bits/requirements.txt       |   1 +
>  4 files changed, 475 insertions(+)
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
>  create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
>  create mode 100644 tests/pytest/acpi-bits/meson.build
>  create mode 100644 tests/pytest/acpi-bits/requirements.txt
>
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> new file mode 100644
> index 0000000000..186395473b
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
> @@ -0,0 +1,59 @@
> +#!/usr/bin/env bash
> +# Generates a python virtual environment for the test to run.
> +# Then runs python test scripts from within that virtual environment.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +# Author: Ani Sinha <ani@anisinha.ca>
> +
> +set -e
> +
> +MYPATH=$(realpath ${BASH_SOURCE:-$0})
> +MYDIR=$(dirname $MYPATH)
> +
> +if [ -z "$PYTEST_SOURCE_ROOT" ]; then
> +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> +    echo " to the root of the qemu source tree."
> +    echo -n "This is required so that the test can find the "
> +    echo "python modules that it needs for execution."
> +    exit 1
> +fi
> +SRCDIR=$PYTEST_SOURCE_ROOT
> +TESTSCRIPTS=("acpi-bits-test.py")
> +PIPCMD="-m pip -q --disable-pip-version-check"
> +# we need to save the old value of PWD before we do a change-dir later
> +PYTEST_PWD=$PWD
> +
> +TESTS_PYTHON=/usr/bin/python3
> +TESTS_VENV_REQ=requirements.txt
> +
> +# sadly for pip -e and -t options do not work together.
> +# please see https://github.com/pypa/pip/issues/562
> +cd $MYDIR
> +
> +$TESTS_PYTHON -m venv .
> +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
> +[ -f $TESTS_VENV_REQ ] && \
> +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ || exit 0
> +
> +# venv is activated at this point.
> +
> +# run the test
> +for testscript in ${TESTSCRIPTS[@]} ; do
> +    export PYTEST_PWD; python3 $testscript
> +done
> +
> +cd $PYTEST_PWD
> +
> +exit 0
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py
> b/tests/pytest/acpi-bits/acpi-bits-test.py
> new file mode 100644
> index 0000000000..97e61eb709
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/acpi-bits-test.py
> @@ -0,0 +1,382 @@
> +#!/usr/bin/env python3
> +# group: rw quick
> +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
> +# https://biosbits.org/
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +# Some parts are slightly taken from qtest.py and iotests.py
> +#
> +# Authors:
> +#  Ani Sinha <ani@anisinha.ca>
> +
> +# pylint: disable=invalid-name
> +
> +"""
> +QEMU bios tests using biosbits available at
> +https://biosbits.org/.
> +"""
> +
> +import logging
> +import os
> +import re
> +import shutil
> +import subprocess
> +import sys
> +import tarfile
> +import tempfile
> +import time
> +import unittest
> +from urllib import request
> +import zipfile
> +from typing import (
> +    List,
> +    Optional,
> +    Sequence,
> +)
> +from tap import TAPTestRunner
> +from qemu.machine import QEMUMachine
> +
> +PYTESTQEMUBIN = os.getenv('PYTEST_QEMU_BINARY')
> +PYTEST_PWD = os.getenv('PYTEST_PWD')
> +
> +def get_arch():
> +    """finds the arch from the qemu binary name"""
> +    match = re.search('.*qemu-system-(.*)', PYTESTQEMUBIN)
> +    if match:
> +        return match.group(1)
> +    return 'x86_64'
> +
> +ARCH = get_arch()
> +
> +class QEMUBitsMachine(QEMUMachine):
> +    """
> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> +    using -cdrom to QEMU commandline.
> +    """
> +    def __init__(self,
> +                 binary: str,
> +                 args: Sequence[str] = (),
> +                 wrapper: Sequence[str] = (),
> +                 name: Optional[str] = None,
> +                 base_temp_dir: str = "/var/tmp",
> +                 debugcon_log: str = "debugcon-log.txt",
> +                 debugcon_addr: str = "0x403",
> +                 sock_dir: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
> +        # pylint: disable=too-many-arguments
> +
> +        if name is None:
> +            name = "qemu-bits-%d" % os.getpid()
> +        if sock_dir is None:
> +            sock_dir = base_temp_dir
> +        super().__init__(binary, args, wrapper=wrapper, name=name,
> +                         base_temp_dir=base_temp_dir,
> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
> +        self.debugcon_log = debugcon_log
> +        self.debugcon_addr = debugcon_addr
> +        self.base_temp_dir = base_temp_dir
> +
> +    @property
> +    def _base_args(self) -> List[str]:
> +        args = super()._base_args
> +        args.extend([
> +            '-chardev',
> +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
> +                                                     self.debugcon_log),
> +            '-device',
> +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
> +        ])
> +        return args
> +
> +    def base_args(self):
> +        """return the base argument to QEMU binary"""
> +        return self._base_args
> +
> +class AcpiBitsTest(unittest.TestCase):
> +    """ACPI and SMBIOS tests using biosbits."""
> +    def __init__(self, *args, **kwargs):
> +        super().__init__(*args, **kwargs)
> +        self._vm = None
> +        self._workDir = None
> +        self._bitsVer = 2100
> +        self._bitsLoc = "
> https://github.com/ani-sinha/bits/raw/bits-builds/"
> +        self._debugcon_addr = '0x403'
> +        self._debugcon_log = 'debugcon-log.txt'
> +        logging.basicConfig(level=logging.INFO)
> +
> +    def copy_bits_config(self):
> +        """ copies the bios bits config file into bits.
> +        """
> +        config_file = 'bits-cfg.txt'
> +        qemu_bits_config_dir = os.path.join(os.getcwd(), 'bits-config')
> +        target_config_dir = os.path.join(self._workDir,
> +                                         'bits-%d' %self._bitsVer, 'boot')
> +        self.assertTrue(os.path.exists(qemu_bits_config_dir))
> +        self.assertTrue(os.path.exists(target_config_dir))
> +        self.assertTrue(os.access(os.path.join(qemu_bits_config_dir,
> +                                               config_file), os.R_OK))
> +        shutil.copy2(os.path.join(qemu_bits_config_dir, config_file),
> +                     target_config_dir)
> +        logging.info('copied config file %s to %s',
> +                     config_file, target_config_dir)
> +
> +    def copy_test_scripts(self):
> +        """copies the python test scripts into bits. """
> +        qemu_test_dir = os.path.join(os.getcwd(), 'bits-tests')
> +        target_test_dir = os.path.join(self._workDir, 'bits-%d'
> %self._bitsVer,
> +                                       'boot', 'python')
> +
> +        self.assertTrue(os.path.exists(qemu_test_dir))
> +        self.assertTrue(os.path.exists(target_test_dir))
> +
> +        for filename in os.listdir(qemu_test_dir):
> +            if os.path.isfile(os.path.join(qemu_test_dir, filename)) and \
> +               filename.endswith('.py'):
> +                shutil.copy2(os.path.join(qemu_test_dir, filename),
> +                             target_test_dir)
> +                logging.info('copied test file %s to %s',
> +                             filename, target_test_dir)
> +
> +                # now remove the pyc test file if it exists, otherwise the
> +                # changes in the python test script won't be executed.
> +                testfile_pyc = os.path.splitext(filename)[0] + '.pyc'
> +                if os.access(os.path.join(target_test_dir, testfile_pyc),
> +                             os.F_OK):
> +                    os.remove(os.path.join(target_test_dir, testfile_pyc))
> +                    logging.info('removed compiled file %s',
> +                                 os.path.join(target_test_dir,
> testfile_pyc))
> +
> +    def fix_mkrescue(self, mkrescue):
> +        """ grub-mkrescue is a bash script with two variables, 'prefix'
> and
> +            'libdir'. They must be pointed to the right location so that
> the
> +            iso can be generated appropriately. We point the two
> variables to
> +            the directory where we have extracted our pre-built bits grub
> +            tarball.
> +        """
> +        grub_x86_64_mods = os.path.join(self._workDir,
> 'grub-inst-x86_64-efi')
> +        grub_i386_mods = os.path.join(self._workDir, 'grub-inst')
> +
> +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> +        self.assertTrue(os.path.exists(grub_i386_mods))
> +
> +        new_script = ""
> +        with open(mkrescue, 'r') as filehandle:
> +            orig_script = filehandle.read()
> +            new_script = re.sub('(^prefix=)(.*)',
> +                                r'\1"%s"' %grub_x86_64_mods,
> +                                orig_script, flags=re.M)
> +            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"'
> %grub_i386_mods,
> +                                new_script, flags=re.M)
> +
> +        with open(mkrescue, 'w') as filehandle:
> +            filehandle.write(new_script)
> +
> +    def generate_bits_iso(self):
> +        """ Uses grub-mkrescue to generate a fresh bits iso with the
> python
> +            test scripts
> +        """
> +        bits_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer)
> +        iso_file = os.path.join(self._workDir, 'bits-%d.iso'
> %self._bitsVer)
> +        mkrescue_script = os.path.join(self._workDir,
> +                                       'grub-inst-x86_64-efi', 'bin',
> +                                       'grub-mkrescue')
> +
> +        self.assertTrue(os.access(mkrescue_script,
> +                                  os.R_OK | os.W_OK | os.X_OK))
> +
> +        self.fix_mkrescue(mkrescue_script)
> +
> +        logging.info('calling grub-mkrescue to generate the biosbits iso
> ...')
> +
> +        try:
> +            if os.getenv('V'):
> +                subprocess.check_call([mkrescue_script, '-o',
> +                                       iso_file, bits_dir],
> +                                      stdout=subprocess.DEVNULL)
> +            else:
> +                subprocess.check_call([mkrescue_script, '-o',
> +                                       iso_file, bits_dir],
> +                                      stderr=subprocess.DEVNULL,
> +                                      stdout=subprocess.DEVNULL)
> +        except Exception as e: # pylint: disable=broad-except
> +            self.skipTest("Error while generating the bits iso. "
> +                          "Pass V=1 in the environment to get more
> details. "
> +                          + str(e))
> +
> +        self.assertTrue(os.access(iso_file, os.R_OK))
> +
> +        logging.info('iso file %s successfully generated.', iso_file)
> +
> +    def setUp(self):
> +        BITS_LOC = os.getenv("PYTEST_BITSLOC")
> +        if BITS_LOC:
> +            prefix = BITS_LOC
> +        else:
> +            prefix = os.path.join(os.getcwd(), 'prebuilt')
> +            if not os.path.isdir(prefix):
> +                os.mkdir(prefix, mode=0o775)
> +
> +        bits_zip_file = os.path.join(prefix, 'bits-%d.zip'
> +                                     %self._bitsVer)
> +        grub_tar_file = os.path.join(prefix,
> +                                     'bits-%d-grub.tar.gz' %self._bitsVer)
> +        # if the location of the bits binaries has been specified by the
> user
> +        # and they are not found in that location, skip the test.
> +        if BITS_LOC and not os.access(bits_zip_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location
> %s." \
> +                          %BITS_LOC)
> +        if BITS_LOC and not os.access(grub_tar_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location
> %s." \
> +                          %BITS_LOC)
> +
> +        self._workDir = tempfile.mkdtemp(prefix='acpi-bits-',
> +                                         suffix='.tmp')
> +        logging.info('working dir: %s', self._workDir)
> +
> +        localArchive = "bits-%d.zip" % self._bitsVer
> +        if not os.access(bits_zip_file, os.F_OK):
> +            logging.info("archive %s not found in %s, downloading ...",
> +                         localArchive, bits_zip_file)
> +            try:
> +                req = request.urlopen(self._bitsLoc + localArchive)
> +                with open(os.path.join(prefix, localArchive),
> +                          'wb') as archivef:
> +                    archivef.write(req.read())
> +            except Exception as e: # pylint: disable=broad-except
> +                self.skipTest("test skipped since biosbits binaries " +
> +                              "could not be obtained." + str(e))
> +        else:
> +            logging.info('using locally found %s', localArchive)
> +
> +        localArchive = "bits-%d-grub.tar.gz" % self._bitsVer
> +        if not os.access(grub_tar_file, os.F_OK):
> +            logging.info("archive %s not found in %s, downloading ...",
> +                         localArchive, bits_zip_file)
> +            try:
> +                req = request.urlopen(self._bitsLoc + localArchive)
> +                with open(os.path.join(prefix, localArchive),
> +                          'wb') as archivef:
> +                    archivef.write(req.read())
> +            except Exception as e: # pylint: disable=broad-except
> +                self.skipTest("test skipped since biosbits binaries " +
> +                              "could not be obtained." + str(e))
> +        else:
> +            logging.info('using locally found %s', localArchive)
> +
> +        # extract the bits software in the temp working directory
> +        with zipfile.ZipFile(bits_zip_file, 'r') as zref:
> +            zref.extractall(self._workDir)
> +
> +        with tarfile.open(grub_tar_file, 'r') as tarball:
> +            tarball.extractall(self._workDir)
> +
> +        self.copy_test_scripts()
> +        self.copy_bits_config()
> +        self.generate_bits_iso()
> +
> +    def parse_log(self):
> +        """parse the log generated by running bits tests and
> +           check for failures.
> +        """
> +        debugconf = os.path.join(self._workDir, self._debugcon_log)
> +        log = ""
> +        with open(debugconf, 'r') as filehandle:
> +            log = filehandle.read()
> +
> +        if os.getenv('V'):
> +            print('\nlogs from biosbits follows:')
> +            print('==========================================\n')
> +            print(log)
> +            print('==========================================\n')
> +
> +        matchiter = re.finditer(r'(.*Summary: )(\d+ passed), (\d+
> failed).*',
> +                                log)
> +        for match in matchiter:
> +            # verify that no test cases failed.
> +            self.assertEqual(match.group(3).split()[0], '0',
> +                             'Some bits tests seems to have failed. ' \
> +                             'Set V=1 in the environment to get the
> entire ' \
> +                             'log from bits.')
> +
> +    def tearDown(self):
> +        if self._vm:
> +            self.assertFalse(not self._vm.is_running)
> +        logging.info('removing the work directory %s', self._workDir)
> +        shutil.rmtree(self._workDir)
> +
> +    def test_acpi_smbios_bits(self):
> +        """The main test case implementaion."""
> +
> +        qemu_bin = PYTESTQEMUBIN
> +        iso_file = os.path.join(self._workDir, 'bits-%d.iso'
> %self._bitsVer)
> +
> +        # PYTESTQEMUBIN could be relative to the current directory
> +        if not os.access(PYTESTQEMUBIN, os.X_OK) and PYTEST_PWD:
> +            qemu_bin = os.path.join(PYTEST_PWD, PYTESTQEMUBIN)
> +
> +        logging.info('QEMU binary used: %s', qemu_bin)
> +
> +        self.assertTrue(os.access(qemu_bin, os.X_OK))
> +        self.assertTrue(os.access(iso_file, os.R_OK))
> +
> +        self._vm = QEMUBitsMachine(binary=qemu_bin,
> +                                   base_temp_dir=self._workDir,
> +                                   debugcon_log=self._debugcon_log,
> +                                   debugcon_addr=self._debugcon_addr)
> +
> +        self._vm.add_args('-cdrom', '%s' %iso_file)
> +
> +        args = " ".join(str(arg) for arg in self._vm.base_args()) + \
> +            " " + " ".join(str(arg) for arg in self._vm.args)
> +
> +        logging.info("launching QEMU vm with the following arguments:
> %s",
> +                     args)
> +
> +        self._vm.launch()
> +        # biosbits has been configured to run all the specified test
> suites
> +        # in batch mode and then automatically initiate a vm shutdown.
> +        # sleep for maximum of one minute
> +        max_sleep_time = time.monotonic() + 60
> +        while self._vm.is_running() and time.monotonic() < max_sleep_time:
> +            time.sleep(1)
> +
> +        self.assertFalse(time.monotonic() > max_sleep_time,
> +                         'The VM seems to have failed to shutdown in
> time')
> +
> +        self.parse_log()
> +
> +def execute_unittest(argv: List[str], debug: bool = False,
> +                     runner: TAPTestRunner = None) -> None:
> +    """Executes unittests within the calling module."""
> +
> +    unittest.main(argv=argv,
> +                  testRunner=runner,
> +                  verbosity=2 if debug else 1,
> +                  warnings=None if sys.warnoptions else 'ignore')
> +
> +def main():
> +    """ The main function where execution begins. """
> +
> +    assert PYTESTQEMUBIN is not None, \
> +        "Environment variable PYTEST_QEMU_BINARY required."
> +
> +    runner = TAPTestRunner()
> +    runner.set_stream(True)
> +    runner.set_format("%s/acpi-bits-test" %ARCH)
> +    execute_unittest(sys.argv, False, runner)
> +
> +main()
> diff --git a/tests/pytest/acpi-bits/meson.build
> b/tests/pytest/acpi-bits/meson.build
> new file mode 100644
> index 0000000000..099c191d57
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/meson.build
> @@ -0,0 +1,33 @@
> +xorriso = find_program('xorriso', required: true)
> +if not xorriso.found()
> +  message('xorriso not found ... disabled bits acpi tests.')
> +  subdir_done()
> +endif
> +
> +subdir('bits-tests')
> +subdir('bits-config')
> +
> +test_files = ['acpi-bits-test.py']
> +requirements = 'requirements.txt'
> +
> +copytestfiles = custom_target('copy test files',
> +  input : test_files,
> +  output :  test_files,
> +  command : ['cp', '@INPUT@', '@OUTPUT@'],
> +  install : false,
> +  build_by_default : true)
> +
> +requirementsfiles = custom_target('copy py req files',
> +  input : requirements,
> +  output : requirements,
> +  command : ['cp', '@INPUT@', '@OUTPUT@'],
> +  install : false,
> +  build_by_default : true)
> +
> +other_deps += [copytestfiles,requirementsfiles]
> +
> +pytest_executables += {
> +    'acpi-bits-test': configure_file(copy:true,
> +                                     input:'acpi-bits-test-venv.sh',
> +                                    output:'acpi-bits-test')
> +}
> diff --git a/tests/pytest/acpi-bits/requirements.txt
> b/tests/pytest/acpi-bits/requirements.txt
> new file mode 100644
> index 0000000000..00cdad09ef
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/requirements.txt
> @@ -0,0 +1 @@
> +tap.py
> --
> 2.25.1
>
>

--000000000000cdbddb05e9af8ead
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il dom 10 lug 2022, 19:01 Ani Sinha &lt;<a href=3D"mai=
lto:ani@anisinha.ca" target=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</=
a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This change adds=
 python based test environment that can be used to run pytest<br>
from within a virtual environment. A bash script sets up a virtual environm=
ent<br>
and then runs the python based tests from within that environment.<br>
All dependent python packages are installed in the virtual environment usin=
g<br>
pip python module. QEMU python test modules are also available in the envir=
onment<br>
for spawning the QEMU based VMs.<br>
<br>
It also introduces QEMU acpi/smbios biosbits python test script which is ru=
n<br>
from within the python virtual environment. When the bios bits tests are ru=
n,<br>
bios bits binaries are downloaded from an external repo/location.<br>
Currently, the test points to an external private github repo where the bit=
s<br>
archives are checked in.</blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">The virtual environment should be set up from configure=
, similar to git submodules. John was working on it and probably can point =
you at some earlier discussions in the archives about how to do it.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I also second the idea of using=
 avocado instead of pytest, by the way.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
---<br>
=C2=A0tests/pytest/acpi-bits/acpi-bits-test-venv.sh |=C2=A0 59 +++<br>
=C2=A0tests/pytest/acpi-bits/acpi-bits-test.py=C2=A0 =C2=A0 =C2=A0 | 382 ++=
++++++++++++++++<br>
=C2=A0tests/pytest/acpi-bits/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 33 ++<br>
=C2=A0tests/pytest/acpi-bits/requirements.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A04 files changed, 475 insertions(+)<br>
=C2=A0create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh<br>
=C2=A0create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py<br>
=C2=A0create mode 100644 tests/pytest/acpi-bits/meson.build<br>
=C2=A0create mode 100644 tests/pytest/acpi-bits/requirements.txt<br>
<br>
diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh b/tests/pytest/a=
cpi-bits/acpi-bits-test-venv.sh<br>
new file mode 100644<br>
index 0000000000..186395473b<br>
--- /dev/null<br>
+++ b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh<br>
@@ -0,0 +1,59 @@<br>
+#!/usr/bin/env bash<br>
+# Generates a python virtual environment for the test to run.<br>
+# Then runs python test scripts from within that virtual environment.<br>
+#<br>
+# This program is free software; you can redistribute it and/or modify<br>
+# it under the terms of the GNU General Public License as published by<br>
+# the Free Software Foundation; either version 2 of the License, or<br>
+# (at your option) any later version.<br>
+#<br>
+# This program is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+# GNU General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU General Public License<br>
+# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
http://www.gnu.org/licenses/</a>&gt;.<br>
+#<br>
+# Author: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"noreferr=
er noreferrer" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
+<br>
+set -e<br>
+<br>
+MYPATH=3D$(realpath ${BASH_SOURCE:-$0})<br>
+MYDIR=3D$(dirname $MYPATH)<br>
+<br>
+if [ -z &quot;$PYTEST_SOURCE_ROOT&quot; ]; then<br>
+=C2=A0 =C2=A0 echo -n &quot;Please set QTEST_SOURCE_ROOT env pointing&quot=
;<br>
+=C2=A0 =C2=A0 echo &quot; to the root of the qemu source tree.&quot;<br>
+=C2=A0 =C2=A0 echo -n &quot;This is required so that the test can find the=
 &quot;<br>
+=C2=A0 =C2=A0 echo &quot;python modules that it needs for execution.&quot;=
<br>
+=C2=A0 =C2=A0 exit 1<br>
+fi<br>
+SRCDIR=3D$PYTEST_SOURCE_ROOT<br>
+TESTSCRIPTS=3D(&quot;acpi-bits-test.py&quot;)<br>
+PIPCMD=3D&quot;-m pip -q --disable-pip-version-check&quot;<br>
+# we need to save the old value of PWD before we do a change-dir later<br>
+PYTEST_PWD=3D$PWD<br>
+<br>
+TESTS_PYTHON=3D/usr/bin/python3<br>
+TESTS_VENV_REQ=3Drequirements.txt<br>
+<br>
+# sadly for pip -e and -t options do not work together.<br>
+# please see <a href=3D"https://github.com/pypa/pip/issues/562" rel=3D"nor=
eferrer noreferrer noreferrer" target=3D"_blank">https://github.com/pypa/pi=
p/issues/562</a><br>
+cd $MYDIR<br>
+<br>
+$TESTS_PYTHON -m venv .<br>
+$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/<br>
+[ -f $TESTS_VENV_REQ ] &amp;&amp; \<br>
+=C2=A0 =C2=A0 $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ || exit 0<b=
r>
+<br>
+# venv is activated at this point.<br>
+<br>
+# run the test<br>
+for testscript in ${TESTSCRIPTS[@]} ; do<br>
+=C2=A0 =C2=A0 export PYTEST_PWD; python3 $testscript<br>
+done<br>
+<br>
+cd $PYTEST_PWD<br>
+<br>
+exit 0<br>
diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py b/tests/pytest/acpi-b=
its/acpi-bits-test.py<br>
new file mode 100644<br>
index 0000000000..97e61eb709<br>
--- /dev/null<br>
+++ b/tests/pytest/acpi-bits/acpi-bits-test.py<br>
@@ -0,0 +1,382 @@<br>
+#!/usr/bin/env python3<br>
+# group: rw quick<br>
+# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,<br>
+# <a href=3D"https://biosbits.org/" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://biosbits.org/</a><br>
+#<br>
+# This program is free software; you can redistribute it and/or modify<br>
+# it under the terms of the GNU General Public License as published by<br>
+# the Free Software Foundation; either version 2 of the License, or<br>
+# (at your option) any later version.<br>
+#<br>
+# This program is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+# GNU General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU General Public License<br>
+# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
http://www.gnu.org/licenses/</a>&gt;.<br>
+#<br>
+# Some parts are slightly taken from qtest.py and iotests.py<br>
+#<br>
+# Authors:<br>
+#=C2=A0 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
+<br>
+# pylint: disable=3Dinvalid-name<br>
+<br>
+&quot;&quot;&quot;<br>
+QEMU bios tests using biosbits available at<br>
+<a href=3D"https://biosbits.org/" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://biosbits.org/</a>.<br>
+&quot;&quot;&quot;<br>
+<br>
+import logging<br>
+import os<br>
+import re<br>
+import shutil<br>
+import subprocess<br>
+import sys<br>
+import tarfile<br>
+import tempfile<br>
+import time<br>
+import unittest<br>
+from urllib import request<br>
+import zipfile<br>
+from typing import (<br>
+=C2=A0 =C2=A0 List,<br>
+=C2=A0 =C2=A0 Optional,<br>
+=C2=A0 =C2=A0 Sequence,<br>
+)<br>
+from tap import TAPTestRunner<br>
+from qemu.machine import QEMUMachine<br>
+<br>
+PYTESTQEMUBIN =3D os.getenv(&#39;PYTEST_QEMU_BINARY&#39;)<br>
+PYTEST_PWD =3D os.getenv(&#39;PYTEST_PWD&#39;)<br>
+<br>
+def get_arch():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;finds the arch from the qemu binary name&q=
uot;&quot;&quot;<br>
+=C2=A0 =C2=A0 match =3D re.search(&#39;.*qemu-system-(.*)&#39;, PYTESTQEMU=
BIN)<br>
+=C2=A0 =C2=A0 if match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return match.group(1)<br>
+=C2=A0 =C2=A0 return &#39;x86_64&#39;<br>
+<br>
+ARCH =3D get_arch()<br>
+<br>
+class QEMUBitsMachine(QEMUMachine):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A QEMU VM, with isa-debugcon enabled and bits iso passed<br>
+=C2=A0 =C2=A0 using -cdrom to QEMU commandline.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binary: str,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args: Sequen=
ce[str] =3D (),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrapper: Seq=
uence[str] =3D (),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name: Option=
al[str] =3D None,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_temp_di=
r: str =3D &quot;/var/tmp&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugcon_log=
: str =3D &quot;debugcon-log.txt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugcon_add=
r: str =3D &quot;0x403&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sock_dir: Op=
tional[str] =3D None,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_timer: O=
ptional[float] =3D None):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dtoo-many-arguments<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if name is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &quot;qemu-bits-%d&quot=
; % os.getpid()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sock_dir is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock_dir =3D base_temp_dir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(binary, args, wrapper=3Dwrapp=
er, name=3Dname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0base_temp_dir=3Dbase_temp_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugcon_log =3D debugcon_log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugcon_addr =3D debugcon_addr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.base_temp_dir =3D base_temp_dir<br>
+<br>
+=C2=A0 =C2=A0 @property<br>
+=C2=A0 =C2=A0 def _base_args(self) -&gt; List[str]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D super()._base_args<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.extend([<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-chardev&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;file,path=3D%s,id=3Ddebugco=
n&#39; %os.path.join(self.base_temp_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.debugcon_log),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-device&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;isa-debugcon,iobase=3D%s,ch=
ardev=3Ddebugcon&#39; %self.debugcon_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return args<br>
+<br>
+=C2=A0 =C2=A0 def base_args(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;return the base argument to =
QEMU binary&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._base_args<br>
+<br>
+class AcpiBitsTest(unittest.TestCase):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;ACPI and SMBIOS tests using biosbits.&quot=
;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, *args, **kwargs):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(*args, **kwargs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._workDir =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._bitsVer =3D 2100<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._bitsLoc =3D &quot;<a href=3D"https://git=
hub.com/ani-sinha/bits/raw/bits-builds/" rel=3D"noreferrer noreferrer noref=
errer" target=3D"_blank">https://github.com/ani-sinha/bits/raw/bits-builds/=
</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._debugcon_addr =3D &#39;0x403&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._debugcon_log =3D &#39;debugcon-log.txt&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.basicConfig(level=3Dlogging.INFO)<br>
+<br>
+=C2=A0 =C2=A0 def copy_bits_config(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; copies the bios bits config=
 file into bits.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config_file =3D &#39;bits-cfg.txt&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bits_config_dir =3D os.path.join(os.getcw=
d(), &#39;bits-config&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_config_dir =3D os.path.join(self._workD=
ir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;bits-%d&#39; %self._bitsVer, &#39;boot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(qemu_bits_confi=
g_dir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(target_config_d=
ir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(os.path.join(qemu_bi=
ts_config_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0config_file), os.R_OK))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(os.path.join(qemu_bits_config_dir=
, config_file),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_config_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;copied c=
onfig file %s to %s&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0config_file, target_config_dir)<br>
+<br>
+=C2=A0 =C2=A0 def copy_test_scripts(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;copies the python test scrip=
ts into bits. &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_test_dir =3D os.path.join(os.getcwd(), &#=
39;bits-tests&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_test_dir =3D os.path.join(self._workDir=
, &#39;bits-%d&#39; %self._bitsVer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;boot=
&#39;, &#39;python&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(qemu_test_dir))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(target_test_dir=
))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for filename in os.listdir(qemu_test_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(os.path.join(q=
emu_test_dir, filename)) and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename.endswith(&=
#39;.py&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(os.pa=
th.join(qemu_test_dir, filename),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_test_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logging.info" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">lo=
gging.info</a>(&#39;copied test file %s to %s&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename, target_test_dir)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # now remove the p=
yc test file if it exists, otherwise the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # changes in the p=
ython test script won&#39;t be executed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile_pyc =3D o=
s.path.splitext(filename)[0] + &#39;.pyc&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.access(os.pa=
th.join(target_test_dir, testfile_pyc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.F_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.r=
emove(os.path.join(target_test_dir, testfile_pyc))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logging.info" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">logging.info</a>(&#39;removed compiled file %s&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(target_test_dir, =
testfile_pyc))<br>
+<br>
+=C2=A0 =C2=A0 def fix_mkrescue(self, mkrescue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; grub-mkrescue is a bash scr=
ipt with two variables, &#39;prefix&#39; and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libdir&#39;. They must be p=
ointed to the right location so that the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iso can be generated appropriate=
ly. We point the two variables to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the directory where we have extr=
acted our pre-built bits grub<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_x86_64_mods =3D os.path.join(self._workDi=
r, &#39;grub-inst-x86_64-efi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_i386_mods =3D os.path.join(self._workDir,=
 &#39;grub-inst&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(grub_x86_64_mod=
s))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(grub_i386_mods)=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(mkrescue, &#39;r&#39;) as filehandle=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_script =3D filehandle.read(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D re.sub(&#39;(^pre=
fix=3D)(.*)&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r&#39;\1&quot;%s&quot;&#39; %grub_x8=
6_64_mods,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_script, flags=3Dre.M)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script =3D re.sub(&#39;(^lib=
dir=3D)(.*)&#39;, r&#39;\1&quot;%s/lib&quot;&#39; %grub_i386_mods,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_script, flags=3Dre.M)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(mkrescue, &#39;w&#39;) as filehandle=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filehandle.write(new_script)<br>
+<br>
+=C2=A0 =C2=A0 def generate_bits_iso(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot; Uses grub-mkrescue to gener=
ate a fresh bits iso with the python<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test scripts<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_dir =3D os.path.join(self._workDir, &#39;=
bits-%d&#39; %self._bitsVer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso_file =3D os.path.join(self._workDir, &#39;=
bits-%d.iso&#39; %self._bitsVer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkrescue_script =3D os.path.join(self._workDir=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;grub=
-inst-x86_64-efi&#39;, &#39;bin&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;grub=
-mkrescue&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(mkrescue_script,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.R_OK | os.W_OK | os.X_OK))=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fix_mkrescue(mkrescue_script)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;calling =
grub-mkrescue to generate the biosbits iso ...&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.getenv(&#39;V&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_c=
all([mkrescue_script, &#39;-o&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iso_file,=
 bits_dir],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubpro=
cess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_c=
all([mkrescue_script, &#39;-o&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iso_file,=
 bits_dir],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubpro=
cess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubpro=
cess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e: # pylint: disable=3Dbro=
ad-except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;Error while =
generating the bits iso. &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Pass V=3D1 in the environment to get more details. =
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 + str(e))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(iso_file, os.R_OK))<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;iso file=
 %s successfully generated.&#39;, iso_file)<br>
+<br>
+=C2=A0 =C2=A0 def setUp(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BITS_LOC =3D os.getenv(&quot;PYTEST_BITSLOC&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D BITS_LOC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D os.path.join(os.getcw=
d(), &#39;prebuilt&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(prefix):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(prefix, m=
ode=3D0o775)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_zip_file =3D os.path.join(prefix, &#39;bi=
ts-%d.zip&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%self._bitsVer)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_tar_file =3D os.path.join(prefix,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bits-%d-gru=
b.tar.gz&#39; %self._bitsVer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the location of the bits binaries has bee=
n specified by the user<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and they are not found in that location, ski=
p the test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC and not os.access(bits_zip_file, o=
s.F_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;test skipped=
 since biosbits binaries &quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;could not be found in the specified location %s.&qu=
ot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %BITS_LOC)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if BITS_LOC and not os.access(grub_tar_file, o=
s.F_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;test skipped=
 since biosbits binaries &quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;could not be found in the specified location %s.&qu=
ot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %BITS_LOC)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._workDir =3D tempfile.mkdtemp(prefix=3D&#=
39;acpi-bits-&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
ffix=3D&#39;.tmp&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;working =
dir: %s&#39;, self._workDir)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localArchive =3D &quot;bits-%d.zip&quot; % sel=
f._bitsVer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.access(bits_zip_file, os.F_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">logging.info</a>=
(&quot;archive %s not found in %s, downloading ...&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0localArchive, bits_zip_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D request.ur=
lopen(self._bitsLoc + localArchive)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.path.=
join(prefix, localArchive),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;wb&#39;) as archivef:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch=
ivef.write(req.read())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e: # pylint:=
 disable=3Dbroad-except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quo=
t;test skipped since biosbits binaries &quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;could not be obtained.&quot; + str(e)=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">logging.info</a>=
(&#39;using locally found %s&#39;, localArchive)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localArchive =3D &quot;bits-%d-grub.tar.gz&quo=
t; % self._bitsVer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.access(grub_tar_file, os.F_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">logging.info</a>=
(&quot;archive %s not found in %s, downloading ...&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0localArchive, bits_zip_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D request.ur=
lopen(self._bitsLoc + localArchive)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(os.path.=
join(prefix, localArchive),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;wb&#39;) as archivef:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch=
ivef.write(req.read())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e: # pylint:=
 disable=3Dbroad-except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quo=
t;test skipped since biosbits binaries &quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;could not be obtained.&quot; + str(e)=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">logging.info</a>=
(&#39;using locally found %s&#39;, localArchive)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # extract the bits software in the temp workin=
g directory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with zipfile.ZipFile(bits_zip_file, &#39;r&#39=
;) as zref:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zref.extractall(self._workDir)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tarfile.open(grub_tar_file, &#39;r&#39;) =
as tarball:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball.extractall(self._workDir=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.copy_test_scripts()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.copy_bits_config()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.generate_bits_iso()<br>
+<br>
+=C2=A0 =C2=A0 def parse_log(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;parse the log generated by r=
unning bits tests and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check for failures.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 debugconf =3D os.path.join(self._workDir, self=
._debugcon_log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(debugconf, &#39;r&#39;) as filehandl=
e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D filehandle.read()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.getenv(&#39;V&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;\nlogs from biosbits =
follows:&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 matchiter =3D re.finditer(r&#39;(.*Summary: )(=
\d+ passed), (\d+ failed).*&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for match in matchiter:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify that no test cases fail=
ed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(match.group(3).=
split()[0], &#39;0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Some bits tests seems to have failed. &=
#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Set V=3D1 in the environment to get the=
 entire &#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;log from bits.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def tearDown(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._vm:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(not self._vm.is=
_running)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;removing=
 the work directory %s&#39;, self._workDir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(self._workDir)<br>
+<br>
+=C2=A0 =C2=A0 def test_acpi_smbios_bits(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;The main test case implement=
aion.&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bin =3D PYTESTQEMUBIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso_file =3D os.path.join(self._workDir, &#39;=
bits-%d.iso&#39; %self._bitsVer)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # PYTESTQEMUBIN could be relative to the curre=
nt directory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.access(PYTESTQEMUBIN, os.X_OK) and P=
YTEST_PWD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bin =3D os.path.join(PYTEST=
_PWD, PYTESTQEMUBIN)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&#39;QEMU bin=
ary used: %s&#39;, qemu_bin)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(qemu_bin, os.X_OK))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.access(iso_file, os.R_OK))<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm =3D QEMUBitsMachine(binary=3Dqemu_bin=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_temp_dir=3Dself._w=
orkDir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugcon_log=3Dself._de=
bugcon_log,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugcon_addr=3Dself._d=
ebugcon_addr)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.add_args(&#39;-cdrom&#39;, &#39;%s&#3=
9; %iso_file)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D &quot; &quot;.join(str(arg) for arg i=
n self._vm.base_args()) + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; &quot; + &quot; &quot;.jo=
in(str(arg) for arg in self._vm.args)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">logging.info</a>(&quot;launchi=
ng QEMU vm with the following arguments: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0args)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # biosbits has been configured to run all the =
specified test suites<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in batch mode and then automatically initiat=
e a vm shutdown.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sleep for maximum of one minute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sleep_time =3D time.monotonic() + 60<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while self._vm.is_running() and time.monotonic=
() &lt; max_sleep_time:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(time.monotonic() &gt; max_sle=
ep_time,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;The VM seems to have failed to shutdown in time&#39;)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_log()<br>
+<br>
+def execute_unittest(argv: List[str], debug: bool =3D False,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0runner: TAPTestRunner =3D None) -&gt; None:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Executes unittests within the calling modu=
le.&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 unittest.main(argv=3Dargv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testRunner=
=3Drunner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verbosity=
=3D2 if debug else 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warnings=3D=
None if sys.warnoptions else &#39;ignore&#39;)<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot; The main function where execution begins.=
 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 assert PYTESTQEMUBIN is not None, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Environment variable PYTEST_QEMU_BINARY =
required.&quot;<br>
+<br>
+=C2=A0 =C2=A0 runner =3D TAPTestRunner()<br>
+=C2=A0 =C2=A0 runner.set_stream(True)<br>
+=C2=A0 =C2=A0 runner.set_format(&quot;%s/acpi-bits-test&quot; %ARCH)<br>
+=C2=A0 =C2=A0 execute_unittest(sys.argv, False, runner)<br>
+<br>
+main()<br>
diff --git a/tests/pytest/acpi-bits/meson.build b/tests/pytest/acpi-bits/me=
son.build<br>
new file mode 100644<br>
index 0000000000..099c191d57<br>
--- /dev/null<br>
+++ b/tests/pytest/acpi-bits/meson.build<br>
@@ -0,0 +1,33 @@<br>
+xorriso =3D find_program(&#39;xorriso&#39;, required: true)<br>
+if not xorriso.found()<br>
+=C2=A0 message(&#39;xorriso not found ... disabled bits acpi tests.&#39;)<=
br>
+=C2=A0 subdir_done()<br>
+endif<br>
+<br>
+subdir(&#39;bits-tests&#39;)<br>
+subdir(&#39;bits-config&#39;)<br>
+<br>
+test_files =3D [&#39;acpi-bits-test.py&#39;]<br>
+requirements =3D &#39;requirements.txt&#39;<br>
+<br>
+copytestfiles =3D custom_target(&#39;copy test files&#39;,<br>
+=C2=A0 input : test_files,<br>
+=C2=A0 output :=C2=A0 test_files,<br>
+=C2=A0 command : [&#39;cp&#39;, &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;],<br=
>
+=C2=A0 install : false,<br>
+=C2=A0 build_by_default : true)<br>
+<br>
+requirementsfiles =3D custom_target(&#39;copy py req files&#39;,<br>
+=C2=A0 input : requirements,<br>
+=C2=A0 output : requirements,<br>
+=C2=A0 command : [&#39;cp&#39;, &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39;],<br=
>
+=C2=A0 install : false,<br>
+=C2=A0 build_by_default : true)<br>
+<br>
+other_deps +=3D [copytestfiles,requirementsfiles]<br>
+<br>
+pytest_executables +=3D {<br>
+=C2=A0 =C2=A0 &#39;acpi-bits-test&#39;: configure_file(copy:true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input:&#39;acpi-=
bits-test-venv.sh&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output:&#39;acpi-bits-=
test&#39;)<br>
+}<br>
diff --git a/tests/pytest/acpi-bits/requirements.txt b/tests/pytest/acpi-bi=
ts/requirements.txt<br>
new file mode 100644<br>
index 0000000000..00cdad09ef<br>
--- /dev/null<br>
+++ b/tests/pytest/acpi-bits/requirements.txt<br>
@@ -0,0 +1 @@<br>
+tap.py<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div></div>

--000000000000cdbddb05e9af8ead--


