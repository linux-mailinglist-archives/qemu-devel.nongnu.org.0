Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117016F33B0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 18:54:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptWmC-0005bi-E6; Mon, 01 May 2023 12:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ptWmA-0005bZ-UH
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:53:22 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ptWm7-0004iu-ON
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:53:22 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc4d96e14so10609163a12.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682959997; x=1685551997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=15L/smWCQwYGjQBnUMZs1FwBDjxfs9Q/IvVQtMrF64Y=;
 b=DgfvaPCsKAhHlZCIJSFNA64y8E1iWa+Vu6GPvhG9qSCNp4TYn2e2BiaA6VIY+ve43F
 yHK+zWsVegEdZN7fs784AvpPb1g547Y4ZYRxC6YYoQ/jBCYSqu6V9Z6iroxaGbIjK4Il
 Qp9iVv7YPTx5niBzDquCQai962LkQ/eejGEqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682959997; x=1685551997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15L/smWCQwYGjQBnUMZs1FwBDjxfs9Q/IvVQtMrF64Y=;
 b=Ap6ZGWa4Y69jpcxO1TfMBXwLfhrMdffQ0XIllgyHAWJSymChmNpDZb3VAKiRikbV7r
 mn5ZLeLLqtg8MYDAs1RiZj6aBE7jb4AVcFBGZseLoDYXYYUAU2l4Cuz6T6jIyrdnjPuH
 W+xAY1BrWNERg7YEoPHWJIe53VJz7RqlJCaY5aSE/iCZT4RvqXxyrwWma9P7lbN0SWzp
 xkVIwAnVh5Rgwj4EQ3mqbIX5u5sbrnDEbQxA2k0FL9XlTB3pfVpCnvEA9AYBFs5oL0VJ
 3EAf3j9yRawZMkVyW8Lio3Dstc+ifS7XYQLFfnKZ0r+YUsV83nx/JeFOLzSJrhFyfyg5
 WsxQ==
X-Gm-Message-State: AC+VfDziZgt4LiunA0n/pfSGEI+PdJdKA6DZrd5D085Mkd5yUrbWZPl8
 7AwIMJiDPKor2dpJw0E2Ndhd4OJJ/ZKev5QMu52OAA==
X-Google-Smtp-Source: ACHHUZ6Ci3jqsaQ1IIqej0e5f0dQ8s8zdkcb8Mham6HYkApC+xq9x20zrvJ+VYGlXra/YldKlU8M9A==
X-Received: by 2002:a17:906:4e1a:b0:946:c1d2:8b5d with SMTP id
 z26-20020a1709064e1a00b00946c1d28b5dmr17974569eju.17.1682959997217; 
 Mon, 01 May 2023 09:53:17 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 k9-20020a170906054900b00923f05b2931sm14949703eja.118.2023.05.01.09.53.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 09:53:16 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a5f462so3227a12.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 09:53:16 -0700 (PDT)
X-Received: by 2002:a05:6402:2682:b0:505:bdac:5590 with SMTP id
 w2-20020a056402268200b00505bdac5590mr111edd.0.1682959996231; Mon, 01 May 2023
 09:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
 <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
In-Reply-To: <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 1 May 2023 09:53:03 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=8C3S8wzBQiSrPyNk0CwCLPeb3cvS6x9VS55J4aJncfA@mail.gmail.com>
Message-ID: <CAAfnVB=8C3S8wzBQiSrPyNk0CwCLPeb3cvS6x9VS55J4aJncfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/display/virtio-gpu-virgl: define callbacks in
 realize function
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: multipart/alternative; boundary="000000000000bfe97005faa4a8dc"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000bfe97005faa4a8dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 30, 2023 at 2:48=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:

