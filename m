Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316ED603057
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:58:00 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoyd-0005z4-0p
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okohQ-0006fJ-F8
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:40:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okohN-0001dy-U4
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:40:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bk15so24159432wrb.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4nsSH6ILR7dshcAU0bN9CZTXV9LyC7B0WVfFngJk3Y=;
 b=UoKxDpP2rIZgvJBU0myj6AymA12er++dfMEGWHSVRG/pWJDvEzTHTxS8gMekxKwguS
 8JT5ndPsjWgfAylaUDM4xIFLgh5VNZPiwJuubhS841ReZizH/OIL4gb9YKM/QukKL16b
 LJhAnl8VSrp2Z7bJ7yDFtQn6ikBTPcHdc4Q0zLcQGNgtrBEjOeNmVHz7KWNCcr0uEkYM
 G2ltIbCGOyCHorIl5VLuceEz5B2vGYfNRhuuJ7LX4KxJvY4Vsy8oyAakck0wEzdulMbk
 bvrZiBJvkeKfzRERokREhDFOHTgUS/ej/0NwgFyqt0Z30Dl+yv9j0aUKruBwd1wBZzfP
 4maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e4nsSH6ILR7dshcAU0bN9CZTXV9LyC7B0WVfFngJk3Y=;
 b=4/q3bB6tHxxrGx0ab8+hsaIu457FuVUTcglBeqNDLJZgQKGKD9OdpgpYZU9dIzrb8H
 WWEG0jNEyyoQigBV7rViDhGS6zetY71cNJ4zo42wzT9fn0xwKrD/Xvw4n7kwW9GV2hi/
 NeXZhkvx4YSyQr+DOFKNkoIlzdZWvnpcvQNJX1+w4LxEIvWqoG/W5RMqz+IkqKPUqzR4
 zISnJuIFC4YZGs0Jk7qTSyoEQIXapDw58LZqyHOIpCK5/i9TNlVypT4GqpSMDm14Moh8
 PzXpyftSwQIokqREWmpYJKXaU0cqBLRu1/0xlBlxdVqsh+w0PE2nu9N6Oo6hjXrGulBm
 2llw==
X-Gm-Message-State: ACrzQf2hyDTwFFFA74qBmu33Qpr0nlvq4xCEzQ920SutOeuxeHNMebBn
 WP9cu0pqyDHHtpDWR94eVMaRjw==
X-Google-Smtp-Source: AMsMyM4y/oLtN/cWrdx3yfrW5ucm+IVVhB3xc1fkzPmD2RG4SuLfqBITcbkRNZ8VA4+Sf3bEkbmc7A==
X-Received: by 2002:a5d:6d06:0:b0:230:3fb:d166 with SMTP id
 e6-20020a5d6d06000000b0023003fbd166mr2288184wrq.562.1666107605371; 
 Tue, 18 Oct 2022 08:40:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c311000b003c6f1732f65sm10946001wmo.38.2022.10.18.08.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:40:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9E401FFB7;
 Tue, 18 Oct 2022 16:40:03 +0100 (BST)
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-9-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
Date: Tue, 18 Oct 2022 16:37:35 +0100
In-reply-to: <20221014173508.222823-9-ani@anisinha.ca>
Message-ID: <87wn8xb0oc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> This introduces QEMU acpi/smbios biosbits avocado test which is run
> from within the python virtual environment. When the bits tests are run, =
bits
> binaries are downloaded from an external repo/location, bios bits iso is
> regenerated containing the acpi/smbios bits tests that are maintained as =
a part
> of the QEMU source under tests/avocado/acpi-bits/bits-test . When the VM =
is
> spawned with the iso, it runs the tests in batch mode and the results are=
 pushed
