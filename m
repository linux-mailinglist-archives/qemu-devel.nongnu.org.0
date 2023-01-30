Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CA68165D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWzl-0004NR-Az; Mon, 30 Jan 2023 11:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWzj-0004NJ-B2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:26:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMWzh-0001Sz-Ad
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:26:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q8so8401941wmo.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGTHZgI6kz8JUVyRgC1qSPnv1yp/q/m4KdOqTYttUFs=;
 b=pEiIcMrr0uiRkymAOI5U8U/5yp9C6a9bRYXXvZdyNTlfUlZ5qac9lpK8OoLi9XPR/9
 Oot5hQC+feNi0dj7CtQo0Le2fjKtrPibSZ/DjqgddGPzjcla4eKMKm+c+CopxwX+MJTK
 axI+d8HqrLX9wlhEso5f2MuLoTSkP69kjMBluU1Pj/FUZLdRU0fTcqlWOm9TkIkyfXjt
 dJG4hOlPtvi2Fxz5rxlGRnhQoz9sca56ChCwf46b91ksi/zfNdgmvweDkpeuS0CeQCjS
 8exwzV6c1e1Zcstd54JALc8TD9BWgAcg9yJI3qofWS6Cn5jNpyNSjgkdA3gcnVAsLNxh
 1wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HGTHZgI6kz8JUVyRgC1qSPnv1yp/q/m4KdOqTYttUFs=;
 b=f/clbCz0uoZPDYtWTlZ3DIcEckjUmcXalrjlp2y4uNYAYOLVpJKdSQola6UlJZkidM
 BEim5BoaQDwwemQF7ijKx8qBb2rVDtzWeKIUEArjyPRYjfvJ6Cs2cgAssG+IZ4Iv3uE0
 yMy/WTkxeUlDC4d1sL3wcy7IcKPOkSMf5TIq8dwt4V5nZbwg1OTBNoGUZamo1q9GIDJw
 uOpRxD8JC01+CkkbXGG592GuyeRiE/ufSW+rzuu3evuTJJ4qh5hgXqEKVXrTzHoP9AvO
 Z9bGPuzQXhuqaDmBycS2bsJn7BV89CB6LjJgQ/zIyrOjL+Y2V+b8Kzl0AZhCqKX93ska
 AK/w==
X-Gm-Message-State: AFqh2krAq9cPxZn8b/6dXttsSQgXWQ5IQ/j6KSdKMr7+6MdLuuywRQ4B
 m7RtFX4YeFZI2kIbnww1yYnIVw==
X-Google-Smtp-Source: AMrXdXuM/z34yJkCtNVSgF+HwejH5AYlcNgNAOusDD6JhM17b1LfPSmqAwhoPMwrbmH9zm+LMBQI/Q==
X-Received: by 2002:a05:600c:1d0b:b0:3db:88f:996d with SMTP id
 l11-20020a05600c1d0b00b003db088f996dmr49200469wms.36.1675096013864; 
 Mon, 30 Jan 2023 08:26:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c078300b003db12112fcfsm12971344wmo.4.2023.01.30.08.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 08:26:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 004B61FFB7;
 Mon, 30 Jan 2023 16:26:52 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-3-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, Gerd Hoffmann
 <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/9] virtio-gpu: hostmem
Date: Mon, 30 Jan 2023 16:22:18 +0000
In-reply-to: <20220926142422.22325-3-antonio.caggiano@collabora.com>
Message-ID: <87ilgo6l9v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> From: Gerd Hoffmann <kraxel@redhat.com>
>
> Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> v3: Formatting fixes
>
>  hw/display/virtio-gpu-pci.c    | 15 +++++++++++++++
>  hw/display/virtio-gpu.c        |  1 +
>  hw/display/virtio-vga.c        | 33 ++++++++++++++++++++++++---------
>  include/hw/virtio/virtio-gpu.h |  5 +++++
>  4 files changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index 93f214ff58..2cbbacd7fe 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -33,6 +33,21 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy=
 *vpci_dev, Error **errp)
