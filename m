Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1E68F8DF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:33:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr87-000881-9E; Wed, 08 Feb 2023 15:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPr85-00087m-Gq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPr83-0005TR-FJ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxQBpDnyyHWtQB0ZJR0CgY/dH/ZtJIDACjPCDUKt4dg=;
 b=YDlB4467pxgEQ77AfBtly2vqlVHJ1M2vk1RT4Wof+lQjS9fPWvBPXjFze5MSA5MEkStXku
 yTtqjzzlNY4Hli4E1njmGCObt9+E8qA6tAwvHdX3S6lf/JNthwjcdEVKViE4SO8aJgDatO
 QlgEYvLFz6yWqdx0wAKc5wY2NXEBAbc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-GEaMKU2GOleHqrRKk059rQ-1; Wed, 08 Feb 2023 15:33:15 -0500
X-MC-Unique: GEaMKU2GOleHqrRKk059rQ-1
Received: by mail-il1-f197.google.com with SMTP id
 s12-20020a92cb0c000000b00313ceced13aso6543593ilo.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxQBpDnyyHWtQB0ZJR0CgY/dH/ZtJIDACjPCDUKt4dg=;
 b=C73AL/vsCFDo+sQ+NzFhI42q/bxIDEke63RGiBYdLpsGptczX7Fat9wmKbjnF2cFjg
 NwoJfao4VJhUo4fH6kcPlWOR9UFZ1vhNtLHu3QcdBA/VVfl+W02I988DgJYgNDvuRHVF
 hlnNqG5TKnsVpOICTKonmSbRTiEiN+pLDhB2HJPvOYuiBBkToJr0QP8iZvxEI9k21XIc
 PvhExdpG0XK05JaeYY31BphDxtLlV6NLQPo1nWVMvAeXF1RL++Rv5/56ulW/bgynPnwF
 IICtd61NNqVJhAVoBc6+UxC3ipgQjKPMimoTno8a3122glR0KsN3p1UPbQCgNfvYbbWv
 w/lg==
X-Gm-Message-State: AO0yUKVvyOM58OS69eJPmiY/uDW+YothgjDnXs0Vg8FS6P2zfZIuxYWX
 UFPuJbToWHnbZq30l5T5FGsxbD6vXhCZyITkwaF+Buh8hb4u/zsJZDD+CUOv3l9RwwOgaIY9xKA
 JtCqappVzAnN17nE=
X-Received: by 2002:a05:6e02:1d10:b0:313:ffce:968a with SMTP id
 i16-20020a056e021d1000b00313ffce968amr1142758ila.32.1675888394436; 
 Wed, 08 Feb 2023 12:33:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8PAEXoCKBGYD1MjjzHSmrWkWZAZ9PqXKlBuOaOARgpFsPt6YXxV9BdYlp0A2Ag8jW+ywAvfg==
X-Received: by 2002:a05:6e02:1d10:b0:313:ffce:968a with SMTP id
 i16-20020a056e021d1000b00313ffce968amr1142726ila.32.1675888394092; 
 Wed, 08 Feb 2023 12:33:14 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k20-20020a056638141400b003a7c64c31b1sm5793774jad.47.2023.02.08.12.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:33:13 -0800 (PST)
Date: Wed, 8 Feb 2023 13:33:11 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>, "clg@redhat.com"
 <clg@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>
Subject: Re: [PATCH v2 12/23] vfio-user: region read/write
Message-ID: <20230208133311.1f535f49.alex.williamson@redhat.com>
In-Reply-To: <C7E53D99-8F52-4EA2-9C01-5D38515D7B2C@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <83ec17255d41c90eb3950364dd853b240398705b.1675228037.git.john.g.johnson@oracle.com>
 <20230206120724.065199c4.alex.williamson@redhat.com>
 <C7E53D99-8F52-4EA2-9C01-5D38515D7B2C@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, 8 Feb 2023 06:38:27 +0000
John Johnson <john.g.johnson@oracle.com> wrote:

> > On Feb 6, 2023, at 11:07 AM, Alex Williamson <alex.williamson@redhat.co=
m> wrote:
> >=20
> > On Wed,  1 Feb 2023 21:55:48 -0800
> > John Johnson <john.g.johnson@oracle.com> wrote:
> >  =20
> >> Add support for posted writes on remote devices
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/vfio/user-protocol.h       |  12 +++++
> >> hw/vfio/user.h                |   1 +
> >> include/hw/vfio/vfio-common.h |   3 +-
> >> hw/vfio/common.c              |  23 ++++++---
> >> hw/vfio/pci.c                 |   5 +-
> >> hw/vfio/user-pci.c            |   5 ++
> >> hw/vfio/user.c                | 112 ++++++++++++++++++++++++++++++++++=
++++++++
> >> hw/vfio/trace-events          |   1 +
> >> 8 files changed, 154 insertions(+), 8 deletions(-)
> >>=20
> >> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> >> index 6f70a48..6987435 100644
> >> --- a/hw/vfio/user-protocol.h
> >> +++ b/hw/vfio/user-protocol.h
> >> @@ -139,4 +139,16 @@ typedef struct {
> >>     uint64_t offset;
> >> } VFIOUserRegionInfo;
> >>=20
> >> +/*
> >> + * VFIO_USER_REGION_READ
> >> + * VFIO_USER_REGION_WRITE
> >> + */
> >> +typedef struct {
> >> +    VFIOUserHdr hdr;
> >> +    uint64_t offset;
> >> +    uint32_t region;
> >> +    uint32_t count;
> >> +    char data[];
> >> +} VFIOUserRegionRW;
> >> +
> >> #endif /* VFIO_USER_PROTOCOL_H */
> >> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> >> index e6485dc..3012a86 100644
> >> --- a/hw/vfio/user.h
> >> +++ b/hw/vfio/user.h
> >> @@ -84,6 +84,7 @@ typedef struct VFIOUserProxy {
> >> /* VFIOProxy flags */
> >> #define VFIO_PROXY_CLIENT        0x1
> >> #define VFIO_PROXY_FORCE_QUEUED  0x4
> >> +#define VFIO_PROXY_NO_POST       0x8
> >>=20
> >> VFIOUserProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp=
);
> >> void vfio_user_disconnect(VFIOUserProxy *proxy);
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-comm=
on.h
> >> index 9fb4c80..bbc4b15 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -57,6 +57,7 @@ typedef struct VFIORegion {
> >>     VFIOMmap *mmaps;
> >>     uint8_t nr; /* cache the region number for debug */
> >>     int fd; /* fd to mmap() region */
> >> +    bool post_wr; /* writes can be posted */
> >> } VFIORegion;
> >>=20
> >> typedef struct VFIOMigration {
> >> @@ -180,7 +181,7 @@ struct VFIODeviceIO {
> >>     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32=
_t size,
> >>                        void *data);
> >>     int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint3=
2_t size,
> >> -                        void *data);
> >> +                        void *data, bool post);
> >> };
> >>=20
> >> struct VFIOContainerIO {
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index d26b325..de64e53 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -215,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
> >>         uint32_t dword;
> >>         uint64_t qword;
> >>     } buf;
> >> +    bool post =3D region->post_wr;
> >>     int ret;
> >>=20
> >>     switch (size) {
> >> @@ -235,12 +236,19 @@ void vfio_region_write(void *opaque, hwaddr addr,
> >>         break;
> >>     }
> >>=20
> >> -    ret =3D vbasedev->io->region_write(vbasedev, region->nr, addr, si=
ze, &buf);
> >> +    /* read-after-write hazard if guest can directly access region */
> >> +    if (region->nr_mmaps) {
> >> +        post =3D false;
> >> +    }
> >> +    ret =3D vbasedev->io->region_write(vbasedev, region->nr, addr, si=
ze, &buf,
> >> +                                     post);
> >>     if (ret !=3D size) {
> >> +        const char *err =3D ret < 0 ? strerror(-ret) : "short write";
> >> +
> >>         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
> >> -                     ",%d) failed: %m",
> >> +                     ",%d) failed: %s",
> >>                      __func__, vbasedev->name, region->nr,
> >> -                     addr, data, size);
> >> +                     addr, data, size, err);
> >>     }
> >>     trace_vfio_region_write(vbasedev->name, region->nr, addr, data, si=
ze);
> >>=20
> >> @@ -271,9 +279,11 @@ uint64_t vfio_region_read(void *opaque,
> >>=20
> >>     ret =3D vbasedev->io->region_read(vbasedev, region->nr, addr, size=
, &buf);
> >>     if (ret !=3D size) {
> >> -        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m=
",
> >> +        const char *err =3D ret < 0 ? strerror(-ret) : "short read";
> >> +
> >> +        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s=
",
> >>                      __func__, vbasedev->name, region->nr,
> >> -                     addr, size);
> >> +                     addr, size, err);
> >>         return (uint64_t)-1;
> >>     }
> >>=20
> >> @@ -1584,6 +1594,7 @@ int vfio_region_setup(Object *obj, VFIODevice *v=
basedev, VFIORegion *region,
> >>     region->size =3D info->size;
> >>     region->fd_offset =3D info->offset;
> >>     region->nr =3D index;
> >> +    region->post_wr =3D false;
> >>     if (vbasedev->regfds !=3D NULL) {
> >>         region->fd =3D vbasedev->regfds[index];
> >>     } else {
> >> @@ -2711,7 +2722,7 @@ static int vfio_io_region_read(VFIODevice *vbase=
dev, uint8_t index, off_t off,
> >> }
> >>=20
> >> static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, o=
ff_t off,
> >> -                                uint32_t size, void *data)
> >> +                                uint32_t size, void *data, bool post)
> >> { =20
> >=20
> > This is all a bit confusing as a non-posted write on bare metal would
> > require a follow-up read to flush the write, but in the kernel case we
> > rely on both the bus protocols and the userspace driver to perform such
> > actions to enforce coherency.  The read-after-write hazard comment above
> > suggests the issue is split access between mmap and read/write across
> > the region, where the mmap access bypasses the socket protocol.  But
> > isn't this actually across the whole device?  For example, PCI doesn't
> > care which BAR a write targets, reads to another BAR cannot bypass the
> > write, aiui.  IOW, couldn't a write to a BAR that doesn't support mmap
> > affect the behavior of a BAR that does support mmap, and therefore
> > there should be no posted writes for the entire device if any region
> > supports mmap access?
> >  =20
>=20
> 	The protocol has sequential ordering, so issues arise only when
> reads to mapped regions pass writes that were sent asynchronously.  The c=
ode
> is designed to handle common driver ordering operations: reading config s=
pace
> (which can=E2=80=99t be mapped, so they=E2=80=99re sequentially ordered b=
y the protocol)
> and reading a nearby register (in the same region).  There is a =E2=80=99=
no-post=E2=80=99
> vfio-user option in case the driver relies on ordering reads to other
> (non-config) regions
>=20
> 	I made this the default since of the the primary customers is an
> NVME device server that polls a mapped doorbell region and wants posted
> writes.

This sounds like we're targeting a very specific use case then since
the code explicitly disables posted writes when mmaps within the same
region are available.  Another device might have these spread across
different regions, where the mmap test might not force the non-posted
write behavior and the user write could return with the operation still
in-flight through the socket protocol, allowing a read through the mmap
to bypass.

Device options are great for debugging and isolating certain features,
but users expect that devices "just work".

> > I wonder if a better approach wouldn't be to make all writes operations
> > synchronous and avoid read-after-write hazard by performing writes
> > through the mmap when available, ie. make use of the same bypass to
> > avoid the hazard.
> >  =20
>=20
> 	I can flip the default to be strict PCI, and force the NVME
> folks to use an option to enable performance.

All the physical NVME devices I have around only have a single BAR, so
the test to disable posted writes if mmaps are available within the
same region, ie. BAR, would necessarily cause all writes through the
trapped space to be non-posted.  Is your NVME device already working
with a non-standard layout to "enable performance"?

I'd rather see default behavior that focuses on creating a compatible
interface to bare metal, which I think means we need to demote all
writes to non-posted when there's a mechanism where reads can bypass
writes.  From that we can build quirks for known devices which can
overlay memory regions that only perform posted writes.  Perhaps a
side-band interface modeled after sparse mmaps would allow
standardization of such a device quirk to allow the device on the
server side to direct areas where posted writes are always safe.
Thanks,

Alex


