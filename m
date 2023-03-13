Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC986B76F8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:56:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgdI-0000Oy-Nv; Mon, 13 Mar 2023 07:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pbgcf-0007gz-BM
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pbgcd-0004BK-1g
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jy2iGrqq+vrZ3/etzuD71vOxuPBy4qjyRtr6nuRmbwQ=;
 b=OZz/OH7ASqgNXZFTyfuiRiH8OFByUp4FvQ/7eNodBE1DgOE8pxMQFQmicmpFRVRiNWXL4V
 2rn12bBNwRnyG1GpvSuoKlKFC6kNHL3FHBXcz6Yr5mgZHVx1yfn7YfmiyUesOIyu3/uVCx
 2+c6G7skLMqtsge1sPipdg45Dd8yTUM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-dpnnoKCpObul-1c_4s3Fug-1; Mon, 13 Mar 2023 07:45:41 -0400
X-MC-Unique: dpnnoKCpObul-1c_4s3Fug-1
Received: by mail-ed1-f69.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso16378293edu.17
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 04:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678707939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jy2iGrqq+vrZ3/etzuD71vOxuPBy4qjyRtr6nuRmbwQ=;
 b=imPzrMTccE77n5/01YQad/yqQe+4jTpc57yRdhgr4eLnYcJo8/9/Ed9XvGa8qulhUC
 twGT0bdfWdSOgN1T28CduD8u74+wRi7+lfG62irehhe3KdOcX8GM4wwdNjqakOO7RdwV
 XFljyQRQkUbKdQ92sYv5AfYzNj5d0GQK4PNcfT1sgj/X6QsUTyf1ROAbYm1iuNBO7m9K
 +KJEL+4ZUfuvuuM6Jb29NhWy9fxSA8vsm4e5NUuKh6C/341vP37wVHj3QVUc8Lamyasb
 7L0ZMxyvmNcR9bbduygrqln1nbsM+4CLZ6s2E1MV1rY95r8JQdKbKMcqSDu42+jWPlFq
 QBEw==
X-Gm-Message-State: AO0yUKV59aCOFB3PNiMSJlRA0zTaTpVzGZGhYF3h92zrYvM/3E+M9h6J
 jimG1NU1NKuF7Vk2sW9euC9vWoIsBxgXcVGaPBeDP4R43q6Hb9WlF8zGGcsK2qPat0L7x/iPBM6
 NKmwoGRW7wiWw1q3wp3WM2pF9OXSsZleU/vdOCgY=
X-Received: by 2002:a17:906:cec1:b0:8ee:babc:d3f8 with SMTP id
 si1-20020a170906cec100b008eebabcd3f8mr5760163ejb.3.1678707939163; 
 Mon, 13 Mar 2023 04:45:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+emz5Los85j8aiLJec710ZPL0ij50AnUUJ1+r6W8vRF9Ej11ozgrqFv/SRgzCTVOa9ANKOyZSp1WSQ7QrFnWg=
X-Received: by 2002:a17:906:cec1:b0:8ee:babc:d3f8 with SMTP id
 si1-20020a170906cec100b008eebabcd3f8mr5760129ejb.3.1678707938834; Mon, 13 Mar
 2023 04:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Mar 2023 15:45:27 +0400
Message-ID: <CAMxuvay2v8aSB0UsLpdi2pT7YVZtMC85cQ9HdybDnGvm=GkLwQ@mail.gmail.com>
Subject: Re: [PULL 00/25] Win socket patches
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000604c9b05f6c6a678"
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

