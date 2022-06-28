Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34555BF68
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:24:09 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66W0-0008VT-B5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65mL-0002ev-JD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o65mI-0005MR-GY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656401813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7yriasRyA2Z0KLvKl8RCp8eQUk97GFFzqa7kZipq8c=;
 b=KnPyggL8fahocF6hSctffGGr7jWrpXKzbFwICyYikpMbHmRg0lM85JdhxaOdkam1YmG24v
 VVTOogMXW1XCt/qSUqnUS+Luj1MfH/CQj54MFOmzCv1UfMADUTBnTSDe7kc5PiLXAdkmev
 zVnV6sCA0T0kLzntpBEi7VKLctBTxnQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621--GqjKZVJOYOZ7rxaiOZqWw-1; Tue, 28 Jun 2022 03:36:51 -0400
X-MC-Unique: -GqjKZVJOYOZ7rxaiOZqWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 e24-20020a05600c219800b003a0471b1904so3536046wme.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=F7yriasRyA2Z0KLvKl8RCp8eQUk97GFFzqa7kZipq8c=;
 b=ibWsWNjm32vjRuyiJ3SyxKYeKZp3laFN9llA/GAKAKddGdxqK4P0nUWAAJcJhtMgT0
 VZ/7yPg592ljTtN6mYQ01apDWxO7nGdPFY6wf2VL8dTcr3pBbFHeF4Sd8lcbdEbpOOGr
 wX5ryKz83CbdonPx0W1xnVih5vrhT5Bf4c470JtLCWXmss2kgLBydm7qbIYpf6p6OD0+
 eGghQaf1wp002xnJQCe4NmTm38TnKhN7Do9CzOXozNtNRYIR0ksiEBm/9bOKtcl2XXmc
 Y5PMI1iHKR/2muuCcHwGhlvLhTzA093Zid8iHnYurd8/ozEY9vzrJ9NHGxslRVJZjnYw
 PIdg==
X-Gm-Message-State: AJIora+rT2CH6UDHEKc+fYI8NEOumzuyBFQ1WU9Nn6SqZz+YcrowKVlG
 7cJYuDdjfwLAcQbJ98QZf69BjC2oKS214+lxgmZ2lkKEGrf5yfI7JTGWlEMieJMhdEVYSVu0Q1B
 LxPr+aPOYZ6jM+iI=
X-Received: by 2002:a5d:4e83:0:b0:21b:9dee:d109 with SMTP id
 e3-20020a5d4e83000000b0021b9deed109mr16008543wru.430.1656401810651; 
 Tue, 28 Jun 2022 00:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uT+UKlE+hR1nHhDVnlinlYt57ZVndImyEE9cWoJSUDz7bowGcqwG78YVZJlliU90GArSKsvw==
X-Received: by 2002:a5d:4e83:0:b0:21b:9dee:d109 with SMTP id
 e3-20020a5d4e83000000b0021b9deed109mr16008500wru.430.1656401810152; 
 Tue, 28 Jun 2022 00:36:50 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j6-20020adff546000000b0021b862ad439sm15295375wrp.9.2022.06.28.00.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:36:49 -0700 (PDT)
Message-ID: <616054ea-1940-bb23-fdd5-1d28ebce3871@redhat.com>
Date: Tue, 28 Jun 2022 09:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, mst@redhat.com,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-10-ani@anisinha.ca>
 <a9614691-5f79-fb77-1514-876deb487e98@redhat.com>
 <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 09/12] acpi/tests/bits: add acpi and smbios python tests
 that uses biosbits
