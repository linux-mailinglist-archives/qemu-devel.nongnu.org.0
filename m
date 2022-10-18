Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29A602866
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:33:19 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiyH-00077G-Rm
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okimh-00062G-9S
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okime-0002Pj-NC
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666084869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9MK6B94e2u92SH8h9csqYy/jq2OHdPHQUZUOG6BPzLg=;
 b=UYwh/lmS6X6EC+b7GMJh7b40yG6mFwYBsUSG/gtLBXkkBaulQKzwHYQBb+vPIQezMK3mln
 50qC37gVtJmjn5JfqqrJnC4JMv3ahTYOYX/lcGhX1QhyyQUYb4jIDG3K4FZd5YRFWThlu6
 JWRjgRIN5gIjasPgimLEF8bYmffjPa4=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645--Ac6ljUFPJaO3dqWSQ_QXA-1; Tue, 18 Oct 2022 05:21:05 -0400
X-MC-Unique: -Ac6ljUFPJaO3dqWSQ_QXA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13234741239so5705339fac.7
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MK6B94e2u92SH8h9csqYy/jq2OHdPHQUZUOG6BPzLg=;
 b=jZSrxewP5l1txBnwcPIWSPp2qLrXcBKg511DIoLMVlcXJ1ursaQ+AOlWcTbXVLJzmL
 kgW54/LQ99vDpcpHiHuDbVrUAA0Nx54NZChFtT1SiAHGT6n1q5jUO3UzBqxIlCnVZssn
 H7gK7vglWhFgXTq/WuucQwjDuCjJzpo71J9dcWSx5pZGPrgckr8fvvHbV/XdJg3759dm
 KydSRe0bxN9LyjcLN/YHhQTazeDnswmsGKPJp+pJptP4NXGidWqME0dqmQKImNWBmdsE
 0kwemP3/YRmAad6nzirU7fXzgSVonjMbMX5d303TcOY/KTcoHjSO3BSYxh/8d7zWbTu1
 I61g==
X-Gm-Message-State: ACrzQf0lofdrNOgses5HYkJ3fjlIreRSPpf17yr2F7QaG3KTG9bPoO9e
 Gd1V173wE5BhNP49wvCQAEu+aWLlhGS/VFBG6AJNQs6sIvycRe/qVLcUUeKdB2EY5sUY+RHa/P+
 0/+xVk27R2neXDWSud0YFjgPaC2Bnets=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1089944oao.53.1666084864441; 
 Tue, 18 Oct 2022 02:21:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74/AyW520zYccanesF2uaqokGGJvTzAU8gfJsCwE0Sqj4ag/iz3HYV3egeYSPpCQ0CQ2XwCbvVKQLYsB8TktA=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1089937oao.53.1666084864204; Tue, 18
 Oct 2022 02:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
 <20221018084341.16270-2-nivanov@cloudlinux.com>
In-Reply-To: <20221018084341.16270-2-nivanov@cloudlinux.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 18 Oct 2022 13:20:52 +0400
Message-ID: <CAMxuvawmkCCcHf0Rb7+-VQrOPR_cqjckTi_vHt4MWtnUe1XbWw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007f3e2405eb4b9c59"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f3e2405eb4b9c59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 12:44 PM Nikita Ivanov <nivanov@cloudlinux.com>
wrote:

> Rename macro name to more transparent one and refactor
> it to expression.
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  chardev/char-fd.c      | 2 +-
>  chardev/char-pipe.c    | 8 +++++---
>  include/qemu/osdep.h   | 8 +++++++-
>  net/tap-bsd.c          | 6 +++---
>  net/tap-linux.c        | 2 +-
>  net/tap-solaris.c      | 8 ++++----
>  net/tap.c              | 2 +-
>  os-posix.c             | 2 +-
>  tests/qtest/libqtest.c | 2 +-
>  9 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..d2c4923359 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags=
,
> Error **errp)
>  {
>      int fd =3D -1;
>
> -    TFR(fd =3D qemu_open_old(src, flags, 0666));
> +    fd =3D RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
>      if (fd =3D=3D -1) {
>          error_setg_file_open(errp, errno, src);
>      }
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b85091..5ad30bcc59 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
>
>      filename_in =3D g_strdup_printf("%s.in", filename);
>      filename_out =3D g_strdup_printf("%s.out", filename);
> -    TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));
> -    TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));
> +    fd_in =3D RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR | O_BINAR=
Y));
> +    fd_out =3D RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR |
> O_BINARY));
>      g_free(filename_in);
>      g_free(filename_out);
>      if (fd_in < 0 || fd_out < 0) {
> @@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >=3D 0) {
>              close(fd_out);
>          }
> -        TFR(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BINA=
RY));
> +        fd_in =3D fd_out =3D RETRY_ON_EINTR(
> +            qemu_open_old(filename, O_RDWR | O_BINARY)
> +        );
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
>              return;
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..45fcf5f2dc 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>  #define ESHUTDOWN 4099
>  #endif
>
> -#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D =
EINTR)
> +#define RETRY_ON_EINTR(expr) \
> +    (__extension__                                          \
> +        ({ typeof(expr) __result;                               \
> +           do {                                             \
> +                __result =3D (typeof(expr)) (expr);         \
> +           } while (__result =3D=3D -1 && errno =3D=3D EINTR);     \
> +           __result; }))
>
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e..4c98fdd337 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>          } else {
>              snprintf(dname, sizeof dname, "/dev/tap%d", i);
>          }
> -        TFR(fd =3D open(dname, O_RDWR));
> +        fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd >=3D 0) {
>              break;
>          }
> @@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
> ifname_size, Error **errp)
>      int fd, s, ret;
>      struct ifreq ifr;
>
> -    TFR(fd =3D open(PATH_NET_TAP, O_RDWR));
> +    fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP)=
;
>          return -1;
> @@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      if (ifname[0] !=3D '\0') {
>          char dname[100];
>          snprintf(dname, sizeof dname, "/dev/%s", ifname);
> -        TFR(fd =3D open(dname, O_RDWR));
> +        fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd < 0 && errno !=3D ENOENT) {
>              error_setg_errno(errp, errno, "could not open %s", dname);
>              return -1;
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 304ff45071..f54f308d35 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int
> *vnet_hdr,
>      int len =3D sizeof(struct virtio_net_hdr);
>      unsigned int features;
>
> -    TFR(fd =3D open(PATH_NET_TUN, O_RDWR));
> +    fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN)=
;
>          return -1;
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index a44f8805c2..38e15028bf 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if( ip_fd )
>         close(ip_fd);
>
> -    TFR(ip_fd =3D open("/dev/udp", O_RDWR, 0));
> +    ip_fd =3D RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
>      if (ip_fd < 0) {
>          error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
>          return -1;
>      }
>
> -    TFR(tap_fd =3D open("/dev/tap", O_RDWR, 0));
> +    tap_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (tap_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap");
>          return -1;
> @@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if ((ppa =3D ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
>          error_report("Can't assign new interface");
>
> -    TFR(if_fd =3D open("/dev/tap", O_RDWR, 0));
> +    if_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg(errp, "Can't open /dev/tap (2)");
>          return -1;
> @@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Erro=
r
> **errp)
>      if (ioctl (ip_fd, I_PUSH, "arp") < 0)
>          error_report("Can't push ARP module (3)");
>      /* Open arp_fd */
> -    TFR(arp_fd =3D open ("/dev/tap", O_RDWR, 0));
> +    arp_fd =3D RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (arp_fd < 0)
>          error_report("Can't open %s", "/dev/tap");
>
> diff --git a/net/tap.c b/net/tap.c
> index e203d07a12..e090d14203 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *tap,
> int *vnet_hdr,
>          vnet_hdr_required =3D 0;
>      }
>
> -    TFR(fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
> +    fd =3D RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr,
> vnet_hdr_required,
>                        mq_required, errp));
>      if (fd < 0) {
>          return -1;
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..bb27f67bac 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -266,7 +266,7 @@ void os_setup_post(void)
>              error_report("not able to chdir to /: %s", strerror(errno));
>              exit(1);
>          }
> -        TFR(fd =3D qemu_open_old("/dev/null", O_RDWR));
> +        fd =3D RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
>          if (fd =3D=3D -1) {
>              exit(1);
>          }
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index b23eb3edc3..90648eb8d1 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
>      /* Skip wait if qtest_probe_child already reaped.  */
>      if (pid !=3D -1) {
>          kill(pid, SIGTERM);
> -        TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
> +        pid =3D RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
>          assert(pid =3D=3D s->qemu_pid);
>          s->qemu_pid =3D -1;
>      }
> --
> 2.37.3
>
>