>      DeviceState *vdev =3D DEVICE(g);
>      int i;
>=20=20
> +    if (virtio_gpu_hostmem_enabled(g->conf)) {
> +        vpci_dev->msix_bar_idx =3D 1;
> +        vpci_dev->modern_mem_bar_idx =3D 2;
> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem,
> +                               VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
> +    }
> +
> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
>      virtio_pci_force_virtio_1(vpci_dev);
>      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>          return;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 20cc703dcc..506b3b8eef 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1424,6 +1424,7 @@ static Property virtio_gpu_properties[] =3D {
>                       256 * MiB),
>      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> +    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem,
> 0),

I note we don't have a definition for -device virtio-gpu or
virtio-gpu-pci in the invocation section of the manual (missing from
qemu-options.hx). Given the growing complexity of the device perhaps we
need those options and perhaps a new section under:

  https://qemu.readthedocs.io/en/latest/system/device-emulation.html#emulat=
ed-devices

to outline how virtio-gpu works and what these control knobs are for and
why they would be used.

>      DEFINE_PROP_END_OF_LIST(),
>  };
>=20=20
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 4dcb34c4a7..aa8d1ab993 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -115,17 +115,32 @@ static void virtio_vga_base_realize(VirtIOPCIProxy =
*vpci_dev, Error **errp)
>      pci_register_bar(&vpci_dev->pci_dev, 0,
>                       PCI_BASE_ADDRESS_MEM_PREFETCH, &vga->vram);
>=20=20
> -    /*
> -     * Configure virtio bar and regions
> -     *
> -     * We use bar #2 for the mmio regions, to be compatible with stdvga.
> -     * virtio regions are moved to the end of bar #2, to make room for
> -     * the stdvga mmio registers at the start of bar #2.
> -     */
> -    vpci_dev->modern_mem_bar_idx =3D 2;
> -    vpci_dev->msix_bar_idx =3D 4;
>      vpci_dev->modern_io_bar_idx =3D 5;
>=20=20
> +    if (!virtio_gpu_hostmem_enabled(g->conf)) {
> +        /*
> +         * Configure virtio bar and regions
> +         *
> +         * We use bar #2 for the mmio regions, to be compatible with std=
vga.
> +         * virtio regions are moved to the end of bar #2, to make room f=
or
> +         * the stdvga mmio registers at the start of bar #2.
> +         */
> +        vpci_dev->modern_mem_bar_idx =3D 2;
> +        vpci_dev->msix_bar_idx =3D 4;
> +    } else {
> +        vpci_dev->msix_bar_idx =3D 1;
> +        vpci_dev->modern_mem_bar_idx =3D 2;

modern_mem_bar_idx is the same for both legs so why move its setting and
comment out of the common path? There is no comment for why msix_bar_idx
moves between the two legs.

> +        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
> +                           g->conf.hostmem);
> +        pci_register_bar(&vpci_dev->pci_dev, 4,
> +                         PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                         &g->hostmem);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem,
> +                               VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
> +    }
> +
>      if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
>          /*
>           * with page-per-vq=3Doff there is no padding space we can use
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
> index 2e28507efe..eafce75b04 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -102,12 +102,15 @@ enum virtio_gpu_base_conf_flags {
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>  #define virtio_gpu_blob_enabled(_cfg) \
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_hostmem_enabled(_cfg) \
> +    (_cfg.hostmem > 0)
>=20=20
>  struct virtio_gpu_base_conf {
>      uint32_t max_outputs;
>      uint32_t flags;
>      uint32_t xres;
>      uint32_t yres;
> +    uint64_t hostmem;
>  };
>=20=20
>  struct virtio_gpu_ctrl_command {
> @@ -131,6 +134,8 @@ struct VirtIOGPUBase {
>      int renderer_blocked;
>      int enable;
>=20=20
> +    MemoryRegion hostmem;
> +
>      struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
>=20=20
>      int enabled_output_bitmask;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

