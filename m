Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879C8575679
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:43:31 +0200 (CEST)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5gI-0004Kk-2H
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC5eJ-0002xY-4n
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 16:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC5eE-0003tJ-Lx
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 16:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657831281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNmR67YB1Y/HhHdp6iALtDcbde+kCUxCNnFDeQQncTA=;
 b=Axbp+ibKEgp8HdImDFCiCZuieMn7lJbkbtEfgic7okkJ3cRjDSj6EbtgeiicdnRfK7zXrF
 zlM7cIdGvsZFACiWUIuHfgVH77s33IFS4mQ0skprF8L0crKRTXmebYhn4dJgZJ7+8YYwwl
 j1k2h0IJWkGUSN2PNLqIG1k6caMDgms=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-ld7Bg6G0M0-gXtUkCTbmQQ-1; Thu, 14 Jul 2022 16:41:19 -0400
X-MC-Unique: ld7Bg6G0M0-gXtUkCTbmQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 130-20020a1c0288000000b003a2fe999093so2278684wmc.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 13:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jNmR67YB1Y/HhHdp6iALtDcbde+kCUxCNnFDeQQncTA=;
 b=5e+3Id1PTtNw72sPRm2SDIhb8yPhlt+B6lEdNkzKRxu4xulnJ5IZK8UpAgB9/NrEbW
 Iaz7aXED47zEqrjwTx4T/8maZUvt1eAMLQYbIxiBwaOIDfOCl4p6/5xToXTirH2HAac2
 ZVtQwgjZws3genT87p6Jth9M8mfnSF3A0atsmtTO1WA677oejIQCt+mKMdBkKIwNE7Ji
 fNA0Cb9wx33NFs9KQ2TL0UkcKeucUTVn27P3iBuCxOvHkv5hZMKiXmlKKTMB+p5qCpKU
 1pQk56ii6JtMyPwo1OJa1G3PB9bk5IL5Wv6fF97B4sdwRPJgxtowVir0xKreHUeT2++6
 QzGw==
X-Gm-Message-State: AJIora+xApoP9/AXv2srp5e5FeLsiQfWierp0dXM8TtHa9QeN9b7GTA/
 PNt5u8uEghiTT6wbi24KSGoZcZd3C/N8SNMOURbV0WXNiTpiS5ywyWFepCI/E4PjplB1lXCfOTL
 vBJefGuQug5jYVH8=
X-Received: by 2002:a05:600c:4fc8:b0:3a1:99cf:800 with SMTP id
 o8-20020a05600c4fc800b003a199cf0800mr16801775wmq.60.1657831278307; 
 Thu, 14 Jul 2022 13:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyKoJvspUj/zSibFrXvikTMSZk7bLqlkTjbuXNxDZMNmKyj1afF/1Rl2I/c0Djr2nGPrJP7w==
X-Received: by 2002:a05:600c:4fc8:b0:3a1:99cf:800 with SMTP id
 o8-20020a05600c4fc800b003a199cf0800mr16801747wmq.60.1657831277837; 
 Thu, 14 Jul 2022 13:41:17 -0700 (PDT)
