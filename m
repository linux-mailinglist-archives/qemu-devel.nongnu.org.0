Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21262F2E7E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:58:23 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIJT-0003NU-2Z
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIAi-0002fE-AO
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:49:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIAg-0008SE-Co
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:49:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y187so1842186wmd.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KtF1kDmeekN8RrMks3Z3SQYKQ3qQcVCCN9mVtPL4JqU=;
 b=xqAFaKLiTgX99NfjbMhJn3mY0cbmyBjC6EATiWuVITKZDqQ2BtPzF0U9Ouyc1yaIiE
 3vg0u168FR1NB79PPfptE9SVCpA+EC+IT7ViGeiWcY5tCM7yXdje/j36K/GbTSyshFB9
 TAVvLnvNfCTfZ6VbXarPKG0zbpyqryhYg25yVGnJqjAzUjPBgZrRNrdlELdh8sWjzpEB
 b2JNBMIGzkbUxkgf5njt5WiBmHsOJPkTw6oKHZ1kpYNcLs20lmuDvrFVSo7Eyg6sWss9
 bD5hWdLd2Kg6Rh9oGtW0yxFDw1uAJZ91iwBknvR/FyclTXkjY2ZaCPfGbzI64xsAiqyD
 Nn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KtF1kDmeekN8RrMks3Z3SQYKQ3qQcVCCN9mVtPL4JqU=;
 b=A+cKUG86lIOUj/pFohxrbCPvaJovGFmDvr528w8iENMdMrV7ZSTjtsKULFjIK89/rc
 HPIry2IUwepdQbFeqzTTX+7l4PHL84wK8XrjObzt/7tvtgKTatLUV0Yq7FRUIH0291/y
 WUgmmDZA8n1DLXvhGu/u1eKyg0ZXIDZ7M8JWKbZi2DEBeO8tXHtqewVltWZVs21gwDi/
 cQQ9VqxJTpiR3/w/kPg/oiH8V1RE2l/5BX38XE8VUiboz7l8xV6DlsfZ6LgZuwG4T5az
 x5rpBMGZ/JToZm9NdG6UTR3fe1iHoN+yC055fM0LhgWlsyAV92YMED9Q+OHO14I8c+hW
 Bw3A==
X-Gm-Message-State: AOAM530/FlXttpsI61LcADZxjypUeulG3rCRjlCgEktds7q7m1f9nXkq
 gqcIpDUF3QceDj2n3JXL51tALw==
X-Google-Smtp-Source: ABdhPJzPy5Y1uX3bnWsGGKsWjHzz+dMUH0Dx3++vDjmIhniLE74omYuAhezIdJ/BnnDdD8VJhTQ87w==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr3249397wmm.110.1610452148820; 
 Tue, 12 Jan 2021 03:49:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i18sm4698917wrp.74.2021.01.12.03.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 03:49:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AB451FF7E;
 Tue, 12 Jan 2021 11:49:07 +0000 (GMT)
References: <20210108185645.86351-1-thuth@redhat.com>
 <20210112115305.1cd5b8c5.cohuck@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Fix race conditions in s390x tests &
 skip fedora on gitlab-CI
Date: Tue, 12 Jan 2021 11:32:44 +0000
In-reply-to: <20210112115305.1cd5b8c5.cohuck@redhat.com>
Message-ID: <877doinznw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cornelia Huck <cohuck@redhat.com> writes:

> On Fri,  8 Jan 2021 19:56:45 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>
>> There was a race condition in the first test where there was already the
>> "crw" output in the dmesg, but the "0.0.4711" entry has not been created
>> in the /sys fs yet. Fix it by waiting until it is there.
>>=20
>> The second test has even more problems on gitlab-CI. Even after adding s=
ome
>> more synchronization points (that wait for some messages in the "dmesg"
>> output to make sure that the modules got loaded correctly), there are st=
ill
>> occasionally some hangs in this test when it is running in the gitlab-CI.
>> So far I was unable to reproduce these hangs locally on my computer, so
>> this issue might take a while to debug. Thus disable the 2nd test in the
>> gitlab-CI until the problems are better understood and fixed.
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/accepta=
nce/machine_s390_ccw_virtio.py
>> index eccf26b262..4028c99afc 100644
>> --- a/tests/acceptance/machine_s390_ccw_virtio.py
>> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
>> @@ -12,6 +12,7 @@
>>  import os
>>  import tempfile
>>=20=20
>> +from avocado import skipIf
>>  from avocado_qemu import Test
>>  from avocado_qemu import exec_command_and_wait_for_pattern
>>  from avocado_qemu import wait_for_console_pattern
>> @@ -133,8 +134,10 @@ class S390CCWVirtioMachine(Test):
>>          self.vm.command('device_add', driver=3D'virtio-net-ccw',
>>                          devno=3D'fe.0.4711', id=3D'net_4711')
>>          self.wait_for_crw_reports()
>> -        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/device=
s/',
>> -                                          '0.0.4711')
>> +        exec_command_and_wait_for_pattern(self, 'for i in 1 2 3 4 5 6 7=
 ; do '
>> +                    'if [ -e /sys/bus/ccw/devices/*4711 ]; then break; =
fi ;'
>> +                    'sleep 1 ; done ; ls /sys/bus/ccw/devices/',
>> +                    '0.0.4711')
>
> I'm wondering whether we should introduce a generic helper function for
> "execute command repeatedly, if the expected result did not yet show
> up", or "wait for a file/directory to exist". It's probably not
> uncommon for a desired outcome to arrive asynchronously, and having a
> function for waiting/retrying could be handy.

We don't really want to encourage fragile shell scripts in the guest so
something that makes it easy to encode these loops in python. Currently
the _console_interaction helper fails the test if failure_message is
seen so I guess we need a slightly more liberal interaction which
accepts a command can fail so we can write something like:

  while True:
      if exec_command_and_check(self, "stat -t /sys/bus/ccw/devices/0.0.471=
1",
                                "/sys/bus/ccw/devices/0.0.4711"):
          break

?

>
>>          # and detach it again
>>          self.clear_guest_dmesg()
>>          self.vm.command('device_del', id=3D'net_4711')


--=20
Alex Benn=C3=A9e

