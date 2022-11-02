Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FC616E95
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 21:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqKJ0-0002C5-GT; Wed, 02 Nov 2022 16:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqKIv-0002A5-HN
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 16:25:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqKIt-0001U1-Rg
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 16:25:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id cl5so14523533wrb.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRPKbd9pb9ceP0SYU68jb7f/rckehKqU6lHpjGQVOEs=;
 b=IrenyQJAdciHrruZBSq4zIQRl2oQz3aK26xnYFj1N1vcOSBj3Q8OCdn4CY0HAVrkHC
 MxgAPpJjnQ7ptkR9ok2LB6DRkffcRrlEleYcgNNMYS1UPE8qkQ8tHiR/Q8rFGEECZ/v+
 DC9EXC1I0wNp4xTWm7SySbMA3sEujP2MMHy0t8MPfDEEpOqkXmT0TYXDyQpuC2CUZV35
 ysy+1iI2zjVwn9e8nHEZ8RI+L7oYMj9IUKg572FZtoOOTszuwAXIPIK+wCPNuNuLf/+U
 RFeZ/NCruA3k3wKJwv+xsCh8H2ntaRHKxL4LNz8jAC/FWIXXUinnTFiwwImOX7M/D7qI
 hoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tRPKbd9pb9ceP0SYU68jb7f/rckehKqU6lHpjGQVOEs=;
 b=E+7hI4e7YsrW07Jrr8nFlQl2sVCLjyEtqyknGaNMXah1QHOrF5T44C3hFcRX4gGWt7
 IzuUvziOMuAfTX0H41AH3zjeRRdvkImkRG5gGS8tqz7lrQ37a/Z03hR2V9SBqqiMdDV2
 zFQ6iyR08F3hbiTUWvRpBUpNiZ/Qt8AJtmAd5rl+5s/rmIhuDyxeCZomHBTRQKqkQnz5
 yygi58X9W6ZDA+NCejOij8jPuAkeYg0eJNKLJSCVmFeuOOmA8p2dlKBwcNehJ7YduPeA
 hSB4+2GDCYXvIKXrk7D7QWBLBOB4tqxdKnzFuBqqpuGbHqu1VIx0awYABoV8Xypbp/Ws
 QiCw==
X-Gm-Message-State: ACrzQf2P73gzRkSdBq9JLz7ZwENoLBJOuGVfmzcNpECovZAnB3IW6yIY
 MXvBUEK8Kg9Y3zXu2uBrwA0cFA==
X-Google-Smtp-Source: AMsMyM4qokaDKco5ubZ6QNtUb3tSSRfCaWgRz4yYke9WHX70uE74GbzOORz29vTewIXVbXOBFKYquA==
X-Received: by 2002:a5d:6b8d:0:b0:236:6d5d:bcbc with SMTP id
 n13-20020a5d6b8d000000b002366d5dbcbcmr15973794wrx.628.1667420737771; 
 Wed, 02 Nov 2022 13:25:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfcd04000000b002366dd0e030sm13882060wrm.68.2022.11.02.13.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:25:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D9C11FFB7;
 Wed,  2 Nov 2022 20:25:36 +0000 (GMT)
References: <20221101213937.21149-1-shentey@gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
Date: Wed, 02 Nov 2022 20:24:35 +0000
In-reply-to: <20221101213937.21149-1-shentey@gmail.com>
Message-ID: <875yfxkssf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Bernhard Beschow <shentey@gmail.com> writes:

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
=E2=80=99 may
> be used uninitialized [-Werror=3Dmaybe-uninitialized]
>    1333 | static G_GNUC_UNUSED inline void
> _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr !=3D none)
> (func) (*_ptr); } \
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

Another approach would be to drop the GString usage which is premature
and then we can allocate everything in order:

--8<---------------cut here---------------start------------->8---
modified   tests/unit/test-io-channel-command.c
@@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir =3D g_dir_make_tmp("qemu-test-io-channel.XXXX=
XX", NULL);
     g_autofree gchar *fifo =3D g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
-    g_autoptr(GString) srcargs =3D g_string_new(socat);
-    g_autoptr(GString) dstargs =3D g_string_new(socat);
-    g_auto(GStrv) srcargv;
-    g_auto(GStrv) dstargv;
+    g_autofree gchar *srcargs =3D g_strdup_printf("%s - PIPE:%s,wronly", s=
ocat, fifo);
+    g_autofree gchar *dstargs =3D g_strdup_printf("%s PIPE:%s,rdonly -", s=
ocat, fifo);
+    g_auto(GStrv) srcargv =3D g_strsplit(srcargs, " ", -1);
+    g_auto(GStrv) dstargv =3D g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
=20
-    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
-    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
-
-    srcargv =3D g_strsplit(srcargs->str, " ", -1);
-    dstargv =3D g_strsplit(dstargs->str, " ", -1);
-
     src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srca=
rgv,
                                                     O_WRONLY,
--8<---------------cut here---------------end--------------->8---




--=20
Alex Benn=C3=A9e

