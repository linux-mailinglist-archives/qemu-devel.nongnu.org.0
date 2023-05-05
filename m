Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B66F8A72
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 22:55:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2RB-0001Lv-IO; Fri, 05 May 2023 16:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pv2R9-0001LY-4G
 for qemu-devel@nongnu.org; Fri, 05 May 2023 16:53:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pv2R5-0003lR-3A
 for qemu-devel@nongnu.org; Fri, 05 May 2023 16:53:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso4326544a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683320028; x=1685912028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dWFfbnuRsT7SoryH1N6h/u/gCHnz9Qn20LMKCEyYljg=;
 b=E4YzXxFjHjn9ftx7hDEFSmfOCLlf74zYwLpsuq+ZuSFIRYzdok0dcm/lEbnChJDgFo
 NxkomHft7BC5Ful09KecrKgBjAfcCKvbNUs02Hy7bQoBOPE1Pw7jUhFXTA2xFKrTtXM7
 Q2ty5ePamdK8iNIH4STwRitDQ020/mFk2nGEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683320028; x=1685912028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWFfbnuRsT7SoryH1N6h/u/gCHnz9Qn20LMKCEyYljg=;
 b=mC0hb9OorLbqRRId2qAEnKOVHhi8+8E5I/WhDcl5yECIVA9ZQ9nrcgn8jbS5D75EFo
 KIdBlf7kvtif66ISyhun0mNXJi97tO8KFf+uz0jyg5YloozeVmnTwdTaptHnYszDUK55
 2TK9BrTsLuTBnSitjSuT5uGKB2qU3Th9GKgDk0AIAITml6wOhxEyn2SR44v1Ff7yk13C
 97SfBNfEkUkKGq4aLIAYXNIRrfS38L8AP9O5BsVmnlM+zh45bW1kurLQqX0/e3osR0sg
 qJo1hvfMoWinubnNziHSGn6vxO38PAGqv1uFpY/Rf9R+Q8AfM/l6iz70KtlcvhmlQp1o
 UQeA==
X-Gm-Message-State: AC+VfDxraFNXtVoAdFe05vcf8TdjZLwyeSfNX6Zh8fV5+pPQZaarX5Dj
 ruUKqAQ+orOTws8I1I9+3lZO9UPM7BipGjo8e3lJCg==
X-Google-Smtp-Source: ACHHUZ5OHdZb2AVVp8UEYoIxGDgQ5gCPuyKZCtCOQlL9WYIsudOVRejpNcRXR/VRUFjmH/ri3FehZw==
X-Received: by 2002:aa7:c548:0:b0:50b:b7f5:3128 with SMTP id
 s8-20020aa7c548000000b0050bb7f53128mr2287489edr.12.1683320028348; 
 Fri, 05 May 2023 13:53:48 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 e6-20020aa7d7c6000000b004af6c5f1805sm3297165eds.52.2023.05.05.13.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 13:53:47 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-4d9b2045e1cso30594a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 13:53:47 -0700 (PDT)
X-Received: by 2002:a05:6402:1d4e:b0:506:c207:c979 with SMTP id
 dz14-20020a0564021d4e00b00506c207c979mr3680edb.0.1683320026803; Fri, 05 May
 2023 13:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
 <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
 <CAAfnVB=8C3S8wzBQiSrPyNk0CwCLPeb3cvS6x9VS55J4aJncfA@mail.gmail.com>
 <6E514B4B-9185-424E-832E-01813DE8E83F@gmail.com>
In-Reply-To: <6E514B4B-9185-424E-832E-01813DE8E83F@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 5 May 2023 13:53:34 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkZxW3sVyWe_t9s=4Ri3f3hT0a3DpDGwueqTBnoaXKdEw@mail.gmail.com>
Message-ID: <CAAfnVBkZxW3sVyWe_t9s=4Ri3f3hT0a3DpDGwueqTBnoaXKdEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/display/virtio-gpu-virgl: define callbacks in
 realize function
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: multipart/alternative; boundary="0000000000003e788c05faf87ce1"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

--0000000000003e788c05faf87ce1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 10:48=E2=80=AFAM Bernhard Beschow <shentey@gmail.com=
> wrote:

> Am 1. Mai 2023 16:53:03 UTC schrieb Gurchetan Singh <
> gurchetansingh@chromium.org>:
> >On Sun, Apr 30, 2023 at 2:48=E2=80=AFPM Bernhard Beschow <shentey@gmail.=
com>
> wrote:
> >
> >>
> >>
> >> Am 28. April 2023 16:48:21 UTC schrieb Gurchetan Singh <
> >> gurchetansingh@chromium.org>:
> >> >From: Gurchetan Singh <gurchetansingh@chromium.org>
> >> >
> >> >This reduces the amount of renderer backend specific needed to
> >> >be exposed to the GL device.  We only need one realize function
> >> >per renderer backend.
> >> >
> >> >Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> >---
> >> >v1: - Remove NULL inits (Philippe)
> >> >    - Use VIRTIO_GPU_BASE where possible (Philippe)
> >> >v2: - Fix unnecessary line break (Akihiko)
> >> >
> >> > hw/display/virtio-gpu-gl.c     | 15 ++++++---------
> >> > hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++--------=
--
> >> > include/hw/virtio/virtio-gpu.h |  7 -------
> >> > 3 files changed, 31 insertions(+), 26 deletions(-)
> >> >
> >> >diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> >> >index 2d140e8792..cdc9483e4d 100644
> >> >--- a/hw/display/virtio-gpu-gl.c
> >> >+++ b/hw/display/virtio-gpu-gl.c
> >> >@@ -21,6 +21,11 @@
> >> > #include "hw/virtio/virtio-gpu-pixman.h"
> >> > #include "hw/qdev-properties.h"
> >> >
> >> >+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error
> **errp)
> >> >+{
> >> >+    virtio_gpu_virgl_device_realize(qdev, errp);
> >> >+}
> >> >+
> >> > static Property virtio_gpu_gl_properties[] =3D {
> >> >     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> >> >                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
> >> >@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass
> >> *klass, void *data)
> >> > {
> >> >     DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> >     VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> >> >-    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLASS(klass);
> >> >-    VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass);
> >> >-
> >> >-    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
> >> >-    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
> >> >-    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
> >> >-    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
> >> >
> >> >-    vdc->realize =3D virtio_gpu_virgl_device_realize;
> >> >-    vdc->reset =3D virtio_gpu_virgl_reset;
> >> >+    vdc->realize =3D virtio_gpu_gl_device_realize;
> >> >     device_class_set_props(dc, virtio_gpu_gl_properties);
> >> > }
> >> >
> >> >diff --git a/hw/display/virtio-gpu-virgl.c
> b/hw/display/virtio-gpu-virgl.c
> >> >index 786351446c..d7e01f1c77 100644
> >> >--- a/hw/display/virtio-gpu-virgl.c
> >> >+++ b/hw/display/virtio-gpu-virgl.c
> >> >@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >> >     g_free(resp);
> >> > }
> >> >
> >> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >> >-                                      struct virtio_gpu_ctrl_command
> >> *cmd)
> >> >+static void
> >> >+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >> >+                             struct virtio_gpu_ctrl_command *cmd)
> >> > {
> >> >     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
> >> >
> >> >@@ -637,7 +638,7 @@ static int
> virtio_gpu_virgl_get_num_capsets(VirtIOGPU
> >> *g)
> >> >     return capset2_max_ver ? 2 : 1;
> >> > }
> >> >
> >> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> >> >+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> >> >                                struct virtio_gpu_scanout *s,
> >> >                                uint32_t resource_id)
> >> > {
> >> >@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *=
g,
> >> >     free(data);
> >> > }
> >> >
> >> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
> >> >+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
> >> > {
> >> >     VirtIOGPU *g =3D VIRTIO_GPU(b);
> >> >
> >> >     virtio_gpu_process_cmdq(g);
> >> > }
> >> >
> >> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> >> >+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQue=
ue
> >> *vq)
> >> > {
> >> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
> >> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
> >> >@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice
> *vdev,
> >> VirtQueue *vq)
> >> >     virtio_gpu_virgl_fence_poll(g);
> >> > }
> >> >
> >> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> >> >+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> >> > {
> >> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
> >> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
> >> >@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> >> >
> >> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp=
)
> >> > {
> >> >-    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
> >> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
> >> >+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >> >+
> >> >+    VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);
> >> >+    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bdev);
> >> >+
> >> >+    VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);
> >> >+    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);
> >> >+
> >> >+    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
> >> >+    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
> >> >+    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
> >> >+    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
> >> >+
> >> >+    vdc->reset =3D virtio_gpu_virgl_reset;
> >>
> >> A realize method is supposed to modify a single instance only while
> we're
> >> modifying the behavior of whole classes here, i.e. will affect every
> >> instance of these classes.
> >
> >This goes against QOM design principles and will therefore be confusing
> for
> >> people who are familiar with QOM in particular and OOP in general.
> >
> >
> >Context: this is a cleanup in preparation for the gfxstream/rutabaga
> >support:
> >
> >
> https://patchew.org/QEMU/20230421011223.718-1-gurchetansingh@chromium.org=
/
>
> Judging from this series the benefit of having a common -gl class isn't
> that big: AFAICS the only synergy effect is sharing a few properties whic=
h
> IMO don't warrant sharing. IOW the almost non-existant benefit rather
> confirms the current design. The last word needs to be spoken by the
> maintainers though.




