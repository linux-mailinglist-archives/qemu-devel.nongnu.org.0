Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCA681682
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMX6Q-0007ow-A6; Mon, 30 Jan 2023 11:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMX6N-0007kb-Di
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:33:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMX6L-0002jr-1y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:33:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h12so11636406wrv.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NkWggAWk+bl/ca7cFrRgVksZfnsgMXum+W5y3kKrd8=;
 b=g3ASpSk9UInVdlIAk4XzabdA5LwZs/EIR/W1o31O4gLRRV35SeEpXMbqDXD5EGEQs2
 kU1gys5joM1yGxPqosPJlbuWiZkHh3G6VX2Yxf2gSBrSl9PezSS/6C21gLADU36/+wmX
 U8p0ubSG+DE6CnfYP2u4EN2e731hcSA21IoCGVJHwnK8ZqFOfBr+p0tA7FETyaLPOJWD
 kLwwkqol8CHRF2KDy0hbDH+rUBnsOIEmHxfFV1N7kQJ7jYtHvyJL055tdRqZ8OxSlGwK
 bg5TOFAmPgOs08I2MB6s65+QkaIXo3SFwKqA3pCvZPvRN5qiFiQtthQPwQpG2JO+rzSc
 /+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/NkWggAWk+bl/ca7cFrRgVksZfnsgMXum+W5y3kKrd8=;
 b=1PKhR4jLHiKFcDbEC7wfgHe713eH5TbdW8dmoHAEhbPcqjsESfDDdK63pSDV4ONYeF
 N+9KTphzAipKXu2XR2k+2YMC2MtaNlFFZ6b6NPWrowl9UB4+Ds3XiTZn4Hao8pcoSTCK
 UELppFHlFZkjII94jkajlP92s+bVn91MynHH0srjP62UEn85AjfufxWOkOnRDihkYkDR
 YAul0wmcFQLKGxdeX0o/1n4wcGA5zW+eJePsz6Gv75m7V2+ZUwb+KgTITuqPdxPaX6d+
 wucQRMinSI2XdHbqZKNQBnJmCSVRxBSTj1hq0InPHi6LTJD/apX2BQtOMT1OWdIbF3vp
 l6jA==
X-Gm-Message-State: AO0yUKWT+Gk97lZi33nhclpZyyf/I19Ao4KJOrwtpViFvHO2SsQinvdy
 f6rqaoHAFhmXPfkMniwBgKaXVg==
X-Google-Smtp-Source: AK7set/R+GrwYEzOAXUDkaHNAQcgQ691917dLErGzg50V8ODywqCmsl1WY9qOUVpu7drqc3OhsEJMg==
X-Received: by 2002:adf:e908:0:b0:2bf:b54b:6ed9 with SMTP id
 f8-20020adfe908000000b002bfb54b6ed9mr100028wrm.15.1675096427192; 
 Mon, 30 Jan 2023 08:33:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t27-20020adfa2db000000b002366553eca7sm12200137wra.83.2023.01.30.08.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 08:33:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53C181FFB7;
 Mon, 30 Jan 2023 16:33:46 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-4-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, Gerd Hoffmann
 <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/9] virtio-gpu: Handle resource blob commands
