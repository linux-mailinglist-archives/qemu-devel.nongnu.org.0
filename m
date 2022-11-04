Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DF618FA7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:56:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqokD-0006pV-UL; Fri, 04 Nov 2022 00:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oqlPm-00055u-Ha; Thu, 03 Nov 2022 21:22:34 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oqlPj-0004TU-Sn; Thu, 03 Nov 2022 21:22:34 -0400
Received: by mail-vk1-xa29.google.com with SMTP id s204so1650795vkb.3;
 Thu, 03 Nov 2022 18:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66CTbmQPX4En4F8hDz5aebxKXt9y46Nyyph8ezlkC7w=;
 b=d9bJx4i0l/hRIFc3x711JoNn8010TQ/23Z47GzuGfWYa1gIF+BGs5vR5k5jIttsI4s
 ciAK1fIHd/DLPGCxTWkWhMTo9QBAzt/NmOOPZgeGgIHfGgIWtY4DnIXJZpg3eUmKnxx3
 iU2scIJN88FP2wQGjOS5OTRZqNR1/3ochgqgV42uDobTG4Db39U69htzR9x5JmFhmFj2
 tVN6oXgILUOkrROS5yQNYBzeYSVNtfIY+gecR4bOyPcn3mklMnfsH4JnmcHSkdqqD6cw
 fZSIl95Em6IHJT48rKBUiTLNr1r9zc7VZ/OGbz8WiBBK24TbWOwDLPt1hQmk1M6Xx4UZ
 Oh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66CTbmQPX4En4F8hDz5aebxKXt9y46Nyyph8ezlkC7w=;
 b=E3ULH83Cpd9I3WQXfoj/BxW9WZZbSPBGwuj4cuJDvkCNVlbJysHFNwq5NjaFjyiYhR
 Ff7vUleZ0pHSDbGoOHboRMSVX1/BFff9qw9N+Ih7W58hgY4CANpiXPtMNWTJWkcjGwxo
 Rs+OQpwkAouTFDKiR7Cg+A9WGmsPbfrZMHvvYI8KM86DdmnVxYcdrAMUIXBnlE9Yixd2
 7gBAZ93Mn2sCcEHIrw4b+NehENP6ZuEzKPReZNghXlq0sfXuwvIJdS5/ges6zANa0aAC
 uuHvSHyWJRNVsxMbkAokmLHJ0IWNGHyIOn9vsqIOe3/ZittLBm2yf/IhLmmoAzJJ2IFt
 jZIA==
X-Gm-Message-State: ACrzQf1HmhUvotrK+eOiqRwNGYjotDsS2bQuixT/kGcWZq/FJX0x6sik
 7StuoTSTUWCZmCZf8R0HdL65s7oqHJ2J/cbE47Y=
X-Google-Smtp-Source: AMsMyM4enyzFgoHaHngn7p4/CdZJJXI+SQuTSQNhjmCFQSPxFcd5mWJxSI7HPr08bULz/eU3Ohecals571RjXz+CGzE=
X-Received: by 2002:a1f:5e4f:0:b0:3b7:8000:da6 with SMTP id
 s76-20020a1f5e4f000000b003b780000da6mr18764488vkb.15.1667524949954; Thu, 03
 Nov 2022 18:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221030093242.208839-1-faithilikerun@gmail.com>
 <20221030093242.208839-3-faithilikerun@gmail.com> <Y2LZ4XSj3VWGRfY7@fedora>