--0000000000007f3e2405eb4b9c59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 18, 2022 at 12:44 PM Niki=
ta Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com">nivanov@cloudlinux.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Rename macro name to more transparent one and refactor<br>
it to expression.<br>
<br>
Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" =
target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0chardev/char-pipe.c=C2=A0 =C2=A0 | 8 +++++---<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0| 8 +++++++-<br>
=C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
=C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqtest.c | 2 +-<br>
=C2=A09 files changed, 24 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>
index cf78454841..d2c4923359 100644<br>
--- a/chardev/char-fd.c<br>
+++ b/chardev/char-fd.c<br>
@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags, =
Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>
<br>
-=C2=A0 =C2=A0 TFR(fd =3D qemu_open_old(src, flags, 0666));<br>
+=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, src);<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c<br>
index 66d3b85091..5ad30bcc59 100644<br>
--- a/chardev/char-pipe.c<br>
+++ b/chardev/char-pipe.c<br>
@@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
<br>
=C2=A0 =C2=A0 =C2=A0filename_in =3D g_strdup_printf(&quot;%<a href=3D"http:=
//s.in" rel=3D"noreferrer" target=3D"_blank">s.in</a>&quot;, filename);<br>
=C2=A0 =C2=A0 =C2=A0filename_out =3D g_strdup_printf(&quot;%s.out&quot;, fi=
lename);<br>
-=C2=A0 =C2=A0 TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY))=
;<br>
-=C2=A0 =C2=A0 TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY=
));<br>
+=C2=A0 =C2=A0 fd_in =3D RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR |=
 O_BINARY));<br>
+=C2=A0 =C2=A0 fd_out =3D RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR=
 | O_BINARY));<br>
