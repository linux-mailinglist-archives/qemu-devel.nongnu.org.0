Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF8314E4B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:43:34 +0100 (CET)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9RQb-0002TG-9G
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9RPj-00023L-JW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 06:42:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9RPh-0008P1-Py
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 06:42:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so21279347wrz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jWLJYFpwAWH8DnDTuPVs2PpN1HOWQSt03oxbY5Fnzy8=;
 b=nRRb2wp0LRtdVePk3CMlFDZUEocHd9ohSR1gePyzmq7LWM6voCdm024RRtYWdgB4/Y
 7Ryo+TyWcaTaOag2qkQOSlpuODdl8SMjOHB4LwUyzUGCcPOu+ouRaHvTkkFYLrYQ8Her
 YxziHIT7h7BC743QX3+ogGbNKBFO+7IHXCG7MExec8C3F2WCum2LxSqhynDZS0sjc8jc
 L2V6I2yujRixUGVU9IuztP8lnC7b4B5V4MLkM89oIuFyVpK4yi/MT3n5igjiNDhoJX+3
 xVye+6JF8pAScQQpmdJi2bbWl+nx7WsuVTbDiLr2/WkAKqLO5qLkc+bFxChmgs+IJo3H
 yNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jWLJYFpwAWH8DnDTuPVs2PpN1HOWQSt03oxbY5Fnzy8=;
 b=owIlFNTMb27BTTFzVHDR7b4V0ZJ1fqtjGI8Grw/FgCjiGL5lM5zXvPOjiMEzAPD1s+
 P+tr3Qw+Md6MM95yn6+KDfY9Dj8JyDuZ77KOwO2Za9W4cWp+16RxdLtbDsFqwVDdP5ry
 QKc+djTl1XyrfSm5bGulV5pZ+26fAWuRGm+QynhCAAHcvjEwxDBtdN4JL+lzPhNqAQaJ
 7us5oGCURzTSIA6EHUS/eQjnMRVHe9uqi6bummRufIi5sAAx0zhGV3+qTfY0U70d4Oq6
 ijqIYoNpdtf04COb28TS5846IYXjFyLLgTzfMwuMR+7i9ZuJnFfnefwj5ugVf07E48Ol
 Ms4A==
X-Gm-Message-State: AOAM5323OwNzzaY/7M6WaBtrriZjl6qIPuK5hxvuLa7oeukOTqZh3xaa
 I1Ja2Q+svV71eMG8Xuqx/e2n2A==
X-Google-Smtp-Source: ABdhPJz7QqB2DUdDnKPJJnxwuBu8u/1SJ9pAxVq9EwBUV8c5OWC5a07X1mnCk4WJap0VS2UmkcPMNw==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr17773098wrr.361.1612870955838; 
 Tue, 09 Feb 2021 03:42:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm20832398wrn.60.2021.02.09.03.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 03:42:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E23B21FF7E;
 Tue,  9 Feb 2021 11:42:33 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com> <8735ycq80u.fsf@linaro.org>
 <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Date: Tue, 09 Feb 2021 11:24:09 +0000
In-reply-to: <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
Message-ID: <87k0rha2mu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Max Reitz <mreitz@redhat.com> writes:

> On 04.02.21 14:23, Alex Benn=C3=A9e wrote:
>>=20
>> Cleber Rosa <crosa@redhat.com> writes:
>>=20
>>> If the vmlinuz variable is set to anything that evaluates to True,
>>> then the respective arguments should be set.  If the variable contains
>>> an empty string, than it will evaluate to False, and the extra
>>> arguments will not be set.
>>>
>>> This keeps the same logic, but improves readability a bit.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   tests/acceptance/virtiofs_submounts.py | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/=
virtiofs_submounts.py
>>> index f1b49f03bb..f25a386a19 100644
>>> --- a/tests/acceptance/virtiofs_submounts.py
>>> +++ b/tests/acceptance/virtiofs_submounts.py
>>> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>>>=20=20=20
>>>           super(VirtiofsSubmountsTest, self).setUp(pubkey)
>>>=20=20=20
>>> -        if len(vmlinuz) > 0:
>>> +        if vmlinuz:
>>>               self.vm.add_args('-kernel', vmlinuz,
>>>                                '-append', 'console=3DttyS0 root=3D/dev/=
sda1')
>>=20
>> And this is were I gave up because I can't see how to run the test:
>>=20
>>    ./tests/venv/bin/avocado run ./tests/acceptance/virtiofs_submounts.py
>>    JOB ID     : b3d9bfcfcd603189a471bec7d770fca3b50a81ee
>>    JOB LOG    : /home/alex/avocado/job-results/job-2021-02-04T13.21-b3d9=
bfc/job.log
>>     (1/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest=
.test_pre_virtiofsd_set_up: CANCEL: vmlinuz parameter not set; you must poi=
nt it to a Linux kernel binary to test (to run this test with the on-image =
kernel, set it to an empty string) (0.00 s)
>>     (2/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest=
.test_pre_launch_set_up: CANCEL: vmlinuz parameter not set; you must point =
it to a Linux kernel binary to test (to run this test with the on-image ker=
nel, set it to an empty string) (0.00 s)
>>     (3/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest=
.test_post_launch_set_up: CANCEL: vmlinuz parameter not set; you must point=
 it to a Linux kernel binary
>>    to test (to run this test with the on-image kernel, set it to an empt=
y string) (0.00 s)
>>     (4/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest=
.test_post_mount_set_up: CANCEL: vmlinuz parameter not set; you must point =
it to a Linux kernel binary to test (to run this test with the on-image ker=
nel, set it to an empty string) (0.00 s)
>>     (5/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest=
.test_two_runs: CANCEL: vmlinuz parameter not set; you must point it to a L=
inux kernel binary to test (to run this test with the on-image kernel, set =
it to an empty string) (0.00 s)
>>    RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT =
0 | CANCEL 5
>>    JOB TIME   : 0.56 s
>>=20
>> Given the test seems to make assumptions about an environment being
>> setup for it I think we need some documentation somewhere about what
>> those pre-requisites are.
>
> I find the cancel message pretty clear, but then again it was me who=20
> wrote it...
>
> Either you point the vmlinuz parameter to some Linux kernel you built=20
> yourself, or you set it to the empty string to just use the kernel=20
> that=E2=80=99s part of the image.  Setting Avocado parameters is done via=
 -p,=20
> i.e. =E2=80=9C-p key=3Dvalue=E2=80=9D.  So in this case
> =E2=80=9C-p vmlinuz=3D/path/to/linux/build/arch/x86/boot/bzImage=E2=80=9D=
, or
> =E2=80=9C-p vmlinuz=3D''=E2=80=9D.
>
> Ideally, vmlinuz=3D'' would be the default, but there=E2=80=99s a problem=
 with=20
> that: I submitted this test along with the patches that added the=20
> required feature to the Linux kernel, so at that point that feature was=20
> not part of Linux.  That=E2=80=99s why you generally have to point it to =
a Linux=20
> kernel binary you built yourself that has this feature (5.10 does).

This is where it deviates from the rest of the check-acceptance tests.
Generally I don't have to worry about finding the right image myself. At
the least it would be worth pointing to a part of our docs on how to
build such an image.

> Using vmlinuz=3D'' you can test it with the kernel that is part of the=20
> cloud image.  Once that kernel is sufficiently new (i.e., >=3D5.10), we=20
> can make that the default.

Good.

>
> Max


--=20
Alex Benn=C3=A9e

