Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33155BFEF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:57:27 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67yG-0002mr-LG
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67wD-00019L-Re
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67wB-0003ei-8w
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6A3uFy7yFjqIhMrvMESfWArCWb4U85pdLHoPX3DE7ro=;
 b=P5T2mEXUhjTWQOKLEvygzGFHGo/59nHmWfGzXCsvuoEZqJN1gyphWP83YsyR7MlNIjp4k5
 Fb69Q5SGLlHw4VKphSXPDsiavIbWLYbjH2a4bafpbTBALH6+1pUm5zjVuULoVf4zSipf5I
 wkJnArEJ1Ysj74rOVzEyKr/xLaQewwQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-JCtMTHGDOrK1PL30lA5rPg-1; Tue, 28 Jun 2022 05:55:11 -0400
X-MC-Unique: JCtMTHGDOrK1PL30lA5rPg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m20-20020a05600c4f5400b003a03aad6bdfso4790833wmq.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6A3uFy7yFjqIhMrvMESfWArCWb4U85pdLHoPX3DE7ro=;
 b=Xt2VcSDp/xxFBelkjwjr9zMY6BFmITY5DMmv/rmdPALqr2Uh6/lLAcwotx9G+q8jLR
 YPVRihER7GiqmZ7dS4Gidtrj5hrLPbTmfYcu84JL2KCXps9S5+LtZ6YK6z1OO4hLwFhO
 X/8BaBqeHSh5opjbbojKMKk6k3bO9MN4y8Vlkb5ccvWdQRFK2gIs9vej/MgSWjJ6J1Cj
 4qlA2NLXr5AfWnUJh9sCbB1mo5sP4HntZszPMj727ckWyVHvqRnJL7DUV75NUmqTQzD+
 n/mABsg6DtZLuMyCCp7i12nXo3BY0pnAQOrKMMlQH5xR/s5Y80NIvrcXonYC9vN6QNnT
 bxbQ==
X-Gm-Message-State: AJIora9i+l6YHHRmDnVYdBpIlibEl0Owq+MMlOyCC6g0ufumFKkYT1o2
 /awkwMTPL/8ZcYzu7MYZytk31YPrmNP4WaWWWbqFy9WMI9kOd7cQ8XN9BfccjWf3qp1B7RgyXb9
 DcsKVFcMav2JunF0=
X-Received: by 2002:a5d:43c7:0:b0:21d:1e01:e9ac with SMTP id
 v7-20020a5d43c7000000b0021d1e01e9acmr2394763wrr.187.1656410110405; 
 Tue, 28 Jun 2022 02:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQ5sDDgaAWbRDFTxeb98hEmumhmN2WCqk1liKnKzGZyHEfPI4LO+7SGi8PgttBjt8bAS7NOg==
X-Received: by 2002:a5d:43c7:0:b0:21d:1e01:e9ac with SMTP id
 v7-20020a5d43c7000000b0021d1e01e9acmr2394738wrr.187.1656410110099; 
 Tue, 28 Jun 2022 02:55:10 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 z9-20020adfec89000000b0021b89f8662esm12968921wrn.13.2022.06.28.02.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:55:09 -0700 (PDT)
Date: Tue, 28 Jun 2022 05:55:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 09/12] acpi/tests/bits: add acpi and smbios python tests
 that uses biosbits
Message-ID: <20220628055416-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-10-ani@anisinha.ca>
 <a9614691-5f79-fb77-1514-876deb487e98@redhat.com>
 <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
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

