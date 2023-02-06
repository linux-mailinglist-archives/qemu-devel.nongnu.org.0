Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDA68BD8D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1Hq-0005vf-TQ; Mon, 06 Feb 2023 08:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1Ho-0005ur-9G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:11:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1Hm-0008WH-9P
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:11:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so7257140wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBHd6oowphx/8jlgw8MWsApgsdNZuFQ0EOyqUjAoTEk=;
 b=O09YquasKpTyLkeZTM9xD+MDRNR99oPzYOgGHmSWJsa/Za4ayyWpsw2eTLBCBtRm95
 Wgq8+dWREB6x+8xi4QHdJfcOhVkSkd/lp6/7+9Q44W3QI9EW6bGDFEzageXg7YFaINcP
 fv5ODckXSM7ajTE4xekk/GX9G5jCvoxEh9ySbVy2MR2CCpAGDUQx/37jSzDI8+tyRnNU
 x3ynW14IOcLZYc+sXHP86ZP/JQHHf792LFlQ2htykR1OjefE9HN5S0GbHmA0MOBikj/L
 fAnzqhDNoEVX4xs5fcsbMWTIbTHEW1+d9UNGVU2DlkUVpim7bNBOkwO8NE7UDbBwregQ
 51oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rBHd6oowphx/8jlgw8MWsApgsdNZuFQ0EOyqUjAoTEk=;
 b=UO/RpmzJ0OpHlqHNkVsG9LR/Jd38Ipnz0XI00U+XKfM1q4vBp/HfxmGaMFMIEDOOjL
 Q2D3PPFQnfGcu/G8lkhk/tKvWvbWVFl8VjUwPjm1hm7thyZyXBuPgqBQBfsc7DSgL3IX
 xGbC+Wyqf+7y5JNOEIwwEG7L+TpR7LR767puPaqikF5dy7pTo29ETaq0+rxQsAovr7sl
 VJKK8zCdwt7MWTOz6beqd9AEWM9OcYdHea1bII1+Fqp1K9pW400RVzQS/vVaQeOb1A5W
 4cv07uNnOOerE/K9fg2BAflyAcSYbvSbR0azP35RMaist/flZXzaj4QUnoEZGlUxhiws
 rEWw==
X-Gm-Message-State: AO0yUKWyvfPMHFq8t3Nrf4GUhfKCWCHJVBFptd5sVaNyQuxA7X9OE1Fp
 lg0IdG9ulb0G+I82P9RUmNAPNQ==
X-Google-Smtp-Source: AK7set+3pOc+cmLKBTScxZCLKJD/ySDkDUnDM63XAQ2jA3uDSlY74TCL06/J/TxCD64tlRn0OJJUQQ==
X-Received: by 2002:a05:600c:204e:b0:3db:66e:cfdd with SMTP id
 p14-20020a05600c204e00b003db066ecfddmr19032061wmg.9.1675689111032; 
 Mon, 06 Feb 2023 05:11:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003dc5b59ed7asm11595562wmq.11.2023.02.06.05.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:11:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 254EC1FFB7;
 Mon,  6 Feb 2023 13:11:50 +0000 (GMT)
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <20230126112250.2584701-5-alex.bennee@linaro.org>
 <adf22fcb-51a6-3194-4496-6a6878e9d498@linaro.org>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, Thomas Huth
 <thuth@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PULL 04/35] tests/unit: drop hacky race avoidance in
 test-io-channel-command
Date: Mon, 06 Feb 2023 13:11:21 +0000
In-reply-to: <adf22fcb-51a6-3194-4496-6a6878e9d498@linaro.org>
Message-ID: <87a61rq6p5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> Hi Alex, Thomas.
>
> On 26/1/23 12:22, Alex Benn=C3=A9e wrote:
>> We don't need to play timing games to ensure one socat wins over the
>> other, just create the fifo they both can use before spawning the
>> processes. However in the process we need to disable two tests for
>> Windows platforms as we don't have an abstraction for mkfifo().
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20230124180127.1881110-5-alex.bennee@linaro.org>
>> diff --git a/tests/unit/test-io-channel-command.c
>> b/tests/unit/test-io-channel-command.c
>> index 19f72eab96..425e2f5594 100644
>> --- a/tests/unit/test-io-channel-command.c
>> +++ b/tests/unit/test-io-channel-command.c
>> @@ -20,6 +20,8 @@
>>     #include "qemu/osdep.h"
>>   #include <glib/gstdio.h>
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>>   #include "io/channel-command.h"
>>   #include "io-channel-helpers.h"
>>   #include "qapi/error.h"
>> @@ -29,6 +31,7 @@
>>     static char *socat =3D NULL;
>>   +#ifndef _WIN32
>>   static void test_io_channel_command_fifo(bool async)
>>   {
>>       g_autofree gchar *tmpdir =3D g_dir_make_tmp("qemu-test-io-channel.=
XXXXXX", NULL);
>> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>>       QIOChannel *src, *dst;
>>       QIOChannelTest *test;
>>   +    if (mkfifo(fifo, 0600)) {
>> +        g_error("mkfifo: %s", strerror(errno));
>> +    }
>> +
>>       src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **) =
srcargv,
>>                                                       O_WRONLY,
>>                                                       &error_abort));
>> -    /* try to avoid a race to create the socket */
>> -    g_usleep(1000);
>> -
>>       dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **) =
dstargv,
>>                                                       O_RDONLY,
>>                                                       &error_abort));
>> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>
> Testing on Darwin/Aarch64 I'm getting (reproducible):
>
> 78/93 qemu:unit / test-io-channel-command             ERROR 2.38s
> killed by signal 13 SIGPIPE
>>>> MALLOC_PERTURB_=3D10 G_TEST_BUILDDIR=3D./tests/unit
>     G_TEST_SRCDIR=3Dtests/unit ./tests/unit/test-io-channel-command
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
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95
> stderr:
> 2023/02/03 08:26:49 socat[32507] E
> mkfifo(/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/qemu-test-io-chan=
nel.GMARZ1/test-io-channel-command.fifo,
> 438): File exists
>
> (test program exited with status code -13)
>
> TAP parsing error: Too few tests run (expected 4, got 0)
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
=80=95=E2=80=95
>
> We call g_rmdir(), but I see various qtests calling unlink()
> before rmdir(). Do we need it here?
>
> +       g_unlink(fifo);

Probably - the man page implies rmdir is expecting an empty directory.

>
>>       g_rmdir(tmpdir);
>>   }
>>   -
>>   static void test_io_channel_command_fifo_async(void)
>>   {
>>       if (!socat) {
>> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>>         test_io_channel_command_fifo(false);
>>   }
>> +#endif
>>       static void test_io_channel_command_echo(bool async)
>> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>>         socat =3D g_find_program_in_path("socat");
>>   +#ifndef _WIN32
>>       g_test_add_func("/io/channel/command/fifo/sync",
>>                       test_io_channel_command_fifo_sync);
>>       g_test_add_func("/io/channel/command/fifo/async",
>>                       test_io_channel_command_fifo_async);
>> +#endif
>>       g_test_add_func("/io/channel/command/echo/sync",
>>                       test_io_channel_command_echo_sync);
>>       g_test_add_func("/io/channel/command/echo/async",


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

