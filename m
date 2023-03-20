Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CE6C13E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFqC-0005sl-Sw; Mon, 20 Mar 2023 09:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1peFqA-0005q9-Dy
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1peFq6-0003az-DA
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679319977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMRc2pR6CTxiqT26RjBkRgQGep7isYMAyoO6yYeDdhE=;
 b=SIkFWJmPgfhAU1kSYW5pwDeOjyjR+RkV3qDhV96EPiLw4IgP5DbBHbAwpqKmQaDsgCh2eo
 RmDvbq47NLp0IcOI/lkKWeHN/E8eNvIltQOeBwWaBT98LKkmpL34dchZZczPVfG7Rt//0c
 XrumML2IBTqc5FAY2lZ5h74sRDPWyCE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-8k0_pVpSNHGt6sLnjJcuWA-1; Mon, 20 Mar 2023 09:46:16 -0400
X-MC-Unique: 8k0_pVpSNHGt6sLnjJcuWA-1
Received: by mail-ed1-f69.google.com with SMTP id
 en6-20020a056402528600b004fa01232e6aso17611954edb.16
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMRc2pR6CTxiqT26RjBkRgQGep7isYMAyoO6yYeDdhE=;
 b=Zz7AEBXwapmKSsTZOouT74rkJKBUn3zKcTnaoBTOrD2MPn2KfYrYK0PRVYVs6+/t6U
 boDJuYoD3GobQHpQFZ7JIEviDw7+DZoeMkchBMoRGIWWBy2Q7fCIoqYvNXQhJZco2qdb
 U198ZyF0RcmbC1frDgbKSS9MxgWGnejq44LvUFjfrz24Qc4SzQQYNzjIv5ipTl5YPnMp
 B3RZeIcsxEyEYHgS5a9fxojiAxJEFfyVOKvBs5bKZL+BmP4AM+cTuIAMdT1O8xlUNEyR
 bfegoOqKn/wVBzjc6051ulO4Eiyu8lH/CIN7nxexbGJnOfCB7S/qRO2peeknmsIAZJ+N
 QoCw==
X-Gm-Message-State: AO0yUKX74Lx2svEbUfhLPQAloHNLnr6QUzECwonN7AKLMmKdeN3nOsvL
 re6wM3PgFfUl8KoUJYHk3g+4VyKsavE4GBzuR2c7zux0nMhs4NI/jHBq9UhXE9EJRUizUJTIsI3
 1sVlpxiy1bcgWFPIM6yyc1UCXF0i48eg=
X-Received: by 2002:a17:907:3f10:b0:935:3085:303b with SMTP id
 hq16-20020a1709073f1000b009353085303bmr1077873ejc.15.1679319973663; 
 Mon, 20 Mar 2023 06:46:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set+it/d8XKhSmnrcmZQIu21/PSYJkjQOXTmPcyt/uRAnQrWcb03ay45IbT4H98ewGkdg7Sksn4vfaAHNXB7kPvg=
X-Received: by 2002:a17:907:3f10:b0:935:3085:303b with SMTP id
 hq16-20020a1709073f1000b009353085303bmr1077868ejc.15.1679319973404; Mon, 20
 Mar 2023 06:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230320133643.1618437-1-marcandre.lureau@redhat.com>
 <20230320133643.1618437-2-marcandre.lureau@redhat.com>
 <ZBhishy1paJdaZQn@redhat.com>