> >
> >I explored creating a separate "virtio-gpu-rutabaga" device,
>
> Although this approach requires another -pci class it seems cleaner to me
> due to how the QEMU object model works. See below.
>
> > but felt it
> >added too much duplicate code (such as virtio-gpu-pci-rutabaga.c and
> >virtio-vga-rutabaga.c).  Please see here:
> >
> >
> https://gitlab.freedesktop.org/gurchetansingh/qemu-gfxstream/-/commits/ma=
ster
> >
> >for that approach (current approach is in "qemu-gfxstream2" branch).
> >
> >In the current approach, function pointers are modified in realize(..)
> >instead of class_init(..) since "capset_names" can choose the appropriat=
e
> >backend, but that variable is only accessible after class_init(..).
>
> Yeah, your're selecting a backend at runtime by changing a whole class'
> behavior inside an *instance* of that class. This is not how the QEMU
> object model is supposed to work...
>
> >
> >The difference between instance_init() and the realize() has also come u=
p
> >before here:
> >
> >
> https://lore.kernel.org/all/268082DD-5FBB-41CC-8718-7D6BAA0D323A@livius.n=
et/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d
>
> The link is about a related but different topic. It discusses
> .instance_init vs. .realize. This patch is essentially confusing
> .instance_init/.realize and .class_init. You can read more about the QEMU
> object model in general and class initialization in particular here:
> https://www.qemu.org/docs/master/devel/qom.html#class-initialization
>
> >
> >
> >> I think the code should be cleaned up in a different way if really
> needed.
> >>
> >
> >Sure, if there's a cleaner way, we should definitely explore it.  Given
> the
> >goal of adding another backend for virtio-gpu, how do you suggest
> >refactoring the code?
>
> I'm no maintainer but my suggestion would be this: Use your first approac=
h
> with dedicated classes. This would also allow to force the new backend vi=
a
> the command line. If you really need detection at runtime you could eithe=
r
> delegate this to Android Studio (by having it select the best (tm) backen=
d
> via command line) or you might be able to add a so called "sugar property=
"
> and have QEMU make the choice (sugar properties exceed my knowledge thoug=
h).


Sure, it's not too much trouble to go back to the original approach as you
suggest (unless maintainers have any opinions -- it's essentially
overriding class pointers versus additional cookie cutter
virtio-gpu-pci-rutabaga.c/virtio-vga-gl.c files).


>
> Regarding rutabaga I have the following comments:
>
> Given that rutabaga seems to be an abstraction layer over virgl and
> gfxstream it seems redundant to me. QEMU already has an abstraction layer
> for various graphics backends so IMO using another just introduces a
> maintenance burden. Therefore I suggest introducing a dedicated class wic=
h
> uses gfxstream directly. The class name could end with -gfxstream to matc=
h
> the technology.
>
> Furthermore, rutabaga abstracts two C APIs and is used as C API. So the
> benefit of using Rust seems to be low -- not even mentioning the packagin=
g
> issues this causes for Linux distributions.



Last but not least rutabaga seems to be a personal pet project rather than
> something official. I guess that QEMU would't want to rely on a personal
> pet project.


True, my main goal is to get gfxstream support for Android Studio .  But
the secondary goal is also to get Wayland passthrough in QEMU [a] -- which
is currently implemented in Rust owing to its crosvm roots.  We're
targeting a 100% Rust paravirtualization host stack in some cases [b], so
rutabaga_gfx does fulfill a need.

