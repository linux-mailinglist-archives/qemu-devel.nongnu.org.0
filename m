Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCF3548314
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:21:09 +0200 (CEST)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0gFv-0001jj-Nq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o0g7g-00037L-83; Mon, 13 Jun 2022 05:12:36 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o0g7b-0004lb-VQ; Mon, 13 Jun 2022 05:12:34 -0400
Received: by mail-yb1-xb31.google.com with SMTP id e184so8817794ybf.8;
 Mon, 13 Jun 2022 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rHB+vBA3Nn1Q/ZDQvmaP8/QsQ9Yz3E6fIDSl+CiiGY8=;
 b=COb1SdA2KeZ+Hh0nsUNJqNeDiHh3BY45YEeUbddoJ6C4A2towwqyL5AfQsmuykaFTK
 FYsjN3QA4GsJwSTmchdwjbCNwTfx01+vGn3Ji9NJ/UpvDJVKh7UcYCH+Oqtwgw+4RuZf
 Di/kFtDMMom57bB92ZNbrezUowpN73Yu4JXQLfj3+Y64RFIzbbf9Ngp0U92ucqVbZFf+
 HyCyHNQKo5LHkGYAx1TgPmE4G704qC5MT742ZuJ3R6GetwRr/9MB97EV47How85owSEU
 +gzOo4dwHWHfsiVrwpVceg23TAwjfXg7jatHJ64+BwOB0OWIcqEPyhclPCcRP4uAmRXr
 KhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rHB+vBA3Nn1Q/ZDQvmaP8/QsQ9Yz3E6fIDSl+CiiGY8=;
 b=Lxid9/fZp7i+5Z8FgNI8408sWeJShI3QZQcfNhBtBacVYm0/2XMJOs+kLNeqMUgqN7
 QmknvukmH7ZH9VIriCnYh2r6D03tls/nB7VfvA0w3kaQAXxU1oyKFpSVkydwnP7DmrM+
 C2hDKpQOWHWGaX0lrQRcPXQQvUgbr1UsP/htXbbmD4E+bKn2X4EPKO4ti0BfkDIUMAUZ
 SXAPv2Y5P8aJ82LFV5BwcRcAGET6WLbyOTV0vfGQIOWResZGNs4KrClduKChYaI+0/wx
 YscIuNk5yrxDqpTR8MHoQ5Gwcw33264pABAsiVPNKgNgMPE0hsbaBG1Ztp8CFxAbiE6y
 TrMg==
X-Gm-Message-State: AOAM531bwJrwhbL+NXoiC/gLKsrJjEfercgXM73KXL+WhUVd2WqMpGYj
 ckwqXNguqBNduWqY15F0mHId6awFTADKqmyw2aE=
X-Google-Smtp-Source: ABdhPJyAR0LaOk/ukTUbZq/FXMKEBbwLNnPJwxuVArOOBsGtpgOxisoIczK+16rJt5RXD9VCEoNLp0yPzN1DroaeLP8=
X-Received: by 2002:a25:7354:0:b0:65d:1518:63a6 with SMTP id
 o81-20020a257354000000b0065d151863a6mr57586719ybc.213.1655111550289; Mon, 13
 Jun 2022 02:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220613040947.16266-1-faithilikerun@gmail.com>
 <221ef49d-4cf9-f740-1eb6-9eb1824a77fd@opensource.wdc.com>