In-Reply-To: <CAARzgwz2oNiR56j7UYstEVweianLUwy8AqC5yRccyR2f4iWipA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/06/2022 09.26, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 12:50 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 27/06/2022 09.28, Ani Sinha wrote:
>>> This change adds python based qtest framework that can be used to run
>>> qtests from within a virtual environment. A bash script creates the virtual
>>> environment and then runs the python based tests from within that environment.
>>> All dependent python packages are installed in the virtual environment using
>>> pip module. QEMU python test modules are also available in the environment for
>>> spawning the QEMU based VMs.
>>>
>>> It also introduces QEMU acpi/smbios biosbits python test script which is run
>>> from within the python virtual environment.
>>>
>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>> ---
>>>    tests/qtest/acpi-bits/acpi-bits-test-venv.sh |  59 ++++
>>>    tests/qtest/acpi-bits/acpi-bits-test.py      | 327 +++++++++++++++++++
>>>    tests/qtest/acpi-bits/meson.build            |  39 +++
>>>    tests/qtest/acpi-bits/requirements.txt       |   1 +
>>>    4 files changed, 426 insertions(+)
>>>    create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
>>>    create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
>>>    create mode 100644 tests/qtest/acpi-bits/meson.build
>>>    create mode 100644 tests/qtest/acpi-bits/requirements.txt
>>>
>>> diff --git a/tests/qtest/acpi-bits/acpi-bits-test-venv.sh b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
>>> new file mode 100644
>>> index 0000000000..124e03ce18
>>> --- /dev/null
>>> +++ b/tests/qtest/acpi-bits/acpi-bits-test-venv.sh
>>> @@ -0,0 +1,59 @@
>>> +#!/usr/bin/env bash
>>> +# Generates a python virtual environment for the test to run.
>>> +# Then runs python test scripts from within that virtual environment.
>>> +#
>>> +# This program is free software; you can redistribute it and/or modify
>>> +# it under the terms of the GNU General Public License as published by
>>> +# the Free Software Foundation; either version 2 of the License, or
>>> +# (at your option) any later version.
>>> +#
>>> +# This program is distributed in the hope that it will be useful,
>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +# GNU General Public License for more details.
>>> +#
>>> +# You should have received a copy of the GNU General Public License
>>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>> +#
>>> +# Author: Ani Sinha <ani@anisinha.ca>
>>> +
>>> +set -e
>>> +
>>> +MYPATH=$(realpath ${BASH_SOURCE:-$0})
>>> +MYDIR=$(dirname $MYPATH)
>>> +
>>> +if [ -z "$QTEST_SOURCE_ROOT" ]; then
>>> +    echo -n "Please set QTEST_SOURCE_ROOT env pointing"
>>> +    echo " to the root of the qemu source tree."
>>> +    echo -n "This is required so that the test can find the "
>>> +    echo "python modules that it needs for execution."
>>> +    exit 1
>>> +fi
>>> +SRCDIR=$QTEST_SOURCE_ROOT
>>> +TESTSCRIPTS=("acpi-bits-test.py")
>>> +PIPCMD="-m pip -q --disable-pip-version-check"
>>> +# we need to save the old value of PWD before we do a change-dir later
>>> +QTEST_PWD=$PWD
>>> +
>>> +TESTS_PYTHON=/usr/bin/python3
>>> +TESTS_VENV_REQ=requirements.txt
>>> +
>>> +# sadly for pip -e and -t options do not work together.
>>> +# please see https://github.com/pypa/pip/issues/562
>>> +cd $MYDIR
>>> +
>>> +$TESTS_PYTHON -m venv .
>>> +$TESTS_PYTHON $PIPCMD install -e $SRCDIR/python/
>>> +[ -f $TESTS_VENV_REQ ] && \
>>> +    $TESTS_PYTHON $PIPCMD install -r $TESTS_VENV_REQ
>>> +
>>> +# venv is activated at this point.
>>> +
>>> +# run the test
>>> +for testscript in ${TESTSCRIPTS[@]} ; do
>>> +    export QTEST_PWD; python3 $testscript
>>> +done
>>> +
>>> +cd $QTEST_PWD
>>> +
>>> +exit 0
>>> diff --git a/tests/qtest/acpi-bits/acpi-bits-test.py b/tests/qtest/acpi-bits/acpi-bits-test.py
>>> new file mode 100644
>>> index 0000000000..673567bf8e
>>> --- /dev/null
>>> +++ b/tests/qtest/acpi-bits/acpi-bits-test.py
>>> @@ -0,0 +1,327 @@
>>> +#!/usr/bin/env python3
>>> +# group: rw quick
>>> +# Exercize QEMU generated ACPI/SMBIOS tables using biosbits,
>>> +# https://biosbits.org/
>>> +#
>>> +# This program is free software; you can redistribute it and/or modify
>>> +# it under the terms of the GNU General Public License as published by
>>> +# the Free Software Foundation; either version 2 of the License, or
>>> +# (at your option) any later version.
>>> +#
>>> +# This program is distributed in the hope that it will be useful,
>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +# GNU General Public License for more details.
>>> +#
>>> +# You should have received a copy of the GNU General Public License
>>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>> +#
>>> +# Some parts are slightly taken from qtest.py and iotests.py
>>> +#
>>> +# Authors:
>>> +#  Ani Sinha <ani@anisinha.ca>
>>> +
>>> +# pylint: disable=invalid-name
>>> +
>>> +"""
>>> +QEMU bios tests using biosbits available at
>>> +https://biosbits.org/.
>>> +"""
>>> +
>>> +import logging
>>> +import os
>>> +import re
>>> +import shutil
>>> +import subprocess
>>> +import sys
>>> +import tarfile
>>> +import tempfile
>>> +import time
>>> +import unittest
>>> +import zipfile
>>> +from typing import (
>>> +    List,
>>> +    Optional,
>>> +    Sequence,
>>> +)
>>> +from tap import TAPTestRunner
>>> +from qemu.machine import QEMUMachine
>>> +
>>> +QTESTQEMUPROG = os.getenv('QTEST_QEMU_BINARY')
>>> +QTEST_PWD = os.getenv('QTEST_PWD')
>>> +
>>> +def get_arch():
>>> +    """finds the arch from the qemu binary name"""
>>> +    match = re.search('.*qemu-system-(.*)', QTESTQEMUPROG)
>>> +    if match:
>>> +        return match.group(1)
>>> +    return 'x86_64'
>>> +
>>> +ARCH = get_arch()
>>> +
>>> +class QEMUBitsMachine(QEMUMachine):
>>> +    """
>>> +    A QEMU VM, with isa-debugcon enabled and bits iso passed
>>> +    using -cdrom to QEMU commandline.
>>> +    """
>>> +    def __init__(self,
>>> +                 binary: str,
>>> +                 args: Sequence[str] = (),
>>> +                 wrapper: Sequence[str] = (),
>>> +                 name: Optional[str] = None,
>>> +                 base_temp_dir: str = "/var/tmp",
>>> +                 debugcon_log: str = "debugcon-log.txt",
>>> +                 debugcon_addr: str = "0x403",
>>> +                 sock_dir: Optional[str] = None,
>>> +                 qmp_timer: Optional[float] = None):
>>> +        # pylint: disable=too-many-arguments
>>> +
>>> +        if name is None:
>>> +            name = "qemu-bits-%d" % os.getpid()
>>> +        if sock_dir is None:
>>> +            sock_dir = base_temp_dir
>>> +        super().__init__(binary, args, wrapper=wrapper, name=name,
>>> +                         base_temp_dir=base_temp_dir,
>>> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
>>> +        self.debugcon_log = debugcon_log
>>> +        self.debugcon_addr = debugcon_addr
>>> +        self.base_temp_dir = base_temp_dir
>>> +
>>> +    @property
>>> +    def _base_args(self) -> List[str]:
>>> +        args = super()._base_args
>>> +        args.extend([
>>> +            '-chardev',
>>> +            'file,path=%s,id=debugcon' %os.path.join(self.base_temp_dir,
>>> +                                                     self.debugcon_log),
>>> +            '-device',
>>> +            'isa-debugcon,iobase=%s,chardev=debugcon' %self.debugcon_addr,
>>> +        ])
>>> +        return args
>>
>> So is this patch series *really* related to qtests? qtests are using a
>> special "accelerator" mode of QEMU where it gets launched with the "-qtest"
>> parameter. I can't see that you're using "-qtest" here or anywhere else, so
>> this rather looks like another framework to me to run python-based QEMU
>> tests (similar to the avocado tests).
> 
> yes you are right. This does not use or need the qtest accelerator
> because we are not inspecting the guest memory for anything.
> 
>>
>> Thus if this is really not related to qtests, may I suggest to move this
>> into another folder instead? Maybe tests/pytests/acpi-bits or something similar?
> 
> The problem I faced with this test is that it does not quite fall into
> the qtest category. Nor does it fall into the integration test
> category. I asked Igor and he suggested I use the qtest framework.

My python-foo really lacks, so putting python stuff under tests/qtest where 
I'm the maintainer is a really bad idea ;-)

> Should we invent a new class of tests then? How many such tests are we
> going to have in the future?  Lets see what others think.

I think we want to have another folder under tests/ for python-based tests 
that do not use the avocado framework. John is working on better python 
bindings, and since we switched almost all other tests to the meson test 
runner now, the avocado-based tests (with their own test runner) rather feel 
like an oddball in the qemu test suite now, so I asume we will have more 
python-based tests in the future which will work without avocado.

The difficult question is - as always - to come up with a good name...

  - tests/pytest/
  - tests/integration/
  - tests/pyqmygoose/
  - ...

... I don't have a real good clue, as you can see ;-)

  Thomas