I've also taken a look at Ubuntu/Debian packaging, and it doesn't seem like
a problem since Rust support is very good [c].  As such, using rutabaga
APIs rather than gfxstream APIs in QEMU seems like the way to go (absent
any maintainer opinions).

[a]
https://roscidus.com/blog/blog/2021/03/07/qubes-lite-with-kvm-and-wayland/
[b]  https://fuchsia-review.googlesource.com/c/fuchsia/+/778764
[c] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05555.html


>
> In any case I'd leave the last word to the maintainers.


> Best regards,
> Bernhard
> >
> >
> >>
> >> Best regards,
> >> Bernhard
> >>
> >> >
> >> > #if HOST_BIG_ENDIAN
> >> >     error_setg(errp, "virgl is not supported on bigendian platforms"=
);
> >> >@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState
> >> *qdev, Error **errp)
> >> >         return;
> >> >     }
> >> >
> >> >-    g->parent_obj.conf.flags |=3D (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLE=
D);
> >> >-    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =3D
> >> >-        virtio_gpu_virgl_get_num_capsets(g);
> >> >+    VIRTIO_GPU_BASE(gpudev)->conf.flags |=3D (1 <<
> >> VIRTIO_GPU_FLAG_VIRGL_ENABLED);
> >> >+    VIRTIO_GPU_BASE(gpudev)->virtio_config.num_capsets =3D
> >> >+        virtio_gpu_virgl_get_num_capsets(gpudev);
> >> >
> >> >     virtio_gpu_device_realize(qdev, errp);
> >> > }
> >> >diff --git a/include/hw/virtio/virtio-gpu.h
> >> b/include/hw/virtio/virtio-gpu.h
> >> >index 89ee133f07..d5808f2ab6 100644
> >> >--- a/include/hw/virtio/virtio-gpu.h
> >> >+++ b/include/hw/virtio/virtio-gpu.h
> >> >@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> >> >                              struct virtio_gpu_rect *r);
> >> >
> >> > /* virtio-gpu-3d.c */
> >> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >> >-                                  struct virtio_gpu_ctrl_command
> *cmd);
> >> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct
> >> virtio_gpu_scanout *s,
> >> >-                                    uint32_t resource_id);
> >> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
> >> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)=
;
> >> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev);
> >> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp=
);
> >> >
> >> > #endif
> >>
>

--0000000000003e788c05faf87ce1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 5, 2023 at 10:48=E2=80=AF=
AM Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_bla=
nk">shentey@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Am 1. Mai 2023 16:53:03 UTC schrieb Gurchetan Singh &l=
t;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurcheta=
nsingh@chromium.org</a>&gt;:<br>
&gt;On Sun, Apr 30, 2023 at 2:48=E2=80=AFPM Bernhard Beschow &lt;<a href=3D=
"mailto:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Am 28. April 2023 16:48:21 UTC schrieb Gurchetan Singh &lt;<br>
&gt;&gt; <a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">g=
urchetansingh@chromium.org</a>&gt;:<br>
&gt;&gt; &gt;From: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chr=
omium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;This reduces the amount of renderer backend specific needed to=
<br>
&gt;&gt; &gt;be exposed to the GL device.=C2=A0 We only need one realize fu=
nction<br>
&gt;&gt; &gt;per renderer backend.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetan=
singh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<b=
r>
&gt;&gt; &gt;Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto=
:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt;&gt; &gt;---<br>
&gt;&gt; &gt;v1: - Remove NULL inits (Philippe)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 - Use VIRTIO_GPU_BASE where possible (Philippe)<=
br>
&gt;&gt; &gt;v2: - Fix unnecessary line break (Akihiko)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0| 15 ++++++----=
-----<br>
&gt;&gt; &gt; hw/display/virtio-gpu-virgl.c=C2=A0 | 35 ++++++++++++++++++++=
++++----------<br>
&gt;&gt; &gt; include/hw/virtio/virtio-gpu.h |=C2=A0 7 -------<br>
&gt;&gt; &gt; 3 files changed, 31 insertions(+), 26 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gp=
u-gl.c<br>
&gt;&gt; &gt;index 2d140e8792..cdc9483e4d 100644<br>
&gt;&gt; &gt;--- a/hw/display/virtio-gpu-gl.c<br>
&gt;&gt; &gt;+++ b/hw/display/virtio-gpu-gl.c<br>
&gt;&gt; &gt;@@ -21,6 +21,11 @@<br>
&gt;&gt; &gt; #include &quot;hw/virtio/virtio-gpu-pixman.h&quot;<br>
&gt;&gt; &gt; #include &quot;hw/qdev-properties.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;+static void virtio_gpu_gl_device_realize(DeviceState *qdev, E=
rror **errp)<br>
&gt;&gt; &gt;+{<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 virtio_gpu_virgl_device_realize(qdev, errp);<br=
>
&gt;&gt; &gt;+}<br>
&gt;&gt; &gt;+<br>
&gt;&gt; &gt; static Property virtio_gpu_gl_properties[] =3D {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT(&quot;stats&quot;, VirtIOG=
PU, parent_obj.conf.flags,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_STATS_ENABLED, false),<br>
&gt;&gt; &gt;@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(Object=
Class<br>
&gt;&gt; *klass, void *data)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_C=
LASS(klass);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLA=
SS(klass);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass)=
;<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vbc-&gt;gl_flushed =3D virtio_gpu_virgl_flushed=
;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vgc-&gt;handle_ctrl =3D virtio_gpu_virgl_handle=
_ctrl;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vgc-&gt;process_cmd =3D virtio_gpu_virgl_proces=
s_cmd;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vgc-&gt;update_cursor_data =3D virtio_gpu_virgl=
_update_cursor;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vdc-&gt;realize =3D virtio_gpu_virgl_device_rea=
lize;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 vdc-&gt;reset =3D virtio_gpu_virgl_reset;<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vdc-&gt;realize =3D virtio_gpu_gl_device_realiz=
e;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, virtio_gpu_gl_p=
roperties);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio=
-gpu-virgl.c<br>
&gt;&gt; &gt;index 786351446c..d7e01f1c77 100644<br>
&gt;&gt; &gt;--- a/hw/display/virtio-gpu-virgl.c<br>
&gt;&gt; &gt;+++ b/hw/display/virtio-gpu-virgl.c<br>
&gt;&gt; &gt;@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU=
 *g,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0g_free(resp);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct virtio_gpu_ctrl_command<br>
