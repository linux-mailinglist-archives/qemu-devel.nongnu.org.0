Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F79612B2F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAAw-0005Pv-Hp; Sun, 30 Oct 2022 11:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1opAAu-0005PX-Qq
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1opAAr-0003OZ-Gf
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667143470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x2Iqa9GsdubnAw8s6HUINaof/NkVIN65kJWMkakPFLs=;
 b=gQRFuuS4BiD2VcWHHAz9j9TRjxyHLzKnE9EOCMmDX+yxyp8Hshpc21Jqj3YUXgfqP8gdOf
 7ET2ZiqtEX3jKvsK/7p2wx2KjxeYz+dF4tZPTzs4K0rK3GOgY1SmNDSV2phpyM/yNGxTL/
 SL62w/rtmvmGnGinN17JKGFG7fGcJyE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-yJMPfqpYONK2y7-42MsiOQ-1; Sun, 30 Oct 2022 11:24:25 -0400
X-MC-Unique: yJMPfqpYONK2y7-42MsiOQ-1
Received: by mail-io1-f71.google.com with SMTP id
 y10-20020a5d914a000000b00688fa7b2252so6778665ioq.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2Iqa9GsdubnAw8s6HUINaof/NkVIN65kJWMkakPFLs=;
 b=coxPuhazsInDw1pfDVqb0s+uFvbn1E1xTH0wXxdwmccfxtOndQsTJe8kHQ4252uUj1
 QUiBPX2UxD0a2MzwMAHvtFLJ4kyJObtssReRsZHB/zjFF/fTgIiTlnp2asJvvBu83WNc
 GtkqjO3o8NhIC0/Sjsh9cm/vNp61NJIY9WPzTSlB6bbvKcytcgeK6Y9KHExV6DDgCIsC
 iEyb0NeZniqn3io/HVgi+9ehW9mP2Nti47ijssjNStI3H6V2w5Cz/L3J0XVdELlp9g8H
 FRJKtD5nLlelzYH9Hx8zwXSUUn/I2DzWfOs9cTGQE5+13ba3Pl6G7yWLOX/hHpPhUtYT
 EbSg==
X-Gm-Message-State: ACrzQf3gQHL6Nm2dnNxUmq9wu0HWVcKdyuAP4yv5ppnGDFGw1AnFg95/
 4aR7eICC/gymMkcHQj9N+9/MA8TeMvKFZzh0+ER5NZYDFzkrPa11qPsJzveSJP96nxcpXXm7Jth
 ShIJALFdKiRkFx7uWd6hKUpKwru+R01E=
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr4711972iow.101.1667143464388; 
 Sun, 30 Oct 2022 08:24:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7W5z5EdNw9ZhUqnWDCmrfFYK6fBd+fHdsogVKx6Ldqjzvp3DpT6rrM2zAkZpDJ7oetVpKeLNU3z7bquLpvK1c=
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr4711960iow.101.1667143464108; Sun, 30
 Oct 2022 08:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
 <20221012160444.3762795-6-marcandre.lureau@redhat.com>
 <ca92f316-ccf6-1367-0514-531f58431349@weilnetz.de>
In-Reply-To: <ca92f316-ccf6-1367-0514-531f58431349@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 30 Oct 2022 19:24:12 +0400
Message-ID: <CAMxuvawiz4coNFHUoCirLrZt3RTOhk6uEzX9_4jDVsUA1AXXbg@mail.gmail.com>
Subject: Re: [PULL 5/7] io/command: use glib GSpawn,
 instead of open-coding fork/exec
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f7dc1b05ec42150d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f7dc1b05ec42150d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan

On Sat, Oct 29, 2022 at 11:12 PM Stefan Weil <sw@weilnetz.de> wrote:

