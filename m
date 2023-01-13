Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E966A0CF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMdj-0008LF-Au; Fri, 13 Jan 2023 11:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pGMdU-0008G0-He
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pGMdS-0003TL-KW
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vkgd2woBpRo26uHCemMo9WU6F0+re3NfVWCPGzqP/EU=;
 b=fLARkXwA/fUhOIYN0/H/9g/dq/wdP0MMxjde+LoxCzDGlsVequPFzimlArrLs/jAXPn1VQ
 26+5lci1wyHFRC+sGiK/LhhhredzZrBqi8W0I7cCN7/xu0yZINWgyF6CxLXf5MEY/YlCqy
 9+96MJB5KP4CLkF2kkNfy85DECsL1gY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-HSEfzb3TOFKq8FWovA4xzA-1; Fri, 13 Jan 2023 11:10:28 -0500
X-MC-Unique: HSEfzb3TOFKq8FWovA4xzA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0047028edd264so15086209edb.20
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 08:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkgd2woBpRo26uHCemMo9WU6F0+re3NfVWCPGzqP/EU=;
 b=iALx1gRcB/eCrg+qxSwZqCkcSGrf53nHn5i0wpWltwnNJCGwTn7D86sluqFD4R2WzB
 tF2AzCOnC2PBRVk3tJ+7AqyKnA+IqIbRrAKLJfuoJx+U1fLgVUcfJHmrdYokA62h7LbJ
 tE7EjMH+sqNluZeG8pONDYTrUwLNzjRGrqX+ljg/16tf0osUzf+atRDCXsYllgDWdq7V
 VWtVcjp1yexYq80zS14YHqLAqB4vD3oluWDVixyQMi1gcHuyUk8T7eYgW4RbVXI35c4P
 PteEKRJP640wMmRx5bC/hNn0vQXNCYJIwmHFTsF2da7sSZijHB3v0ZYHVxPi4p9pmdzq
 rknw==
X-Gm-Message-State: AFqh2kr4Qy4xpF9X0xs0uH3S5jfCchBcjbHZDyz/lW9WQ66ZuMJbqdDR
 gaseKw2NTawgxNbuXnV4Rw86RToJcoVgrT0vMezBYU0Mpa79qPCeOS4cBDyPHvXWwD4eBAGWGub
 zgT+wFAALmjpu27gd0+qS4LK80oN1Y0E=
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id
 y21-20020a170906525500b007c16b1fe131mr5182862ejm.557.1673626225976; 
 Fri, 13 Jan 2023 08:10:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuI6EWHRTHJhlA+yPiHCo4lCfiHCMHEuJxBydbEE8YDc2epqn8Ydz2ynncktca6htPI8/ocbzCC+FWIMkLsjpY=
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id
 y21-20020a170906525500b007c16b1fe131mr5182840ejm.557.1673626225805; Fri, 13
 Jan 2023 08:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-5-alex.bennee@linaro.org>
In-Reply-To: <20230110173922.265055-5-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 13 Jan 2023 20:10:14 +0400
Message-ID: <CAMxuvazJc7Om2o1L+CjsuzK+ECq9aV-BOwi4afDfcGX7Jt6x6g@mail.gmail.com>
Subject: Re: [PATCH 04/26] tests/unit: drop hacky race avoidance in
 test-io-channel-command
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 John G Johnson <john.g.johnson@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000ad282405f22778fa"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000ad282405f22778fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 10, 2023 at 9:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> We don't need to play timing games to ensure one socat wins over the
> other, just create the fifo they both can use before spawning the
> processes. However in the process we need to disable two tests for
> Windows platforms as we don't have an abstraction for mkfifo().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/unit/test-io-channel-command.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/tests/unit/test-io-channel-command.c
> b/tests/unit/test-io-channel-command.c
> index 19f72eab96..425e2f5594 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -20,6 +20,8 @@
>
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>  #include "io/channel-command.h"
>  #include "io-channel-helpers.h"
>  #include "qapi/error.h"
> @@ -29,6 +31,7 @@
>
>  static char *socat =3D NULL;
>
> +#ifndef _WIN32
>

sigh, I give up trying to keep it running on windows then...

You can further cleanup #ifdef stuff it seems

 static void test_io_channel_command_fifo(bool async)