In-Reply-To: <Y2LZ4XSj3VWGRfY7@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 4 Nov 2022 09:22:36 +0800
Message-ID: <CAAAx-8LfRLCb13=9Fdk94wiEE5becVQZuD-mhaeBMfv5iyRHNA@mail.gmail.com>
Subject: Re: [RFC v4 2/3] virtio-blk: add zoned storage emulation for zoned
 devices
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 00:55:52 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=883=E6=
=97=A5=E5=91=A8=E5=9B=9B 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Oct 30, 2022 at 05:32:41AM -0400, Sam Li wrote:
> > This patch extends virtio-blk emulation to handle zoned device commands
> > by calling the new block layer APIs to perform zoned device I/O on
> > behalf of the guest. It supports Report Zone, four zone oparations (ope=
n,
> > close, finish, reset), and Append Zone.
> >
> > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > support zoned block devices. Regular block devices(conventional zones)
> > will not be set.
> >
> > The guest os can use blktests, fio to test those commands on zoned devi=
ces.
> > Furthermore, using zonefs to test zone append write is also supported.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  hw/block/virtio-blk-common.c |   2 +
> >  hw/block/virtio-blk.c        | 387 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 389 insertions(+)
> >
> > diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.=
c
> > index ac52d7c176..e2f8e2f6da 100644
> > --- a/hw/block/virtio-blk-common.c
> > +++ b/hw/block/virtio-blk-common.c
> > @@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] =3D {
> >       .end =3D endof(struct virtio_blk_config, discard_sector_alignment=
)},
> >      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
> >       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap)}=
,
> > +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> > +     .end =3D endof(struct virtio_blk_config, zoned)},
> >      {}
> >  };
> >
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 8131ec2dbc..4f3625840a 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -26,6 +26,9 @@
> >  #include "hw/virtio/virtio-blk.h"
> >  #include "dataplane/virtio-blk.h"
> >  #include "scsi/constants.h"
> > +#if defined(CONFIG_BLKZONED)
> > +#include <linux/blkzoned.h>
> > +#endif
>
> virtio-blk.c should use QEMU block layer APIs instead of Linux-specific
> APIs. Can this include be removed?

Yes, missed removing it.