In-Reply-To: <221ef49d-4cf9-f740-1eb6-9eb1824a77fd@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 13 Jun 2022 17:12:28 +0800
Message-ID: <CAAAx-8JCBLWPJ=5fxsbvcoktfGRVbR+YG_M4U2Mvy9iXGH-kbg@mail.gmail.com>
Subject: Re: [RFC v1] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 14:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/13/22 13:09, Sam Li wrote:
> > By adding zone management operations in BlockDriver, storage
> > controller emulation can use the new block layer APIs including
> > zone_report, zone_reset, zone_open, zone_close, and zone_finish.
>
> Like a real review, commenting inline below.
>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/block-backend.c             |  20 ++++
> >  block/coroutines.h                |   6 ++
> >  block/file-posix.c                | 174 ++++++++++++++++++++++++++++++
> >  block/io.c                        |  26 +++++
> >  include/block/block-common.h      |   8 ++
> >  include/block/block-io.h          |  11 ++
> >  include/block/block_int-common.h  |   6 ++
> >  qemu-io-cmds.c                    |  66 ++++++++++++
> >  tests/qemu-iotests/tests/zoned.sh |  47 ++++++++
> >  9 files changed, 364 insertions(+)
> >  create mode 100644 tests/qemu-iotests/tests/zoned.sh
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index e0e1aff4b1..4695e5f9fe 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
> >      int ret;
> >  } BlockBackendAIOCB;
> >
> > +
> > +
>
> No need for these extra blank line.
>
> >  static const AIOCBInfo block_backend_aiocb_info =3D {
> >      .get_aio_context =3D blk_aiocb_get_aio_context,
> >      .aiocb_size =3D sizeof(BlockBackendAIOCB),
> > @@ -1810,6 +1812,23 @@ int blk_flush(BlockBackend *blk)
> >      return ret;
> >  }
> >
> > +int blk_co_zone_report(BlockBackend *blk)
> > +{
> > +    int ret;
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, NULL, 0, 0, 0, 0);
> > +
> > +    return ret;
>
> Simplify:
>
>         return bdrv_co_zone_report(blk->root->bs, NULL, 0, 0, 0, 0);
>
> But I can see that this code is temporary anyway :)
>
> > +}
> > +
> > +int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op)
> > +{
> > +    int ret;
> > +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, 0, 100);
> > +
> > +    return ret;
> > +}
> > +
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > @@ -2634,3 +2653,4 @@ int blk_make_empty(BlockBackend *blk, Error **err=
p)
> >
> >      return bdrv_make_empty(blk->root, errp);
> >  }
> > +
>
> Please do not randomly add blank lines.
>
> > diff --git a/block/coroutines.h b/block/coroutines.h
> > index 830ecaa733..e29222a68a 100644
> > --- a/block/coroutines.h
> > +++ b/block/coroutines.h
> > @@ -81,6 +81,10 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset=
, int64_t bytes);
> >
> >  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> >
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk);
> > +
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op);
> > +
> >
> >  /*
> >   * "I/O or GS" API functions. These functions can run without
> > @@ -129,4 +133,6 @@ blk_do_pdiscard(BlockBackend *blk, int64_t offset, =
int64_t bytes);
> >
> >  int generated_co_wrapper blk_do_flush(BlockBackend *blk);
> >
> > +
> > +
>
> No need for these blank lines.
>
> >  #endif /* BLOCK_COROUTINES_H */
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..42646acc4e 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -73,6 +73,7 @@
> >  #include <linux/hdreg.h>
> >  #include <linux/magic.h>
> >  #include <scsi/sg.h>
> > +#include <linux/blkzoned.h>
> >  #ifdef __s390__
> >  #include <asm/dasd.h>
> >  #endif
> > @@ -178,6 +179,167 @@ typedef struct BDRVRawReopenState {
> >      bool check_cache_dropped;
> >  } BDRVRawReopenState;
> >
> > +
>
> Another extra blank line not needed.
>
> > +enum zone_type {
> > +    BLK_ZT_CONV =3D BLK_ZONE_TYPE_CONVENTIONAL,
> > +    BLK_ZT_SWR =3D BLK_ZONE_TYPE_SEQWRITE_REQ,
> > +    BLK_ZT_SWP =3D BLK_ZONE_TYPE_SEQWRITE_PREF,
> > +};
> > +
> > +enum zone_cond {
> > +    BLK_ZS_NOT_WP =3D BLK_ZONE_COND_NOT_WP,
> > +    BLK_ZS_EMPTY =3D BLK_ZONE_COND_EMPTY,
> > +    BLK_ZS_IOPEN =3D BLK_ZONE_COND_IMP_OPEN,
> > +    BLK_ZS_EOPEN =3D BLK_ZONE_COND_EXP_OPEN,
> > +    BLK_ZS_CLOSED =3D BLK_ZONE_COND_CLOSED,
> > +    BLK_ZS_RDONLY =3D BLK_ZONE_COND_READONLY,
> > +    BLK_ZS_FULL =3D BLK_ZONE_COND_FULL,
> > +    BLK_ZS_OFFLINE =3D BLK_ZONE_COND_OFFLINE,
> > +};
> > +
> > +/*
> > + * Zone descriptor data structure.
> > + * Provide information on a zone with all position and size values in =
bytes.
> > + */
> > +struct BlockZoneDescriptor {
> > +    uint64_t start;
> > +    uint32_t length;
> > +    uint32_t cap;
> > +    uint64_t wp;
> > +    enum zone_type type;
> > +    enum zone_cond cond;
> > +};
> > +
> > +enum zone_model {
> > +    ZBD_HOST_MANAGED,
> > +    ZBD_HOST_AWARE,
>
> Please stay consistent with the macro prefixes. Use BLK_Zxxx here too.
> Likely BLK_ZM_HOST_MANAGED and BLK_ZM_HOST_AWARE.
>
> All of the above definitions should not be in block/file-posix.c because
> they must be common to the entire block layer backend (regardless of the
> driver implementing the zone operations). So these need to go into some
> common .h header file so that both backend drivers (e.g. file-posix) and
> front end (virtio-blk) can both see the same definitions.
>
> > +};
> > +
> > +/**
> > + * Zone device information data structure.
> > + * Provide information on a device.
> > + */
> > +typedef struct zbd_dev {
> > +    enum zone_model model;
> > +    uint32_t block_size;
> > +    uint32_t write_granularity;
> > +    uint32_t nr_zones;
> > +    struct BlockZoneDescriptor *zones; /* array of zones */
> > +    uint32_t max_nr_open_zones; /* maximum number of explicitly open z=
ones */
> > +    uint32_t max_nr_active_zones;
> > +} zbd_dev;
> > +
> > +/**
> > + * zone report - Get a zone block device's information in the
> > + * form of an array of zone descriptors.
> > + *
> > + * @param bs: passing zone block device file descriptor
> > + * @param zones: Space to hold zone information on reply
> > + * @param offset: the location in the zone block device
> > + * @param len: the length of reported zone information*
> > + * @param partial: if partial has zero value, it is the number
> > + * of zones that can be reported; else, set the nr_zones to the
> > + * number of fully transferred zone descriptors in the data buffer.
> > + * @return 0 on success, -1 on failure
> > + */
> > +static int raw_co_zone_report(BlockDriverState *bs,
> > +                       struct BlockZoneDescriptor *zones, uint32_t *nr=
_zones,
> > +                       int64_t offset, int64_t len, uint8_t partial) {
>
> Remove the partial argument from this interface. We have decided to drop
> it from the virtio specs and linux ioctl do not need it. Also, it is
> generally good practice to have the first arguments of a function be the
> "inputs" and the last ones the outputs. So:
>
> static int raw_co_zone_report(BlockDriverState *bs,
>                               int64_t offset, int64_t len,
>                               uint32_t *nr_zones,
>                               struct BlockZoneDescriptor *zones)
>
> would be better, I think.
> In any case, this function interface needs rethinking. E.g., what are the
> inputs and the outputs ?
>
> * Option (1)
>
> Input: (a) the offset where to start the report from, (b) the array of
> zones to fill up and (c) the maximum number of zones that the caller want=
s
> (which may be just 1).
> Ouput: (a) the array of zones filled up and (b) the number of zone
> decriptors that were filled in the array of zones, which can be LESS than
> what the caller requested.
>
> The interface then is:
>
> static int raw_co_zone_report(BlockDriverState *bs,
>                               int64_t offset, uint32_t *nr_zones,
>                               struct BlockZoneDescriptor *zones);
>
> * Option (2)
>
> Input: (a) the offset where to start the report from, (b) the maximum
> number of zones that the caller wants (which may be just 1).
> Ouput: (a) an allocated and filled array of zones and (b) the number of
> zone decriptors that were filled in the allocated array of zones, which
> can be LESS than what the caller requested.
>
> The interface then is:
>
> static int raw_co_zone_report(BlockDriverState *bs,
>                               int64_t offset, uint32_t *nr_zones,
>                               struct BlockZoneDescriptor **zones);
>
> Note the "**" since you will return an array of zones (that is, a pointer=
).
>
> For option (1), the caller will be responsible to manage the array of
> zones and free it when it is not needed anymore. For (2), the caller will
> still need to free the array of zones when not needed anymore BUT since
> the caller has no idea how that array was allocated, (it may be an
> anonymous mmap region !), you would need a "free array of zones" function=
 too.
>
> So option (2) is more complicated. So I strongly suggest you go for
> solution (1): the virtio-blk driver (or qemu-io for your test) will
> allocate the array of zones and pass it along as an argument for this
> function to use it and fill the array.

It's kind of like the delete_file before. I should finish solution 1
before moving to improvements.

Thanks for reviewing. The advice is very helpful and I'll fix these
problems as soon as possible.

Best regards,
Sam

>
> > +    printf("%s\n", "start to report zone");
> > +    BDRVRawState *s =3D bs->opaque;
> > +
> > +    struct blk_zone_report *rep;
> > +    uint32_t rep_nr_zones =3D 0;
> > +    int ret =3D 0, i =3D 0, start_sector =3D 0;
>
> Not sure about qemu code style rules, but generally:
> 1) Mixing code and declarations is a BAD idea. It makes code reading
> harder. So move that printf after the declarations.
> 2) No blank lines in the middle of the declarations.
>
> > +
> > +    if (ioctl(s->fd, BLKGETNRZONES, &rep_nr_zones)) {
> > +        /* Done */
> > +        error_report("number of zones not available");
> > +    }
>
> You do not need this. You have the nr_zones input argument and if that is
> too large, then the kernel will simply return less zones than what the
> caller asked for. You do need to check that nr_zones is not 0.
>
> > +
> > +    fprintf(stdout, "Got %u zone descriptors\n", rep_nr_zones);
> > +    rep =3D malloc(sizeof(struct blk_zone_report) +
> > +            rep_nr_zones * sizeof(struct blk_zone));
> > +    if (!rep) {
> > +        return -1;
> > +    }
> > +
> > +    rep->nr_zones =3D rep_nr_zones;
> > +    rep->sector =3D start_sector;
> > +
> > +    while (i < rep_nr_zones) {
> > +        ret =3D ioctl(s->fd, BLKREPORTZONE, rep);
> > +        if (ret !=3D 0) {
> > +            error_report("can't report zone");
> > +        }
> > +
> > +        fprintf(stdout, "start: 0x%llx, len 0x%llx, cap 0x%llx, "
> > +                        "wptr 0x%llx reset: %u non-seq:%u, zcond:%u, [=
type: %u]\n",
> > +                        rep->zones[i].start, rep->zones[i].len,
> > +                        rep->zones[i].capacity, rep->zones[i].wp,
> > +                        rep->zones[i].reset, rep->zones[i].non_seq,
> > +                        rep->zones[i].cond, rep->zones[i].type);
> > +        ++i;
>
> The ioctl in the loop may have returned a lot more than 1 zone. The actua=
l
> number that is returned is indicated by rep->nr_zones after the ioctl
> call. So instead of i++, you need "i +=3D rep->nr_zones". And you also ne=
ed
> to stop (break) if rep->nr_zones is 0.
>
> > +    }
> > +
> > +    free(rep);
>
> You are not updating the nr_zones argument "*nr_zones =3D i;"
>
> Overall: last week, we decided that you should not worry about the ioctl
> for now and simply fill directly some value for the first zone in the
> "struct BlockZoneDescriptor *zones" array and return only that one zone.
> And the printf should be in your qemu-io test so that you can check that
> you are seeing the zone descriptors being propagated from the driver to
> the caller.
>
> > +
> > +    return ret;
> > +}
> > +
> > +/**
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +static int raw_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> > +        int64_t offset, int64_t len) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    struct blk_zone_range range;
> > +    const char *ioctl_name;
> > +    uint64_t ioctl_op;
> > +    int ret;
> > +
> > +    switch (op) {
> > +    case zone_open:
> > +        ioctl_name =3D "BLKOPENZONE";
> > +        ioctl_op =3D BLKOPENZONE;
> > +        break;
> > +    case zone_close:
> > +        ioctl_name =3D "BLKCLOSEZONE";
> > +        ioctl_op =3D BLKCLOSEZONE;
> > +        break;
> > +    case zone_finish:
> > +        ioctl_name =3D "BLKFINISHZONE";
> > +        ioctl_op =3D BLKFINISHZONE;
> > +        break;
> > +    case zone_reset:
> > +        ioctl_name =3D "BLKRESETZONE";
> > +        ioctl_op =3D BLKRESETZONE;
> > +        break;
> > +    default:
> > +        error_report("Invalid zone operation 0x%x", op);
> > +        errno =3D -EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    /* Execute the operation */
> > +    range.sector =3D 0;
>
> This should be "=3D offset".
>
> > +    range.nr_sectors =3D 100;
>
> And this should be "=3D len".
>
> You have the arguments, use them !
>
> > +    ret =3D ioctl(s->fd, ioctl_op, &range);
> > +    if (ret !=3D 0) {
> > +        if (errno =3D=3D ENOTTY) {
> > +            error_report("ioctl %s is not supported", ioctl_name);
> > +            errno =3D ENOTSUP;
>
> This is most likely not necessary since you will have checked already tha=
t
> the device is a zoned device, so you know it accepts these ioctls.
>
> > +        } else {
> > +            error_report("ioctl %s failed %d",
> > +                         ioctl_name, errno);
> > +        }
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +
> >  static int fd_open(BlockDriverState *bs)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > @@ -3324,6 +3486,9 @@ BlockDriver bdrv_file =3D {
> >      .bdrv_abort_perm_update =3D raw_abort_perm_update,
> >      .create_opts =3D &raw_create_opts,
> >      .mutable_opts =3D mutable_opts,
> > +
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> >  };
> >
> >  /***********************************************/
> > @@ -3697,6 +3862,9 @@ static BlockDriver bdrv_host_device =3D {
> >      .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> >      .bdrv_probe_geometry =3D hdev_probe_geometry,
> >
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>
> These probably need to be in a #ifdef __linux__ / #endif since these
> functions use linux only ioctl. However, you are unconditionally adding
> the method to bdrv_host_device, which is also going to be used for regula=
r
> disks. So not good. You may need to define a:
> "BlockDriver bdrv_zoned_host_device" which is the same as bdrv_host_devic=
e
> + adding the zone operation. When the driver is initialized, you choose
> how it is registered aftewr testing if the host device is zoned or not.
>
> > +
> >      /* generic scsi device */
> >  #ifdef __linux__
> >      .bdrv_co_ioctl          =3D hdev_co_ioctl,
> > @@ -3809,6 +3977,9 @@ static BlockDriver bdrv_host_cdrom =3D {
> >      .bdrv_io_unplug =3D raw_aio_unplug,
> >      .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> >
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>
> CROM do not have zones :)
>
> > +
> >      .bdrv_co_truncate    =3D raw_co_truncate,
> >      .bdrv_getlength      =3D raw_getlength,
> >      .has_variable_length =3D true,
> > @@ -3939,6 +4110,9 @@ static BlockDriver bdrv_host_cdrom =3D {
> >      .bdrv_io_unplug =3D raw_aio_unplug,
> >      .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> >
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +
> >      .bdrv_co_truncate    =3D raw_co_truncate,
> >      .bdrv_getlength      =3D raw_getlength,
> >      .has_variable_length =3D true,
> > diff --git a/block/io.c b/block/io.c
> > index 789e6373d5..04f108c128 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3258,6 +3258,32 @@ out:
> >      return co.ret;
> >  }
> >
> > +int bdrv_co_zone_report(BlockDriverState *bs,
> > +                        struct BlockZoneDescriptor *zones, uint32_t *n=
r_zones,
> > +                                int64_t offset, int64_t len, uint8_t p=
artial)
> > +{
> > +    int ret;
> > +    ret =3D bs->drv->bdrv_co_zone_report(bs, zones, nr_zones,
> > +                                       offset, len, partial);
> > +    if (!ret) {
> > +        return -ENOTSUP;
>
> Nope. ret needs to be returned as is here. But you need to guard  against
> invalid calls with something like:
>
>         if (!bs->drv->bdrv_co_zone_report)
>                 return -ENOTSUP;
>
> Before actully calling bs->drv->bdrv_co_zone_report.
>
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    ret =3D bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> > +    if (!ret) {
> > +        return -ENOTSUP;
>
> Same comment as above.
>
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >  {
> >      IO_CODE();
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index fdb7306e78..62eeeba8da 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -48,6 +48,14 @@
> >  typedef struct BlockDriver BlockDriver;
> >  typedef struct BdrvChild BdrvChild;
> >  typedef struct BdrvChildClass BdrvChildClass;
> > +/* zone descriptor data structure */
> > +typedef struct BlockZoneDescriptor BlockZoneDescriptor;
> > +enum zone_op {
> > +    zone_open,
> > +    zone_close,
> > +    zone_finish,
> > +    zone_reset,
> > +};
> >
> >  typedef struct BlockDriverInfo {
> >      /* in bytes, 0 if irrelevant */
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 62c84f0519..a915b554ad 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -80,6 +80,14 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, voi=
d *buf);
> >  /* Ensure contents are flushed to disk.  */
> >  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> >
> > +/* Report zone information of zone block device. */
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs,
> > +                                     struct BlockZoneDescriptor *zones=
,
> > +                                             uint32_t *nr_zones, int64=
_t offset,
> > +                                             int64_t len, uint8_t part=
ial);
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op =
op,
> > +        int64_t offset, int64_t len);
> > +
> >  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> > @@ -290,6 +298,9 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVect=
or *qiov, int64_t pos);
> >  int generated_co_wrapper
> >  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t =
pos);
> >
> > +int generated_co_wrapper blk_zone_report(BlockBackend *blk);
> > +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op=
 op);
> > +
> >  /**
> >   * bdrv_parent_drained_begin_single:
> >   *
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 8947abab76..520a733481 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -691,6 +691,12 @@ struct BlockDriver {
> >                                            QEMUIOVector *qiov,
> >                                            int64_t pos);
> >
> > +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> > +            struct BlockZoneDescriptor *zones, uint32_t *nr_zones,
> > +                    int64_t offset, int64_t len, uint8_t partial);
> > +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum z=
one_op op,
> > +            int64_t offset, int64_t len);
> > +
> >      /* removable device specific */
> >      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 2f0d8ac25a..ca02b4047e 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1706,6 +1706,67 @@ static const cmdinfo_t flush_cmd =3D {
> >      .oneline    =3D "flush all in-core file state to disk",
> >  };
> >
> > +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    return blk_zone_report(blk);
> > +}
> > +
> > +static const cmdinfo_t zone_report_cmd =3D {
> > +        .name =3D "zone_report",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_report_f,
> > +        .oneline =3D "report zone information in zone block device",
> > +};
> > +
> > +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    return blk_zone_mgmt(blk, zone_open);
> > +}
> > +
> > +static const cmdinfo_t zone_open_cmd =3D {
> > +        .name =3D "zone_open",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_open_f,
> > +        .oneline =3D "explicit open a range of zones in zone block dev=
ice",
> > +};
> > +
> > +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    return blk_zone_mgmt(blk, zone_close);
> > +}
> > +
> > +static const cmdinfo_t zone_close_cmd =3D {
> > +        .name =3D "zone_close",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_close_f,
> > +        .oneline =3D "close a range of zones in zone block device",
> > +};
> > +
> > +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    return blk_zone_mgmt(blk, zone_finish);
> > +}
> > +
> > +static const cmdinfo_t zone_finish_cmd =3D {
> > +        .name =3D "zone_finish",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_finish_f,
> > +        .oneline =3D "finish a range of zones in zone block device",
> > +};
> > +
> > +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    return blk_zone_mgmt(blk, zone_reset);
> > +}
> > +
> > +static const cmdinfo_t zone_reset_cmd =3D {
> > +        .name =3D "zone_reset",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_reset_f,
> > +        .oneline =3D "reset a zone write pointer in zone block device"=
,
> > +};
> > +
> > +
> >  static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >  static const cmdinfo_t truncate_cmd =3D {
> >      .name       =3D "truncate",
> > @@ -2498,6 +2559,11 @@ static void __attribute((constructor)) init_qemu=
io_commands(void)
> >      qemuio_add_command(&aio_write_cmd);
> >      qemuio_add_command(&aio_flush_cmd);
> >      qemuio_add_command(&flush_cmd);
> > +    qemuio_add_command(&zone_report_cmd);
> > +    qemuio_add_command(&zone_open_cmd);
> > +    qemuio_add_command(&zone_close_cmd);
> > +    qemuio_add_command(&zone_finish_cmd);
> > +    qemuio_add_command(&zone_reset_cmd);
> >      qemuio_add_command(&truncate_cmd);
> >      qemuio_add_command(&length_cmd);
> >      qemuio_add_command(&info_cmd);
> > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tes=
ts/zoned.sh
> > new file mode 100644
> > index 0000000000..a1596e8340
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.sh
> > @@ -0,0 +1,47 @@
> > +#!/usr/bin/env bash
> > +#
> > +# Test zone management operations.
> > +#
> > +
> > +
> > +
> > +seq=3D`basename $0`
> > +echo "QA output created by $seq"
> > +
> > +status=3D1 # failure is the default!
> > +
> > +_cleanup()
> > +{
> > +  _cleanup_test_img
> > +}
> > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > +
> > +# get standard environment, filters and checks
> > +. ./common.rc
> > +. ./common.filter
> > +. ./common.pattern
> > +
> > +# much of this could be generic for any format supporting compression.
> > +_supported_fmt qcow qcow2
> > +_supported_proto file
> > +_supported_os Linux
> > +
> > +TEST_OFFSETS=3D"0 1000 4000"
> > +TEST_LENS=3D"1000"
> > +TEST_OPS=3D"zone_report zone_open zone_close zone_finish zone_reset zo=
ne_append"
> > +
> > +
> > +echo "Testing a null_blk device"
> > +echo
> > +
> > +for offset in $TEST_OFFSETS; do
> > +    echo "At offset $offset:"
> > +    io_test "write -b" $offset $CLUSTER_SIZE 8
> > +    io_test "read -b" $offset $CLUSTER_SIZE 8
> > +    _check_test_img
> > +done
> > +
> > +# success, all done
> > +echo "*** done"
> > +rm -f $seq.full
> > +status=3D0
>
>
> --
> Damien Le Moal
> Western Digital Research

