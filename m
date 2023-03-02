Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2F6A83F9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:11:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjcf-0007UO-Tx; Thu, 02 Mar 2023 09:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pXjcd-0007Ts-RB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pXjcX-0008Mv-A8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677766160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mG+yRUgys0wekSu+yTWFS79wgh7VNnUc4l/qBnVpGiE=;
 b=iJ5mvaw9mtVPD6w4LJ5QR1PmuiT+skj9ULOVdIBdIhhazNwjqrPvaZAiAzObEjw4aIMFQI
 CiwAD9EU3uF+eCDUbmnnd/1tqA10lF84CyWAxduXmsy6A/+Mimvq6MN69Jf59M56xzvziD
 f98E4zmpUqP/wmHOm1H3O90FDyi3J8c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-BU3pGCRpOg21OoHm0jpJvw-1; Thu, 02 Mar 2023 09:09:19 -0500
X-MC-Unique: BU3pGCRpOg21OoHm0jpJvw-1
Received: by mail-ed1-f72.google.com with SMTP id
 t9-20020a056402524900b004af59c073abso24402344edd.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mG+yRUgys0wekSu+yTWFS79wgh7VNnUc4l/qBnVpGiE=;
 b=r2WT2Zi8qvq5ieNkyvgArwPgiYjicVzUxt42M097LZcf8u1Hv5TCSGYA0AhkZpDWdo
 tGTC7D+tFQhGWLACYSOPRF5dMfwMEFqRCctHQWy5YXgvvKd5rB1TqJyVMTS+iKIoqDTy
 VvjikCwR/IGy/uyE0V18d3Uz41J/b8EJQ9hkRvsC7u+Aqv0Srm+X0ZpwXuUw/uMfNAPW
 OvjWaIJGht2aPVhzACoy9xcp5xzQLH4ZOCtPdaRVQA/qPoeSsNMNkwP3LkCed6XKGHg/
 F0qJQX05t+y26LHGWiIaM/4rNLO+ph8oI2QNri4401/kGVBMBCW8c915q9k2BDKX50Dn
 6gWw==
X-Gm-Message-State: AO0yUKUBZDGxPEXy69quyCYrOvgrARt7iHUHdNPut8mz+qpGJ/3G99yS
 5sD04MwQEvtQF7TIs6CREMsZEPGMCc1yvwzftbA3CJ3+QSYJ4Q1xTVdRUHymkV3b3WgCHf5ZP46
 cv+C4skKNJ2unVZxGe65erRY9zZpCeW7S54E7qJw=
X-Received: by 2002:a50:d64e:0:b0:4bc:bea1:d0fe with SMTP id
 c14-20020a50d64e000000b004bcbea1d0femr2862945edj.8.1677766157129; 
 Thu, 02 Mar 2023 06:09:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8my4jU2Tw3AIDfImPyuNOu20I9WHY+rombVOkTo6kx3DyOJ4Nl3DTkoRBJz5CMOMkt3s1LFCUkcL7+bGezNVQ=
X-Received: by 2002:a50:d64e:0:b0:4bc:bea1:d0fe with SMTP id
 c14-20020a50d64e000000b004bcbea1d0femr2862919edj.8.1677766156791; Thu, 02 Mar
 2023 06:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 2 Mar 2023 18:09:05 +0400