On Tue, Jun 28, 2022 at 12:56:52PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 12:50 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 27/06/2022 09.28, Ani Sinha wrote:
> > > This change adds python based qtest framework that can be used to run
> > > qtests from within a virtual environment. A bash script creates the virtual
> > > environment and then runs the python based tests from within that environment.
> > > All dependent python packages are installed in the virtual environment using
> > > pip module. QEMU python test modules are also available in the environment for
> > > spawning the QEMU based VMs.
> > >
> > > It also introduces QEMU acpi/smbios biosbits python test script which is run
> > > from within the python virtual environment.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >   tests/qtest/acpi-bits/acpi-bits-test-venv.sh |  59 ++++
> > >   tests/qtest/acpi-bits/acpi-bits-test.py      | 327 +++++++++++++++++++
> > >   tests/qtest/acpi-bits/meson.build            |  39 +++
> > >   tests/qtest/acpi-bits/requirements.txt       |   1 +
> > >   4 files changed, 426 insertions(+)
> > >   create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> > >   create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
> > >   create mode 100644 tests/qtest/acpi-bits/meson.build
> > >   create mode 100644 tests/qtest/acpi-bits/requirements.txt
> > >
> > > diff --git a/tests/qtest/acpi-bits/acpi-bits-test-venv.sh b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> > > new file mode 100644
> > > index 0000000000..124e03ce18
> > > --- /dev/null
> > > +++ b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> > > @@ -0,0 +1,59 @@
> > > +#!/usr/bin/env bash
> > > +# Generates a python virtual environment for the test to run.
> > > +# Then runs python test scripts from within that virtual environment.
> > > +#
> > > +# This program is free software; you can redistribute it and/or modify
> > > +# it under the terms of the GNU General Public License as published by
> > > +# the Free Software Foundation; either version 2 of the License, or
> > > +# (at your option) any later version.
> > > +#
> > > +# This program is distributed in the hope that it will be useful,
> > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > +# GNU General Public License for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public License
> > > +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > > +#
> > > +# Author: Ani Sinha <ani@anisinha.ca>
> > > +
> > > +set -e
> > > +
> > > +MYPATH=$(realpath ${BASH_SOURCE:-$0})
> > > +MYDIR=$(dirname $MYPATH)
> > > +
> > > +if [ -z "$QTEST_SOURCE_ROOT" ]; then
> > > +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
> > > +    echo " to the root of the qemu source tree."
> > > +    echo -n "This is required so that the test can find the "
> > > +    echo "python modules that it needs for execution."
> > > +    exit 1
> > > +fi
> > > +SRCDIR=$QTEST_SOURCE_ROOT
> > > +TESTSCRIPTS=("acpi-bits-test.py")
> > > +PIPCMD="-m pip -q --disable-pip-version-check"
> > > +# we need to save the old value of PWD before we do a change-dir later
> > > +QTEST_PWD=$PWD
> > > +
> > > +TESTS_PYTHON=/usr/bin/python3
> > > +TESTS_VENV_REQ=requirements.txt
> > > +
> > > +# sadly for pip -e and -t options do not work together.
> > > +# please see https://github.com/pypa/pip/issues/562
> > > +cd $MYDIR
> > > +
> > > +$TESTS_PYTHON -m venv .
> > > +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
> > > +[ -f $TESTS_VENV_REQ ] && \
> > > +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ
> > > +
> > > +# venv is activated at this point.
> > > +
> > > +# run the test
> > > +for testscript in ${TESTSCRIPTS[@]} ; do
> > > +    export QTEST_PWD; python3 $testscript
> > > +done
> > > +
> > > +cd $QTEST_PWD
> > > +
> > > +exit 0
> > > diff --git a/tests/qtest/acpi-bits/acpi-bits-test.py b/tests/qtest/acpi-bits/acpi-bits-test.py
> > > new file mode 100644
> > > index 0000000000..673567bf8e
> > > --- /dev/null
> > > +++ b/tests/qtest/acpi-bits/acpi-bits-test.py
> > > @@ -0,0 +1,327 @@
> > > +#!/usr/bin/env python3
> > > +# group: rw quick
> > > +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
> > > +# https://biosbits.org/
> > > +#
> > > +# This program is free software; you can redistribute it and/or modify
> > > +# it under the terms of the GNU General Public License as published by
> > > +# the Free Software Foundation; either version 2 of the License, or
> > > +# (at your option) any later version.
> > > +#
> > > +# This program is distributed in the hope that it will be useful,
> > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > +# GNU General Public License for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public License
> > > +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > > +#
> > > +# Some parts are slightly taken from qtest.py and iotests.py
> > > +#
> > > +# Authors:
> > > +#  Ani Sinha <ani@anisinha.ca>
> > > +
> > > +# pylint: disable=invalid-name
> > > +
> > > +"""
> > > +QEMU bios tests using biosbits available at
> > > +https://biosbits.org/.
> > > +"""
> > > +
> > > +import logging
> > > +import os
> > > +import re
> > > +import shutil
> > > +import subprocess
> > > +import sys
> > > +import tarfile
> > > +import tempfile
> > > +import time
> > > +import unittest
> > > +import zipfile
> > > +from typing import (
> > > +    List,
> > > +    Optional,
> > > +    Sequence,
> > > +)
> > > +from tap import TAPTestRunner
> > > +from qemu.machine import QEMUMachine
> > > +
> > > +QTESTQEMUPROG = os.getenv('QTEST_QEMU_BINARY')
> > > +QTEST_PWD = os.getenv('QTEST_PWD')
> > > +
> > > +def get_arch():
> > > +    """finds the arch from the qemu binary name"""
> > > +    match = re.search('.*qemu-system-(.*)', QTESTQEMUPROG)
> > > +    if match:
> > > +        return match.group(1)
> > > +    return 'x86_64'
> > > +
> > > +ARCH = get_arch()
> > > +
> > > +class QEMUBitsMachine(QEMUMachine):
> > > +    """
> > > +    A QEMU VM, with isa-debugcon enabled and bits iso passed
> > > +    using -cdrom to QEMU commandline.
> > > +    """
> > > +    def __init__(self,
> > > +                 binary: str,
> > > +                 args: Sequence[str] = (),
> > > +                 wrapper: Sequence[str] = (),
> > > +                 name: Optional[str] = None,
> > > +                 base_temp_dir: str = "/var/tmp",
> > > +                 debugcon_log: str = "debugcon-log.txt",
> > > +                 debugcon_addr: str = "0x403",
> > > +                 sock_dir: Optional[str] = None,
> > > +                 qmp_timer: Optional[float] = None):
> > > +        # pylint: disable=too-many-arguments
> > > +
> > > +        if name is None:
> > > +            name = "qemu-bits-%d" % os.getpid()
> > > +        if sock_dir is None:
> > > +            sock_dir = base_temp_dir
> > > +        super().__init__(binary, args, wrapper=wrapper, name=name,
> > > +                         base_temp_dir=base_temp_dir,
> > > +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
> > > +        self.debugcon_log = debugcon_log
> > > +        self.debugcon_addr = debugcon_addr
> > > +        self.base_temp_dir = base_temp_dir
> > > +
> > > +    @property
> > > +    def _base_args(self) -> List[str]:
> > > +        args = super()._base_args
> > > +        args.extend([
> > > +            '-chardev',
> > > +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
> > > +                                                     self.debugcon_log),
> > > +            '-device',
> > > +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
> > > +        ])
> > > +        return args
> >
> > So is this patch series *really* related to qtests? qtests are using a
> > special "accelerator" mode of QEMU where it gets launched with the "-qtest"
> > parameter. I can't see that you're using "-qtest" here or anywhere else, so
> > this rather looks like another framework to me to run python-based QEMU
> > tests (similar to the avocado tests).
> 
> yes you are right. This does not use or need the qtest accelerator
> because we are not inspecting the guest memory for anything.

Same is true for e.g. ./tests/qtest/bios-tables-test.c ...


> >
> > Thus if this is really not related to qtests, may I suggest to move this
> > into another folder instead? Maybe tests/pytests/acpi-bits or something similar?
> 
> The problem I faced with this test is that it does not quite fall into
> the qtest category. Nor does it fall into the integration test
> category. I asked Igor and he suggested I use the qtest framework.
> Should we invent a new class of tests then? How many such tests are we
> going to have in the future?  Lets see what others think.
> 
> >
> >   Thomas
> >


