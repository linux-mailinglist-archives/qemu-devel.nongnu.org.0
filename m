Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BB6508AE6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:40:06 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBUz-0002dd-5O
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhAk0-00059p-Jr
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhAjw-0000dX-Qy
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650462688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ldzk6Llzie+DkRUs9Dx/N+0VAtFOPvrCn5tgIUldgJE=;
 b=IgyFXDRBr0noKqhysFCJYzUzrW8xgmr17O1tgMZnLlh+Pn6wxGwCmSYkDElh0m04kgJxqG
 yUen7nAn2VgpCurGnkziy2bjUWseDcMcUpGCuadInJ+3w8KaXAc0vIY3ibHvf6IW1voyQx
 O8S0PaOOd8SuassWl9IuUN99+KeXSlY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-FGBHnmohPda_5Imy_ml_tw-1; Wed, 20 Apr 2022 09:51:23 -0400
X-MC-Unique: FGBHnmohPda_5Imy_ml_tw-1
Received: by mail-yb1-f199.google.com with SMTP id
 i5-20020a258b05000000b006347131d40bso1473271ybl.17
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 06:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ldzk6Llzie+DkRUs9Dx/N+0VAtFOPvrCn5tgIUldgJE=;
 b=AsDyZ+WJGgG+FhpQU347NNeqAk8gWOtZ6AxJKbhm4vAXJXP43HGWpLDQTCAucqX0f1
 x1wPPMxZqNq+3Nk3DYKXl+CPPGD5EirdaoG3aZqXBS5RWptS4OzFd4HILEJNHyz6SOUy
 3bsFxYcm1+wLjmZnIZ4TaMIK9r8JeYfAXsnue1TGykpLvnlaCBzgz6ab6gcz1TyHpmVS
 7W0OVkHC0TGKr1pe6xcnQU/eJb6uhiqmEaeLMy88xnOycJtckmONQR5BoHrkvxSLcXOu
 jKLtkCJL4fiv0/xBpHpYRPc7P423kZTAhgEbEENPHTtu10m5qjtPbNBRenyIMSQJgd5C
 xRNA==
X-Gm-Message-State: AOAM532x/7sSF1/urFRIx6hgXYSQBhzCid7u/Fe8/B1SuKlFjyry+U+L
 cuLAbUb95DeVp8+iJ04Upt0uw5mVgo9ptS1MSCqiQKRrenmgYxnvA/SHDzDb5hZTxT2RkniAcQF
 v776YYk9jAXSpP1KlJGLkTwwC9qzW6OE=
X-Received: by 2002:a05:6902:1028:b0:644:cbb0:4adc with SMTP id
 x8-20020a056902102800b00644cbb04adcmr18069569ybt.599.1650462683318; 
 Wed, 20 Apr 2022 06:51:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3VL0+7SbVcfTQSxPoR7wQcq2Df03vE+UKgQ696anqGzfUObLJ+ZfmZq8KzGE9+2E7NYCa1UIHB1uoIA1vFr8=
X-Received: by 2002:a05:6902:1028:b0:644:cbb0:4adc with SMTP id
 x8-20020a056902102800b00644cbb04adcmr18069551ybt.599.1650462683096; Wed, 20
 Apr 2022 06:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-32-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-32-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 20 Apr 2022 16:51:12 +0300
