Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67925F3170
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:45:50 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLlV-0007QL-27
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLiN-00031l-Cg
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLiB-00027l-OE
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664804542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fbrX+u/KQIr27ulbJ/ZYW2AAvO4+nAlJ7OQHSavykTE=;
 b=U8/eYG/b/Kn08C8lpqBv3l8jCM1oKZQ3ZDs/3sijb/WZM/f/C6rdozJhYubC2zqXl1jthM
 LPWPuxsFZB6H0Bds+rOUAcTh39pdQsKN/rbe6EeG2FRF12uEjWCsk9mUE3SUuAqAh/BBdL
 fU0gB2Ly9p5jEGLB4pOFLrFPXu4Eyso=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-be3_b1DjOHS3FVcLKFDxdw-1; Mon, 03 Oct 2022 09:42:21 -0400
X-MC-Unique: be3_b1DjOHS3FVcLKFDxdw-1
Received: by mail-yb1-f200.google.com with SMTP id
 v17-20020a259d91000000b006b4c31c0640so10308154ybp.18
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fbrX+u/KQIr27ulbJ/ZYW2AAvO4+nAlJ7OQHSavykTE=;
 b=YGNxh8i24A6toHri3rdFl2HCWtNRaXz83FooDZMMxZOWAw5SCX2c3MrUnEEWv+F94v
 h3McNRW1dmaDziMrT9jie/uZoah1F+JU00kNWu8ocIADGBFiKzynllNaaViR2vnNowPp
 4MMvU8YsnAA2ZNjptzrsGfJ7xXT6AWYN3Cyg54giv17YYzrlfDNMYhbAg1JTXmuxZYAd
 sezY8I2Us5FUGStbBybz48De1WdfklJoQlAqbpCkNdfu3bEArFv6h04Ujbaa3Lk/r5T2
 KD3lkQA7lFo6kI38dovxwaXP9szUsQezoDGaMJrnhw33+pBmERI3jyHjArH7me+jXmwp
 /NDw==
X-Gm-Message-State: ACrzQf2PAVY7SOBKgpiGqv0Kz+iyDVqVxtMpb6FTYGzLHAvHhDfjAzdg
 qBAwyVEyH/rVPxz2MckXnpYREAWxVrvgkSI9ib2Km5qmaZGODrpKNuCCdSFcWkj9Kc3cAVE8c92
 lrWTWkfOwMoqJ2/bMgJS0i8TtAwOPfNo=
X-Received: by 2002:a5b:c8e:0:b0:6bb:f8b5:47ec with SMTP id
 i14-20020a5b0c8e000000b006bbf8b547ecmr19595570ybq.14.1664804540752; 
 Mon, 03 Oct 2022 06:42:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CCHO5zvTTHHp6ncr6TnCHUq/5tvmhRrR3CwQM9aL5oolooO+wUjtYk/Zl0oqp65HU+7yqkinJYZFR///hs0Y=
X-Received: by 2002:a5b:c8e:0:b0:6bb:f8b5:47ec with SMTP id
 i14-20020a5b0c8e000000b006bbf8b547ecmr19595407ybq.14.1664804538618; Mon, 03
 Oct 2022 06:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-2-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CLQszg1LuC66WuGbR0RQvzpRm=Amj+k+=kc=moFHpxQ8Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CLQszg1LuC66WuGbR0RQvzpRm=Amj+k+=kc=moFHpxQ8Q@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Oct 2022 16:42:07 +0300
Message-ID: <CAPMcbCpBxYf+vR7CPN1n1PqDN5nOY6UY0ZkgN4V8gaY-p1Sx6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] qga: Add initial FreeBSD support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org, 
 den@virtuozzo.com, michael.roth@amd.com