Message-ID: <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cac4ea05f5eb5f8f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000cac4ea05f5eb5f8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 21, 2023 at 4:48=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> A win32 SOCKET handle is often cast to an int file descriptor, as this is
> what
> other OS use for sockets. When necessary, QEMU eventually queries whether
> it's a
> socket with the help of fd_is_socket(). However, there is no guarantee of
> conflict between the fd and SOCKET space. Such conflict would have
> surprising
> consequences. We can fix this by using FDs only.
>
> After fixing a few missed closesocket(), this patch series makes the win3=
2
> socket API wrappers take FDs. It finally get rid of closesocket() usage b=
y
> using
> a close() wrapper instead. (note that fdopen/fclose would not be enough
> either
> to close the underlying socket appropriately)
>
> v3:
> - fix closesocket() to prevent CloseHandle() from close()
> - fix direct closesocket() usage (#undef closesocket before)
> - add a test for &error_warn
> - add r-b tags
>
>
ping  (I am missing reviews, thanks)


> v2:
> - add clean up patch "util: drop qemu_fork()"
> - add a "&error_warn", to help with basic error reporting
> - fix errno handling after _get_osfhandle()
> - introduce qemu_socket_(un)select() helpers
> - add patch "aio_set_fd_handler() only supports SOCKET"
> - add meson slirp.wrap RFC
> - various misc cleanups
> - add r-b tags
>
> Marc-Andr=C3=A9 Lureau (16):
>   util: drop qemu_fork()
>   tests: use closesocket()
>   io: use closesocket()
>   tests: add test-error-report
>   error: add global &error_warn destination
>   win32/socket: introduce qemu_socket_select() helper
>   win32/socket: introduce qemu_socket_unselect() helper
>   aio: make aio_set_fd_poll() static to aio-posix.c
>   aio/win32: aio_set_fd_handler() only supports SOCKET
>   RFC: build-sys: add slirp.wrap
>   main-loop: remove qemu_fd_register(), win32/slirp/socket specific
>   slirp: unregister the win32 SOCKET
>   slirp: open-code qemu_socket_(un)select()
>   win32: avoid mixing SOCKET and file descriptor space
>   os-posix: remove useless ioctlsocket() define
>   win32: replace closesocket() with close() wrapper
>
>  include/block/aio.h            |   8 --
>  include/qapi/error.h           |   6 +
>  include/qemu/main-loop.h       |   2 -
>  include/qemu/osdep.h           |  14 --
>  include/sysemu/os-posix.h      |   3 -
>  include/sysemu/os-win32.h      |  15 ++-
>  backends/tpm/tpm_emulator.c    |   6 +-
>  crypto/afalg.c                 |   6 +-
>  hw/hyperv/syndbg.c             |   4 +-
>  io/channel-socket.c            |   8 +-
>  io/channel-watch.c             |  10 +-
>  net/dgram.c                    |  14 +-
>  net/slirp.c                    |  16 ++-
>  net/socket.c                   |  22 +--
>  tests/qtest/libqtest.c         |   8 +-
>  tests/qtest/microbit-test.c    |   2 +-
>  tests/qtest/netdev-socket.c    |  10 +-
>  tests/unit/socket-helpers.c    |   2 +-
>  tests/unit/test-error-report.c | 139 +++++++++++++++++++
>  util/aio-posix.c               |   6 +-
>  util/aio-win32.c               |  23 ++--
>  util/error.c                   |  10 +-
>  util/main-loop.c               |  11 --
>  util/oslib-posix.c             |  70 ----------
>  util/oslib-win32.c             | 240 ++++++++++++++++++++++++++++-----
>  util/qemu-sockets.c            |  22 +--
>  .gitignore                     |   2 +
>  subprojects/slirp.wrap         |   6 +
>  tests/unit/meson.build         |   1 +
>  29 files changed, 461 insertions(+), 225 deletions(-)
>  create mode 100644 tests/unit/test-error-report.c
>  create mode 100644 subprojects/slirp.wrap
>
> --
> 2.39.2
>
>

--000000000000cac4ea05f5eb5f8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 4:48=E2=80=
=AFPM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
A win32 SOCKET handle is often cast to an int file descriptor, as this is w=
hat<br>
other OS use for sockets. When necessary, QEMU eventually queries whether i=
t&#39;s a<br>
socket with the help of fd_is_socket(). However, there is no guarantee of<b=
r>
conflict between the fd and SOCKET space. Such conflict would have surprisi=
ng<br>
consequences. We can fix this by using FDs only.<br>
<br>
After fixing a few missed closesocket(), this patch series makes the win32<=
br>
socket API wrappers take FDs. It finally get rid of closesocket() usage by =
using<br>
a close() wrapper instead. (note that fdopen/fclose would not be enough eit=
her<br>
to close the underlying socket appropriately)<br>
<br>
v3:<br>
- fix closesocket() to prevent CloseHandle() from close()<br>
- fix direct closesocket() usage (#undef closesocket before)<br>
- add a test for &amp;error_warn<br>
- add r-b tags<br>
<br></blockquote><div>=C2=A0</div><div>ping=C2=A0 (I am missing reviews, th=
anks)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
v2:<br>
- add clean up patch &quot;util: drop qemu_fork()&quot;<br>
- add a &quot;&amp;error_warn&quot;, to help with basic error reporting<br>
- fix errno handling after _get_osfhandle()<br>
- introduce qemu_socket_(un)select() helpers<br>
- add patch &quot;aio_set_fd_handler() only supports SOCKET&quot;<br>
- add meson slirp.wrap RFC<br>
- various misc cleanups<br>
- add r-b tags<br>
<br>
Marc-Andr=C3=A9 Lureau (16):<br>
=C2=A0 util: drop qemu_fork()<br>
=C2=A0 tests: use closesocket()<br>
=C2=A0 io: use closesocket()<br>
=C2=A0 tests: add test-error-report<br>
=C2=A0 error: add global &amp;error_warn destination<br>
=C2=A0 win32/socket: introduce qemu_socket_select() helper<br>
=C2=A0 win32/socket: introduce qemu_socket_unselect() helper<br>
=C2=A0 aio: make aio_set_fd_poll() static to aio-posix.c<br>
=C2=A0 aio/win32: aio_set_fd_handler() only supports SOCKET<br>
=C2=A0 RFC: build-sys: add slirp.wrap<br>
=C2=A0 main-loop: remove qemu_fd_register(), win32/slirp/socket specific<br=
>
=C2=A0 slirp: unregister the win32 SOCKET<br>
=C2=A0 slirp: open-code qemu_socket_(un)select()<br>
=C2=A0 win32: avoid mixing SOCKET and file descriptor space<br>
=C2=A0 os-posix: remove useless ioctlsocket() define<br>
=C2=A0 win32: replace closesocket() with close() wrapper<br>
<br>
=C2=A0include/block/aio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 --<br>
=C2=A0include/qapi/error.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +<br>
=C2=A0include/qemu/main-loop.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<=
br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
14 --<br>
=C2=A0include/sysemu/os-posix.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 -<br>
=C2=A0include/sysemu/os-win32.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 ++-<br>
=C2=A0backends/tpm/tpm_emulator.c=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0crypto/afalg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0hw/hyperv/syndbg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0io/channel-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A0io/channel-watch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
=C2=A0net/dgram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 16 ++-<br>
=C2=A0net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 22 +--<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +-<br>
=C2=A0tests/qtest/microbit-test.c=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tests/qtest/netdev-socket.c=C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0tests/unit/socket-helpers.c=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tests/unit/test-error-report.c | 139 +++++++++++++++++++<br>
=C2=A0util/aio-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0util/aio-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 23 ++--<br>
=C2=A0util/error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 11 --<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 70 ----------<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
40 ++++++++++++++++++++++++++++-----<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
22 +--<br>
=C2=A0.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0subprojects/slirp.wrap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0tests/unit/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A029 files changed, 461 insertions(+), 225 deletions(-)<br>
=C2=A0create mode 100644 tests/unit/test-error-report.c<br>
=C2=A0create mode 100644 subprojects/slirp.wrap<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000cac4ea05f5eb5f8f--


