Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6B615C7E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 07:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7cZ-00067g-Ro; Wed, 02 Nov 2022 02:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oq7cX-00065L-Dj; Wed, 02 Nov 2022 02:53:05 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oq7cV-0002m2-U8; Wed, 02 Nov 2022 02:53:05 -0400
Received: by mail-qk1-x72c.google.com with SMTP id z1so5282547qkl.9;
 Tue, 01 Nov 2022 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dp/2nM6BVLUxDbHyeuag7pf6BAWzYhb4v+1CK/rvnQg=;
 b=EogQ6/pJ+rlPf2un9b+JBE+0BpmYNxFdtZZFiHxIJwC6NWuffY5Yln9olyoQYuiBhQ
 1PikutjQn4YlJnwTgqjohKONyaBCDobQBOpoY0L8hNj//su4u8DdfIkev+1ebjX2YZ0/
 UwSY0N22cNxOH1h6Q8DT+V61axbTrCgLqlDZu13ksRDRFJqNer5rxhgS+cg28sGIF5uc
 Pk8gxrmxS5BoInJb7Xi023LAFaAY7PGzj32pz0AfhrVQelUBckPUHhgZHx4HL2UvfYoF
 gZ1uGx8HW99+KvuX6n6Iy5ar/0mmHE7rtoo8bEV+UbC9ZtLAwvMWqWKIG3w/EYfICfb8
 1npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dp/2nM6BVLUxDbHyeuag7pf6BAWzYhb4v+1CK/rvnQg=;
 b=VyBVYn37vfpDVrD+rj7NoYFT+qSl6h6+RWFRLBwoYhdrcBU/JAKZs49Kn+rhUQnHk5
 5vkVSJAb/AGws9+R/yM+X307+zKjukHp5+0iM7mOOvtqNDJeCQUOkNmNVLpNHqiSk8Z2
 +nYF53Mq8TAfi18f+swF9TwV/rDiGvnSekDZAPEvsD0sRjG02UDNOyvQcTT2bv2NYHPr
 aRGJpQa3KAqDaBkBcod3san2y9IYYMgATv0CgDlKdyjjPK+K1G9kgm6NBRRDPsYSM35a
 J9AlyCbbRw2aa09/1PCaDQLSQ5bhHAllNQLK4gTcKZTgpDLp6ueuFVVDGMtnHrUA4m/P
 rlGA==
X-Gm-Message-State: ACrzQf1iAgUXqay1yR9ftnJEubQUXZ3Pn33uM3W1OKjB58cLQclVk4qd
 LgWcNz5MV3f1ZkltVg01lyoQt0swQVP8u7rfb7A=
X-Google-Smtp-Source: AMsMyM4BFkHiLWhLLd7ZiMEsmtFNc71Oyxy300qNIJ9dXD1ostC8BAKkdxNGXhsuToF+JrORx5x0GADwVNaUT87t9aI=
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr16274168qkp.389.1667371981328; Tue, 01
 Nov 2022 23:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221101213937.21149-1-shentey@gmail.com>
In-Reply-To: <20221101213937.21149-1-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 2 Nov 2022 14:50:16 +0800
Message-ID: <CAEUhbmV7EeD9d+yZwYBBWvxx-C=CpNprq2iWUjd+fOomjU=PNw@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Nov 2, 2022 at 5:41 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> GCC issues a false positive warning, resulting in build failure with -Wer=
ror:
>
>   In file included from /usr/lib/glib-2.0/include/glibconfig.h:9,
>                    from /usr/include/glib-2.0/glib/gtypes.h:34,
>                    from /usr/include/glib-2.0/glib/galloca.h:34,
>                    from /usr/include/glib-2.0/glib.h:32,
>                    from ../src/include/glib-compat.h:32,
>                    from ../src/include/qemu/osdep.h:144,
>                    from ../src/tests/unit/test-io-channel-command.c:21:
>   /usr/include/glib-2.0/glib/gmacros.h: In function =E2=80=98test_io_chan=
nel_command_fifo=E2=80=99:
>   /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: =E2=80=98dstargv=
=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>    1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeNam=
e) (TypeName *_ptr) { if (*_ptr !=3D none) (func) (*_ptr); }     \
>         |                                                                =
                                         ^
>   ../src/tests/unit/test-io-channel-command.c:39:19: note: =E2=80=98dstar=
gv=E2=80=99 was declared here
>      39 |     g_auto(GStrv) dstargv;
>         |                   ^~~~~~~
>   /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: =E2=80=98srcargv=
=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>    1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeNam=
e) (TypeName *_ptr) { if (*_ptr !=3D none) (func) (*_ptr); }     \
>         |                                                                =
                                         ^
>   ../src/tests/unit/test-io-channel-command.c:38:19: note: =E2=80=98srcar=
gv=E2=80=99 was declared here
>      38 |     g_auto(GStrv) srcargv;
>         |                   ^~~~~~~
>   cc1: all warnings being treated as errors
>
> GCC version:
>
>   $ gcc --version
>   gcc (GCC) 12.2.0
>
> Fixes: 68406d10859385c88da73d0106254a7f47e6652e ('tests/unit: cleanups fo=
r test-io-channel-command')

The correct format is to have 12-digit hex number, instead of the
whole hash string.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  tests/unit/test-io-channel-command.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-ch=
annel-command.c
> index 43e29c8cfb..ba0717d3c3 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -35,8 +35,8 @@ static void test_io_channel_command_fifo(bool async)
>      g_autofree gchar *fifo =3D g_strdup_printf("%s/%s", tmpdir, TEST_FIF=
O);
>      g_autoptr(GString) srcargs =3D g_string_new(socat);
>      g_autoptr(GString) dstargs =3D g_string_new(socat);
> -    g_auto(GStrv) srcargv;
> -    g_auto(GStrv) dstargv;
> +    g_auto(GStrv) srcargv =3D NULL;
> +    g_auto(GStrv) dstargv =3D NULL;
>      QIOChannel *src, *dst;
>      QIOChannelTest *test;
>
> --
> 2.38.1
>
>