>
> >  #ifdef __linux__
> >  # include <scsi/sg.h>
> >  #endif
> > @@ -592,6 +595,332 @@ err:
> >      return err_status;
> >  }
> >
> > +typedef struct ZoneCmdData {
> > +    VirtIOBlockReq *req;
> > +    union {
> > +        struct {
> > +            unsigned int nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report_data;
> > +        struct {
> > +            int64_t offset;
> > +        } zone_append_data;
> > +    };
> > +} ZoneCmdData;
> > +
> > +/*
> > + * check zoned_request: error checking before issuing requests. If all=
 checks
> > + * passed, return true.
> > + * append: true if only zone append requests issued.
> > + */
> > +static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int64_=
t len,
> > +                             bool append, uint8_t *status) {
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    int index =3D offset / bs->bl.zone_size;
> > +
> > +    if (offset < 0 || len < 0 || offset > (bs->total_sectors << BDRV_S=
ECTOR_BITS) - len) {
>
> Missing len > (bs->total_sectors << BDRV_SECTOR_BITS) check before
> subtracting len.
>
> > +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        return false;
> > +    }
> > +
> > +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> > +        *status =3D VIRTIO_BLK_S_UNSUPP;
> > +        return false;
> > +    }
> > +
> > +    if (append) {
> > +        if ((offset % bs->bl.write_granularity) !=3D 0) {
> > +            *status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> > +            return false;
> > +        }
> > +
> > +        if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
> > +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            return false;
> > +        }
> > +
> > +        if (len / 512 > bs->bl.max_append_sectors) {
> > +            if (bs->bl.max_append_sectors =3D=3D 0) {
> > +                *status =3D VIRTIO_BLK_S_UNSUPP;
> > +            } else {
> > +                *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            }
> > +            return false;
> > +        }
> > +    }
> > +    return true;
> > +}
> > +
> > +static void virtio_blk_zone_report_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > +    struct iovec *in_iov =3D req->elem.in_sg;
> > +    unsigned in_num =3D req->elem.in_num;
> > +    int64_t zrp_size, n, j =3D 0;
> > +    int64_t nz =3D data->zone_report_data.nr_zones;
> > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zone_=
report) {
> > +            .nr_zones =3D cpu_to_le64(nz),
> > +    };
> > +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> > +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> > +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
> > +    if (n !=3D sizeof(zrp_hdr)) {
> > +        virtio_error(vdev, "Driver provided intput buffer that is too =
small!");
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size;
> > +        i +=3D sizeof(struct virtio_blk_zone_descriptor), ++j) {
> > +        struct virtio_blk_zone_descriptor desc =3D
> > +            (struct virtio_blk_zone_descriptor) {
> > +                .z_start =3D cpu_to_le64(data->zone_report_data.zones[=
j].start
> > +                    >> BDRV_SECTOR_BITS),
> > +                .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j]=
.cap
> > +                    >> BDRV_SECTOR_BITS),
> > +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].=
wp
> > +                    >> BDRV_SECTOR_BITS),
> > +        };
> > +
> > +        switch (data->zone_report_data.zones[j].type) {
> > +        case BLK_ZT_CONV:
> > +            desc.z_type =3D VIRTIO_BLK_ZT_CONV;
> > +            break;
> > +        case BLK_ZT_SWR:
> > +            desc.z_type =3D VIRTIO_BLK_ZT_SWR;
> > +            break;
> > +        case BLK_ZT_SWP:
> > +            desc.z_type =3D VIRTIO_BLK_ZT_SWP;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +
> > +        switch (data->zone_report_data.zones[j].state) {
> > +        case BLK_ZS_RDONLY:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_RDONLY;
> > +            break;
> > +        case BLK_ZS_OFFLINE:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_OFFLINE;
> > +            break;
> > +        case BLK_ZS_EMPTY:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_EMPTY;
> > +            break;
> > +        case BLK_ZS_CLOSED:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_CLOSED;
> > +            break;
> > +        case BLK_ZS_FULL:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_FULL;
> > +            break;
> > +        case BLK_ZS_EOPEN:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_EOPEN;
> > +            break;
> > +        case BLK_ZS_IOPEN:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_IOPEN;
> > +            break;
> > +        case BLK_ZS_NOT_WP:
> > +            desc.z_state =3D VIRTIO_BLK_ZS_NOT_WP;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +
> > +        /* TODO: it takes O(n^2) time complexity. Optimizations requir=
ed. */
> > +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
> > +        if (n !=3D sizeof(desc)) {
> > +            virtio_error(vdev, "Driver provided input buffer "
> > +                               "for descriptors that is too small!");
> > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        }
> > +    }
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data->zone_report_data.zones);
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
> > +{
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    unsigned int nr_zones;
> > +    ZoneCmdData *data;
> > +    int64_t zone_size, offset;
> > +    uint8_t err_status;
> > +
> > +    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
> > +            sizeof(struct virtio_blk_zone_report) +
> > +            sizeof(struct virtio_blk_zone_descriptor)) {
> > +        virtio_error(vdev, "in buffer too small for zone report");
> > +        return -1;
> > +    }
> > +
> > +    /* start byte offset of the zone report */
> > +    offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BIT=
S;
> > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > +        goto out;
> > +    }
> > +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> > +                sizeof(struct virtio_blk_zone_report)) /
> > +               sizeof(struct virtio_blk_zone_descriptor);
> > +
> > +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> > +    data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    data->zone_report_data.nr_zones =3D nr_zones;
> > +    data->zone_report_data.zones =3D g_malloc(zone_size),
> > +
> > +    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_zon=
es,
> > +                        data->zone_report_data.zones,
> > +                        virtio_blk_zone_report_complete, data);
> > +    return 0;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> > +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +    }
> > +
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneO=
p op)
> > +{
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SE=
CTOR_BITS;
> > +    uint64_t len;
> > +    uint64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    uint32_t type =3D virtio_ldl_p(vdev, &req->out.type);
> > +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> > +        /* Entire drive capacity */
> > +        offset =3D 0;
> > +        len =3D capacity;
> > +    } else {
> > +        if (bs->bl.zone_size > capacity - offset) {
> > +            /* The zoned device allows the last smaller zone. */
> > +            len =3D capacity - bs->bl.zone_size * (bs->bl.nr_zones - 1=
);
> > +        } else {
> > +            len =3D bs->bl.zone_size;
> > +        }
> > +    }
> > +
> > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
>
> Why is the len argument 0? It wouldn't hurt to have the [offset,
> offset+len) range checked.
>
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
>
> Is ZoneCmdData needed? If req is passed as the argument to
> virtio_blk_zone_mgmt_complete() then that should be enough (and g_free()
> isn't required).

No, it can be dropped in this case.

>
> > +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> > +                      virtio_blk_zone_mgmt_complete, data);
> > +
> > +    return 0;
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> > +static void virtio_blk_zone_append_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > +    int64_t append_sector, n;
> > +    struct iovec *out_iov =3D req->elem.out_sg;
> > +    unsigned out_num =3D req->elem.out_num;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    virtio_stl_p(vdev, &append_sector,
> > +                 data->zone_append_data.offset >> BDRV_SECTOR_BITS);
> > +    n =3D iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(appen=
d_sector));
>
> The append sector must be written to the first 8 bytes of
> req->elem.in_sg/req->elem.in_num.