>  {
>      g_autofree gchar *tmpdir =3D
> g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>      QIOChannel *src, *dst;
>      QIOChannelTest *test;
>
> +    if (mkfifo(fifo, 0600)) {
> +        g_error("mkfifo: %s", strerror(errno));
> +    }
> +
>      src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **)
> srcargv,
>                                                      O_WRONLY,
>                                                      &error_abort));
> -    /* try to avoid a race to create the socket */
> -    g_usleep(1000);
> -
>      dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **)
> dstargv,
>                                                      O_RDONLY,
>                                                      &error_abort));
> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>      g_rmdir(tmpdir);
>  }
>
> -
>  static void test_io_channel_command_fifo_async(void)
>  {
>      if (!socat) {
> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>
>      test_io_channel_command_fifo(false);
>  }
> +#endif
>
>
>  static void test_io_channel_command_echo(bool async)
> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>
>      socat =3D g_find_program_in_path("socat");
>
> +#ifndef _WIN32
>      g_test_add_func("/io/channel/command/fifo/sync",
>                      test_io_channel_command_fifo_sync);
>      g_test_add_func("/io/channel/command/fifo/async",
>                      test_io_channel_command_fifo_async);
> +#endif
>      g_test_add_func("/io/channel/command/echo/sync",
>                      test_io_channel_command_echo_sync);
>      g_test_add_func("/io/channel/command/echo/async",
> --
> 2.34.1
>
>

--000000000000ad282405f22778fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 9:39 PM Ale=
x Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blan=
k">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">We don&#39;t need to play timing games to ensure o=
ne socat wins over the<br>
other, just create the fifo they both can use before spawning the<br>
processes. However in the process we need to disable two tests for<br>
Windows platforms as we don&#39;t have an abstraction for mkfifo().<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1403" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1403</a><br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-io-channel-command.c | 14 ++++++++++----<br>
=C2=A01 file changed, 10 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-chan=
nel-command.c<br>
index 19f72eab96..425e2f5594 100644<br>
--- a/tests/unit/test-io-channel-command.c<br>
+++ b/tests/unit/test-io-channel-command.c<br>
@@ -20,6 +20,8 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
+#include &lt;sys/stat.h&gt;<br>
=C2=A0#include &quot;io/channel-command.h&quot;<br>
=C2=A0#include &quot;io-channel-helpers.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -29,6 +31,7 @@<br>
<br>
=C2=A0static char *socat =3D NULL;<br>
<br>
+#ifndef _WIN32<br></blockquote><div><br></div><div>sigh, I give up trying =
to keep it running on windows then...</div><div><br></div><div>You can furt=
her cleanup #ifdef stuff it seems<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0static void test_io_channel_command_fifo(bool async)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autofree gchar *tmpdir =3D g_dir_make_tmp(&quot;qemu-=
test-io-channel.XXXXXX&quot;, NULL);<br>
@@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)<br=
>
=C2=A0 =C2=A0 =C2=A0QIOChannel *src, *dst;<br>
=C2=A0 =C2=A0 =C2=A0QIOChannelTest *test;<br>
<br>
+=C2=A0 =C2=A0 if (mkfifo(fifo, 0600)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_error(&quot;mkfifo: %s&quot;, strerror(errno=
));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0src =3D QIO_CHANNEL(qio_channel_command_new_spawn((cons=
t char **) srcargv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O_WRONLY,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort));<br>
-=C2=A0 =C2=A0 /* try to avoid a race to create the socket */<br>
-=C2=A0 =C2=A0 g_usleep(1000);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0dst =3D QIO_CHANNEL(qio_channel_command_new_spawn((cons=
t char **) dstargv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O_RDONLY,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort));<br>
@@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)<br>
=C2=A0 =C2=A0 =C2=A0g_rmdir(tmpdir);<br>
=C2=A0}<br>
<br>
-<br>
=C2=A0static void test_io_channel_command_fifo_async(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!socat) {<br>
@@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0test_io_channel_command_fifo(false);<br>
=C2=A0}<br>
+#endif<br>
<br>
<br>
=C2=A0static void test_io_channel_command_echo(bool async)<br>
@@ -124,10 +128,12 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0socat =3D g_find_program_in_path(&quot;socat&quot;);<br=
>
<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/fifo/sync&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_fifo_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/fifo/async&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_fifo_async);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/echo/sync&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0test_io_channel_command_echo_sync);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_func(&quot;/io/channel/command/echo/async&qu=
ot;,<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000ad282405f22778fa--