In-Reply-To: <ZBhishy1paJdaZQn@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Mar 2023 17:46:01 +0400
Message-ID: <CAMxuvawbT5_K7_asU4_gSbzmDpv_Lu=Yx79Pp9kJYpEkdU4Wgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] win32: add qemu_close_socket_osfhandle()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007ab17a05f755263d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--0000000000007ab17a05f755263d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 20, 2023 at 5:42=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> On Mon, Mar 20, 2023 at 05:36:41PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Close the given file descriptor, but returns the underlying SOCKET.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/sysemu/os-win32.h | 15 ++++++--
> >  util/oslib-win32.c        | 75 +++++++++++++++++++++------------------
> >  2 files changed, 53 insertions(+), 37 deletions(-)
> >
> > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > index e2849f88ab..15c296e0eb 100644
> > --- a/include/sysemu/os-win32.h
> > +++ b/include/sysemu/os-win32.h
> > @@ -171,10 +171,21 @@ bool qemu_socket_select(int sockfd, WSAEVENT
> hEventObject,
> >
> >  bool qemu_socket_unselect(int sockfd, Error **errp);
> >
> > -/* We wrap all the sockets functions so that we can
> > - * set errno based on WSAGetLastError()
> > +/* We wrap all the sockets functions so that we can set errno based on
> > + * WSAGetLastError(), and use file-descriptors instead of SOCKET.
> >   */
> >
> > +/*
> > + * qemu_close_socket_osfhandle:
> > + * @fd: a file descriptor associated with a SOCKET
> > + *
> > + * Close only the C run-time file descriptor, leave the SOCKET opened.
> > + *
> > + * Returns zero on success. On error, -1 is returned, and errno is set
> to
> > + * indicate the error.
> > + */
> > +int qemu_close_socket_osfhandle(int fd);
> > +
> >  #undef close
> >  #define close qemu_close_wrap
> >  int qemu_close_wrap(int fd);
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 16f8a67f7e..a98638729a 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -479,40 +479,27 @@ int qemu_bind_wrap(int sockfd, const struct
> sockaddr *addr,
> >      return ret;
> >  }
> >
> > -
> >  #undef close
> > -int qemu_close_wrap(int fd)
> > +int qemu_close_socket_osfhandle(int fd)
> >  {
> > -    int ret;
> > +    SOCKET s =3D _get_osfhandle(fd);
> >      DWORD flags =3D 0;
> > -    SOCKET s =3D INVALID_SOCKET;
> > -
> > -    if (fd_is_socket(fd)) {
> > -        s =3D _get_osfhandle(fd);
> > -
> > -        /*
> > -         * If we were to just call _close on the descriptor, it would
> close the
> > -         * HANDLE, but it wouldn't free any of the resources associate=
d
> to the
> > -         * SOCKET, and we can't call _close after calling closesocket,
> because
> > -         * closesocket has already closed the HANDLE, and _close would
> attempt to
> > -         * close the HANDLE again, resulting in a double free. We can
> however
> > -         * protect the HANDLE from actually being closed long enough t=
o
> close the
> > -         * file descriptor, then close the socket itself.
> > -         */
> > -        if (!GetHandleInformation((HANDLE)s, &flags)) {
> > -            errno =3D EACCES;
> > -            return -1;
> > -        }
> >
> > -        if (!SetHandleInformation((HANDLE)s,
> HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
> > -            errno =3D EACCES;
> > -            return -1;
> > -        }
> > +    /*
> > +     * If we were to just call _close on the descriptor, it would clos=
e
> the
> > +     * HANDLE, but it wouldn't free any of the resources associated to
> the
> > +     * SOCKET, and we can't call _close after calling closesocket,
> because
> > +     * closesocket has already closed the HANDLE, and _close would
> attempt to
> > +     * close the HANDLE again, resulting in a double free. We can
> however
> > +     * protect the HANDLE from actually being closed long enough to
> close the
> > +     * file descriptor, then close the socket itself.
> > +     */
> > +    if (!GetHandleInformation((HANDLE)s, &flags)) {
> > +        errno =3D EACCES;
> > +        return -1;
> >      }
> >
> > -    ret =3D close(fd);
> > -
> > -    if (s !=3D INVALID_SOCKET && !SetHandleInformation((HANDLE)s, flag=
s,
> flags)) {
> > +    if (!SetHandleInformation((HANDLE)s,
> HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
> >          errno =3D EACCES;
> >          return -1;
> >      }
> > @@ -521,15 +508,33 @@ int qemu_close_wrap(int fd)
> >       * close() returns EBADF since we PROTECT_FROM_CLOSE the underlyin=
g
> handle,
> >       * but the FD is actually freed
> >       */
> > -    if (ret < 0 && (s =3D=3D INVALID_SOCKET || errno !=3D EBADF)) {
> > -        return ret;
> > +    if (close(fd) < 0 && errno !=3D EBADF) {
> > +        return -1;
> >      }
> >
> > -    if (s !=3D INVALID_SOCKET) {
> > -        ret =3D closesocket(s);
> > -        if (ret < 0) {
> > -            errno =3D socket_error();
> > -        }
> > +    if (!SetHandleInformation((HANDLE)s, flags, flags)) {
> > +        errno =3D EACCES;
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int qemu_close_wrap(int fd)
> > +{
> > +    SOCKET s =3D INVALID_SOCKET;
> > +    int ret =3D -1;
> > +
> > +    if (!fd_is_socket(fd)) {
> > +        return close(fd);
> > +    }
> > +
> > +    s =3D _get_osfhandle(fd);
> > +    qemu_close_socket_osfhandle(fd);
> > +
> > +    ret =3D closesocket(s);
> > +    if (ret < 0) {
> > +        errno =3D socket_error();
> >      }
>
> Shouldn't the closesocket() and return check be wrapped in
>
>    if (s !=3D INVALID_SOCKET) { .... }
>
>
We shouldn't get there since fd_is_socket().


> as the old code had that conditional invokation of closesocket() ?
>

The v1 code could actually leak a SOCKET. This version should be a bit
better, if the FD is already closed for example, we still close the SOCKET.

Open to ideas to improve it.

thanks

--0000000000007ab17a05f755263d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 20, 2023 at 5:42=E2=80=
=AFPM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, Mar 20, 2023 at 05:36:41PM +0400, <a href=3D"mailt=
o:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.co=
m</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Close the given file descriptor, but returns the underlying SOCKET.<br=
>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/sysemu/os-win32.h | 15 ++++++--<br>
&gt;=C2=A0 util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 75 +++++++++++++=
++++++++------------------<br>
&gt;=C2=A0 2 files changed, 53 insertions(+), 37 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h<br>
&gt; index e2849f88ab..15c296e0eb 100644<br>
&gt; --- a/include/sysemu/os-win32.h<br>
&gt; +++ b/include/sysemu/os-win32.h<br>
&gt; @@ -171,10 +171,21 @@ bool qemu_socket_select(int sockfd, WSAEVENT hEv=
entObject,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 bool qemu_socket_unselect(int sockfd, Error **errp);<br>
&gt;=C2=A0 <br>
&gt; -/* We wrap all the sockets functions so that we can<br>
&gt; - * set errno based on WSAGetLastError()<br>
&gt; +/* We wrap all the sockets functions so that we can set errno based o=
n<br>
&gt; + * WSAGetLastError(), and use file-descriptors instead of SOCKET.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * qemu_close_socket_osfhandle:<br>
&gt; + * @fd: a file descriptor associated with a SOCKET<br>
&gt; + *<br>
&gt; + * Close only the C run-time file descriptor, leave the SOCKET opened=
.<br>
&gt; + *<br>
&gt; + * Returns zero on success. On error, -1 is returned, and errno is se=
t to<br>
&gt; + * indicate the error.<br>
&gt; + */<br>
&gt; +int qemu_close_socket_osfhandle(int fd);<br>
&gt; +<br>
&gt;=C2=A0 #undef close<br>
&gt;=C2=A0 #define close qemu_close_wrap<br>
&gt;=C2=A0 int qemu_close_wrap(int fd);<br>
&gt; diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
&gt; index 16f8a67f7e..a98638729a 100644<br>
&gt; --- a/util/oslib-win32.c<br>
&gt; +++ b/util/oslib-win32.c<br>
&gt; @@ -479,40 +479,27 @@ int qemu_bind_wrap(int sockfd, const struct sock=
addr *addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 #undef close<br>
&gt; -int qemu_close_wrap(int fd)<br>
&gt; +int qemu_close_socket_osfhandle(int fd)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int ret;<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DWORD flags =3D 0;<br>
&gt; -=C2=A0 =C2=A0 SOCKET s =3D INVALID_SOCKET;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (fd_is_socket(fd)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D _get_osfhandle(fd);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we were to just call _close on=
 the descriptor, it would close the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* HANDLE, but it wouldn&#39;t free =
any of the resources associated to the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* SOCKET, and we can&#39;t call _cl=
ose after calling closesocket, because<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* closesocket has already closed th=
e HANDLE, and _close would attempt to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* close the HANDLE again, resulting=
 in a double free. We can however<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* protect the HANDLE from actually =
being closed long enough to close the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* file descriptor, then close the s=
ocket itself.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!GetHandleInformation((HANDLE)s, &amp=
;flags)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!SetHandleInformation((HANDLE)s, HAND=
LE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If we were to just call _close on the descripto=
r, it would close the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* HANDLE, but it wouldn&#39;t free any of the res=
ources associated to the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* SOCKET, and we can&#39;t call _close after call=
ing closesocket, because<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* closesocket has already closed the HANDLE, and =
_close would attempt to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* close the HANDLE again, resulting in a double f=
ree. We can however<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* protect the HANDLE from actually being closed l=
ong enough to close the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* file descriptor, then close the socket itself.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!GetHandleInformation((HANDLE)s, &amp;flags)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 ret =3D close(fd);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (s !=3D INVALID_SOCKET &amp;&amp; !SetHandleInformat=
ion((HANDLE)s, flags, flags)) {<br>
&gt; +=C2=A0 =C2=A0 if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTEC=
T_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -521,15 +508,33 @@ int qemu_close_wrap(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* close() returns EBADF since we PROTECT_FRO=
M_CLOSE the underlying handle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* but the FD is actually freed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 if (ret &lt; 0 &amp;&amp; (s =3D=3D INVALID_SOCKET || e=
rrno !=3D EBADF)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 if (close(fd) &lt; 0 &amp;&amp; errno !=3D EBADF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (s !=3D INVALID_SOCKET) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D closesocket(s);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (!SetHandleInformation((HANDLE)s, flags, flags)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int qemu_close_wrap(int fd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D INVALID_SOCKET;<br>
&gt; +=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!fd_is_socket(fd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return close(fd);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D _get_osfhandle(fd);<br>
&gt; +=C2=A0 =C2=A0 qemu_close_socket_osfhandle(fd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D closesocket(s);<br>
&gt; +=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Shouldn&#39;t the closesocket() and return check be wrapped in<br>
<br>
=C2=A0 =C2=A0if (s !=3D INVALID_SOCKET) { .... }<br>
<br></blockquote><div>=C2=A0</div><div>We shouldn&#39;t get there since fd_=
is_socket().<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
as the old code had that conditional invokation of closesocket() ?<br></blo=
ckquote><div><br></div><div>The v1 code could actually leak a SOCKET. This =
version should be a bit better, if the FD is already closed for example, we=
 still close the SOCKET.</div><div><br></div><div>Open to ideas to improve =
it.</div><div><br></div><div>thanks<br></div></div></div>

--0000000000007ab17a05f755263d--