> out from the VM to the test machine where they are analyzed by this scrip=
t and
> pass/fail results are reported.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits.py | 359 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 359 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> new file mode 100644
> index 0000000000..009c7f5327
> --- /dev/null
> +++ b/tests/avocado/acpi-bits.py
> @@ -0,0 +1,359 @@
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
> +#
> +# Author:
> +#  Ani Sinha <ani@anisinha.ca>
> +
> +# pylint: disable=3Dinvalid-name
> +# pylint: disable=3Dconsider-using-f-string
> +
> +"""
> +This is QEMU ACPI/SMBIOS avocado tests using biosbits.
> +Biosbits is available originally at https://biosbits.org/.
> +This test uses a fork of the upstream bits and has numerous fixes
> +including an upgraded acpica. The fork is located here:
> +https://gitlab.com/qemu-project/biosbits-bits .
> +"""
> +
> +import logging
> +import os
> +import re
> +import shutil
> +import subprocess
> +import tarfile
> +import tempfile
> +import time
> +import zipfile
> +from typing import (
> +    List,
> +    Optional,
> +    Sequence,
> +)
> +from qemu.machine import QEMUMachine
> +from avocado import skipIf
> +from avocado_qemu import QemuBaseTest
> +
> +def _print_log(log):
> +    print('\nlogs from biosbits follows:')
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> +    print(log)
> +    print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n')
> +
> +class QEMUBitsMachine(QEMUMachine): # pylint: disable=3Dtoo-few-public-m=
ethods
> +    """
> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> +    using -cdrom to QEMU commandline.
> +
> +    """
> +    def __init__(self,
> +                 binary: str,
> +                 args: Sequence[str] =3D (),
> +                 wrapper: Sequence[str] =3D (),
> +                 name: Optional[str] =3D None,
> +                 base_temp_dir: str =3D "/var/tmp",
> +                 debugcon_log: str =3D "debugcon-log.txt",
> +                 debugcon_addr: str =3D "0x403",
> +                 sock_dir: Optional[str] =3D None,
> +                 qmp_timer: Optional[float] =3D None):
> +        # pylint: disable=3Dtoo-many-arguments
> +
> +        if name is None:
> +            name =3D "qemu-bits-%d" % os.getpid()
> +        if sock_dir is None:
> +            sock_dir =3D base_temp_dir
> +        super().__init__(binary, args, wrapper=3Dwrapper, name=3Dname,
> +                         base_temp_dir=3Dbase_temp_dir,
> +                         sock_dir=3Dsock_dir, qmp_timer=3Dqmp_timer)
> +        self.debugcon_log =3D debugcon_log
> +        self.debugcon_addr =3D debugcon_addr
> +        self.base_temp_dir =3D base_temp_dir
> +
> +    @property
> +    def _base_args(self) -> List[str]:
> +        args =3D super()._base_args
> +        args.extend([
> +            '-chardev',
> +            'file,path=3D%s,id=3Ddebugcon' %os.path.join(self.base_temp_=
dir,
> +                                                     self.debugcon_log),
> +            '-device',
> +            'isa-debugcon,iobase=3D%s,chardev=3Ddebugcon' %self.debugcon=
_addr,
> +        ])
> +        return args
> +
> +    def base_args(self):
> +        """return the base argument to QEMU binary"""
> +        return self._base_args
> +
> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +class AcpiBitsTest(QemuBaseTest): #pylint: disable=3Dtoo-many-instance-a=
ttributes
> +    """
> +    ACPI and SMBIOS tests using biosbits.
> +
> +    :avocado: tags=3Darch:x86_64
> +    :avocado: tags=3Dacpi
> +
> +    """
> +    def __init__(self, *args, **kwargs):
> +        super().__init__(*args, **kwargs)
> +        self._vm =3D None
> +        self._workDir =3D None
> +        self._baseDir =3D None
> +
> +        # following are some standard configuration constants
> +        self._bitsInternalVer =3D 2020
> +        self._bitsCommitHash =3D 'b972c69d' # commit hash must match
> +                                          # the artifact tag below
> +        self._bitsTag =3D "qemu-bits-09272022" # this is the latest bits
> +                                             # release as of today.
> +        self._bitsArtSHA1Hash =3D '6915ad4781de0d80d1a099438a4cb4bd9e12d=
f70'
> +        self._bitsArtURL =3D ("https://gitlab.com/qemu-project/"
> +                            "biosbits-bits/-/jobs/artifacts/%s/"
> +                            "download?job=3Dqemu-bits-build" %self._bits=
Tag)
> +        self._debugcon_addr =3D '0x403'
> +        self._debugcon_log =3D 'debugcon-log.txt'
> +        logging.basicConfig(level=3Dlogging.INFO)
> +
> +    def copy_bits_config(self):
> +        """ copies the bios bits config file into bits.
> +        """
> +        config_file =3D 'bits-cfg.txt'
> +        bits_config_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> +                                       'bits-config')
> +        target_config_dir =3D os.path.join(self._workDir,
> +                                         'bits-%d' %self._bitsInternalVe=
r,
> +                                         'boot')
> +        self.assertTrue(os.path.exists(bits_config_dir))
> +        self.assertTrue(os.path.exists(target_config_dir))
> +        self.assertTrue(os.access(os.path.join(bits_config_dir,
> +                                               config_file), os.R_OK))
> +        shutil.copy2(os.path.join(bits_config_dir, config_file),
> +                     target_config_dir)
> +        logging.info('copied config file %s to %s',
> +                     config_file, target_config_dir)
> +
> +    def copy_test_scripts(self):
> +        """copies the python test scripts into bits. """
> +
> +        bits_test_dir =3D os.path.join(self._baseDir, 'acpi-bits',
> +                                     'bits-tests')
> +        target_test_dir =3D os.path.join(self._workDir,
> +                                       'bits-%d' %self._bitsInternalVer,
> +                                       'boot', 'python')
> +
> +        self.assertTrue(os.path.exists(bits_test_dir))
> +        self.assertTrue(os.path.exists(target_test_dir))
> +
> +        for filename in os.listdir(bits_test_dir):
> +            if os.path.isfile(os.path.join(bits_test_dir, filename)) and=
 \