Content-Type: multipart/alternative; boundary="000000000000252aa005ea2183c4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000252aa005ea2183c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Oct 3, 2022 at 12:58 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
>
> On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov <
> alexander.ivanov@virtuozzo.com> wrote:
>
>> - Fix device path.
>> - Fix virtio-serial channel initialization.
>> - Make the code buildable in FreeBSD.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>
>
> Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>> ---
>>  meson.build          |  2 +-
>>  qga/channel-posix.c  | 19 +++++++++++++++++++
>>  qga/commands-posix.c |  8 ++++++++
>>  qga/main.c           |  6 +++++-
>>  4 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 8dc661363f..5c11abc8aa 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -75,7 +75,7 @@ have_tools =3D get_option('tools') \
>>    .allowed()
>>  have_ga =3D get_option('guest_agent') \
>>    .disable_auto_if(not have_system and not have_tools) \
>> -  .require(targetos in ['sunos', 'linux', 'windows'],
>> +  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>>             error_message: 'unsupported OS for QEMU guest agent') \
>>    .allowed()
>>  have_block =3D have_system or have_tools
>> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
>> index 6796a02cff..568350ded4 100644
>> --- a/qga/channel-posix.c
>> +++ b/qga/channel-posix.c
>> @@ -149,6 +149,25 @@ static gboolean ga_channel_open(GAChannel *c, const
>> gchar *path,
>>              return false;
>>          }
>>  #endif
>> +#ifdef __FreeBSD__
>> +        /*
>> +         * In the default state channel sends echo of every command to =
a
>> +         * client. The client programm doesn't expect this and raises a=
n
>> +         * error. Suppress echo by resetting ECHO terminal flag.
>> +         */
>> +        struct termios tio;
>> +        if (tcgetattr(fd, &tio) < 0) {
>> +            error_setg_errno(errp, errno, "error getting channel termio=
s
>> attrs");
>> +            close(fd);
>> +            return false;
>> +        }
>> +        tio.c_lflag &=3D ~ECHO;
>> +        if (tcsetattr(fd, TCSAFLUSH, &tio) < 0) {
>> +            error_setg_errno(errp, errno, "error setting channel termio=
s
>> attrs");
>> +            close(fd);
>> +            return false;
>> +        }
>> +#endif /* __FreeBSD__ */
>>          ret =3D ga_channel_client_add(c, fd);
>>          if (ret) {
>>              error_setg(errp, "error adding channel to main loop");
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index eea819cff0..16d67e9f6d 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -51,6 +51,14 @@
>>  #endif
>>  #endif
>>
>> +#ifdef __FreeBSD__
>> +/*
>> + * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBS=
D.
>> + * Fix it in one of the following patches.
>> + */
>> +#undef HAVE_GETIFADDRS
>> +#endif
>> +
>>  #ifdef HAVE_GETIFADDRS
>>  #include <arpa/inet.h>
>>  #include <sys/socket.h>
>> diff --git a/qga/main.c b/qga/main.c
>> index 5a9d8252e0..0d27c97d38 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -45,9 +45,13 @@
>>  #endif
>>
>>  #ifndef _WIN32
>> +#ifdef __FreeBSD__
>> +#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
>> +#else /* __FreeBSD__ */
>>  #define QGA_VIRTIO_PATH_DEFAULT
>> "/dev/virtio-ports/org.qemu.guest_agent.0"
>> -#define QGA_STATE_RELATIVE_DIR  "run"
>> +#endif /* __FreeBSD__ */
>>  #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
>> +#define QGA_STATE_RELATIVE_DIR  "run"
>>  #else
>>  #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
>>  #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
>> --
>> 2.34.1
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--000000000000252aa005ea2183c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3=
, 2022 at 12:58 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov &lt;<a href=3D"mailto=
:alexander.ivanov@virtuozzo.com" target=3D"_blank">alexander.ivanov@virtuoz=
zo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">- Fix device path.<br>
- Fix virtio-serial channel initialization.<br>
- Make the code buildable in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a>&gt;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0qga/channel-posix.c=C2=A0 | 19 +++++++++++++++++++<br>
=C2=A0qga/commands-posix.c |=C2=A0 8 ++++++++<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<b=
r>
=C2=A04 files changed, 33 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 8dc661363f..5c11abc8aa 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -75,7 +75,7 @@ have_tools =3D get_option(&#39;tools&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_ga =3D get_option(&#39;guest_agent&#39;) \<br>
=C2=A0 =C2=A0.disable_auto_if(not have_system and not have_tools) \<br>
-=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;],<br>
+=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;, &#39;freebsd&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;unsupported O=
S for QEMU guest agent&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_block =3D have_system or have_tools<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 6796a02cff..568350ded4 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -149,6 +149,25 @@ static gboolean ga_channel_open(GAChannel *c, const gc=
har *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In the default state channel sends ech=
o of every command to a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* client. The client programm doesn&#39;=
t expect this and raises an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* error. Suppress echo by resetting ECHO=
 terminal flag.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct termios tio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcgetattr(fd, &amp;tio) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error getting channel termios attrs&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tio.c_lflag &amp;=3D ~ECHO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcsetattr(fd, TCSAFLUSH, &amp;tio) &lt; 0)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error setting channel termios attrs&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif /* __FreeBSD__ */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ga_channel_client_add(c, fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;erro=
r adding channel to main loop&quot;);<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index eea819cff0..16d67e9f6d 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -51,6 +51,14 @@<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+/*<br>
+ * The code under HAVE_GETIFADDRS condition can&#39;t be compiled in FreeB=
SD.<br>
+ * Fix it in one of the following patches.<br>
+ */<br>
+#undef HAVE_GETIFADDRS<br>
+#endif<br>
+<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 5a9d8252e0..0d27c97d38 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -45,9 +45,13 @@<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifndef _WIN32<br>
+#ifdef __FreeBSD__<br>
+#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/vtcon/org.qemu.guest_agent.0&qu=
ot;<br>
+#else /* __FreeBSD__ */<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/virtio-ports/org.qemu.gues=
t_agent.0&quot;<br>
-#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
+#endif /* __FreeBSD__ */<br>
=C2=A0#define QGA_SERIAL_PATH_DEFAULT &quot;/dev/ttyS0&quot;<br>
+#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
=C2=A0#else<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;\\\\.\\Global\\org.qemu.guest_a=
gent.0&quot;<br>
=C2=A0#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;qemu-ga&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--000000000000252aa005ea2183c4--


