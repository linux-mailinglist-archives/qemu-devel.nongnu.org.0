Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65F60CCC6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:59:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJVr-0004MK-Dy; Tue, 25 Oct 2022 08:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJVo-0003vy-0x
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:58:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJVm-0005PO-4y
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:58:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bu30so20753804wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHHvRhxdAbx46aEaPpxTT0UvXcNySuBfk/mmu6SnRvc=;
 b=BaFPS2BJzZAeK1KOi/XmFJFBX7Z7ge7IsbkEp8pyOVrRVxp2w3/cJf+zmH+zl/SUv6
 7F9/MyXWR05x25YwKD86CJ6pKd2x6/Ioox+KEbN2yPEMlv4UqU/FPiY8EAyeTrujpRI6
 ZC9/173l+ubTlj00l7UTeh1T54k25Ak/EpegzEDDc44qjrk0xyX6XhNxpT+ZYHZUGIoo
 1bmxOURQvGaRNDclOXBCI8JirEUnk7d8kPmyMqUGlvenwc2II/pVd+jyHjOLTFvf8MV2
 /Kz4gLdUOmTbZZYh5sUO8WKdWL7WxCc7TZ4Zu/A8PBX2HZBdxecnS5zGVIXQITNaJ6m4
 1V7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zHHvRhxdAbx46aEaPpxTT0UvXcNySuBfk/mmu6SnRvc=;
 b=cGGu21fbjaUBO0dGSL3B7tLlaCu5xH+ISMcfoi8+5RsnBAxiaRXarSi9qgdvtyH9mN
 xyZne/FfSJY0YU+k8J16ES+zQvjIxxmveFcW9OtL/GbbG/o0a5yrzqUqgWGWv0LqhJfy
 9SiwgD+fuNN8ji6Ct30DqktxqduOIJyvpKo2+V12geNtUrksPjZbtenoKKmfoE7buUJW
 f/Hn3KGaO81hzGQ4pR+yAXxNI6D0zEyYxIZ4+IlnBs47WP0JHCt1gbqCSG1Frq1fdtUK
 OPg14WymGhAqs9Bi1zdjYexJk9AZmSHukuIetBOAEezrKKA4Tvc0jq5F0wuVtSyOdF0Y
 b2Vw==
X-Gm-Message-State: ACrzQf0kUDurfIW6EdBNEazRev9oVtQyMKN5o0KPtydnFU8sunI1/2pN
 EzpmU1fqTdD7l1K8+KNanLEfmxYpRhZ4kg==
X-Google-Smtp-Source: AMsMyM72y/JpfXDHgVbOmaHVTcGyhDQI4jAV6gxCWcvDfTLXcabjFk16DWb425yIshmFflXoCzo6KQ==
X-Received: by 2002:a05:6000:1d93:b0:22e:5d8a:c8f8 with SMTP id
 bk19-20020a0560001d9300b0022e5d8ac8f8mr25200822wrb.324.1666702707435; 
 Tue, 25 Oct 2022 05:58:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003c701c12a17sm10718936wma.12.2022.10.25.05.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:58:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CC5D1FFB7;
 Tue, 25 Oct 2022 13:58:26 +0100 (BST)
References: <20221025105520.3016-1-quintela@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juan Quintela <quintela@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Create fifo for test-io-channel-command
Date: Tue, 25 Oct 2022 13:57:23 +0100
In-reply-to: <20221025105520.3016-1-quintela@redhat.com>
Message-ID: <87mt9k6owd.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Juan Quintela <quintela@redhat.com> writes:

> Previous commit removed the creation of the fifo.  Without it, I get
> random failure during tests with high load, please consider
> reintroduce it.
>
> My guess is that there is a race between the two socats when we leave
> them to create the channel, better return to the previous behavior.
>
> I can't reproduce the problem when I run ./test-io-channel-command
> test alone, I need to do the make check.  And any (unrelated) change
> can make it dissapear.

I was chasing a similar problem with this test although I don't see it
timeout while running (I don't think our unit tests time out). I'm
provisionally queuing this to testing/next unless anyone objects.

>
> commit 76f5148c21b4543e62a6ad605ac4b44133421401
> Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Date:   Thu Oct 6 15:36:57 2022 +0400
>
>     tests/unit: make test-io-channel-command work on win32
>
>     This has been tested under msys2 & windows 11. I haven't tried to make
>     it work with other environments yet, but that should be enough to
>     validate the channel-command implementation anyway.
>
>     Here are the changes:
>     - drop tests/ from fifo/pipe path, to avoid directory issues
>     - use g_find_program() to lookup the socat executable (otherwise we
>     would need to change ChanneCommand to use G_SPAWN_SEARCH_PATH, and de=
al
>     with missing socat differently)
>     - skip the "echo" test when socat is missing as well
>
>     Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>     Message-Id: <20221006113657.2656108-7-marcandre.lureau@redhat.com>
>
> Failure:
>
> [178/178] =F0=9F=8C=93 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=94 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=95 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=96 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=97 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=98 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=91 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=92 qemu:unit / test-io-channel-command
> [178/178] =F0=9F=8C=93 qemu:unit / test-io-channel-command
> ^CWARNING: Received SIGTERM, exiting
> 178/178 qemu:unit / test-io-channel-command                              =
      INTERRUPT      1127.75s   killed by signal 15 SIGTERM
>>>> MALLOC_PERTURB_=3D149 G_TEST_BUILDDIR=3D/scratch/qemu/multifd/x64/test=
s/unit G_TEST_SRCDIR=3D/mnt/code/qemu/multifd/tests/unit /scratch/qemu/mult=
ifd/x64/tests/unit/test-io-channel-command --tap -k
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
> 2022/10/25 12:32:48 socat[463140] E mkfifo(test-io-channel-command.fifo, =
438): File exists
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
=95=E2=80=95=E2=80=95=E2=80=95
>
> Summary of Failures:
>
> 178/178 qemu:unit / test-io-channel-command                           INT=
ERRUPT      1127.75s   killed by signal 15 SIGTERM
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  tests/unit/test-io-channel-command.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-ch=
annel-command.c
> index 7eee939c07..7e75f960f4 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -48,6 +48,9 @@ static void test_io_channel_command_fifo(bool async)
>      }
>=20=20
>      unlink(TEST_FIFO);
> +    if (mkfifo(TEST_FIFO, 0600) < 0) {
> +        abort();
> +    }
>      src =3D QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
>                                                      O_WRONLY,
>                                                      &error_abort));


--=20
Alex Benn=C3=A9e

