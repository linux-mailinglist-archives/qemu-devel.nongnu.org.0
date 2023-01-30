Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96035681737
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXa0-0006Ps-4U; Mon, 30 Jan 2023 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMXZx-0006Je-2g
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:04:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMXZu-00010C-Pv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:04:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so11725500wrz.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 09:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUaSM1petFfbUvSL1yckpwIFn/BrUiIz91h4Pkyjpe0=;
 b=ly9l2+2qneITB6Zff4zKftmWnswTkjuRXYUELeQU4XkH5cbqkKULMDKS2gnJRotHMO
 7PuiK0xaJVrEN2kuHiVwGzXJT+P8+CXKA/RDWtX5mvt/q4EXvuF7TSQyzSX8Gxi3fhO8
 nw4Wj6ZEauYlVpDYv0FyVHa+bc5sRPVTTBuEMnPGSGDP3nHRVV5lM2rtqeNpNcUPQO5e
 H8a2urQAZualmLZbSnDk9fMxWWfRCodDVcjdsWIXVy0FEz5AES3wDhlRviYLcyUKLb6T
 fJBly6JhcDtswoslbYqqOvINHV0Ry+z00uAuw9qGitNaxtnrFSEP1AldKBEdXoxmrUve
 sATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iUaSM1petFfbUvSL1yckpwIFn/BrUiIz91h4Pkyjpe0=;
 b=OyQAWXa4yk4fUGZd+MMCpEt/OWTjb1+TRAWHmJmMLo8DKTD9MgQ17oH8y4EMLFhMrd
 et5YovYmDLHUSjssx3pTqpXXXXK17BVoHgc/Q8S7NrSrKwO5HaqeTxkRSShMHHBxrMOT
 c/xBuvJVerJ8lIAPJq6ocOqwRMmo7fyCzlBW5yCmqrHI55LtcoZes/zufzHC+Z8jkw23
 +91xKfUPfDbu2hM0tycY0AzEW34/726+WnJX1ZO2CrMGyCagctjh6nRRFodvc2OWQEQY
 P/+hHP9CK/2c1nXFJd3MtTAtJh21tRB78LJA62G9qNxZBHoOLmL2rLu9xxRtHoSzH+ov
 lJgA==
X-Gm-Message-State: AO0yUKVs9r6aCgsRcZBjWMN9GRG1OSwKFEPfcvsmZDYsmwib1lCrP9E7
 9Ten4bFDufQ9rz1A2wE0wIHkLg==
X-Google-Smtp-Source: AK7set9NLi+lwLhY93WgoOPe8Yj7WFtf9e9cT7PR+X9MaVRZ1AD9gkRpX9rhh5qmk0pL8CDJim9b0Q==
X-Received: by 2002:a5d:510a:0:b0:2bf:da3a:36f4 with SMTP id
 s10-20020a5d510a000000b002bfda3a36f4mr9941129wrt.36.1675098260535; 
 Mon, 30 Jan 2023 09:04:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a056000000c00b002bdd96d88b4sm12563224wrx.75.2023.01.30.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 09:04:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B05A81FFB7;
 Mon, 30 Jan 2023 17:04:19 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
Date: Mon, 30 Jan 2023 17:00:02 +0000
In-reply-to: <20220926142422.22325-1-antonio.caggiano@collabora.com>
Message-ID: <877cx46jjg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> This series of patches enables support for the Venus VirtIO-GPU Vulkan
> driver by adding some features required by the driver:
>
> - CONTEXT_INIT
> - HOSTMEM
> - RESOURCE_UUID
> - BLOB_RESOURCES
>
> In addition to these features, Venus capset support was required
> together with the implementation for Virgl blob resource commands.

I managed to apply to current master but I needed a bunch of patches to
get it to compile with my old virgl:

--8<---------------cut here---------------start------------->8---
modified   hw/display/virtio-gpu-virgl.c
@@ -744,10 +744,12 @@ static int virgl_make_context_current(void *opaque, i=
nt scanout_idx,
                                    qctx);
 }