>
>
> Am 28. April 2023 16:48:21 UTC schrieb Gurchetan Singh <
> gurchetansingh@chromium.org>:
> >From: Gurchetan Singh <gurchetansingh@chromium.org>
> >
> >This reduces the amount of renderer backend specific needed to
> >be exposed to the GL device.  We only need one realize function
> >per renderer backend.
> >
> >Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >---
> >v1: - Remove NULL inits (Philippe)
> >    - Use VIRTIO_GPU_BASE where possible (Philippe)
> >v2: - Fix unnecessary line break (Akihiko)
> >
> > hw/display/virtio-gpu-gl.c     | 15 ++++++---------
> > hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++----------
> > include/hw/virtio/virtio-gpu.h |  7 -------
> > 3 files changed, 31 insertions(+), 26 deletions(-)
> >
> >diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> >index 2d140e8792..cdc9483e4d 100644
> >--- a/hw/display/virtio-gpu-gl.c
> >+++ b/hw/display/virtio-gpu-gl.c
> >@@ -21,6 +21,11 @@
> > #include "hw/virtio/virtio-gpu-pixman.h"
> > #include "hw/qdev-properties.h"
> >
> >+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **err=
p)
> >+{
> >+    virtio_gpu_virgl_device_realize(qdev, errp);
> >+}
> >+
> > static Property virtio_gpu_gl_properties[] =3D {
> >     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> >                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
> >@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass
> *klass, void *data)
> > {
> >     DeviceClass *dc =3D DEVICE_CLASS(klass);
> >     VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> >-    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLASS(klass);
> >-    VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass);
> >-
> >-    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
> >-    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
> >-    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
> >-    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
> >
> >-    vdc->realize =3D virtio_gpu_virgl_device_realize;
> >-    vdc->reset =3D virtio_gpu_virgl_reset;
> >+    vdc->realize =3D virtio_gpu_gl_device_realize;
> >     device_class_set_props(dc, virtio_gpu_gl_properties);
> > }
> >
> >diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl=
.c
> >index 786351446c..d7e01f1c77 100644
> >--- a/hw/display/virtio-gpu-virgl.c
> >+++ b/hw/display/virtio-gpu-virgl.c
> >@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >     g_free(resp);
> > }
> >
> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >-                                      struct virtio_gpu_ctrl_command
> *cmd)
> >+static void
> >+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >+                             struct virtio_gpu_ctrl_command *cmd)
> > {
> >     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
> >
> >@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIOGP=
U
> *g)
> >     return capset2_max_ver ? 2 : 1;
> > }
> >
> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> >+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> >                                struct virtio_gpu_scanout *s,
> >                                uint32_t resource_id)
> > {
> >@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> >     free(data);
> > }
> >
> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
> >+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
> > {
> >     VirtIOGPU *g =3D VIRTIO_GPU(b);
> >
> >     virtio_gpu_process_cmdq(g);
> > }
> >
> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> >+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue
> *vq)
> > {
> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
> >@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev=
,
> VirtQueue *vq)
> >     virtio_gpu_virgl_fence_poll(g);
> > }
> >
> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> >+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> > {
> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
> >@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> >
> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
> > {
> >-    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
> >+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >+
> >+    VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);
> >+    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bdev);
> >+
> >+    VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);
> >+    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);
> >+
> >+    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
> >+    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
> >+    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
> >+    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
> >+
> >+    vdc->reset =3D virtio_gpu_virgl_reset;
>
> A realize method is supposed to modify a single instance only while we're
> modifying the behavior of whole classes here, i.e. will affect every
> instance of these classes.

This goes against QOM design principles and will therefore be confusing for
> people who are familiar with QOM in particular and OOP in general.


Context: this is a cleanup in preparation for the gfxstream/rutabaga
support:

 https://patchew.org/QEMU/20230421011223.718-1-gurchetansingh@chromium.org/

I explored creating a separate "virtio-gpu-rutabaga" device, but felt it
added too much duplicate code (such as virtio-gpu-pci-rutabaga.c and
virtio-vga-rutabaga.c).  Please see here:

https://gitlab.freedesktop.org/gurchetansingh/qemu-gfxstream/-/commits/mast=
er

for that approach (current approach is in "qemu-gfxstream2" branch).

In the current approach, function pointers are modified in realize(..)
instead of class_init(..) since "capset_names" can choose the appropriate
backend, but that variable is only accessible after class_init(..).

