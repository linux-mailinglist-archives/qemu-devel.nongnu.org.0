Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF76C5A6B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7RQ-0000LD-1Q; Wed, 22 Mar 2023 19:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf7RL-0000L0-UG
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:00:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf7RK-0004n0-6r
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:00:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id ew6so16366759edb.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 16:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679526016;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Gym5IZqBTtSJcck5TgrA/01/3mp3DYjZNIpkcy9Fq8=;
 b=QIlmmoYtrlWRHdklwpU3NoxlTnzJzxTya/P4nMI0UOMfwPvLkmCIUUW8E+dTKMngTI
 HLFumxSruoQXARX6r1B2UAyzqjPfsRA+47VUGSN0TvBiExCZpAn0KD28WHyUiKekb/LZ
 OlhhBzFsEgvvBQ44pXTFgMCgyGGbFlZaka32tfn7LnWQvFEY0usVWUpRXrMa72Fa4Ma/
 td3H1NWr0dr+uaMrtk0i5tbSOY3PVGIuL+jji9nFXg/Hoo91jvDWPJIGyLKxIsUOIuYx
 Yd0ndyvdK1scrsTOhv+WIX3B1MGJBwtvYqxdSfvO5DbEpMJOcKq4daTrl1I11cGkxAIs
 TrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679526016;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0Gym5IZqBTtSJcck5TgrA/01/3mp3DYjZNIpkcy9Fq8=;
 b=D++TcSBxtUvuP7zGRz6xa/91JBg/p2UcvAJOPSmtsI5T1RI1lpNgEpGZ6UrbtIhpSU
 AC5t5XdwwQ2K9oxHkg3j/iMzfXJEzktLyNAIU6TrTqRu7Y9+dme9af9CDmg5fkPO877W
 KHCJfdnzqdUY821/y/OXLIEGVW/L9Wucbf/dRk3x7yRyk89qJbvxcqBY0ZE1D6EWp3EE
 vMO3jL6R+0oLXEFieOZDbzzthXDn9wcvVXM6dxyfLeCJiZWZabOB9Ak9K0uAc6otTHqA
 KxKbwHKoZ1lXOf8iwAMAwHVvbq4EqwtK8MHKZuYQROG0JfWnQXsLBbQX0Pb3FCRQ/PML
 dzBQ==
X-Gm-Message-State: AO0yUKU0rWlT3mOesN3T6g2xuPC3Rz8rXJPLMxC4L1c2fR+JyvK/RSfx
 IfeMCy9TqxLEZbEvnu7xJHg/YxmZoB+7ywiB9vQ=
X-Google-Smtp-Source: AKy350YlGoFj8ju7kOBaCxV3RpCRYopwvTGXo3MturY8WheQr13I4TF2RAKYST++HOe+CPm1qeUhtQ==
X-Received: by 2002:a05:6000:180e:b0:2ce:a3c7:d2a4 with SMTP id
 m14-20020a056000180e00b002cea3c7d2a4mr791621wrh.25.1679522087147; 
 Wed, 22 Mar 2023 14:54:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b002c55521903bsm14650992wrt.51.2023.03.22.14.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 14:54:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 798251FFB7;
 Wed, 22 Mar 2023 21:54:46 +0000 (GMT)
References: <20230322163303.4115917-1-alex.bennee@linaro.org>
 <CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=sn4qv2YBen-pN3beU0Q@mail.gmail.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PULL v2 for 8.0 00/35] various fixes (testing, plugins, gitdm)
Date: Wed, 22 Mar 2023 21:54:30 +0000
In-reply-to: <CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=sn4qv2YBen-pN3beU0Q@mail.gmail.com>
Message-ID: <87355w5u55.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 22 Mar 2023 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit c283ff89d11ff123efc9af49128ef58511f73=
012:
>>
>>   Update version for v8.0.0-rc1 release (2023-03-21 17:15:43 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-220323-1
>>
>> for you to fetch changes up to e35b9a2e81ccce86db6f1417b1d73bb97d7cbc17:
>>
>>   qtests: avoid printing comments before g_test_init() (2023-03-22
>>   15:08:26 +0000)
>>
>> Note you will need to remove the old openbsd disk image to trigger a
>> rebuild that avoids the issues with -ENOSPC. My pipeline can be seen
>> here:
>>
>>   https://gitlab.com/stsquad/qemu/-/pipelines/814624909
>>
>> ----------------------------------------------------------------
>> Misc fixes for 8.0 (testing, plugins, gitdm)
>>
>>   - update Alpine image used for testing images
>>   - include libslirp in custom runner build env
>>   - update gitlab-runner recipe for CentOS
>>   - update docker calls for better caching behaviour
>>   - document some plugin callbacks
>>   - don't use tags to define drives for lkft baseline tests
>>   - fix missing clear of plugin_mem_cbs
>>   - fix iotests to report individual results
>>   - update the gitdm metadata for contributors
>>   - avoid printing comments before g_test_init()
>>   - probe for multiprocess support before running avocado test
>>   - refactor igb.py into netdev-ethtool.py avocado test
>>   - rebuild openbsd to have more space space for iotests
>
> I saw this on ppc64. I suspect it of being a pre-existing
> intermittent -- I'm retrying it.

On what platform is that?

>
> =E2=96=B6 737/761 qcow2 copy-before-write
>            FAIL
> 737/761 qemu:block / io-qcow2-copy-before-write
>            ERROR           6.80s   exit status 1
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> --- /home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write.out
> +++ /home/pm215/qemu/build/all/scratch/qcow2-file-copy-before-write/copy-=
before-write.out.bad
> @@ -1,5 +1,21 @@
> -....
> +..F.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FAIL: test_timeout_break_guest (__main__.TestCbwError.test_timeout_break=
_guest)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
> line 200, in test_timeout_break_guest
> +    self.assertEqual(log, """\
> +AssertionError: 'wrot[90 chars])\nwrote 524288/524288 bytes at offset
> 524288\[151 chars]c)\n' !=3D 'wrot[90 chars])\nwrite failed: Connection
> timed out\nread 10[85 chars]c)\n'
> +  wrote 524288/524288 bytes at offset 0
> +  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> ++ write failed: Connection timed out
> +- wrote 524288/524288 bytes at offset 524288
> +- 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +  read 1048576/1048576 bytes at offset 0
> +  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +
>  ----------------------------------------------------------------------
>  Ran 4 tests
>
> -OK
> +FAILED (failures=3D1)
>
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