Message-ID: <CAPMcbCpBJxfjhM0xJAtv_atS3L7+G_i52CXYwDExQPsgOY9EMA@mail.gmail.com>
Subject: Re: [PATCH 31/41] qga: move qga_get_host_name()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f0ff5505dd16497f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0ff5505dd16497f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Apr 20, 2022 at 4:30 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The function is specific to qemu-ga, no need to share it in QEMU.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/osdep.h  | 10 ----------
>  qga/commands-common.h | 11 +++++++++++
>  qga/commands-posix.c  | 35 +++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c  | 13 +++++++++++++
>  qga/commands.c        |  2 +-
>  util/oslib-posix.c    | 35 -----------------------------------
>  util/oslib-win32.c    | 13 -------------
>  7 files changed, 60 insertions(+), 59 deletions(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 9fd52d6a33a7..ccf10f05f806 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -648,16 +648,6 @@ int qemu_fdatasync(int fd);
>   */
>  int qemu_msync(void *addr, size_t length, int fd);
>
> -/**
> - * qemu_get_host_name:
> - * @errp: Error object
> - *
> - * Operating system agnostic way of querying host name.
> - *
> - * Returns allocated hostname (caller should free), NULL on failure.
> - */
> -char *qemu_get_host_name(Error **errp);
> -
>  /**
>   * qemu_get_host_physmem:
>   *
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index 90785ed4bb7b..d0e4a9696f37 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -18,4 +18,15 @@ GuestFileHandle *guest_file_handle_find(int64_t id,
> Error **errp);
>  GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
>                                        int64_t count, Error **errp);
>
> +/**
> + * qga_get_host_name:
> + * @errp: Error object
> + *
> + * Operating system agnostic way of querying host name.
> + * Compared to g_get_host_name(), it doesn't cache the result.
> + *
> + * Returns allocated hostname (caller should free), NULL on failure.
> + */
> +char *qga_get_host_name(Error **errp);
> +
>  #endif
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 390c1560e1b5..77f4672ca2c9 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -3278,3 +3278,38 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> **errp)
>
>      return NULL;
>  }
> +
> +#ifndef HOST_NAME_MAX
> +# ifdef _POSIX_HOST_NAME_MAX
> +#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
> +# else
> +#  define HOST_NAME_MAX 255
> +# endif
> +#endif
> +
> +char *qga_get_host_name(Error **errp)
> +{
> +    long len =3D -1;
> +    g_autofree char *hostname =3D NULL;
> +
> +#ifdef _SC_HOST_NAME_MAX
> +    len =3D sysconf(_SC_HOST_NAME_MAX);
> +#endif /* _SC_HOST_NAME_MAX */
> +
> +    if (len < 0) {
> +        len =3D HOST_NAME_MAX;
> +    }
> +
> +    /* Unfortunately, gethostname() below does not guarantee a
> +     * NULL terminated string. Therefore, allocate one byte more
> +     * to be sure. */
> +    hostname =3D g_new0(char, len + 1);
> +
> +    if (gethostname(hostname, len) < 0) {
> +        error_setg_errno(errp, errno,
> +                         "cannot get hostname");
> +        return NULL;
> +    }
> +
> +    return g_steal_pointer(&hostname);
> +}
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 406e4072a012..d56b5fd2a71c 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2519,3 +2519,16 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> **errp)
>      }
>      return head;
>  }
> +
> +char *qga_get_host_name(Error **errp)
> +{
> +    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
> +    DWORD size =3D G_N_ELEMENTS(tmp);
> +
> +    if (GetComputerNameW(tmp, &size) =3D=3D 0) {
> +        error_setg_win32(errp, GetLastError(), "failed close handle");
> +        return NULL;
> +    }
> +
> +    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
> +}
> diff --git a/qga/commands.c b/qga/commands.c
> index 4e9ce25b2e73..690da0073d6e 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -511,7 +511,7 @@ int ga_parse_whence(GuestFileWhence *whence, Error
> **errp)
>  GuestHostName *qmp_guest_get_host_name(Error **errp)
>  {
>      GuestHostName *result =3D NULL;
> -    g_autofree char *hostname =3D qemu_get_host_name(errp);
> +    g_autofree char *hostname =3D qga_get_host_name(errp);
>
>      /*
>       * We want to avoid using g_get_host_name() because that
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 4f18cc612850..63d2c6a76a77 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -805,41 +805,6 @@ void sigaction_invoke(struct sigaction *action,
>      action->sa_sigaction(info->ssi_signo, &si, NULL);
>  }
>
> -#ifndef HOST_NAME_MAX
> -# ifdef _POSIX_HOST_NAME_MAX
> -#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
> -# else
> -#  define HOST_NAME_MAX 255
> -# endif
> -#endif
> -
> -char *qemu_get_host_name(Error **errp)
> -{
> -    long len =3D -1;
> -    g_autofree char *hostname =3D NULL;
> -
> -#ifdef _SC_HOST_NAME_MAX
> -    len =3D sysconf(_SC_HOST_NAME_MAX);
> -#endif /* _SC_HOST_NAME_MAX */
> -
> -    if (len < 0) {
> -        len =3D HOST_NAME_MAX;
> -    }
> -
> -    /* Unfortunately, gethostname() below does not guarantee a
> -     * NULL terminated string. Therefore, allocate one byte more
> -     * to be sure. */
> -    hostname =3D g_new0(char, len + 1);
> -
> -    if (gethostname(hostname, len) < 0) {
> -        error_setg_errno(errp, errno,
> -                         "cannot get hostname");
> -        return NULL;
> -    }
> -
> -    return g_steal_pointer(&hostname);
> -}
> -
>  size_t qemu_get_host_physmem(void)
>  {
>  #ifdef _SC_PHYS_PAGES
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 0371082d23b3..41df0a289e28 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -537,19 +537,6 @@ bool qemu_write_pidfile(const char *filename, Error
> **errp)
>      return true;
>  }
>
> -char *qemu_get_host_name(Error **errp)
> -{
> -    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
> -    DWORD size =3D G_N_ELEMENTS(tmp);
> -
> -    if (GetComputerNameW(tmp, &size) =3D=3D 0) {
> -        error_setg_win32(errp, GetLastError(), "failed close handle");
> -        return NULL;
> -    }
> -
> -    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
> -}
> -
>  size_t qemu_get_host_physmem(void)
>  {
>      MEMORYSTATUSEX statex;
> --
> 2.35.1.693.g805e0a68082a
>
>

--000000000000f0ff5505dd16497f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 2=
0, 2022 at 4:30 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;<br>
<br>
The function is specific to qemu-ga, no need to share it in QEMU.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/osdep.h=C2=A0 | 10 ----------<br>
=C2=A0qga/commands-common.h | 11 +++++++++++<br>
=C2=A0qga/commands-posix.c=C2=A0 | 35 +++++++++++++++++++++++++++++++++++<b=
r>
=C2=A0qga/commands-win32.c=C2=A0 | 13 +++++++++++++<br>
=C2=A0qga/commands.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 | 35 --------------------------------=
---<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 | 13 -------------<br>
=C2=A07 files changed, 60 insertions(+), 59 deletions(-)<br>
<br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index 9fd52d6a33a7..ccf10f05f806 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -648,16 +648,6 @@ int qemu_fdatasync(int fd);<br>
=C2=A0 */<br>
=C2=A0int qemu_msync(void *addr, size_t length, int fd);<br>
<br>
-/**<br>
- * qemu_get_host_name:<br>
- * @errp: Error object<br>
- *<br>
- * Operating system agnostic way of querying host name.<br>
- *<br>
- * Returns allocated hostname (caller should free), NULL on failure.<br>
- */<br>
-char *qemu_get_host_name(Error **errp);<br>
-<br>
=C2=A0/**<br>
=C2=A0 * qemu_get_host_physmem:<br>
=C2=A0 *<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index 90785ed4bb7b..d0e4a9696f37 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -18,4 +18,15 @@ GuestFileHandle *guest_file_handle_find(int64_t id, Erro=
r **errp);<br>
=C2=A0GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t c=
ount, Error **errp);<br>
<br>
+/**<br>
+ * qga_get_host_name:<br>
+ * @errp: Error object<br>
+ *<br>
+ * Operating system agnostic way of querying host name.<br>
+ * Compared to g_get_host_name(), it doesn&#39;t cache the result.<br>
+ *<br>
+ * Returns allocated hostname (caller should free), NULL on failure.<br>
+ */<br>
+char *qga_get_host_name(Error **errp);<br>
+<br>
=C2=A0#endif<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 390c1560e1b5..77f4672ca2c9 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -3278,3 +3278,38 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **e=
rrp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
+<br>
+#ifndef HOST_NAME_MAX<br>
+# ifdef _POSIX_HOST_NAME_MAX<br>
+#=C2=A0 define HOST_NAME_MAX _POSIX_HOST_NAME_MAX<br>
+# else<br>
+#=C2=A0 define HOST_NAME_MAX 255<br>
+# endif<br>
+#endif<br>
+<br>
+char *qga_get_host_name(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 long len =3D -1;<br>
+=C2=A0 =C2=A0 g_autofree char *hostname =3D NULL;<br>
+<br>
+#ifdef _SC_HOST_NAME_MAX<br>
+=C2=A0 =C2=A0 len =3D sysconf(_SC_HOST_NAME_MAX);<br>
+#endif /* _SC_HOST_NAME_MAX */<br>
+<br>
+=C2=A0 =C2=A0 if (len &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D HOST_NAME_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Unfortunately, gethostname() below does not guarantee a<b=
r>
+=C2=A0 =C2=A0 =C2=A0* NULL terminated string. Therefore, allocate one byte=
 more<br>
+=C2=A0 =C2=A0 =C2=A0* to be sure. */<br>
+=C2=A0 =C2=A0 hostname =3D g_new0(char, len + 1);<br>
+<br>
+=C2=A0 =C2=A0 if (gethostname(hostname, len) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;cannot get hostname&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return g_steal_pointer(&amp;hostname);<br>
+}<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 406e4072a012..d56b5fd2a71c 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2519,3 +2519,16 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return head;<br>
=C2=A0}<br>
+<br>
+char *qga_get_host_name(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];<br>
+=C2=A0 =C2=A0 DWORD size =3D G_N_ELEMENTS(tmp);<br>
+<br>
+=C2=A0 =C2=A0 if (GetComputerNameW(tmp, &amp;size) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(), &quot;f=
ailed close handle&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);<br>
+}<br>
diff --git a/qga/commands.c b/qga/commands.c<br>
index 4e9ce25b2e73..690da0073d6e 100644<br>
--- a/qga/commands.c<br>
+++ b/qga/commands.c<br>
@@ -511,7 +511,7 @@ int ga_parse_whence(GuestFileWhence *whence, Error **er=
rp)<br>
=C2=A0GuestHostName *qmp_guest_get_host_name(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GuestHostName *result =3D NULL;<br>
-=C2=A0 =C2=A0 g_autofree char *hostname =3D qemu_get_host_name(errp);<br>
+=C2=A0 =C2=A0 g_autofree char *hostname =3D qga_get_host_name(errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * We want to avoid using g_get_host_name() because tha=
t<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index 4f18cc612850..63d2c6a76a77 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -805,41 +805,6 @@ void sigaction_invoke(struct sigaction *action,<br>
=C2=A0 =C2=A0 =C2=A0action-&gt;sa_sigaction(info-&gt;ssi_signo, &amp;si, NU=
LL);<br>
=C2=A0}<br>
<br>
-#ifndef HOST_NAME_MAX<br>
-# ifdef _POSIX_HOST_NAME_MAX<br>
-#=C2=A0 define HOST_NAME_MAX _POSIX_HOST_NAME_MAX<br>
-# else<br>
-#=C2=A0 define HOST_NAME_MAX 255<br>
-# endif<br>
-#endif<br>
-<br>
-char *qemu_get_host_name(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 long len =3D -1;<br>
-=C2=A0 =C2=A0 g_autofree char *hostname =3D NULL;<br>
-<br>
-#ifdef _SC_HOST_NAME_MAX<br>
-=C2=A0 =C2=A0 len =3D sysconf(_SC_HOST_NAME_MAX);<br>
-#endif /* _SC_HOST_NAME_MAX */<br>
-<br>
-=C2=A0 =C2=A0 if (len &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D HOST_NAME_MAX;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Unfortunately, gethostname() below does not guarantee a<b=
r>
-=C2=A0 =C2=A0 =C2=A0* NULL terminated string. Therefore, allocate one byte=
 more<br>
-=C2=A0 =C2=A0 =C2=A0* to be sure. */<br>
-=C2=A0 =C2=A0 hostname =3D g_new0(char, len + 1);<br>
-<br>
-=C2=A0 =C2=A0 if (gethostname(hostname, len) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;cannot get hostname&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return g_steal_pointer(&amp;hostname);<br>
-}<br>
-<br>
=C2=A0size_t qemu_get_host_physmem(void)<br>
=C2=A0{<br>
=C2=A0#ifdef _SC_PHYS_PAGES<br>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
index 0371082d23b3..41df0a289e28 100644<br>
--- a/util/oslib-win32.c<br>
+++ b/util/oslib-win32.c<br>
@@ -537,19 +537,6 @@ bool qemu_write_pidfile(const char *filename, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
-char *qemu_get_host_name(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];<br>
-=C2=A0 =C2=A0 DWORD size =3D G_N_ELEMENTS(tmp);<br>
-<br>
-=C2=A0 =C2=A0 if (GetComputerNameW(tmp, &amp;size) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(), &quot;f=
ailed close handle&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);<br>
-}<br>
-<br>
=C2=A0size_t qemu_get_host_physmem(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MEMORYSTATUSEX statex;<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
</blockquote></div>

--000000000000f0ff5505dd16497f--