Date: Mon, 30 Jan 2023 16:29:44 +0000
In-reply-to: <20220926142422.22325-4-antonio.caggiano@collabora.com>
Message-ID: <87bkmg6kyd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> Support BLOB resources creation, mapping and unmapping by calling the
> new stable virglrenderer 0.10 interface. Only enabled when available and
> via the blob config. E.g. -device virtio-vga-gl,blob=3Dtrue
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> v3: Fix memory leaks and unmap resource on destroy.
>
>  hw/display/virtio-gpu-virgl.c        | 171 +++++++++++++++++++++++++++
>  hw/display/virtio-gpu.c              |  12 +-
>  include/hw/virtio/virtio-gpu-bswap.h |  18 +++
>  include/hw/virtio/virtio-gpu.h       |   8 ++
>  meson.build                          |   5 +
>  5 files changed, 210 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 73cb92c8d5..17f00b3fb0 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -16,6 +16,8 @@
>  #include "trace.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-gpu.h"
> +#include "hw/virtio/virtio-gpu-bswap.h"
> +#include "hw/virtio/virtio-iommu.h"
>=20=20
>  #include <virglrenderer.h>
>=20=20
> @@ -398,6 +400,164 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>      g_free(resp);
>  }
>=20=20
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +
> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> +                                           struct virtio_gpu_ctrl_comman=
d *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_create_blob cblob;
> +    int ret;
> +
> +    VIRTIO_GPU_FILL_CMD(cblob);
> +    virtio_gpu_create_blob_bswap(&cblob);
> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> +
> +    if (cblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, cblob.resource_id);
> +    if (res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n=
",
> +                      __func__, cblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D g_new0(struct virtio_gpu_simple_resource, 1);
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +
> +    res->resource_id =3D cblob.resource_id;
> +    res->blob_size =3D cblob.size;
> +
> +    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_HOST3D) {
> +        ret =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeo=
f(cblob),
> +                                            cmd, &res->addrs, &res->iov,
> +                                            &res->iov_cnt);
> +        if (ret !=3D 0) {
> +            cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> +            return;
> +        }
> +    }
> +
> +    if (cblob.blob_mem =3D=3D VIRTIO_GPU_BLOB_MEM_GUEST) {
> +        virtio_gpu_init_udmabuf(res);
> +    }
> +    const struct virgl_renderer_resource_create_blob_args virgl_args =3D=
 {
> +        .res_handle =3D cblob.resource_id,
> +        .ctx_id =3D cblob.hdr.ctx_id,
> +        .blob_mem =3D cblob.blob_mem,
> +        .blob_id =3D cblob.blob_id,
> +        .blob_flags =3D cblob.blob_flags,
> +        .size =3D cblob.size,
> +        .iovecs =3D res->iov,
> +        .num_iovs =3D res->iov_cnt,
> +    };
> +    ret =3D virgl_renderer_resource_create_blob(&virgl_args);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\=
n",
> +                      __func__, strerror(-ret));
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> +    }
> +}
> +
> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command *=
cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_map_blob mblob;
> +    int ret;
> +    void *data;
> +    uint64_t size;
> +    struct virtio_gpu_resp_map_info resp;
> +
> +    VIRTIO_GPU_FILL_CMD(mblob);
> +    virtio_gpu_map_blob_bswap(&mblob);
> +
> +    if (mblob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, mblob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, mblob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    ret =3D virgl_renderer_resource_map(res->resource_id, &data, &size);
> +    if (ret) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> +                      __func__, strerror(-ret));
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL, siz=
e, data);
> +    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset, &r=
es->region);
> +    memory_region_set_enabled(&res->region, true);
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;
> +    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_in=
fo);
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +
> +    res->mapped =3D true;
> +}
> +
> +int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> +                                    struct virtio_gpu_simple_resource *r=
es)
> +{
> +    if (!res->mapped) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d=
\n",
> +                      __func__, res->resource_id);
> +        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +    }
> +
> +    memory_region_set_enabled(&res->region, false);
> +    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
> +    object_unparent(OBJECT(&res->region));
> +
> +    res->mapped =3D false;
> +    return virgl_renderer_resource_unmap(res->resource_id);
> +}
> +
> +static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
> +                                        struct virtio_gpu_ctrl_command *=
cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_unmap_blob ublob;
> +    VIRTIO_GPU_FILL_CMD(ublob);
> +    virtio_gpu_unmap_blob_bswap(&ublob);
> +
> +    if (ublob.resource_id =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed=
\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    res =3D virtio_gpu_find_resource(g, ublob.resource_id);
> +    if (!res) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n=
",
> +                      __func__, ublob.resource_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> +        return;
> +    }
> +
> +    virtio_gpu_virgl_resource_unmap(g, res);
> +}
> +
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
> +
>  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                        struct virtio_gpu_ctrl_command *cm=
d)
>  {
> @@ -464,6 +624,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_EDID:
>          virtio_gpu_get_edid(g, cmd);
>          break;
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
> +        virgl_cmd_resource_create_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
> +        virgl_cmd_resource_map_blob(g, cmd);
> +        break;
> +    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
> +        virgl_cmd_resource_unmap_blob(g, cmd);
> +        break;
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>      default:
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 506b3b8eef..f79693d44d 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -33,8 +33,6 @@
>=20=20
>  #define VIRTIO_GPU_VM_VERSION 1
>=20=20
> -static struct virtio_gpu_simple_resource*
> -virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
>  static struct virtio_gpu_simple_resource *
>  virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
>                                 bool require_backing,
> @@ -115,7 +113,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio=
_gpu_update_cursor *cursor)
>                    cursor->resource_id ? 1 : 0);
>  }
>=20=20
> -static struct virtio_gpu_simple_resource *
> +struct virtio_gpu_simple_resource *
>  virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
>  {
>      struct virtio_gpu_simple_resource *res;
> @@ -874,6 +872,10 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
>  static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
>                                         struct virtio_gpu_simple_resource=
 *res)