--000000000000604c9b05f6c6a678
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 13, 2023 at 3:43=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit
> 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of
> https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00
> +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git
> tags/win-socket-pull-request
>
> for you to fetch changes up to 0006c18362cbe1e93587ac1e8ee965c08e6970f2:
>
>   QMP/HMP: only actually implement getfd on CONFIG_POSIX (2023-03-13
> 15:41:32 +0400)
>
> ----------------------------------------------------------------
> QMP command to import win32 sockets
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (25):
>   util: drop qemu_fork()
>   tests: use closesocket()
>   io: use closesocket()
>   tests: add test-error-report
>   error: add global &error_warn destination
>   win32/socket: introduce qemu_socket_select() helper
>   win32/socket: introduce qemu_socket_unselect() helper
>   aio: make aio_set_fd_poll() static to aio-posix.c
>   aio/win32: aio_set_fd_handler() only supports SOCKET
>   main-loop: remove qemu_fd_register(), win32/slirp/socket specific
>   slirp: unregister the win32 SOCKET
>   slirp: open-code qemu_socket_(un)select()
>   win32: avoid mixing SOCKET and file descriptor space
>   os-posix: remove useless ioctlsocket() define
>   win32: replace closesocket() with close() wrapper
>   tests: fix path separator, use g_build_filename()
>   char: do not double-close fd when failing to add client
>   tests/docker: fix a win32 error due to portability
>   osdep: implement qemu_socketpair() for win32
>   qmp: 'add_client' actually expects sockets
>   monitor: release the lock before calling close()
>   qmp: add 'get-win32-socket'
>   libqtest: make qtest_qmp_add_client work on win32
>   qtest: enable vnc-display test on win32
>   QMP/HMP: only actually implement getfd on CONFIG_POSIX
>

My bad, last patch is not the one I intended (with message fix suggested by
Markus). Sending v2.


>
>  qapi/misc.json                       |  36 ++-
>  include/block/aio.h                  |   8 -
>  include/qapi/error.h                 |   6 +
>  include/qemu/main-loop.h             |   2 -
>  include/qemu/osdep.h                 |  14 --
>  include/qemu/sockets.h               |   2 -
>  include/sysemu/os-posix.h            |   3 -
>  include/sysemu/os-win32.h            |  15 +-
>  tests/qtest/libqtest.h               |   5 +-
>  backends/tpm/tpm_emulator.c          |   6 +-
>  chardev/char.c                       |   2 -
>  crypto/afalg.c                       |   6 +-
>  hw/hyperv/syndbg.c                   |   4 +-
>  io/channel-socket.c                  |   8 +-
>  io/channel-watch.c                   |  10 +-
>  monitor/fds.c                        |  77 ++++--
>  monitor/hmp-cmds.c                   |   2 +
>  monitor/qmp-cmds.c                   |   7 +
>  net/dgram.c                          |  14 +-
>  net/slirp.c                          |  16 +-
>  net/socket.c                         |  22 +-
>  tests/qtest/libqtest.c               |  26 +-
>  tests/qtest/microbit-test.c          |   2 +-
>  tests/qtest/netdev-socket.c          |  10 +-
>  tests/qtest/vnc-display-test.c       |  12 +-
>  tests/unit/socket-helpers.c          |   2 +-
>  tests/unit/test-error-report.c       | 139 +++++++++++
>  tests/unit/test-io-channel-command.c |   2 +-
>  util/aio-posix.c                     |   6 +-
>  util/aio-win32.c                     |  23 +-
>  util/error.c                         |  10 +-
>  util/main-loop.c                     |  11 -
>  util/oslib-posix.c                   |  70 ------
>  util/oslib-win32.c                   | 350 ++++++++++++++++++++++++---
>  util/qemu-sockets.c                  |  22 +-
>  hmp-commands.hx                      |   2 +
>  tests/docker/docker.py               |   6 +-
>  tests/unit/meson.build               |   1 +
>  38 files changed, 701 insertions(+), 258 deletions(-)
>  create mode 100644 tests/unit/test-error-report.c
>
> --
> 2.39.2
>
>