&gt;&gt; *cmd)<br>
&gt;&gt; &gt;+static void<br>
&gt;&gt; &gt;+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_ctrl_command=
 *cmd)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FILL_CMD(cmd-&gt;cmd_hdr);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capset=
s(VirtIOGPU<br>
&gt;&gt; *g)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0return capset2_max_ver ? 2 : 1;<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,<br>
&gt;&gt; &gt;+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_scanout=
 *s,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t resource_id)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(Virt=
IOGPU *g,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0free(data);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)<br>
&gt;&gt; &gt;+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(b);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_process_cmdq(g);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQue=
ue *vq)<br>
&gt;&gt; &gt;+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, =
VirtQueue<br>
&gt;&gt; *vq)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(vdev);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);<b=
r>
&gt;&gt; &gt;@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODe=
vice *vdev,<br>
&gt;&gt; VirtQueue *vq)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_virgl_fence_poll(g);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_reset(VirtIODevice *vdev)<br>
&gt;&gt; &gt;+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(vdev);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);<b=
r>
&gt;&gt; &gt;@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice =
*vdev)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error=
 **errp)<br>
&gt;&gt; &gt; {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 VirtIOGPU *g =3D VIRTIO_GPU(qdev);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CL=
ASS(vdev);<br>
&gt;&gt; &gt;+<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);<=
br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET=
_CLASS(bdev);<br>
&gt;&gt; &gt;+<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gp=
udev);<br>
&gt;&gt; &gt;+<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vbc-&gt;gl_flushed =3D virtio_gpu_virgl_flushed=
;<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vgc-&gt;handle_ctrl =3D virtio_gpu_virgl_handle=
_ctrl;<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vgc-&gt;process_cmd =3D virtio_gpu_virgl_proces=
s_cmd;<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vgc-&gt;update_cursor_data =3D virtio_gpu_virgl=
_update_cursor;<br>
&gt;&gt; &gt;+<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 vdc-&gt;reset =3D virtio_gpu_virgl_reset;<br>
&gt;&gt;<br>
&gt;&gt; A realize method is supposed to modify a single instance only whil=
e we&#39;re<br>
&gt;&gt; modifying the behavior of whole classes here, i.e. will affect eve=
ry<br>
&gt;&gt; instance of these classes.<br>
&gt;<br>
&gt;This goes against QOM design principles and will therefore be confusing=
 for<br>