> Am 12.10.22 um 18:04 schrieb marcandre.lureau@redhat.com:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Simplify qio_channel_command_new_spawn() with GSpawn API. This will
> > allow to build for WIN32 in the following patches.
> >
> > As pointed out by Daniel Berrang=C3=A9: there is a change in semantics =
here
> > too. The current code only touches stdin/stdout/stderr. Any other FDs
> > which do NOT have O_CLOEXEC set will be inherited. With the new code,
> > all FDs except stdin/out/err will be explicitly closed, because we don'=
t
> > set the flag G_SPAWN_LEAVE_DESCRIPTORS_OPEN. The only place we use
> > QIOChannelCommand today is the migration exec: protocol, and that is
> > only declared to use stdin/stdout.
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Message-Id: <20221006113657.2656108-5-marcandre.lureau@redhat.com>
> > ---
> >   include/io/channel-command.h |   2 +-
> >   io/channel-command.c         | 105 ++++++----------------------------=
-
> >   2 files changed, 19 insertions(+), 88 deletions(-)
> >
> > diff --git a/include/io/channel-command.h b/include/io/channel-command.=
h
> > index 305ac1d280..8dc58273c0 100644
> > --- a/include/io/channel-command.h
> > +++ b/include/io/channel-command.h
> > @@ -41,7 +41,7 @@ struct QIOChannelCommand {
> >       QIOChannel parent;
> >       int writefd;
> >       int readfd;
> > -    pid_t pid;
> > +    GPid pid;
>
>
> GPid is a pointer for Windows now. Therefore code like pid > 0 is no
> longer valid. As the new initial value is no longer -1, but 0 now, this
> patch might fix the code for Windows:
>
> diff --git a/io/channel-command.c b/io/channel-command.c
> index 74516252ba..8850a374f1 100644
> --- a/io/channel-command.c
> +++ b/io/channel-command.c
> @@ -175,7 +175,7 @@ static void qio_channel_command_finalize(Object *obj)
>           close(ioc->writefd);
>       }
>       ioc->writefd =3D ioc->readfd =3D -1;
> -    if (ioc->pid > 0) {
> +    if (ioc->pid !=3D 0) {
>           qio_channel_command_abort(ioc, NULL);
>           g_spawn_close_pid(ioc->pid);
>       }
>

Hmm, GPid is an "int" on unix, "void*" on windows. I think the current code
should work fine. Do you see really an issue? Your change looks correct to
me too, can you send a proper patch with details?

thanks


>
>
> >   };
> >
> >
> > diff --git a/io/channel-command.c b/io/channel-command.c
> > index 9f2f4a1793..f84d1f03a0 100644
> > --- a/io/channel-command.c
> > +++ b/io/channel-command.c
> > @@ -31,7 +31,7 @@
> >    * qio_channel_command_new_pid:
> >    * @writefd: the FD connected to the command's stdin
> >    * @readfd: the FD connected to the command's stdout
> > - * @pid: the PID of the running child command
> > + * @pid: the PID/HANDLE of the running child command
> >    * @errp: pointer to a NULL-initialized error object
> >    *
> >    * Create a channel for performing I/O with the
> > @@ -50,7 +50,7 @@
> >   static QIOChannelCommand *
> >   qio_channel_command_new_pid(int writefd,
> >                               int readfd,
> > -                            pid_t pid)
> > +                            GPid pid)
> >   {
> >       QIOChannelCommand *ioc;
> >
> > @@ -69,94 +69,24 @@ qio_channel_command_new_spawn(const char *const
> argv[],
> >                                 int flags,
> >                                 Error **errp)
> >   {
> > -    pid_t pid =3D -1;
> > -    int stdinfd[2] =3D { -1, -1 };
> > -    int stdoutfd[2] =3D { -1, -1 };
> > -    int devnull =3D -1;
> > -    bool stdinnull =3D false, stdoutnull =3D false;
> > -    QIOChannelCommand *ioc;
> > +    g_autoptr(GError) err =3D NULL;
> > +    GPid pid =3D 0;
> > +    GSpawnFlags gflags =3D G_SPAWN_CLOEXEC_PIPES |
> G_SPAWN_DO_NOT_REAP_CHILD;
> > +    int stdinfd =3D -1, stdoutfd =3D -1;
> >
> >       flags =3D flags & O_ACCMODE;
> > -
> > -    if (flags =3D=3D O_RDONLY) {
> > -        stdinnull =3D true;
> > -    }
> > -    if (flags =3D=3D O_WRONLY) {
> > -        stdoutnull =3D true;
> > -    }
> > -
> > -    if (stdinnull || stdoutnull) {
> > -        devnull =3D open("/dev/null", O_RDWR);
> > -        if (devnull < 0) {
> > -            error_setg_errno(errp, errno,
> > -                             "Unable to open /dev/null");
> > -            goto error;
> > -        }
> > -    }
> > -
> > -    if ((!stdinnull && !g_unix_open_pipe(stdinfd, FD_CLOEXEC, NULL)) |=
|
> > -        (!stdoutnull && !g_unix_open_pipe(stdoutfd, FD_CLOEXEC, NULL))=
)
> {
> > -        error_setg_errno(errp, errno,
> > -                         "Unable to open pipe");
> > -        goto error;
> > -    }
> > -
> > -    pid =3D qemu_fork(errp);
> > -    if (pid < 0) {
> > -        goto error;
> > -    }
> > -
> > -    if (pid =3D=3D 0) { /* child */
> > -        dup2(stdinnull ? devnull : stdinfd[0], STDIN_FILENO);
> > -        dup2(stdoutnull ? devnull : stdoutfd[1], STDOUT_FILENO);
> > -        /* Leave stderr connected to qemu's stderr */
> > -
> > -        if (!stdinnull) {
> > -            close(stdinfd[0]);
> > -            close(stdinfd[1]);
> > -        }
> > -        if (!stdoutnull) {
> > -            close(stdoutfd[0]);
> > -            close(stdoutfd[1]);
> > -        }
> > -        if (devnull !=3D -1) {
> > -            close(devnull);
> > -        }
> > -
> > -        execv(argv[0], (char * const *)argv);
> > -        _exit(1);
> > +    gflags |=3D flags =3D=3D O_WRONLY ? G_SPAWN_STDOUT_TO_DEV_NULL : 0=
;
> > +
> > +    if (!g_spawn_async_with_pipes(NULL, (char **)argv, NULL, gflags,
> NULL, NULL,
> > +                                  &pid,
> > +                                  flags =3D=3D O_RDONLY ? NULL : &stdi=
nfd,
> > +                                  flags =3D=3D O_WRONLY ? NULL : &stdo=
utfd,
> > +                                  NULL, &err)) {
> > +        error_setg(errp, "%s", err->message);
> > +        return NULL;
> >       }
> >
> > -    if (!stdinnull) {
> > -        close(stdinfd[0]);
> > -    }
> > -    if (!stdoutnull) {
> > -        close(stdoutfd[1]);
> > -    }
> > -
> > -    ioc =3D qio_channel_command_new_pid(stdinnull ? devnull : stdinfd[=
1],
> > -                                      stdoutnull ? devnull :
> stdoutfd[0],
> > -                                      pid);
> > -    trace_qio_channel_command_new_spawn(ioc, argv[0], flags);
> > -    return ioc;
> > -
> > - error:
> > -    if (devnull !=3D -1) {
> > -        close(devnull);
> > -    }
> > -    if (stdinfd[0] !=3D -1) {
> > -        close(stdinfd[0]);
> > -    }
> > -    if (stdinfd[1] !=3D -1) {
> > -        close(stdinfd[1]);
> > -    }
> > -    if (stdoutfd[0] !=3D -1) {
> > -        close(stdoutfd[0]);
> > -    }
> > -    if (stdoutfd[1] !=3D -1) {
> > -        close(stdoutfd[1]);
> > -    }
> > -    return NULL;
> > +    return qio_channel_command_new_pid(stdinfd, stdoutfd, pid);
> >   }
> >
> >   #else /* WIN32 */
> > @@ -221,7 +151,7 @@ static void qio_channel_command_init(Object *obj)
> >       QIOChannelCommand *ioc =3D QIO_CHANNEL_COMMAND(obj);
> >       ioc->readfd =3D -1;
> >       ioc->writefd =3D -1;
> > -    ioc->pid =3D -1;
> > +    ioc->pid =3D 0;
> >   }
> >
> >   static void qio_channel_command_finalize(Object *obj)
> > @@ -239,6 +169,7 @@ static void qio_channel_command_finalize(Object *ob=
j)
> >   #ifndef WIN32
> >           qio_channel_command_abort(ioc, NULL);
> >   #endif
> > +        g_spawn_close_pid(ioc->pid);
> >       }
> >   }
> >
>