The difference between instance_init() and the realize() has also come up
before here:

https://lore.kernel.org/all/268082DD-5FBB-41CC-8718-7D6BAA0D323A@livius.net=
/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d


> I think the code should be cleaned up in a different way if really needed=
.
>

Sure, if there's a cleaner way, we should definitely explore it.  Given the
goal of adding another backend for virtio-gpu, how do you suggest
refactoring the code?


>
> Best regards,
> Bernhard
>
> >
> > #if HOST_BIG_ENDIAN
> >     error_setg(errp, "virgl is not supported on bigendian platforms");
> >@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState
> *qdev, Error **errp)
> >         return;
> >     }
> >
> >-    g->parent_obj.conf.flags |=3D (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
> >-    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =3D
> >-        virtio_gpu_virgl_get_num_capsets(g);
> >+    VIRTIO_GPU_BASE(gpudev)->conf.flags |=3D (1 <<
> VIRTIO_GPU_FLAG_VIRGL_ENABLED);
> >+    VIRTIO_GPU_BASE(gpudev)->virtio_config.num_capsets =3D
> >+        virtio_gpu_virgl_get_num_capsets(gpudev);
> >
> >     virtio_gpu_device_realize(qdev, errp);
> > }
> >diff --git a/include/hw/virtio/virtio-gpu.h
> b/include/hw/virtio/virtio-gpu.h
> >index 89ee133f07..d5808f2ab6 100644
> >--- a/include/hw/virtio/virtio-gpu.h
> >+++ b/include/hw/virtio/virtio-gpu.h
> >@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> >                              struct virtio_gpu_rect *r);
> >
> > /* virtio-gpu-3d.c */
> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >-                                  struct virtio_gpu_ctrl_command *cmd);
> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct
> virtio_gpu_scanout *s,
> >-                                    uint32_t resource_id);
> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);
> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev);
> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);
> >
> > #endif
>

