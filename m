Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96168C12A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3EC-0006Ks-Io; Mon, 06 Feb 2023 10:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP3E9-0006Ji-4T
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:16:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP3E7-0002U7-8b
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:16:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n13so8911157wmr.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1To7rwcy9URXf81xLyGLzH05uoV172WcCp/SHRj686g=;
 b=gMXzrxclpRrN1Kgq+Bf8kEmOZEweu1+ZLBMaeYdEZcKVClmlKDgQaTfypFPh5YRBDL
 sY1ASmAXXS4gB7cHZEbs7VnabArmpj7p20AXH43EzEhT64I2qbrOeXRZSDuJ+GG8iHrM
 1xIdSOiOsDAvIzQaUsX0Me2Md2qseuG8ApkxQH5pTsLqoAJ58vTEAVoD6VnSJ6G9PIde
 8u09YFJk/1l+xQNSZcHWbsKtFL+y9aRDa9BAKiOjSaqvqcEfxDumyRUEgVGbfulQxIZL
 A+5GFCTc9DfQRoWRxmjUZpszCjJxSn7kWuvuc5gc2JdNrvaFxBrRsSj92cQ2AD//aZFJ
 0BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1To7rwcy9URXf81xLyGLzH05uoV172WcCp/SHRj686g=;
 b=iNBNrTBXW/EwC1rRqXx7hTFWlo0JLlNU3+TY6VBFVJzW6tjtR2up/oNpiom7FUf1W2
 xSTsfcdUGRR9jE+V3JjqmzJM0klGZeAVT7eQIMiQmnK/Ubdx3+r4QD09iR5Qaj53aHLk
 XZCLlbDG+vCx/+l2wgF2UmiKx5BHV37OUh8iZvpTUP9yv8x9af4M0qwbt/uHc9Rn9xl7
 8m2M2+SY72vw/u383fb8nM0RJw7ZvKsfoTB/j2ueIeSOC79e4HJxdn3PpaCRHdSUrBuO
 S05ko3NVRS13NOAFtSsAOyonKK8I9hAgyxIqHehKYeewH9KdDph4T4vq8PI3zf8YmSoH
 MjGQ==
X-Gm-Message-State: AO0yUKU2gQ3cjLSmkvrezUO4iHZU7x/uYY0rupTTR/+A30UEGc6oFuVq
 40bQxTIsvsVMN9CJ37x8Q/XPuw==
X-Google-Smtp-Source: AK7set9Ppc64NUj8SyMQh0QvB6CCGXAz28hUHv7V4q/I6ML+fsI45sm0+reN06+u4/6QTVTAJkJs0Q==
X-Received: by 2002:a05:600c:2ac8:b0:3dd:638d:bc31 with SMTP id
 t8-20020a05600c2ac800b003dd638dbc31mr53126wme.26.1675696572029; 
 Mon, 06 Feb 2023 07:16:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003dc433355aasm11819836wmn.18.2023.02.06.07.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:16:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2465E1FFB7;
 Mon,  6 Feb 2023 15:16:11 +0000 (GMT)
References: <20230206141051.4088777-1-alex.bennee@linaro.org>
 <3d76dc8b-0328-3159-3f52-ca8c86d14f7f@linaro.org>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [RFC PATCH] tests: be a bit more strict cleaning up fifos
Date: Mon, 06 Feb 2023 15:15:28 +0000
In-reply-to: <3d76dc8b-0328-3159-3f52-ca8c86d14f7f@linaro.org>
Message-ID: <87sffiq0xw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 6/2/23 15:10, Alex Benn=C3=A9e wrote:
>> When we re-factored we dropped the unlink() step which turns out to be
>> required for rmdir to do its thing. If we had been checking the return
>> value we would have noticed so lets do that with this fix.
>> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>   tests/unit/test-io-channel-command.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>> diff --git a/tests/unit/test-io-channel-command.c
>> b/tests/unit/test-io-channel-command.c
>> index 425e2f5594..c2179a6462 100644
>> --- a/tests/unit/test-io-channel-command.c
>> +++ b/tests/unit/test-io-channel-command.c
>> @@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
>>       g_auto(GStrv) dstargv =3D g_strsplit(dstargs, " ", -1);
>>       QIOChannel *src, *dst;
>>       QIOChannelTest *test;
>> +    int err;
>>         if (mkfifo(fifo, 0600)) {
>>           g_error("mkfifo: %s", strerror(errno));
>> @@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
>>       object_unref(OBJECT(src));
>>       object_unref(OBJECT(dst));
>>   -    g_rmdir(tmpdir);
>> +    err =3D g_unlink(fifo);
>> +    g_assert(err =3D=3D 0);
>> +    err =3D g_rmdir(tmpdir);
>> +    g_assert(err =3D=3D 0);
>>   }
>
> Thanks for the patch, but unfortunately this doesn't help:
>
> Unknown TAP version. The first line MUST be `TAP version <int>`.
> Assuming version 12.
>
> 71/93 qemu:unit / test-io-channel-command             ERROR 1.06s
> killed by signal 13 SIGPIPE
>>>> G_TEST_BUILDDIR=3D/Users/philmd/source/qemu/build/tests/unit
>     G_TEST_SRCDIR=3D/Users/philmd/source/qemu/tests/unit
>     MALLOC_PERTURB_=3D27
>     /Users/philmd/source/qemu/build/tests/unit/test-io-channel-command
>    --tap -k
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> =E2=9C=80
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> 2023/02/06 15:46:03 socat[88615] E read(5, 0x13480c000, 8192): Bad
> file descriptor
>
> (test program exited with status code -13)
>
> TAP parsing error: Too few tests run (expected 4, got 0)

Ahh that is a different error.

>
> $ tests/unit/test-io-channel-command
> # random seed: R02Se92d5500c30bbf1797b1047cd480607c
> 1..4
> # Start of io tests
> # Start of channel tests
> # Start of command tests
> # Start of fifo tests
> 2023/02/06 15:47:31 socat[88651] E read(5, 0x12000c000, 8192): Bad
> file descriptor
> $ echo $?
> 141
>
> Should we add 'socat' as testing dependency in lci-tool?

Yes, and maybe this is triggering on FreeBSD as well?

  https://cdn.artifacts.gitlab-static.net/7e/5d/7e5de39c75978325e6b9b68dd0f=
992f487a1c862c6dff2cc867723e4c306e820/2023_02_05/3717196650/4070740647/job.=
log?response-content-type=3Dtext%2Fplain%3B%20charset%3Dutf-8&response-cont=
ent-disposition=3Dinline&Expires=3D1675696399&KeyName=3Dgprd-artifacts-cdn&=
Signature=3DB4AVL9qee1_jd8hmwvEkyVepy38=3D

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