&gt;&gt; people who are familiar with QOM in particular and OOP in general.=
<br>
&gt;<br>
&gt;<br>
&gt;Context: this is a cleanup in preparation for the gfxstream/rutabaga<br=
>
&gt;support:<br>
&gt;<br>
&gt; <a href=3D"https://patchew.org/QEMU/20230421011223.718-1-gurchetansing=
h@chromium.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/Q=
EMU/20230421011223.718-1-gurchetansingh@chromium.org/</a><br>
<br>
Judging from this series the benefit of having a common -gl class isn&#39;t=
 that big: AFAICS the only synergy effect is sharing a few properties which=
 IMO don&#39;t warrant sharing. IOW the almost non-existant benefit rather =
confirms the current design. The last word needs to be spoken by the mainta=
iners though.=C2=A0=C2=A0</blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;<br>
&gt;I explored creating a separate &quot;virtio-gpu-rutabaga&quot; device,<=
br>
<br>
Although this approach requires another -pci class it seems cleaner to me d=
ue to how the QEMU object model works. See below.<br>
<br>
&gt; but felt it<br>
&gt;added too much duplicate code (such as virtio-gpu-pci-rutabaga.c and<br=
>
&gt;virtio-vga-rutabaga.c).=C2=A0 Please see here:<br>
&gt;<br>
&gt;<a href=3D"https://gitlab.freedesktop.org/gurchetansingh/qemu-gfxstream=
/-/commits/master" rel=3D"noreferrer" target=3D"_blank">https://gitlab.free=
desktop.org/gurchetansingh/qemu-gfxstream/-/commits/master</a><br>
&gt;<br>
&gt;for that approach (current approach is in &quot;qemu-gfxstream2&quot; b=
ranch).<br>
&gt;<br>
&gt;In the current approach, function pointers are modified in realize(..)<=
br>
&gt;instead of class_init(..) since &quot;capset_names&quot; can choose the=
 appropriate<br>
&gt;backend, but that variable is only accessible after class_init(..).<br>
<br>
Yeah, your&#39;re selecting a backend at runtime by changing a whole class&=
#39; behavior inside an *instance* of that class. This is not how the QEMU =
object model is supposed to work...<br>
<br>
&gt;<br>
&gt;The difference between instance_init() and the realize() has also come =
up<br>
&gt;before here:<br>
&gt;<br>
&gt;<a href=3D"https://lore.kernel.org/all/268082DD-5FBB-41CC-8718-7D6BAA0D=
323A@livius.net/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d" rel=3D"norefe=
rrer" target=3D"_blank">https://lore.kernel.org/all/268082DD-5FBB-41CC-8718=
-7D6BAA0D323A@livius.net/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d</a><b=
r>
<br>
The link is about a related but different topic. It discusses .instance_ini=
t vs. .realize. This patch is essentially confusing .instance_init/.realize=
 and .class_init. You can read more about the QEMU object model in general =
and class initialization in particular here: <a href=3D"https://www.qemu.or=
g/docs/master/devel/qom.html#class-initialization" rel=3D"noreferrer" targe=
t=3D"_blank">https://www.qemu.org/docs/master/devel/qom.html#class-initiali=
zation</a><br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; I think the code should be cleaned up in a different way if really=
 needed.<br>
&gt;&gt;<br>
&gt;<br>
&gt;Sure, if there&#39;s a cleaner way, we should definitely explore it.=C2=
=A0 Given the<br>
&gt;goal of adding another backend for virtio-gpu, how do you suggest<br>
&gt;refactoring the code?<br>
<br>
I&#39;m no maintainer but my suggestion would be this: Use your first appro=
ach with dedicated classes. This would also allow to force the new backend =
via the command line. If you really need detection at runtime you could eit=
her delegate this to Android Studio (by having it select the best (tm) back=
end via command line) or you might be able to add a so called &quot;sugar p=
roperty&quot; and have QEMU make the choice (sugar properties exceed my kno=
wledge though).</blockquote><div><br></div><div>Sure, it&#39;s not too much=
 trouble to go back to the original approach as you suggest (unless maintai=
ners have any opinions -- it&#39;s essentially overriding class pointers ve=
rsus additional cookie cutter virtio-gpu-pci-rutabaga.c/virtio-vga-gl.c fil=
es).=C2=A0=C2=A0</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Regarding rutabaga I have the following comments:<br>
<br>
Given that rutabaga seems to be an abstraction layer over virgl and gfxstre=
am it seems redundant to me. QEMU already has an abstraction layer for vari=
ous graphics backends so IMO using another just introduces a maintenance bu=
rden. Therefore I suggest introducing a dedicated class wich uses gfxstream=
 directly. The class name could end with -gfxstream to match the technology=
