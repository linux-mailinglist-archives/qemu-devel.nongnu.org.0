Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2172FA780
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:28:38 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YKT-00041J-RR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Xuf-0004Kk-NG
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:01:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Xuc-0007M3-Ax
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:01:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d26so17137042wrb.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NOuBFHusNf64Rlv9ZpOzWl+jAufp8me91HyAHOSdXbo=;
 b=Mq+NnthsBTx/HyMOH+p28xOmZxWq1q0Z6DKLjHjdlM+h9tnkTafWo8k51FECoGSuJQ
 lVVbjMPcMNzKuiXA8cxOO8pFlGYazhFvj1Z8GPfsQcfNCdv4ka83RzuZk+l9dFqwn56S
 wZuJhq84Q03KVIhBExf7G63BP4K8d2vFWdF4Bm0AiLtAP0mGkRaIFOk1ssI2tU13crNd
 0lalaU27+GGTu/GX6YlbSoIWoYan2/82ST1t7gqMYzoDysMa6UitA51U1PmyZdz2fCq5
 OFd40Wg+I4sQCmMhT2q21C5wPY4iabaLVanOwLCZsPn6l4CJU9HZvEGS/WraeiWMi3Uu
 Sh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NOuBFHusNf64Rlv9ZpOzWl+jAufp8me91HyAHOSdXbo=;
 b=WRX9H8RlQZ/CATcyHkgSDayi4FcDzXe2EBPdGPVMykWOvhJWCBbcUIEmtiMfjuHiCe
 KoOGNNbVTXuAx5r/mpUmlhHlWLW28cWu+YQrIyQ4QSN+pxe68wNH7K7B9sPH3tFEzN1q
 0c1lpxRojpNTVRMusC+2suHGapk719cx3GDLRnvKoXfq9jcuRCEkD9Hwkf2ncRsaZkpZ
 s9v2xHNiWTC48G8A4YMEmJlX106RxCAm6jrgHAa7+9r1grFzNz642JXa/ftcPEtSZIsA
 HTyOd8/Jxuyecyerl0Sw7F4fszPu+AZrr5juY7oZW3QclnEQIymy47HzgW3k7VLxMX9T
 I3Ug==
X-Gm-Message-State: AOAM532C9LE1eeJvzwhvScTyFFY6CArEl09hy6e554j9eG9iBnn7NPas
 /wkxgGxu1Oim8mZvBPvVTF4xJA==
X-Google-Smtp-Source: ABdhPJwOxaEssDB9ofrX7268596g84htSuPs/JiPi3PEOW0mmFVyoURCGRJDYeRkDap11GkyxbC5wA==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr408410wrn.141.1610989312329; 
 Mon, 18 Jan 2021 09:01:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u83sm27939521wmu.12.2021.01.18.09.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:01:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 626CC1FF7E;
 Mon, 18 Jan 2021 17:01:50 +0000 (GMT)
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
 <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
Date: Mon, 18 Jan 2021 16:54:19 +0000
In-reply-to: <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org>
Message-ID: <87pn22uqkh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi Jiaxun, Alex,
>
> On 1/12/21 3:07 AM, Jiaxun Yang wrote:
>> Test booting of PMON bootloader on loongson3-virt platform.
>>=20
>> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
>>     avocado --show=3Dapp,console \
>>       run -t machine:loongson3-virt tests/acceptance
>> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoon=
gson3v.test_pmon_serial_console
>> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
>> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e20=
2b3/job.log
> ...
>> console: This software may be redistributed under the BSD copyright.
>> console: Copyright 2000-2002, Opsycon AB, Sweden.
>> console: Copyright 2005, ICT CAS.
>> console: CPU GODSON3 BogoMIPS: 1327
>> PASS (3.89 s)
>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
>> JOB TIME   : 4.38 s
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  MAINTAINERS                                 |  1 +
>>  tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 tests/acceptance/machine_mips_loongson3v.py
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4be087b88e..f38882f997 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
>>  F: hw/mips/loongson3_bootp.c
>>  F: hw/mips/loongson3_bootp.h
>>  F: hw/mips/loongson3_virt.c
>> +F: tests/acceptance/machine_mips_loongson3v.py
>>=20=20
>>  Boston
>>  M: Paul Burton <paulburton@kernel.org>
>> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/accepta=
nce/machine_mips_loongson3v.py
>> new file mode 100644
>> index 0000000000..17a85de69f
>> --- /dev/null
>> +++ b/tests/acceptance/machine_mips_loongson3v.py
>> @@ -0,0 +1,39 @@
>> +# Functional tests for the Generic Loongson-3 Platform.
>> +#
>> +# Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> 2021 Jiaxun Yang <jiaxun.yang@flygoat.com>? :D
>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import os
>> +import time
>> +
>> +from avocado import skipUnless
>> +from avocado_qemu import Test
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class MipsLoongson3v(Test):
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted c=
ode')
>
> The source code is published [1], you provided reproducible
> workflow [2] and a tag [3] with a public build artifacts [4],
> so my understanding is this is "trustable" binary.
>
> Alex, would it be OK to add this test without the UNTRUSTED tag
> (amending the links in the commit description)?

It's a subjective call. Having open source code is a minimum step to
being "trusted" but really the trust is in the community that hosts the
code. The upstream distros (e.g. Debian/Fedora) are trusted because
people install their software on their desktops and basically give the
software publisher root on their machines. There has to be a level of
trust that the distros won't abuse that to steal information from their
users.

I personally have no idea about the loongson community because it's not
one I interact with so I have no idea what sort of place it is. Is it a
code dump for semi-proprietary non-upstreamed kernels or is it a place
that has a good development culture with a sane security process that is
responsive to problems and moderately conservative with what they merge?

If you would trust your keys to a machine running this communities
software then by all means treated it as a trusted source.

>
> [1] https://github.com/loongson-community/pmon/
> [2]
> https://github.com/loongson-community/pmon/blob/master/.github/workflows/=
compile.yml
> [3] https://github.com/loongson-community/pmon/releases/tag/20210112
> [4] https://github.com/loongson-community/pmon/actions/runs/479132723
>
>> +    def test_pmon_serial_console(self):
>> +        """
>> +        :avocado: tags=3Darch:mips64el
>> +        :avocado: tags=3Dendian:little
>> +        :avocado: tags=3Dmachine:loongson3-virt
>> +        :avocado: tags=3Dcpu:Loongson-3A1000
>> +        :avocado: tags=3Ddevice:liointc
>> +        :avocado: tags=3Ddevice:goldfish_rtc
>> +        """
>> +
>> +        pmon_hash =3D '7c8b45dd81ccfc55ff28f5aa267a41c3'
>> +        pmon_path =3D self.fetch_asset('https://github.com/loongson-com=
munity/pmon/'
>> +                                    'releases/download/20210112/pmon-3a=
virt.bin',
>> +                                     asset_hash=3Dpmon_hash, algorithm=
=3D'md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', pmon_path)
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Sta=
ndby...')
>> +        wait_for_console_pattern(self, 'Copy PMON to execute location d=
one.')
>> +        wait_for_console_pattern(self, 'CPU GODSON3 BogoMIPS:')
>>=20


--=20
Alex Benn=C3=A9e