> +               filename.endswith('.py2'):
> +                # all test scripts are named with extension .py2 so that
> +                # avocado does not try to load them. These scripts are
> +                # written for python 2.7 not python 3 and hence if avoca=
do
> +                # loaded them, it would complain about python 3 specific
> +                # syntaxes.
> +                newfilename =3D os.path.splitext(filename)[0] + '.py'
> +                shutil.copy2(os.path.join(bits_test_dir, filename),
> +                             os.path.join(target_test_dir, newfilename))
> +                logging.info('copied test file %s to %s',
> +                             filename, target_test_dir)
> +
> +                # now remove the pyc test file if it exists, otherwise t=
he
> +                # changes in the python test script won't be executed.
> +                testfile_pyc =3D os.path.splitext(filename)[0] + '.pyc'
> +                if os.access(os.path.join(target_test_dir, testfile_pyc),
> +                             os.F_OK):
> +                    os.remove(os.path.join(target_test_dir, testfile_pyc=
))
> +                    logging.info('removed compiled file %s',
> +                                 os.path.join(target_test_dir, testfile_=
pyc))
> +
> +    def fix_mkrescue(self, mkrescue):
> +        """ grub-mkrescue is a bash script with two variables, 'prefix' =
and
> +            'libdir'. They must be pointed to the right location so that=
 the
> +            iso can be generated appropriately. We point the two variabl=
es to
> +            the directory where we have extracted our pre-built bits grub
> +            tarball.
> +        """
> +        grub_x86_64_mods =3D os.path.join(self._workDir, 'grub-inst-x86_=
64-efi')
> +        grub_i386_mods =3D os.path.join(self._workDir, 'grub-inst')
> +
> +        self.assertTrue(os.path.exists(grub_x86_64_mods))
> +        self.assertTrue(os.path.exists(grub_i386_mods))
> +
> +        new_script =3D ""
> +        with open(mkrescue, 'r', encoding=3D'utf-8') as filehandle:
> +            orig_script =3D filehandle.read()
> +            new_script =3D re.sub('(^prefix=3D)(.*)',
> +                                r'\1"%s"' %grub_x86_64_mods,
> +                                orig_script, flags=3Dre.M)
> +            new_script =3D re.sub('(^libdir=3D)(.*)', r'\1"%s/lib"' %gru=
b_i386_mods,
> +                                new_script, flags=3Dre.M)
> +
> +        with open(mkrescue, 'w', encoding=3D'utf-8') as filehandle:
> +            filehandle.write(new_script)
> +
> +    def generate_bits_iso(self):
> +        """ Uses grub-mkrescue to generate a fresh bits iso with the pyt=
hon
> +            test scripts
> +        """
> +        bits_dir =3D os.path.join(self._workDir,
> +                                'bits-%d' %self._bitsInternalVer)
> +        iso_file =3D os.path.join(self._workDir,
> +                                'bits-%d.iso' %self._bitsInternalVer)
> +        mkrescue_script =3D os.path.join(self._workDir,
> +                                       'grub-inst-x86_64-efi', 'bin',
> +                                       'grub-mkrescue')

This seems wrong because it fails to find grub-mkrescue (which on my
system is in the PATH):

  =E2=9E=9C  which grub-mkrescue
  /usr/bin/grub-mkrescue

but because it can't find this it never works.

--=20
Alex Benn=C3=A9e