.<br>
<br>
Furthermore, rutabaga abstracts two C APIs and is used as C API. So the ben=
efit of using Rust seems to be low -- not even mentioning the packaging iss=
ues this causes for Linux distributions.=C2=A0</blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Last but not least rutabaga seems to be a personal pet project rather than =
something official. I guess that QEMU would&#39;t want to rely on a persona=
l pet project.</blockquote><div><br></div><div>True, my main goal is to get=
 gfxstream support for Android Studio .=C2=A0 But the secondary goal is als=
o to get Wayland passthrough in QEMU [a] -- which is currently implemented =
in Rust owing to its crosvm roots.=C2=A0 We&#39;re targeting a 100% Rust pa=
ravirtualization host stack in some cases [b], so rutabaga_gfx does fulfill=
 a need.</div><div><br></div><div>I&#39;ve also taken a look at Ubuntu/Debi=
an packaging, and it doesn&#39;t seem like a problem since Rust support is =
very good [c].=C2=A0 As such, using rutabaga APIs rather than gfxstream API=
s in QEMU seems like the way to go (absent any maintainer opinions).=C2=A0 =
=C2=A0=C2=A0</div><div><br></div><div>[a]=C2=A0<a href=3D"https://roscidus.=
com/blog/blog/2021/03/07/qubes-lite-with-kvm-and-wayland/" target=3D"_blank=
">https://roscidus.com/blog/blog/2021/03/07/qubes-lite-with-kvm-and-wayland=
/</a></div><div>[b]=C2=A0=C2=A0<a href=3D"https://fuchsia-review.googlesour=
ce.com/c/fuchsia/+/778764" rel=3D"noreferrer" target=3D"_blank">https://fuc=
hsia-review.googlesource.com/c/fuchsia/+/778764</a></div><div>[c]=C2=A0<a h=
ref=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05555.html"=
>https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05555.html</a></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In any case I&#39;d leave the last word to the maintainers.</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
Bernhard<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Bernhard<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; #if HOST_BIG_ENDIAN<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;virgl is not suppor=
ted on bigendian platforms&quot;);<br>
&gt;&gt; &gt;@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(Devic=
eState<br>
&gt;&gt; *qdev, Error **errp)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 g-&gt;parent_obj.conf.flags |=3D (1 &lt;&lt; VI=
RTIO_GPU_FLAG_VIRGL_ENABLED);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 VIRTIO_GPU_BASE(g)-&gt;virtio_config.num_capset=
s =3D<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_virgl_get_num_capsets(=
g);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VIRTIO_GPU_BASE(gpudev)-&gt;conf.flags |=3D (1 =
&lt;&lt;<br>
&gt;&gt; VIRTIO_GPU_FLAG_VIRGL_ENABLED);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 VIRTIO_GPU_BASE(gpudev)-&gt;virtio_config.num_c=
apsets =3D<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_virgl_get_num_capsets(=
gpudev);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_device_realize(qdev, errp);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;diff --git a/include/hw/virtio/virtio-gpu.h<br>
&gt;&gt; b/include/hw/virtio/virtio-gpu.h<br>
&gt;&gt; &gt;index 89ee133f07..d5808f2ab6 100644<br>
&gt;&gt; &gt;--- a/include/hw/virtio/virtio-gpu.h<br>
&gt;&gt; &gt;+++ b/include/hw/virtio/virtio-gpu.h<br>
&gt;&gt; &gt;@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g=
,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_rect *r);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /* virtio-gpu-3d.c */<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_g=
pu_ctrl_command *cmd);<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct<br>
&gt;&gt; virtio_gpu_scanout *s,<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 resource_id);<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQue=
ue *vq);<br>
&gt;&gt; &gt;-void virtio_gpu_virgl_reset(VirtIODevice *vdev);<br>
&gt;&gt; &gt; void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error=
 **errp);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; #endif<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000003e788c05faf87ce1--