Thanks for the reminder!

>
> > +    if (n !=3D sizeof(append_sector)) {
> > +        virtio_error(vdev, "Driver provided input buffer less than siz=
e of "
> > +                           "append_sector");
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
> > +                                         struct iovec *out_iov,
> > +                                         uint64_t niov) {
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SE=
CTOR_BITS;
> > +    int64_t len =3D iov_size(out_iov, niov);
> > +
> > +    if (!check_zoned_request(s, offset, len, true, &err_status)) {
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    data->zone_append_data.offset =3D offset;
> > +    qemu_iovec_init_external(&req->qiov, out_iov, niov);
> > +    blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &req->=
qiov, 0,
> > +                        virtio_blk_zone_append_complete, data);
> > +    return 0;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> >  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuff=
er *mrb)
> >  {
> >      uint32_t type;
> > @@ -678,6 +1007,24 @@ static int virtio_blk_handle_request(VirtIOBlockR=
eq *req, MultiReqBuffer *mrb)
> >      case VIRTIO_BLK_T_FLUSH:
> >          virtio_blk_handle_flush(req, mrb);
> >          break;
> > +    case VIRTIO_BLK_T_ZONE_REPORT:
> > +        virtio_blk_handle_zone_report(req);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_OPEN:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_CLOSE:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_FINISH:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_RESET:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > +        break;
> >      case VIRTIO_BLK_T_SCSI_CMD:
> >          virtio_blk_handle_scsi(req);
> >          break;
> > @@ -696,6 +1043,13 @@ static int virtio_blk_handle_request(VirtIOBlockR=
eq *req, MultiReqBuffer *mrb)
> >          virtio_blk_free_request(req);
> >          break;
> >      }
> > +    case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> > +        /*
> > +         * It is not safe to access req->elem.out_sg directly because =
it
> > +         * may be modified by virtio_blk_handle_request().
> > +         */
> > +        virtio_blk_handle_zone_append(req, out_iov, out_num);
> > +        break;
> >      /*
> >       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined =
with
> >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch st=
atement,
> > @@ -895,6 +1249,7 @@ static void virtio_blk_update_config(VirtIODevice =
*vdev, uint8_t *config)
> >  {
> >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> >      BlockConf *conf =3D &s->conf.conf;
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> >      struct virtio_blk_config blkcfg;
> >      uint64_t capacity;
> >      int64_t length;
> > @@ -954,6 +1309,30 @@ static void virtio_blk_update_config(VirtIODevice=
 *vdev, uint8_t *config)
> >          blkcfg.write_zeroes_may_unmap =3D 1;
> >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> >      }
> > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > +        switch (bs->bl.zoned) {
> > +        case BLK_Z_HM:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > +            break;
> > +        case BLK_Z_HA:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +
> > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > +                     bs->bl.zone_size / 512);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > +                     bs->bl.max_active_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > +                     bs->bl.max_open_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > +                     bs->bl.max_append_sectors);
> > +    } else {
> > +        blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> > +    }
> >      memcpy(config, &blkcfg, s->config_size);
> >  }
> >
> > @@ -1118,6 +1497,7 @@ static void virtio_blk_device_realize(DeviceState=
 *dev, Error **errp)
> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >      VirtIOBlock *s =3D VIRTIO_BLK(dev);
> >      VirtIOBlkConf *conf =3D &s->conf;
> > +    BlockDriverState *bs =3D blk_bs(conf->conf.blk);
> >      Error *err =3D NULL;
> >      unsigned i;
> >
> > @@ -1163,6 +1543,13 @@ static void virtio_blk_device_realize(DeviceStat=
e *dev, Error **errp)
> >          return;
> >      }
> >
> > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> > +        if (bs->bl.zoned =3D=3D BLK_Z_HM) {
> > +            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DISCA=
RD);
> > +        }
> > +    }
> > +
> >      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &&
> >          (!conf->max_discard_sectors ||
> >           conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> > --
> > 2.38.1
> >

