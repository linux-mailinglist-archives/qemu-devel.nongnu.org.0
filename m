Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABD6815D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWa1-0000kE-J6; Mon, 30 Jan 2023 11:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWZz-0000jo-MA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:00:23 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWZw-00042H-EP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:00:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id m14so11080193wrg.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fQ/FM9SQEHIHqMfK+pe5BjCWiyPGrFIb80IyLW51bs=;
 b=ccVhhGp050zOBZBOqvYp3qnUWhs7A7iiPrx0kD30pSi73xgoNrVgAEP6Gr3OW9WdW9
 CtCNDmswnvJoysVdi9oFnqGbJKY/zXbaHWAr9S8NY34SzbvowA/9ALiKK5HBvsFyGID9
 T7ybKBc4q5B6Ubwtthl3zD5JwbRqhWGq2Fq9ABdI2CfdoyC1WvYNff8IgbVNLhm30CTF
 lSIEJVDpwO4psGhTm6gdh7dXJUP3N81leYqsw+GeEJhwjirzsPri5+OqO4l4JzyVMYOT
 V3/FFDn9+kAhntGJAPqhfSvb7JlvJg24j+i/+4b/nLwM+bTO/X0PRQb8SSjJVaeDzucZ
 0uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0fQ/FM9SQEHIHqMfK+pe5BjCWiyPGrFIb80IyLW51bs=;
 b=NQS5MeNQ/2EwF4KDo3Hsw8h+XaofRWWWewVzEhIhSwKDe5cdwG6QV2jqaUuuPKzjvc
 ntEUMyX4aNC4vvidlCqmP8MrAhOB3hxUQJhye0J6RwriwBFyBO5w7J4P9SAczu4JLZdm
 vmWGnKxw2LPYmIG8vn/8upFHvtlLuA1JO2HG1GgpkoOxmrXJONnfBTHCy6RHmN/cBAuA
 E1cKA9oqAIaVQRA773zv1HqTK9WlK1gzQ7gT4ADzfBDykztQhDD52rXBq2IoAu8UVTps
 CbLZjfOZGL8bFP/VjMqX/MDi6zOLyh7IVS70LSwf1dG0VQ2O4AgruhgW0NUajrqeInyN
 lK7w==
X-Gm-Message-State: AFqh2kpTaPLb8zkpkRP3qJUGp5h/sN5WZCt9L58N84RsXSC+fzxvNRrh
 fy2uI3xuhgwEQQcBJO+JkwhCjg==
X-Google-Smtp-Source: AMrXdXu2cEZulZg+0HIt9cbD0QCLdi0EFU7G5qL/90LjqXsFVjVydLrKu9hkb0iGwyVaD7eaKalJDQ==
X-Received: by 2002:adf:c78b:0:b0:2bd:dd13:170f with SMTP id
 l11-20020adfc78b000000b002bddd13170fmr53972614wrg.26.1675094418546; 
 Mon, 30 Jan 2023 08:00:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm1604998wrr.2.2023.01.30.08.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 08:00:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 946CE1FFB7;
 Mon, 30 Jan 2023 16:00:17 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-9-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, "Michael S.
 Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 8/9] virtio-gpu: Initialize Venus
Date: Mon, 30 Jan 2023 15:55:21 +0000
In-reply-to: <20220926142422.22325-9-antonio.caggiano@collabora.com>
Message-ID: <87mt606mi6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> Request Venus when initializing VirGL.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 16f600adbb..0f17bdddd0 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -806,7 +806,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>  {
>      int ret;
>=20=20
> -    ret =3D virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> +    ret =3D virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_=
cbs);
>      if (ret !=3D 0) {
>          error_report("virgl could not be initialized: %d", ret);
>          return ret;

We need to probe for Venus support in virgl in configure:

irtio-gpu-virgl.c.o -c ../../hw/display/virtio-gpu-virgl.c
../../hw/display/virtio-gpu-virgl.c: In function =E2=80=98virtio_gpu_virgl_=
init=E2=80=99:
../../hw/display/virtio-gpu-virgl.c:820:34: error: =E2=80=98VIRGL_RENDERER_=
VENUS=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98VIRGL_RENDERER_USE_EGL=E2=80=99?
  820 |     ret =3D virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gp=
u_3d_cbs);
      |                                  ^~~~~~~~~~~~~~~~~~~~
      |                                  VIRGL_RENDERER_USE_EGL
../../hw/display/virtio-gpu-virgl.c:820:34: note: each undeclared identifie=
r is reported only once for each function it appears in

While I fixed the callback with:

  modified   hw/display/virtio-gpu-virgl.c
  @@ -744,10 +744,12 @@ static int virgl_make_context_current(void *opaque,=
 int scanout_idx,
                                      qctx);
   }

  +#if VIRGL_RENDERER_CALLBACKS_VERSION >=3D 4
   static void *virgl_get_egl_display(void *opaque)
   {
       return eglGetCurrentDisplay();
   }
  +#endif

   static struct virgl_renderer_callbacks virtio_gpu_3d_cbs =3D {
       .version             =3D 4,
  @@ -755,7 +757,9 @@ static struct virgl_renderer_callbacks virtio_gpu_3d_=
cbs =3D {
       .create_gl_context   =3D virgl_create_context,
       .destroy_gl_context  =3D virgl_destroy_context,
       .make_current        =3D virgl_make_context_current,
  +#if VIRGL_RENDERER_CALLBACKS_VERSION >=3D 4
       .get_egl_display     =3D virgl_get_egl_display,
  +#endif
   };

   static void virtio_gpu_print_stats(void *opaque)

I suspect we shouldn't unconditionally enable VENUS here. This sounds
like it needs a configuration knob on the device, i.e.:

 -device virtio-gpu-pci,renderer=3Dvenus

where the default is EGL.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