>  {
> +    if (res->mapped) {
> +        virtio_gpu_virgl_resource_unmap(g, res);
> +    }
> +

This fails to build if an older VirGL is used:

  /usr/bin/ld: libcommon.fa.p/hw_display_virtio-gpu.c.o: in function `virti=
o_gpu_cleanup_mapping':
  /home/alex/lsrc/qemu.git/builds/arm.all/../../hw/display/virtio-gpu.c:877=
: undefined reference to `virtio_gpu_virgl_resource_unmap'
  collect2: error: ld returned 1 exit status

so I think needs an ifdef protecting it. Can ->mapped be set without
blob support?

>      virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
>      res->iov =3D NULL;
>      res->iov_cnt =3D 0;
> @@ -1323,10 +1325,12 @@ void virtio_gpu_device_realize(DeviceState *qdev,=
 Error **errp)
>              return;
>          }
>=20=20
> +#ifndef HAVE_VIRGL_RESOURCE_BLOB
>          if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
> -            error_setg(errp, "blobs and virgl are not compatible (yet)");
> +            error_setg(errp, "Linked virglrenderer does not support blob=
 resources");
>              return;
>          }
> +#endif
>      }
>=20=20
>      if (!virtio_gpu_base_device_realize(qdev,
> diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/vir=
tio-gpu-bswap.h
> index 9124108485..dd1975e2d4 100644
> --- a/include/hw/virtio/virtio-gpu-bswap.h
> +++ b/include/hw/virtio/virtio-gpu-bswap.h
> @@ -63,10 +63,28 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resour=
ce_create_blob *cblob)
>  {
>      virtio_gpu_ctrl_hdr_bswap(&cblob->hdr);
>      le32_to_cpus(&cblob->resource_id);
> +    le32_to_cpus(&cblob->blob_mem);
>      le32_to_cpus(&cblob->blob_flags);
> +    le32_to_cpus(&cblob->nr_entries);
> +    le64_to_cpus(&cblob->blob_id);
>      le64_to_cpus(&cblob->size);
>  }
>=20=20
> +static inline void
> +virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
> +{
> +    virtio_gpu_ctrl_hdr_bswap(&mblob->hdr);
> +    le32_to_cpus(&mblob->resource_id);
> +    le64_to_cpus(&mblob->offset);
> +}
> +
> +static inline void
> +virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)
> +{
> +    virtio_gpu_ctrl_hdr_bswap(&ublob->hdr);
> +    le32_to_cpus(&ublob->resource_id);
> +}
> +
>  static inline void
>  virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
>  {
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
> index eafce75b04..708cf1bb9c 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -55,6 +55,9 @@ struct virtio_gpu_simple_resource {
>      int dmabuf_fd;
>      uint8_t *remapped;
>=20=20
> +    MemoryRegion region;
> +    bool mapped;
> +

These probably need to be conditionally #ifdef'ed

>      QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
>  };
>=20=20
> @@ -245,6 +248,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase =
*g,
>                          struct virtio_gpu_resp_display_info *dpy_info);
>=20=20
>  /* virtio-gpu.c */
> +struct virtio_gpu_simple_resource *
> +virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
> +
>  void virtio_gpu_ctrl_response(VirtIOGPU *g,
>                                struct virtio_gpu_ctrl_command *cmd,
>                                struct virtio_gpu_ctrl_hdr *resp,
> @@ -289,5 +295,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
>  void virtio_gpu_virgl_reset(VirtIOGPU *g);
>  int virtio_gpu_virgl_init(VirtIOGPU *g);
>  int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
> +int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
> +                                    struct virtio_gpu_simple_resource *r=
es);
>

It would be nice for these API functions to have some kerneldoc comments.

>  #endif
> diff --git a/meson.build b/meson.build
> index 3885fc1076..c4e801b4f5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or have_sy=
stem or have_vhost_user_gpu
>                       method: 'pkg-config',
>                       required: get_option('virglrenderer'),
>                       kwargs: static_kwargs)
> +
> +  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
> +                       cc.has_function('virgl_renderer_resource_create_b=
lob',
> +                                       prefix: '#include <virglrenderer.=
h>',
> +                                       dependencies: virgl))
>  endif
>  curl =3D not_found
>  if not get_option('curl').auto() or have_block


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