--000000000000f7dc1b05ec42150d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Stefan<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 29, 2022 at 11:1=
2 PM Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 12.=
10.22 um 18:04 schrieb <a href=3D"mailto:marcandre.lureau@redhat.com" targe=
t=3D"_blank">marcandre.lureau@redhat.com</a>:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Simplify qio_channel_command_new_spawn() with GSpawn API. This will<br=
>
&gt; allow to build for WIN32 in the following patches.<br>
&gt;<br>
&gt; As pointed out by Daniel Berrang=C3=A9: there is a change in semantics=
 here<br>
&gt; too. The current code only touches stdin/stdout/stderr. Any other FDs<=
br>
&gt; which do NOT have O_CLOEXEC set will be inherited. With the new code,<=
br>
&gt; all FDs except stdin/out/err will be explicitly closed, because we don=
&#39;t<br>
&gt; set the flag G_SPAWN_LEAVE_DESCRIPTORS_OPEN. The only place we use<br>
&gt; QIOChannelCommand today is the migration exec: protocol, and that is<b=
r>
&gt; only declared to use stdin/stdout.<br>
&gt;<br>
&gt; Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@re=
dhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Message-Id: &lt;<a href=3D"mailto:20221006113657.2656108-5-marcandre.l=
ureau@redhat.com" target=3D"_blank">20221006113657.2656108-5-marcandre.lure=
au@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/io/channel-command.h |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0io/channel-command.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10=
5 ++++++-----------------------------<br>
&gt;=C2=A0 =C2=A02 files changed, 19 insertions(+), 88 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/io/channel-command.h b/include/io/channel-command=
.h<br>
&gt; index 305ac1d280..8dc58273c0 100644<br>
&gt; --- a/include/io/channel-command.h<br>
&gt; +++ b/include/io/channel-command.h<br>
&gt; @@ -41,7 +41,7 @@ struct QIOChannelCommand {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QIOChannel parent;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int writefd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int readfd;<br>
&gt; -=C2=A0 =C2=A0 pid_t pid;<br>
&gt; +=C2=A0 =C2=A0 GPid pid;<br>
<br>
<br>
GPid is a pointer for Windows now. Therefore code like pid &gt; 0 is no <br=
>
longer valid. As the new initial value is no longer -1, but 0 now, this <br=
>
patch might fix the code for Windows:<br>
<br>
diff --git a/io/channel-command.c b/io/channel-command.c<br>
index 74516252ba..8850a374f1 100644<br>
--- a/io/channel-command.c<br>
+++ b/io/channel-command.c<br>
@@ -175,7 +175,7 @@ static void qio_channel_command_finalize(Object *obj)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close(ioc-&gt;writef=
d);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ioc-&gt;writefd =3D ioc-&gt;readfd =3D -1;<b=
r>
-=C2=A0=C2=A0=C2=A0 if (ioc-&gt;pid &gt; 0) {<br>
+=C2=A0=C2=A0=C2=A0 if (ioc-&gt;pid !=3D 0) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qio_channel_command_=
abort(ioc, NULL);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_spawn_close_pid(io=
c-&gt;pid);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br></blockquote></div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">Hmm, GPid is an &quot;int&quot;=
 on unix, &quot;void*&quot; on windows. I think the current code should wor=
k fine. Do you see really an issue? Your change looks correct to me too, ca=
n you send a proper patch with details?</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">thanks<br></div><div class=3D"gmail_quote=
"><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/io/channel-command.c b/io/channel-command.c<br>
&gt; index 9f2f4a1793..f84d1f03a0 100644<br>
&gt; --- a/io/channel-command.c<br>
&gt; +++ b/io/channel-command.c<br>
&gt; @@ -31,7 +31,7 @@<br>
&gt;=C2=A0 =C2=A0 * qio_channel_command_new_pid:<br>
&gt;=C2=A0 =C2=A0 * @writefd: the FD connected to the command&#39;s stdin<b=
r>
&gt;=C2=A0 =C2=A0 * @readfd: the FD connected to the command&#39;s stdout<b=
r>
&gt; - * @pid: the PID of the running child command<br>
&gt; + * @pid: the PID/HANDLE of the running child command<br>
&gt;=C2=A0 =C2=A0 * @errp: pointer to a NULL-initialized error object<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Create a channel for performing I/O with the<br>
&gt; @@ -50,7 +50,7 @@<br>
&gt;=C2=A0 =C2=A0static QIOChannelCommand *<br>
&gt;=C2=A0 =C2=A0qio_channel_command_new_pid(int writefd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int readfd,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t pid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPid pid)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QIOChannelCommand *ioc;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -69,94 +69,24 @@ qio_channel_command_new_spawn(const char *const ar=
gv[],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 pid_t pid =3D -1;<br>
&gt; -=C2=A0 =C2=A0 int stdinfd[2] =3D { -1, -1 };<br>
&gt; -=C2=A0 =C2=A0 int stdoutfd[2] =3D { -1, -1 };<br>
&gt; -=C2=A0 =C2=A0 int devnull =3D -1;<br>
&gt; -=C2=A0 =C2=A0 bool stdinnull =3D false, stdoutnull =3D false;<br>
&gt; -=C2=A0 =C2=A0 QIOChannelCommand *ioc;<br>
&gt; +=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 GPid pid =3D 0;<br>
&gt; +=C2=A0 =C2=A0 GSpawnFlags gflags =3D G_SPAWN_CLOEXEC_PIPES | G_SPAWN_=
DO_NOT_REAP_CHILD;<br>
&gt; +=C2=A0 =C2=A0 int stdinfd =3D -1, stdoutfd =3D -1;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D flags &amp; O_ACCMODE;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (flags =3D=3D O_RDONLY) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdinnull =3D true;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (flags =3D=3D O_WRONLY) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdoutnull =3D true;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (stdinnull || stdoutnull) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 devnull =3D open(&quot;/dev/null&quot;, O=
_RDWR);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devnull &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unable to open /dev/null&quot;);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if ((!stdinnull &amp;&amp; !g_unix_open_pipe(stdinfd, F=
D_CLOEXEC, NULL)) ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!stdoutnull &amp;&amp; !g_unix_open_pipe=
(stdoutfd, FD_CLOEXEC, NULL))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;Unable to open pipe&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 pid =3D qemu_fork(errp);<br>
&gt; -=C2=A0 =C2=A0 if (pid &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (pid =3D=3D 0) { /* child */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup2(stdinnull ? devnull : stdinfd[0], ST=
DIN_FILENO);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup2(stdoutnull ? devnull : stdoutfd[1], =
STDOUT_FILENO);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Leave stderr connected to qemu&#39;s s=
tderr */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!stdinnull) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdinfd[0]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdinfd[1]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!stdoutnull) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdoutfd[0]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdoutfd[1]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devnull !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(devnull);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 execv(argv[0], (char * const *)argv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(1);<br>
&gt; +=C2=A0 =C2=A0 gflags |=3D flags =3D=3D O_WRONLY ? G_SPAWN_STDOUT_TO_D=
EV_NULL : 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!g_spawn_async_with_pipes(NULL, (char **)argv, NULL=
, gflags, NULL, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D=3D O_RDONLY ? N=
ULL : &amp;stdinfd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D=3D O_WRONLY ? N=
ULL : &amp;stdoutfd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, &amp;err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s&quot;, err-&gt;=
message);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (!stdinnull) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdinfd[0]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (!stdoutnull) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdoutfd[1]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ioc =3D qio_channel_command_new_pid(stdinnull ? devnull=
 : stdinfd[1],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdoutnull =
? devnull : stdoutfd[0],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pid);<br>
&gt; -=C2=A0 =C2=A0 trace_qio_channel_command_new_spawn(ioc, argv[0], flags=
);<br>
&gt; -=C2=A0 =C2=A0 return ioc;<br>
&gt; -<br>
&gt; - error:<br>
&gt; -=C2=A0 =C2=A0 if (devnull !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(devnull);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (stdinfd[0] !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdinfd[0]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (stdinfd[1] !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdinfd[1]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (stdoutfd[0] !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdoutfd[0]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (stdoutfd[1] !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(stdoutfd[1]);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 return qio_channel_command_new_pid(stdinfd, stdoutfd, p=
id);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#else /* WIN32 */<br>
&gt; @@ -221,7 +151,7 @@ static void qio_channel_command_init(Object *obj)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QIOChannelCommand *ioc =3D QIO_CHANNEL_COMMA=
ND(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ioc-&gt;readfd =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ioc-&gt;writefd =3D -1;<br>
&gt; -=C2=A0 =C2=A0 ioc-&gt;pid =3D -1;<br>
&gt; +=C2=A0 =C2=A0 ioc-&gt;pid =3D 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void qio_channel_command_finalize(Object *obj)<br>
&gt; @@ -239,6 +169,7 @@ static void qio_channel_command_finalize(Object *o=
bj)<br>
&gt;=C2=A0 =C2=A0#ifndef WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_command_abort(ioc,=
 NULL);<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_spawn_close_pid(ioc-&gt;pid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
</blockquote></div></div>

--000000000000f7dc1b05ec42150d--