--000000000000604c9b05f6c6a678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 13, 2023 at 3:43=E2=80=AFPM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517=
:<br>
<br>
=C2=A0 Merge tag &#39;linux-user-for-8.0-pull-request&#39; of <a href=3D"ht=
tps://gitlab.com/laurent_vivier/qemu" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.com/laurent_vivier/qemu</a> into staging (2023-03-12 10:57:0=
0 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/marcandre.lureau/qemu.git" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.com/marcandre.lureau/qemu.git</a> =
tags/win-socket-pull-request<br>
<br>
for you to fetch changes up to 0006c18362cbe1e93587ac1e8ee965c08e6970f2:<br=
>
<br>
=C2=A0 QMP/HMP: only actually implement getfd on CONFIG_POSIX (2023-03-13 1=
5:41:32 +0400)<br>
<br>
----------------------------------------------------------------<br>
QMP command to import win32 sockets<br>
<br>
----------------------------------------------------------------<br>
<br>
Marc-Andr=C3=A9 Lureau (25):<br>
=C2=A0 util: drop qemu_fork()<br>
=C2=A0 tests: use closesocket()<br>
=C2=A0 io: use closesocket()<br>
=C2=A0 tests: add test-error-report<br>
=C2=A0 error: add global &amp;error_warn destination<br>
=C2=A0 win32/socket: introduce qemu_socket_select() helper<br>
=C2=A0 win32/socket: introduce qemu_socket_unselect() helper<br>
=C2=A0 aio: make aio_set_fd_poll() static to aio-posix.c<br>
=C2=A0 aio/win32: aio_set_fd_handler() only supports SOCKET<br>
=C2=A0 main-loop: remove qemu_fd_register(), win32/slirp/socket specific<br=
>
=C2=A0 slirp: unregister the win32 SOCKET<br>
=C2=A0 slirp: open-code qemu_socket_(un)select()<br>
=C2=A0 win32: avoid mixing SOCKET and file descriptor space<br>
=C2=A0 os-posix: remove useless ioctlsocket() define<br>
=C2=A0 win32: replace closesocket() with close() wrapper<br>
=C2=A0 tests: fix path separator, use g_build_filename()<br>
=C2=A0 char: do not double-close fd when failing to add client<br>
=C2=A0 tests/docker: fix a win32 error due to portability<br>
=C2=A0 osdep: implement qemu_socketpair() for win32<br>
=C2=A0 qmp: &#39;add_client&#39; actually expects sockets<br>
=C2=A0 monitor: release the lock before calling close()<br>
=C2=A0 qmp: add &#39;get-win32-socket&#39;<br>
=C2=A0 libqtest: make qtest_qmp_add_client work on win32<br>
=C2=A0 qtest: enable vnc-display test on win32<br>
=C2=A0 QMP/HMP: only actually implement getfd on CONFIG_POSIX<br></blockquo=
te><div><br></div><div>My bad, last patch is not the one I intended (with m=
essage fix suggested by Markus). Sending v2.</div><div>=C2=A0 <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0qapi/misc.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 36 ++-<br>
=C2=A0include/block/aio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 -<br>
=C2=A0include/qapi/error.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0include/qemu/main-loop.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 -<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 14 --<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0include/sysemu/os-posix.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 -<br>
=C2=A0include/sysemu/os-win32.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 15 +-<br>
=C2=A0tests/qtest/libqtest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0backends/tpm/tpm_emulator.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0crypto/afalg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0hw/hyperv/syndbg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0io/channel-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0io/channel-watch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0monitor/fds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 77 ++++--<br>
=C2=A0monitor/hmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0net/dgram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +-<br>
=C2=A0net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +-<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 26 +-<br>
=C2=A0tests/qtest/microbit-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0tests/qtest/netdev-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 10 +-<br>
=C2=A0tests/qtest/vnc-display-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +=
-<br>
=C2=A0tests/unit/socket-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0tests/unit/test-error-report.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 139 ++++++=
+++++<br>
=C2=A0tests/unit/test-io-channel-command.c |=C2=A0 =C2=A02 +-<br>
=C2=A0util/aio-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0util/aio-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 +-<br>
=C2=A0util/error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 -<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 70 ------<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 350 ++++++++++++++++++++++++---<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 +-<br>
=C2=A0hmp-commands.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0tests/docker/docker.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0tests/unit/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A038 files changed, 701 insertions(+), 258 deletions(-)<br>
=C2=A0create mode 100644 tests/unit/test-error-report.c<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000604c9b05f6c6a678--