--000000000000bfe97005faa4a8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 30, 2023 at 2:48=E2=80=AF=
PM Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_bla=
nk">shentey@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
Am 28. April 2023 16:48:21 UTC schrieb Gurchetan Singh &lt;<a href=3D"mailt=
o:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.or=
g</a>&gt;:<br>
&gt;From: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org=
" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt;<br>
&gt;This reduces the amount of renderer backend specific needed to<br>
&gt;be exposed to the GL device.=C2=A0 We only need one realize function<br=
>
&gt;per renderer backend.<br>
&gt;<br>
&gt;Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chr=
omium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt;Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@l=
inaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt;---<br>
&gt;v1: - Remove NULL inits (Philippe)<br>
&gt;=C2=A0 =C2=A0 - Use VIRTIO_GPU_BASE where possible (Philippe)<br>
&gt;v2: - Fix unnecessary line break (Akihiko)<br>
&gt;<br>
&gt; hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0| 15 ++++++---------<br>
&gt; hw/display/virtio-gpu-virgl.c=C2=A0 | 35 ++++++++++++++++++++++++-----=
-----<br>
&gt; include/hw/virtio/virtio-gpu.h |=C2=A0 7 -------<br>
&gt; 3 files changed, 31 insertions(+), 26 deletions(-)<br>
&gt;<br>
&gt;diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c<br=
>
&gt;index 2d140e8792..cdc9483e4d 100644<br>
&gt;--- a/hw/display/virtio-gpu-gl.c<br>
&gt;+++ b/hw/display/virtio-gpu-gl.c<br>
&gt;@@ -21,6 +21,11 @@<br>
&gt; #include &quot;hw/virtio/virtio-gpu-pixman.h&quot;<br>
&gt; #include &quot;hw/qdev-properties.h&quot;<br>
&gt; <br>
&gt;+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **er=
rp)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 virtio_gpu_virgl_device_realize(qdev, errp);<br>
&gt;+}<br>
&gt;+<br>
&gt; static Property virtio_gpu_gl_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT(&quot;stats&quot;, VirtIOGPU, paren=
t_obj.conf.flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0VIRTIO_GPU_FLAG_STATS_ENABLED, false),<br>
&gt;@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass *kl=
ass, void *data)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klas=
s);<br>
&gt;-=C2=A0 =C2=A0 VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLASS(klass)=
;<br>
&gt;-=C2=A0 =C2=A0 VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass);<br>
&gt;-<br>
&gt;-=C2=A0 =C2=A0 vbc-&gt;gl_flushed =3D virtio_gpu_virgl_flushed;<br>
&gt;-=C2=A0 =C2=A0 vgc-&gt;handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;<br=
>
&gt;-=C2=A0 =C2=A0 vgc-&gt;process_cmd =3D virtio_gpu_virgl_process_cmd;<br=
>
&gt;-=C2=A0 =C2=A0 vgc-&gt;update_cursor_data =3D virtio_gpu_virgl_update_c=
ursor;<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 vdc-&gt;realize =3D virtio_gpu_virgl_device_realize;<br>
&gt;-=C2=A0 =C2=A0 vdc-&gt;reset =3D virtio_gpu_virgl_reset;<br>
&gt;+=C2=A0 =C2=A0 vdc-&gt;realize =3D virtio_gpu_gl_device_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, virtio_gpu_gl_properties=
);<br>
&gt; }<br>
&gt; <br>
&gt;diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virg=
l.c<br>
&gt;index 786351446c..d7e01f1c77 100644<br>
&gt;--- a/hw/display/virtio-gpu-virgl.c<br>
&gt;+++ b/hw/display/virtio-gpu-virgl.c<br>
&gt;@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(resp);<br>
&gt; }<br>
&gt; <br>
&gt;-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virti=
o_gpu_ctrl_command *cmd)<br>
&gt;+static void<br>
&gt;+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_ctrl_command *cmd)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FILL_CMD(cmd-&gt;cmd_hdr);<br>
&gt; <br>
&gt;@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIOG=
PU *g)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return capset2_max_ver ? 2 : 1;<br>
&gt; }<br>
&gt; <br>
&gt;-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,<br>
&gt;+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_scanout *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t resource_id)<br>
&gt; {<br>
&gt;@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0free(data);<br>
&gt; }<br>
&gt; <br>
&gt;-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)<br>
&gt;+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(b);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_process_cmdq(g);<br>
&gt; }<br>
&gt; <br>
&gt;-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)<b=
r>
&gt;+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue=
 *vq)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(vdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);<br>
&gt;@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vde=
v, VirtQueue *vq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_virgl_fence_poll(g);<br>
&gt; }<br>
&gt; <br>
&gt;-void virtio_gpu_virgl_reset(VirtIODevice *vdev)<br>
&gt;+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(vdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);<br>
&gt;@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)<br=
>
&gt; <br>
&gt; void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)<=
br>
&gt; {<br>
&gt;-=C2=A0 =C2=A0 VirtIOGPU *g =3D VIRTIO_GPU(qdev);<br>
&gt;+=C2=A0 =C2=A0 VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);<br>
&gt;+=C2=A0 =C2=A0 VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev)=
;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);<br>
&gt;+=C2=A0 =C2=A0 VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bd=
ev);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);<br>
&gt;+=C2=A0 =C2=A0 VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);<br=
>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 vbc-&gt;gl_flushed =3D virtio_gpu_virgl_flushed;<br>
&gt;+=C2=A0 =C2=A0 vgc-&gt;handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;<br=
>
&gt;+=C2=A0 =C2=A0 vgc-&gt;process_cmd =3D virtio_gpu_virgl_process_cmd;<br=
>
&gt;+=C2=A0 =C2=A0 vgc-&gt;update_cursor_data =3D virtio_gpu_virgl_update_c=
ursor;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 vdc-&gt;reset =3D virtio_gpu_virgl_reset;<br>
<br>
A realize method is supposed to modify a single instance only while we&#39;=
re modifying the behavior of whole classes here, i.e. will affect every ins=
tance of these classes.=C2=A0</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">This goes against QOM design principles and will therefore=
 be confusing for people who are familiar with QOM in particular and OOP in=
 general.</blockquote><div><br></div><div>Context: this is a cleanup in pre=