=20
+#if VIRGL_RENDERER_CALLBACKS_VERSION >=3D 4
 static void *virgl_get_egl_display(void *opaque)
 {
     return eglGetCurrentDisplay();
 }
+#endif
=20
 static struct virgl_renderer_callbacks virtio_gpu_3d_cbs =3D {
     .version             =3D 4,
@@ -755,7 +757,9 @@ static struct virgl_renderer_callbacks virtio_gpu_3d_cb=
s =3D {
     .create_gl_context   =3D virgl_create_context,
     .destroy_gl_context  =3D virgl_destroy_context,
     .make_current        =3D virgl_make_context_current,
+#if VIRGL_RENDERER_CALLBACKS_VERSION >=3D 4
     .get_egl_display     =3D virgl_get_egl_display,
+#endif
 };
=20
 static void virtio_gpu_print_stats(void *opaque)
@@ -813,7 +817,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
=20
-    ret =3D virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cb=
s);
+    ret =3D virgl_renderer_init(g, 0 /* VIRGL_RENDERER_VENUS */, &virtio_g=
pu_3d_cbs);
     if (ret !=3D 0) {
         error_report("virgl could not be initialized: %d", ret);
         return ret;
modified   hw/display/virtio-gpu.c
@@ -873,9 +873,12 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *=
res)
 {
+
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
     if (res->mapped) {
         virtio_gpu_virgl_resource_unmap(g, res);
     }
+#endif
=20
     virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
     res->iov =3D NULL;
--8<---------------cut here---------------end--------------->8---

However when I run it with:

gdb --args ./qemu-system-aarch64 \
  -cpu max,pauth-impdef=3Don \
  -machine type=3Dvirt,virtualization=3Don,gic-version=3D3 \
  -serial mon:stdio \
  -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 \
  -device virtio-net-pci,netdev=3Dunet,id=3Dvirt-net,disable-legacy=3Don \
  -device virtio-scsi-pci,id=3Dvirt-scsi,disable-legacy=3Don \
  -blockdev driver=3Draw,node-name=3Dhd,discard=3Dunmap,file.driver=3Dhost_=
device,file.filename=3D/dev/zen-disk/debian-bullseye-arm64 \
  -device scsi-hd,drive=3Dhd,id=3Dvirt-scsi-hd \
  -kernel $HOME/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image \
  -append "root=3D/dev/sda2" \
  -smp 4 -m 4096 \
  -object memory-backend-memfd,id=3Dmem,size=3D4G,share=3Don \
  -numa node,memdev=3Dmem \
  -device qemu-xhci \
  -device usb-tablet \
  -device usb-kbd -global virtio-mmio.force-legacy=3Dfalse \
  -display gtk,gl=3Don -device virtio-gpu-pci=20

something must be broken because it asserts:

  qemu-system-aarch64: ../../hw/core/qdev.c:282: qdev_realize: Assertion `!=
dev->realized && !dev->parent_bus' failed.

  Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:50
  50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  (gdb) bt
  #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.=
c:50
  #1  0x00007ffff5309537 in __GI_abort () at abort.c:79
  #2  0x00007ffff530940f in __assert_fail_base (fmt=3D0x7ffff54816a8 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x5555562da640 "!dev->re=
alized && !dev->parent_bus",=20
  file=3D0x5555562da6a7 "../../hw/core/qdev.c", line=3D282, function=3D<opt=
imized out>) at assert.c:92
  #3  0x00007ffff5318662 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x5555562da640 "!dev->realized && !dev->parent_bus", file=3Dfile@entry=
=3D0x5555562da6a7 "../../hw/core/qd
  ev.c", line=3Dline@entry=3D282, function=3Dfunction@entry=3D0x5555562da86=
8 <__PRETTY_FUNCTION__.14> "qdev_realize") at assert.c:101
  #4  0x0000555555f64b6f in qdev_realize (dev=3Ddev@entry=3D0x555558251370,=
 bus=3D<optimized out>, errp=3Derrp@entry=3D0x7fffffffd670) at ../../hw/cor=
e/qdev.c:282
  #5  0x0000555555bbecaa in virtio_gpu_pci_base_realize (vpci_dev=3D0x55555=
8248fa0, errp=3D0x7fffffffd670) at ../../hw/display/virtio-gpu-pci.c:52
  #6  0x0000555555a6048d in pci_qdev_realize (qdev=3D0x555558248fa0, errp=
=3D<optimized out>) at ../../hw/pci/pci.c:2043
  #7  0x0000555555f6416e in device_set_realized (obj=3D<optimized out>, val=
ue=3D<optimized out>, errp=3D0x7fffffffd880) at ../../hw/core/qdev.c:510
  #8  0x0000555555f67ea6 in property_set_bool (obj=3D0x555558248fa0, v=3D<o=
ptimized out>, name=3D<optimized out>, opaque=3D0x555556c35ab0, errp=3D0x7f=
ffffffd880) at ../../qom/object.c:2
  285
  #9  0x0000555555f6aee4 in object_property_set (obj=3Dobj@entry=3D0x555558=
248fa0, name=3Dname@entry=3D0x555556231289 "realized", v=3Dv@entry=3D0x5555=
582545a0, errp=3Derrp@entry=3D0x7fffffffd
  880) at ../../qom/object.c:1420
  #10 0x0000555555f6e290 in object_property_set_qobject (obj=3Dobj@entry=3D=
0x555558248fa0, name=3Dname@entry=3D0x555556231289 "realized", value=3Dvalu=
e@entry=3D0x555558253390, errp=3Derrp@e
  ntry=3D0x7fffffffd880) at ../../qom/qom-qobject.c:28
  #11 0x0000555555f6b505 in object_property_set_bool (obj=3D0x555558248fa0,=
 name=3Dname@entry=3D0x555556231289 "realized", value=3Dvalue@entry=3Dtrue,=
 errp=3Derrp@entry=3D0x7fffffffd880) at
   ../../qom/object.c:1489
  #12 0x0000555555f64aee in qdev_realize (dev=3D<optimized out>, bus=3Dbus@=
entry=3D0x555557696f70, errp=3Derrp@entry=3D0x7fffffffd880) at ../../hw/cor=
e/qdev.c:292
  #13 0x0000555555b36d26 in qdev_device_add_from_qdict (opts=3Dopts@entry=
=3D0x555557d52d40, from_json=3Dfrom_json@entry=3Dfalse, errp=3D0x7fffffffd8=
80, errp@entry=3D0x555556b02790 <error_
  fatal>) at ../../softmmu/qdev-monitor.c:714
  #14 0x0000555555b36e42 in qdev_device_add (opts=3D0x555556c31d20, errp=3D=
errp@entry=3D0x555556b02790 <error_fatal>) at ../../softmmu/qdev-monitor.c:=
733
  #15 0x0000555555b38c4f in device_init_func (opaque=3D<optimized out>, opt=
s=3D<optimized out>, errp=3D0x555556b02790 <error_fatal>) at ../../softmmu/=
vl.c:1143
  #16 0x00005555560e6382 in qemu_opts_foreach (list=3D<optimized out>, func=
=3Dfunc@entry=3D0x555555b38c40 <device_init_func>, opaque=3Dopaque@entry=3D=
0x0, errp=3D0x555556b02790 <error_fat
  al>) at ../../util/qemu-option.c:1135
  #17 0x0000555555b3b4ae in qemu_create_cli_devices () at ../../softmmu/vl.=
c:2539
  #18 qmp_x_exit_preconfig (errp=3D<optimized out>) at ../../softmmu/vl.c:2=
607
  #19 0x0000555555b3ee5d in qmp_x_exit_preconfig (errp=3D<optimized out>) a=
t ../../softmmu/vl.c:2601
  #20 qemu_init (argc=3D<optimized out>, argv=3D<optimized out>) at ../../s=
oftmmu/vl.c:3613
  #21 0x00005555558b3fa9 in main (argc=3D<optimized out>, argv=3D<optimized=
 out>) at=20

  (gdb) p dev
  $1 =3D (DeviceState *) 0x555558251370
  (gdb) p *$
  $2 =3D {parent_obj =3D {class =3D 0x555556e36b10, free =3D 0x0, propertie=
s =3D 0x555558204c60, ref =3D 2, parent =3D 0x555558248fa0}, id =3D 0x0, ca=
nonical_path =3D 0x0, realized =3D false, pending_deleted_event =3D false, =
pending_deleted_expires_ms =3D 0, opts =3D 0x0, hotplugged =3D 0, allow_unp=
lug_during_migration =3D false, parent_bus =3D 0x5555582512e0, gpios =3D {l=
h_first =3D 0x0}, clocks =3D {lh_first =3D 0x0}, child_bus =3D {lh_first =
=3D 0x0}, num_child_bus =3D 0, instance_id_alias =3D -1, alias_required_for=
_version =3D 0, reset =3D {count =3D 0, hold_phase_pending =3D false, exit_=
phase_in_progress =3D false}, unplug_blockers =3D 0x0}
  (gdb) p dev->realized=20
  $3 =3D false
  (gdb) p dev->parent_bus
  $4 =3D (BusState *) 0x5555582512e0
  (gdb) p *$
  $5 =3D {obj =3D {class =3D 0x555556e192e0, free =3D 0x0, properties =3D 0=
x555558204aa0 =3D {[0x555558259d90 "hotplug-handler"] =3D 0x555558259ec0, [=
0x55555825a1e0 "child[0]"] =3D 0x55555825a180, [0x555558259d70 "realized"] =
=3D 0x555558259fe0}, ref =3D 2, parent =3D 0x555558248fa0}, parent =3D 0x55=
5558248fa0, name =3D 0x55555825a040 "virtio-bus", hotplug_handler =3D 0x0, =
max_index =3D 1, realized =3D false, full =3D false, num_children =3D 1, ch=
ildren =3D {tqh_first =3D 0x55555825a120, tqh_circ =3D {tql_next =3D 0x5555=
5825a120, tql_prev =3D 0x55555825a140}}, sibling =3D {le_next =3D 0x0, le_p=
rev =3D 0x555558249010}, reset =3D {count =3D 0, hold_phase_pending =3D fal=
se, exit_phase_in_progress =3D false}}
  (gdb)=20

>
> Antonio Caggiano (7):
>   virtio-gpu: Handle resource blob commands
>   virtio-gpu: CONTEXT_INIT feature
>   virtio-gpu: Unrealize
>   virtio-gpu: Resource UUID
>   virtio-gpu: Support Venus capset
>   virtio-gpu: Initialize Venus
>   virtio-gpu: Get EGL Display callback
>
> Dr. David Alan Gilbert (1):
>   virtio: Add shared memory capability
>
> Gerd Hoffmann (1):
>   virtio-gpu: hostmem
>
>  hw/display/trace-events                     |   1 +
>  hw/display/virtio-gpu-base.c                |   7 +-
>  hw/display/virtio-gpu-pci.c                 |  15 ++
>  hw/display/virtio-gpu-virgl.c               | 230 +++++++++++++++++++-
>  hw/display/virtio-gpu.c                     |  67 +++++-
>  hw/display/virtio-vga.c                     |  33 ++-
>  hw/virtio/virtio-pci.c                      |  18 ++
>  include/hw/virtio/virtio-gpu-bswap.h        |  18 ++
>  include/hw/virtio/virtio-gpu.h              |  21 ++
>  include/hw/virtio/virtio-pci.h              |   4 +
>  include/standard-headers/linux/virtio_gpu.h |   2 +
>  meson.build                                 |   9 +
>  12 files changed, 403 insertions(+), 22 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

