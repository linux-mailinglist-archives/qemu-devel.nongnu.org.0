Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036015F3191
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:57:52 +0200 (CEST)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLx8-0003Kv-WF
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLjN-0004Y3-Q7
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ofLjK-0002Cb-Ij
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664804613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3nms61mGmebcvFl16RCmCIh8o6ePDlyJZ+ojnUvfo/0=;
 b=MGwIXFJs2JvPyLW7GASyG86q7GvcQv+dtLLlBoM7X2wGKJQLY03t/9KuaFI+v6NxcN7lth
 bgFTKc222VulCqyuN0VaaFgf0tcdvcEOlhECzckRoRtXypJ9ro9EjT1bYd5epYnf63CeVB
 2HRxj5cduW3/Is6vKRr54xfzA3H+3nA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-6qfpEupdMLSLcQLjAL-__w-1; Mon, 03 Oct 2022 09:43:32 -0400
X-MC-Unique: 6qfpEupdMLSLcQLjAL-__w-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-3576c47f204so63251657b3.2
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3nms61mGmebcvFl16RCmCIh8o6ePDlyJZ+ojnUvfo/0=;
 b=x+h4L8hpgF6axqeaVwqQvaWtoJTpu67p88Ma5S2oFUM6rakBMMUw7SmC43DszUWeBO
 Lz2lRLR0SaBzC1P/ntcix+Pelgk8vD591tOzHmiNaKpQrtEEVcfDJB5vN5m7auooyM76
 6e7WMdOzlTTUA32UVQRX7jXScJZ/Tm/hCGRC3rENie0LAoFzXFfgN4GdxDTOAHI/1w0u
 aUy2GOrbohL5cFNUWYYJjPP+Wd34L0uaum4Le73W2w1TRrk4ff74EwTSHbX4W1O/NxQp
 GWlZI+yeXrxEw8YflfIiDmfC67hmUESwrhPLeBxSe0F0sTQ2s8ekWEJhms1unS36Vlc/
 puvw==
X-Gm-Message-State: ACrzQf11fhJHFtWI6HsWFMXxIZSHsZQtn8iDeG6lMNu57biV09yYJmxo
 fcdGrOakXgWvjzmzhlFb5G8/V/8GTDoQ8QQrdgL9MOKUpRiozwR1FxD/j3LAOZZTfxzLhZeWWKJ
 lM2jAJtse8Q1BE+ZQcRVn6ELvcf3qFjY=
X-Received: by 2002:a5b:ccf:0:b0:6b3:ae46:1646 with SMTP id
 e15-20020a5b0ccf000000b006b3ae461646mr20128862ybr.74.1664804612012; 
 Mon, 03 Oct 2022 06:43:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sLj9k8/G+p19P75Swu0MMDa2fuO3PGD34iKZAde7TTKdhZAbI4JmLGqXUqQfxiIHWsPM9q0UI9lepv6voQa8=
X-Received: by 2002:a5b:ccf:0:b0:6b3:ae46:1646 with SMTP id
 e15-20020a5b0ccf000000b006b3ae461646mr20128847ybr.74.1664804611813; Mon, 03
 Oct 2022 06:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-6-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CJuZB04HhCXWZ_Mzb5NXyGnQpzZ+zOrRnNuruPSa3B_7A@mail.gmail.com>
In-Reply-To: <CAJ+F1CJuZB04HhCXWZ_Mzb5NXyGnQpzZ+zOrRnNuruPSa3B_7A@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Oct 2022 16:43:20 +0300
Message-ID: <CAPMcbCoSSb7yKtXaLsstGdbjDVHoJ=9AuhXGXjgjFVnd5tHmAA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] qga: Add support for user password setting in
 FreeBSD
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org, 
 den@virtuozzo.com, michael.roth@amd.com