Received: from redhat.com ([2.52.24.42]) by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm2260146wrx.94.2022.07.14.13.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 13:41:17 -0700 (PDT)
Date: Thu, 14 Jul 2022 16:41:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 berrange@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220714163611-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710170014.1673480-8-ani@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, Jul 10, 2022 at 10:30:10PM +0530, Ani Sinha wrote:
> This change adds python based test environment that can be used to run pytest
> from within a virtual environment. A bash script sets up a virtual environment
> and then runs the python based tests from within that environment.
> All dependent python packages are installed in the virtual environment using
> pip python module. QEMU python test modules are also available in the environment
> for spawning the QEMU based VMs.
> 
> It also introduces QEMU acpi/smbios biosbits python test script which is run
> from within the python virtual environment. When the bios bits tests are run,
> bios bits binaries are downloaded from an external repo/location.
> Currently, the test points to an external private github repo where the bits
> archives are checked in.
> 
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
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test-venv.sh b/tests/pytest/acpi-bits/acpi-bits-test-venv.sh
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
> diff --git a/tests/pytest/acpi-bits/acpi-bits-test.py b/tests/pytest/acpi-bits/acpi-bits-test.py
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
> +        self._bitsLoc = "https://github.com/ani-sinha/bits/raw/bits-builds/"
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
> +        target_test_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer,
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
> +                                 os.path.join(target_test_dir, testfile_pyc))
> +
> +    def fix_mkrescue(self, mkrescue):
> +        """ grub-mkrescue is a bash script with two variables, 'prefix' and
> +            'libdir'. They must be pointed to the right location so that the
> +            iso can be generated appropriately. We point the two variables to
> +            the directory where we have extracted our pre-built bits grub
> +            tarball.
> +        """
> +        grub_x86_64_mods = os.path.join(self._workDir, 'grub-inst-x86_64-efi')
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
> +            new_script = re.sub('(^libdir=)(.*)', r'\1"%s/lib"' %grub_i386_mods,
> +                                new_script, flags=re.M)
> +
> +        with open(mkrescue, 'w') as filehandle:
> +            filehandle.write(new_script)
> +
> +    def generate_bits_iso(self):
> +        """ Uses grub-mkrescue to generate a fresh bits iso with the python
> +            test scripts
> +        """
> +        bits_dir = os.path.join(self._workDir, 'bits-%d' %self._bitsVer)
> +        iso_file = os.path.join(self._workDir, 'bits-%d.iso' %self._bitsVer)
> +        mkrescue_script = os.path.join(self._workDir,
> +                                       'grub-inst-x86_64-efi', 'bin',
> +                                       'grub-mkrescue')
> +
> +        self.assertTrue(os.access(mkrescue_script,
> +                                  os.R_OK | os.W_OK | os.X_OK))
> +
> +        self.fix_mkrescue(mkrescue_script)
> +
> +        logging.info('calling grub-mkrescue to generate the biosbits iso ...')
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
> +                          "Pass V=1 in the environment to get more details. "
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
> +        # if the location of the bits binaries has been specified by the user
> +        # and they are not found in that location, skip the test.
> +        if BITS_LOC and not os.access(bits_zip_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location %s." \
> +                          %BITS_LOC)
> +        if BITS_LOC and not os.access(grub_tar_file, os.F_OK):
> +            self.skipTest("test skipped since biosbits binaries " +
> +                          "could not be found in the specified location %s." \
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

Poking at URLs from python is really gross IMHO.
Instead of all this mess, can't we just spawn e.g. "git clone --depth 1"?
And if the directory exists I would fetch and checkout.


Fundamentally people hate submodules so we are recreating
them ok, but at least we can use git and not open-code http
and file management ...



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
> +        matchiter = re.finditer(r'(.*Summary: )(\d+ passed), (\d+ failed).*',
> +                                log)
> +        for match in matchiter:
> +            # verify that no test cases failed.
> +            self.assertEqual(match.group(3).split()[0], '0',
> +                             'Some bits tests seems to have failed. ' \
> +                             'Set V=1 in the environment to get the entire ' \
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
> +        iso_file = os.path.join(self._workDir, 'bits-%d.iso' %self._bitsVer)
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
> +        logging.info("launching QEMU vm with the following arguments: %s",
> +                     args)
> +
> +        self._vm.launch()
> +        # biosbits has been configured to run all the specified test suites
> +        # in batch mode and then automatically initiate a vm shutdown.
> +        # sleep for maximum of one minute
> +        max_sleep_time = time.monotonic() + 60
> +        while self._vm.is_running() and time.monotonic() < max_sleep_time:
> +            time.sleep(1)
> +
> +        self.assertFalse(time.monotonic() > max_sleep_time,
> +                         'The VM seems to have failed to shutdown in time')
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
> diff --git a/tests/pytest/acpi-bits/meson.build b/tests/pytest/acpi-bits/meson.build
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
> +				     output:'acpi-bits-test')
> +}
> diff --git a/tests/pytest/acpi-bits/requirements.txt b/tests/pytest/acpi-bits/requirements.txt
> new file mode 100644
> index 0000000000..00cdad09ef
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/requirements.txt
> @@ -0,0 +1 @@
> +tap.py
> -- 
> 2.25.1