paration for the gfxstream/rutabaga support:</div><div><br></div><div>=C2=
=A0<a href=3D"https://patchew.org/QEMU/20230421011223.718-1-gurchetansingh@=
chromium.org/" target=3D"_blank">https://patchew.org/QEMU/20230421011223.71=
8-1-gurchetansingh@chromium.org/</a></div><div><br></div><div>I explored cr=
eating a separate &quot;virtio-gpu-rutabaga&quot; device, but felt it added=
 too much duplicate code (such as virtio-gpu-pci-rutabaga.c and virtio-vga-=
rutabaga.c).=C2=A0 Please see here:<div><br></div><div><a href=3D"https://g=
itlab.freedesktop.org/gurchetansingh/qemu-gfxstream/-/commits/master" targe=
t=3D"_blank">https://gitlab.freedesktop.org/gurchetansingh/qemu-gfxstream/-=
/commits/master</a><br></div><div><br></div><div>for that approach (current=
 approach is in &quot;qemu-gfxstream2&quot; branch).=C2=A0 =C2=A0 =C2=A0=C2=
=A0</div><div><br></div><div>In the current approach, function pointers are=
 modified in realize(..) instead of class_init(..) since &quot;capset_names=
&quot; can choose the appropriate backend, but that variable is only access=
ible after class_init(..).</div></div><div><br></div><div>The difference be=
tween instance_init() and the realize() has also come up before here:</div>=
<div><br></div><div><a href=3D"https://lore.kernel.org/all/268082DD-5FBB-41=
CC-8718-7D6BAA0D323A@livius.net/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1=
d">https://lore.kernel.org/all/268082DD-5FBB-41CC-8718-7D6BAA0D323A@livius.=
net/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d</a></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I think the code should b=
e cleaned up in a different way if really needed.<br></blockquote><div><br>=
</div><div><div><div>Sure, if there&#39;s a cleaner way, we should definite=
ly explore it.=C2=A0 Given the goal of adding another backend for virtio-gp=
u, how do you suggest refactoring the code?</div></div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
Bernhard<br>
<br>
&gt; <br>
&gt; #if HOST_BIG_ENDIAN<br>
&gt;=C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;virgl is not supported on bi=
gendian platforms&quot;);<br>
&gt;@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState *q=
dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 g-&gt;parent_obj.conf.flags |=3D (1 &lt;&lt; VIRTIO_GPU_=
FLAG_VIRGL_ENABLED);<br>
&gt;-=C2=A0 =C2=A0 VIRTIO_GPU_BASE(g)-&gt;virtio_config.num_capsets =3D<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_virgl_get_num_capsets(g);<br>
&gt;+=C2=A0 =C2=A0 VIRTIO_GPU_BASE(gpudev)-&gt;conf.flags |=3D (1 &lt;&lt; =
VIRTIO_GPU_FLAG_VIRGL_ENABLED);<br>
&gt;+=C2=A0 =C2=A0 VIRTIO_GPU_BASE(gpudev)-&gt;virtio_config.num_capsets =
=3D<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_virgl_get_num_capsets(gpudev);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_device_realize(qdev, errp);<br>
&gt; }<br>
&gt;diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-=
gpu.h<br>
&gt;index 89ee133f07..d5808f2ab6 100644<br>
&gt;--- a/include/hw/virtio/virtio-gpu.h<br>
&gt;+++ b/include/hw/virtio/virtio-gpu.h<br>
&gt;@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_rect *r);<br>
&gt; <br>
&gt; /* virtio-gpu-3d.c */<br>
&gt;-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_com=
mand *cmd);<br>
&gt;-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct virtio_gpu_sc=
anout *s,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t resource_i=
d);<br>
&gt;-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);<br>
&gt;-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);<=
br>
&gt;-void virtio_gpu_virgl_reset(VirtIODevice *vdev);<br>
&gt; void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);=
<br>
&gt; <br>
&gt; #endif<br>
</blockquote></div></div>

--000000000000bfe97005faa4a8dc--