=C2=A0 =C2=A0 =C2=A0g_free(filename_in);<br>
=C2=A0 =C2=A0 =C2=A0g_free(filename_out);<br>
=C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0 || fd_out &lt; 0) {<br>
@@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_out &gt;=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd_out);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd_in =3D fd_out =3D qemu_open_old(filenam=
e, O_RDWR | O_BINARY));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_in =3D fd_out =3D RETRY_ON_EINTR(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_open_old(filename, O_RDWR |=
 O_BINARY)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, =
errno, filename);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index b1c161c035..45fcf5f2dc 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -243,7 +243,13 @@ void QEMU_ERROR(&quot;code path is reachable&quot;)<br=
>
=C2=A0#define ESHUTDOWN 4099<br>
=C2=A0#endif<br>
<br>
-#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D EI=
NTR)<br>
+#define RETRY_ON_EINTR(expr) \<br>
+=C2=A0 =C2=A0 (__extension__=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ typeof(expr) __result;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __result =3D (type=
of(expr)) (expr);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (__result =3D=3D -1 &amp;=
&amp; errno =3D=3D EINTR);=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__result; }))<br>
<br>
=C2=A0/* time_t may be either 32 or 64 bits depending on the host OS, and<b=
r>
=C2=A0 * can be either signed or unsigned, so we can&#39;t just hardcode a<=
br>
diff --git a/net/tap-bsd.c b/net/tap-bsd.c<br>
index 005ce05c6e..4c98fdd337 100644<br>
--- a/net/tap-bsd.c<br>
+++ b/net/tap-bsd.c<br>
@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dnam=
e, &quot;/dev/tap%d&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D open(dname, O_RDWR));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int ifname_size=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0int fd, s, ret;<br>
=C2=A0 =C2=A0 =C2=A0struct ifreq ifr;<br>
<br>
-=C2=A0 =C2=A0 TFR(fd =3D open(PATH_NET_TAP, O_RDWR));<br>
+=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;could=
 not open %s&quot;, PATH_NET_TAP);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
@@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_h=
dr,<br>
=C2=A0 =C2=A0 =C2=A0if (ifname[0] !=3D &#39;\0&#39;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char dname[100];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dname, &quot;/dev/=
%s&quot;, ifname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D open(dname, O_RDWR));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0 &amp;&amp; errno !=3D ENOEN=
T) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errn=
o, &quot;could not open %s&quot;, dname);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
diff --git a/net/tap-linux.c b/net/tap-linux.c<br>
index 304ff45071..f54f308d35 100644<br>
--- a/net/tap-linux.c<br>
+++ b/net/tap-linux.c<br>
@@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr=
,<br>
=C2=A0 =C2=A0 =C2=A0int len =3D sizeof(struct virtio_net_hdr);<br>
=C2=A0 =C2=A0 =C2=A0unsigned int features;<br>
<br>
-=C2=A0 =C2=A0 TFR(fd =3D open(PATH_NET_TUN, O_RDWR));<br>
+=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;could=
 not open %s&quot;, PATH_NET_TUN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
diff --git a/net/tap-solaris.c b/net/tap-solaris.c<br>
index a44f8805c2..38e15028bf 100644<br>
--- a/net/tap-solaris.c<br>
+++ b/net/tap-solaris.c<br>
@@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0if( ip_fd )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ip_fd);<br>
<br>
-=C2=A0 =C2=A0 TFR(ip_fd =3D open(&quot;/dev/udp&quot;, O_RDWR, 0));<br>
+=C2=A0 =C2=A0 ip_fd =3D RETRY_ON_EINTR(open(&quot;/dev/udp&quot;, O_RDWR, =
0));<br>
=C2=A0 =C2=A0 =C2=A0if (ip_fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /de=
v/ip (actually /dev/udp)&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 TFR(tap_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0));<br>
+=C2=A0 =C2=A0 tap_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR,=
 0));<br>
=C2=A0 =C2=A0 =C2=A0if (tap_fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /de=
v/tap&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
@@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0if ((ppa =3D ioctl (tap_fd, I_STR, &amp;strioc_ppa)) &l=
t; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t assign new i=
nterface&quot;);<br>
<br>
-=C2=A0 =C2=A0 TFR(if_fd =3D open(&quot;/dev/tap&quot;, O_RDWR, 0));<br>
+=C2=A0 =C2=A0 if_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR, =
0));<br>
=C2=A0 =C2=A0 =C2=A0if (if_fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /de=
v/tap (2)&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0if (ioctl (ip_fd, I_PUSH, &quot;arp&quot;) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t push ARP mod=
ule (3)&quot;);<br>
=C2=A0 =C2=A0 =C2=A0/* Open arp_fd */<br>
-=C2=A0 =C2=A0 TFR(arp_fd =3D open (&quot;/dev/tap&quot;, O_RDWR, 0));<br>
+=C2=A0 =C2=A0 arp_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR,=
 0));<br>
=C2=A0 =C2=A0 =C2=A0if (arp_fd &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t open %s&quot=
;, &quot;/dev/tap&quot;);<br>
<br>
diff --git a/net/tap.c b/net/tap.c<br>
index e203d07a12..e090d14203 100644<br>
--- a/net/tap.c<br>
+++ b/net/tap.c<br>
@@ -651,7 +651,7 @@ static int net_tap_init(const NetdevTapOptions *tap, in=
t *vnet_hdr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnet_hdr_required =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 TFR(fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_re=
quired,<br>
+=C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(tap_open(ifname, ifname_sz, vnet_hdr, =
vnet_hdr_required,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mq_required, errp));<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
diff --git a/os-posix.c b/os-posix.c<br>
index 321fc4bd13..bb27f67bac 100644<br>
--- a/os-posix.c<br>
+++ b/os-posix.c<br>
@@ -266,7 +266,7 @@ void os_setup_post(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;not able=
 to chdir to /: %s&quot;, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd =3D qemu_open_old(&quot;/dev/null&quot;=
, O_RDWR));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(qemu_open_old(&quot;/dev=
/null&quot;, O_RDWR));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index b23eb3edc3..90648eb8d1 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0/* Skip wait if qtest_probe_child already reaped.=C2=A0=
 */<br>
=C2=A0 =C2=A0 =C2=A0if (pid !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(pid, SIGTERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(pid =3D waitpid(s-&gt;qemu_pid, &amp;s-&gt=
;wstatus, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid =3D RETRY_ON_EINTR(waitpid(s-&gt;qemu_pid,=
 &amp;s-&gt;wstatus, 0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(pid =3D=3D s-&gt;qemu_pid);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--0000000000007f3e2405eb4b9c59--


