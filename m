Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83B681591
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWQm-0001Y2-O3; Mon, 30 Jan 2023 10:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWQj-0001Xj-AY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:50:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWQd-0002cn-4K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:50:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10352937wma.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8ReE+pMOMGHHz5kzozOoP629rGPsmq+iU4zvQVc358=;
 b=kXEIGtYZytzdicJ7Rd3+oP9S+tQytyMkTM9bsPM8qXgpaAzcB0JK5w+AKNiUl3jS5m
 LQp1cTAKMC3zWwh89ytapQb2AwGleT06hjYpbEsxDPcJAHYVpmWQW/sDtIkxc/gIqX3t
 S8tksOL+nIDV8dIOa879vURvVH27psv1dHy6spwysBNwEQCsq0AJ7eAhBMgOOWOcUHOR
 +c1UoVtybg34+b53oSW75PUosCb0qcHOkwhyLByMahN9PNwDGsl58SERtJ/qK7wGjPPb
 tW7VF6ee/srKWZAz/vGD+xJne3I8l5iPtEmaTNjOhcOgcy0GiRhqlLVjOdmbnF7zI5kL
 GKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U8ReE+pMOMGHHz5kzozOoP629rGPsmq+iU4zvQVc358=;
 b=n/YCkFGrQD8MqzECTgsQTffvVfNyqRcuSw8Mpv9Ngbnzg1WK0Z1H2nOY3UvuMjVVzE
 WabZaQMerUO3j5nbSHnOBNvpbMUbFAxXOrQ14VqaezxQM9NLKhSRbqte6VPTc96RNMno
 HtOJnQcSRQh9rf192FWlpvKlLoblhA/B1tFUEYDnIkVVlF6vHQm6hOziNrfDjSUv/0e/
 UAs2+V2OfERzcUHtpKa1W1Oy8cxf2bSZ2gPeG1lrAFh2t/ylku35W8SddnS94Qpmqz9U
 4ez1crKBN5sjdjSNZ5urwQ3Lrux10I2hUXrwcZ44u1w7yfCMHImpRoFZ20BF6GeMLWAy
 mcSQ==
X-Gm-Message-State: AFqh2kqXZGmqErRNCOmcCZnLmjxWqLJT8ldS5vGKJPM9sRfGrfLwQ/Dt
 MK+E22OHtE/moM4ev/92iiz3ug==
X-Google-Smtp-Source: AMrXdXvEnCZYhLzf7zmxGD6JfwSuqTa2lIaZf3+8MFSFeDAX9u2QmMUL6XGrO+Y0q7avTSs4e8D4ug==
X-Received: by 2002:a1c:f317:0:b0:3d0:480b:ac53 with SMTP id
 q23-20020a1cf317000000b003d0480bac53mr52123307wmq.12.1675093839797; 
 Mon, 30 Jan 2023 07:50:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db0bb81b6asm13743994wmb.1.2023.01.30.07.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:50:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAD041FFB7;
 Mon, 30 Jan 2023 15:50:38 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-10-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, Gerd Hoffmann
 <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 9/9] virtio-gpu: Get EGL Display callback
Date: Mon, 30 Jan 2023 15:49:33 +0000
In-reply-to: <20220926142422.22325-10-antonio.caggiano@collabora.com>
Message-ID: <87r0vc6my9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Antonio Caggiano <antonio.caggiano@collabora.com> writes:

> Implement get_egl_display callback for virglrenderer.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 0f17bdddd0..0fd9ad8a3d 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -18,6 +18,7 @@
>  #include "hw/virtio/virtio-gpu.h"
>  #include "hw/virtio/virtio-gpu-bswap.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include <epoxy/egl.h>
>=20=20
>  #include <virglrenderer.h>
>=20=20
> @@ -743,12 +744,18 @@ static int virgl_make_context_current(void *opaque,=
 int scanout_idx,
>                                     qctx);
>  }
>=20=20
> +static void *virgl_get_egl_display(void *opaque)
> +{
> +    return eglGetCurrentDisplay();
> +}
> +
>  static struct virgl_renderer_callbacks virtio_gpu_3d_cbs =3D {
> -    .version             =3D 1,
> +    .version             =3D 4,
>      .write_fence         =3D virgl_write_fence,
>      .create_gl_context   =3D virgl_create_context,
>      .destroy_gl_context  =3D virgl_destroy_context,
>      .make_current        =3D virgl_make_context_current,
> +    .get_egl_display     =3D virgl_get_egl_display,

This fails for me:

  FAILED: libcommon.fa.p/hw_display_virtio-gpu-virgl.c.o=20
  cc -m64 -mcx16 -Ilibcommon.fa.p -I../../common-user/host/x86_64 -I../../l=
inux-user/include/host/x86_64 -I../../linux-user/include -Idtc/libfdt -I../=
../dtc/libfdt -I/usr/include/capstone -I/usr/include/pixman-1 -I/usr/includ=
e/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/includ=
e/p11-kit-1 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gli=
b-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/gio-unix-=
2.0 -I/usr/include/slirp -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/=
2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-lin=
ux-gnu/dbus-1.0/include -I/usr/include/cairo -I/usr/include/pango-1.0 -I/us=
r/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/inc=
lude/uuid -I/usr/include/freetype2 -I/usr/include/gdk-pixbuf-2.0 -I/usr/inc=
lude/vte-2.91 -I/usr/include/virgl -I/usr/include/cacard -I/usr/include/nss=
 -I/usr/include/nspr -I/usr/include/PCSC -I/usr/include/libusb-1.0 -fdiagno=
stics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem=
 /home/alex/lsrc/qemu.git/linux-headers -isystem linux-headers -iquote . -i=
quote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/include -iq=
uote /home/alex/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIF=
Y_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fn=
o-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-pro=
totypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wold=
-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self =
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansi=
on-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wno-mi=
ssing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-s=
trong -fPIE -D_REENTRANT -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600 -DNCURSES_=
WIDECHAR=3D1 -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa.p/hw_display_virti=
o-gpu-virgl.c.o -MF libcommon.fa.p/hw_display_virtio-gpu-virgl.c.o.d -o lib=
common.fa.p/hw_display_virtio-gpu-virgl.c.o -c ../../hw/display/virtio-gpu-=
virgl.c
  ../../hw/display/virtio-gpu-virgl.c:758:6: error: =E2=80=98struct virgl_r=
enderer_callbacks=E2=80=99 has no member named =E2=80=98get_egl_display=E2=
=80=99
    758 |     .get_egl_display     =3D virgl_get_egl_display,
        |      ^~~~~~~~~~~~~~~
  ../../hw/display/virtio-gpu-virgl.c:758:28: error: initialization of =E2=
=80=98int (*)(void *)=E2=80=99 from incompatible pointer type =E2=80=98void=
 * (*)(void *)=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    758 |     .get_egl_display     =3D virgl_get_egl_display,
        |                            ^~~~~~~~~~~~~~~~~~~~~
  ../../hw/display/virtio-gpu-virgl.c:758:28: note: (near initialization fo=
r =E2=80=98virtio_gpu_3d_cbs.get_drm_fd=E2=80=99)
  ../../hw/display/virtio-gpu-virgl.c: In function =E2=80=98virtio_gpu_virg=
l_init=E2=80=99:
  ../../hw/display/virtio-gpu-virgl.c:816:34: error: =E2=80=98VIRGL_RENDERE=
R_VENUS=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98VIRGL_RENDERER_USE_EGL=E2=80=99?
    816 |     ret =3D virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_=
gpu_3d_cbs);
        |                                  ^~~~~~~~~~~~~~~~~~~~
        |                                  VIRGL_RENDERER_USE_EGL
  ../../hw/display/virtio-gpu-virgl.c:816:34: note: each undeclared identif=
ier is reported only once for each function it appears in
  cc1: all warnings being treated as errors

I assume because I'm either missing a library or my distro version is
too old. Either way this needs to be caught at configure time and
#ifdef'd.


>  };
>=20=20
>  static void virtio_gpu_print_stats(void *opaque)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