Content-Type: multipart/alternative; boundary="0000000000008209d705ea218720"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--0000000000008209d705ea218720
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Oct 3, 2022 at 12:54 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
>
> On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov <
> alexander.ivanov@virtuozzo.com> wrote:
>
>> Move qmp_guest_set_user_password() from __linux__ condition to
>> (__linux__ || __FreeBSD__) condition. Add command and arguments
>> for password setting in FreeBSD.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>> ---
>>  qga/commands-posix.c | 35 +++++++++++++++++++++++++----------
>>  1 file changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 88e0d0fe24..f5b9e5c530 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2122,7 +2122,9 @@ int64_t
>> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>>
>>      return processed;
>>  }
>> +#endif /* __linux__ */
>>
>> +#if defined(__linux__) || defined(__FreeBSD__)
>>  void qmp_guest_set_user_password(const char *username,
>>                                   const char *password,
>>                                   bool crypted,
>> @@ -2156,10 +2158,15 @@ void qmp_guest_set_user_password(const char
>> *username,
>>          goto out;
>>      }
>>
>> +#ifdef __FreeBSD__
>> +    chpasswddata =3D g_strdup(rawpasswddata);
>> +    passwd_path =3D g_find_program_in_path("pw");
>> +#else
>>      chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata=
);
>> -    chpasswdlen =3D strlen(chpasswddata);
>> -
>>      passwd_path =3D g_find_program_in_path("chpasswd");
>> +#endif
>> +
>> +    chpasswdlen =3D strlen(chpasswddata);
>>
>>      if (!passwd_path) {
>>          error_setg(errp, "cannot find 'passwd' program in PATH");
>> @@ -2180,11 +2187,17 @@ void qmp_guest_set_user_password(const char
>> *username,
>>          reopen_fd_to_null(1);
>>          reopen_fd_to_null(2);
>>
>> +#ifdef __FreeBSD__
>> +        const char *h_arg;
>> +        h_arg =3D (crypted) ? "-H" : "-h";
>> +        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0",
>> NULL);
>> +#else
>>          if (crypted) {
>>              execl(passwd_path, "chpasswd", "-e", NULL);
>>          } else {
>>              execl(passwd_path, "chpasswd", NULL);
>>          }
>> +#endif
>>          _exit(EXIT_FAILURE);
>>      } else if (pid < 0) {
>>          error_setg_errno(errp, errno, "failed to create child process")=
;
>> @@ -2227,7 +2240,17 @@ out:
>>          close(datafd[1]);
>>      }
>>  }
>> +#else /* __linux__ || __FreeBSD__ */
>> +void qmp_guest_set_user_password(const char *username,
>> +                                 const char *password,
>> +                                 bool crypted,
>> +                                 Error **errp)
>> +{
>> +    error_setg(errp, QERR_UNSUPPORTED);
>> +}
>> +#endif /* __linux__ || __FreeBSD__ */
>>
>> +#ifdef __linux__
>>  static void ga_read_sysfs_file(int dirfd, const char *pathname, char
>> *buf,
>>                                 int size, Error **errp)
>>  {
>> @@ -2764,14 +2787,6 @@ int64_t
>> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>>      return -1;
>>  }
>>
>> -void qmp_guest_set_user_password(const char *username,
>> -                                 const char *password,
>> -                                 bool crypted,
>> -                                 Error **errp)
>> -{
>> -    error_setg(errp, QERR_UNSUPPORTED);
>> -}
>> -
>>  GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>>  {
>>      error_setg(errp, QERR_UNSUPPORTED);
>> --
>> 2.34.1
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--0000000000008209d705ea218720
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3=
, 2022 at 12:54 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov &lt;<a href=3D"mailto=
:alexander.ivanov@virtuozzo.com" target=3D"_blank">alexander.ivanov@virtuoz=
zo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Move qmp_guest_set_user_password() from __linux__ condition to<br>
(__linux__ || __FreeBSD__) condition. Add command and arguments<br>
for password setting in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 35 +++++++++++++++++++++++++----------<br>
=C2=A01 file changed, 25 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 88e0d0fe24..f5b9e5c530 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2122,7 +2122,9 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList=
 *vcpus, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return processed;<br>
=C2=A0}<br>
+#endif /* __linux__ */<br>
<br>
+#if defined(__linux__) || defined(__FreeBSD__)<br>
=C2=A0void qmp_guest_set_user_password(const char *username,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *password,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool crypted,<br>
@@ -2156,10 +2158,15 @@ void qmp_guest_set_user_password(const char *userna=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 chpasswddata =3D g_strdup(rawpasswddata);<br>
+=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;pw&quot;);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0chpasswddata =3D g_strdup_printf(&quot;%s:%s\n&quot;, u=
sername, rawpasswddata);<br>
-=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0passwd_path =3D g_find_program_in_path(&quot;chpasswd&q=
uot;);<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!passwd_path) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;cannot find &#39;p=
asswd&#39; program in PATH&quot;);<br>
@@ -2180,11 +2187,17 @@ void qmp_guest_set_user_password(const char *userna=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(2);<br>
<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *h_arg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h_arg =3D (crypted) ? &quot;-H&quot; : &quot;-=
h&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;pw&quot;, &quot;userm=
od&quot;, &quot;-n&quot;, username, h_arg, &quot;0&quot;, NULL);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crypted) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(passwd_path, &quot;ch=
passwd&quot;, &quot;-e&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(passwd_path, &quot;ch=
passwd&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0} else if (pid &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;faile=
d to create child process&quot;);<br>
@@ -2227,7 +2240,17 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(datafd[1]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
+#else /* __linux__ || __FreeBSD__ */<br>
+void qmp_guest_set_user_password(const char *username,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+#endif /* __linux__ || __FreeBSD__ */<br>
<br>
+#ifdef __linux__<br>
=C2=A0static void ga_read_sysfs_file(int dirfd, const char *pathname, char =
*buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int size, Error **errp)<br>
=C2=A0{<br>
@@ -2764,14 +2787,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorLis=
t *vcpus, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-void qmp_guest_set_user_password(const char *username,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-}<br>
-<br>
=C2=A0GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_UNSUPPORTED);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--0000000000008209d705ea218720--


