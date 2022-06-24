Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81780558F06
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 05:21:49 +0200 (CEST)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ZtE-0006kh-Kg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 23:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o4ZmI-0003CQ-Q1; Thu, 23 Jun 2022 23:14:38 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o4ZmF-00074p-De; Thu, 23 Jun 2022 23:14:38 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id h187so152243ybg.0;
 Thu, 23 Jun 2022 20:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3f3nff6oq9FWCdkrrz7JGPBA0XMOlEbbC491CBt9wsk=;
 b=YCXy03m2WV0y09ePlFox9UjnIWz9sHYjogW61lhMYpBtCS8wsKv7lCcRhjlZeIAxIo
 b8+QOBEqJB9GR74cxDPYP0TnkChUKeJHCi8kQIaXppWJ9W4GiC/FJNpoFLC1XpnDfMVo
 bAVoLoJXK6ATWdnh5pUUNsMiUa2tqurYFn7FHdeqrH3gZqT/IKwvoI65Npr0ITF9FY4N
 qlVoE1PsMuszQkcj345YoWscWl/tuoxspcbNfHJFodcY8wTEuqjQiVz1gKgeOI+skV5c
 GllikXmw/WvohKv01LnVT6LMR5QvUtKon35G+0mk1pEyOjphBL6W7dWvmchAZgDaVLbT
 TVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3f3nff6oq9FWCdkrrz7JGPBA0XMOlEbbC491CBt9wsk=;
 b=Vt3H1d2HLEpwDqPFQKNQVZh/gqHzyCR+CJvqAQxgQvflDFFDTDPihMBSY4QMmnHWLJ
 lrClpCaUoKrznDuYSYWP9l3ivAv+9HF8KECSC8dgB5MQy9mqgoLcUGlQrRzWRZFlYjf4
 GGdI59KQrzM/JZuTDSYrKSmGaNX2YrFiIUc4x7GdruKe4oCF6UtGLPHw/6VNY25f5sqp
 4lltcmTublXNmrNvoA8Y3CyVqdeC+KGfvsC+Lzx8NwfvoxmkiIsWErgLUSz4D1YSMpIY
 qUSyWq8c+6KFEwM6kOnlIvb7728y/h1fVSKPNDwDjAC+2zL14D8LoCYv6qym/bQCQL3A
 nQZg==
X-Gm-Message-State: AJIora+fZiAe0fQWH68K8KEqwbQjSiKwHXveOxHb34biJoe9Hci+uSdY
 sBMpeIETcw4EIoM5SyK6o5GMbbzqnQ8SZE0T+ys=
X-Google-Smtp-Source: AGRyM1vxS0qZm0QwkvPr4dH+QNa5u+fcTMqgSR3xb0lVQCFRnLzu7STtkG+sGsGhuWCdrWXHUjeAKitrch2N1uHSahY=
X-Received: by 2002:a25:9e82:0:b0:669:b38d:e93e with SMTP id
 p2-20020a259e82000000b00669b38de93emr5341129ybq.242.1656040473099; Thu, 23
 Jun 2022 20:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
In-Reply-To: <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 24 Jun 2022 11:14:32 +0800
Message-ID: <CAAAx-8JdYAKfoS_xBxx5g2iAJFoAHLMqDkz5QA6jhw2QH1L0=w@mail.gmail.com>
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2c.google.com
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

Hi Stefan,

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=B8=80 15:55=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
>
> Hi Sam,
> Is this version 2 of "[RFC v1] Add support for zoned device"? Please
> keep the email subject line the same (except for "v2", "v3", etc) so
> that it's clear which patch series this new version replaces.
>
> > Fix some mistakes before. It can report a range of zones now.
>
> This looks like the description of what changed compared to v1. Please
> put the changelog below "---" in the future. When patch emails are
> merged by git-am(1) it keeps the text above "---" and discards the text
> below "---". The changelog is usually no longer useful once the patches
> are merged, so it should be located below the "---" line.
>
> The text above the "---" is the commit description (an explanation of
> why this commit is necessary). In this case the commit description
> should explain that this patch adds .bdrv_co_zone_report() and
> .bdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can be
> supported.
>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/block-backend.c             |  22 ++++
> >  block/coroutines.h                |   5 +
> >  block/file-posix.c                | 182 ++++++++++++++++++++++++++++++
> >  block/io.c                        |  23 ++++
> >  include/block/block-common.h      |  43 ++++++-
> >  include/block/block-io.h          |  13 +++
> >  include/block/block_int-common.h  |  20 ++++
> >  qemu-io-cmds.c                    | 118 +++++++++++++++++++
> >  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
> >  9 files changed, 477 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/qemu-iotests/tests/zoned.sh
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index e0e1aff4b1..20248e4a35 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
> >      int ret;
> >  } BlockBackendAIOCB;
> >
> > +
> > +
>
> Please avoid whitespace changes in code that is otherwise untouched by
> your patch. Code changes can cause merge conflicts and they make it
> harder to use git-annotate(1), so only changes that are necessary should
> be included in a patch.
>
> >  static const AIOCBInfo block_backend_aiocb_info =3D {
> >      .get_aio_context =3D blk_aiocb_get_aio_context,
> >      .aiocb_size =3D sizeof(BlockBackendAIOCB),
> > @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
> >      return ret;
> >  }
> >
>
> Please add a documentation comment for blk_co_zone_report() that
> explains how to use the functions and the purpose of the arguments. For
> example, does offset have to be the first byte in a zone or can it be
> any byte offset? What are the alignment requirements of offset and len?
> Why is nr_zones a pointer?
>
> > +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t len,
>
> Functions that run in coroutine context must be labeled with
> coroutine_fn:
>
>     int coroutine_fn blk_co_zone_report(...)
>
> This tells humans and tools that the function can only be called from a
> coroutine. There is a blog post about coroutines in QEMU here:
> https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html
>
> > +                       int64_t *nr_zones,
> > +                       struct BlockZoneDescriptor *zones)
>
> QEMU coding style uses typedefs when defining structs, so "struct
> BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
> *zones".
>
> > +{
> > +    int ret;
>
> This function is called from the I/O code path, please mark it with:
>
>   IO_CODE();
>
> From include/block/block-io.h:
>
>   * I/O API functions. These functions are thread-safe, and therefore
>   * can run in any thread as long as the thread has called
>   * aio_context_acquire/release().
>   *
>   * These functions can only call functions from I/O and Common categorie=
s,
>   * but can be invoked by GS, "I/O or GS" and I/O APIs.
>   *
>   * All functions in this category must use the macro
>   * IO_CODE();
>   * to catch when they are accidentally called by the wrong API.
>
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len, nr_zones, =
zones);
>
> Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around this
> function call to ensure that zone report requests finish before I/O is
> drained (see bdrv_drained_begin()). This is necessary so that it's
> possible to wait for I/O requests, including zone report, to complete.
>
> Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
> blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
> bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called after
> bdrv_co_zone_report() returns.
>
After adding similar structure to blk_co_do_preadv(), zone operation
command will always fail at blk_wait_while_drained(blk) because
blk->inflight <=3D 0. Would it be ok to just remove
blk_wait_while_drained?

> > +    return ret;
> > +}
> > +
> > +int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> > +
> > +    return ret;
> > +}
>
> The same applies to this function.
>
> > +
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > @@ -2634,3 +2655,4 @@ int blk_make_empty(BlockBackend *blk, Error **err=
p)
> >
> >      return bdrv_make_empty(blk->root, errp);
> >  }
> > +
>
> Unrelated whitespace change.
>
> > diff --git a/block/coroutines.h b/block/coroutines.h
> > index 830ecaa733..247326255f 100644
> > --- a/block/coroutines.h
> > +++ b/block/coroutines.h
> > @@ -80,6 +80,11 @@ int coroutine_fn
> >  blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> >
> >  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t len, int64_t *nr_zones,
> > +                                    struct BlockZoneDescriptor *zones)=
;
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +        int64_t offset, int64_t len);
> >
> >
> >  /*
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..71fd21f8ba 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -178,6 +178,137 @@ typedef struct BDRVRawReopenState {
> >      bool check_cache_dropped;
> >  } BDRVRawReopenState;
> >
> > +/*
> > + * parse_zone - Fill a zone descriptor
> > + */
> > +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> > +        struct blk_zone *blkz) {
> > +    zone->start =3D blkz->start << BDRV_SECTOR_BITS;
> > +    zone->length =3D blkz->len << BDRV_SECTOR_BITS;
> > +    zone->cap =3D blkz->capacity << BDRV_SECTOR_BITS;
> > +    zone->wp =3D blkz->wp << BDRV_SECTOR_BITS;
> > +    zone->type =3D blkz->type;
> > +    zone->cond =3D blkz->type;
>
> Should this be "zone->cond =3D blkz->cond"?
>
> > +}
> > +
> > +/**
> > + * zone report - Get a zone block device's information in the
> > + * form of an array of zone descriptors.
> > + *
> > + * @param bs: passing zone block device file descriptor
> > + * @param zones: Space to hold zone information on reply
> > + * @param offset: the location in the zone block device
> > + * @return 0 on success, -1 on failure
> > + */
> > +static int raw_co_zone_report(BlockDriverState *bs, int64_t offset, in=
t64_t len,
>
> coroutine_fn
>
> > +                              int64_t *nr_zones,
> > +                              struct BlockZoneDescriptor *zones) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    struct blk_zone_report *rep;
> > +    struct BlockZoneDescriptor bzd;
> > +    struct blk_zone *blkz;
> > +    int64_t zone_size_mask, end, rep_size, nrz;
> > +    int ret, n =3D 0, i =3D 0;
> > +
> > +    printf("%s\n", "start to report zone");
>
> This looks like debug output. QEMU has a tracing system that you can
> use. See docs/devel/tracing.rst.
>
> > +    nrz =3D *nr_zones;
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    rep =3D (struct blk_zone_report *)malloc(rep_size);
>
> Please use g_autofree and g_new(). QEMU avoids direct use of malloc(3)/fr=
ee(3).
>
> > +    if (!rep) {
> > +        return -1;
> > +    }
> > +
> > +    zone_size_mask =3D zone_start_sector - 1;
> > +    /* align up */
> > +    end =3D ((offset + len + zone_size_mask) & (~zone_size_mask))
> > +            >> BDRV_SECTOR_BITS;
>
> More readable:
>
>   end =3D DIV_ROUND_UP(offset + len, BDRV_SECTOR_SIZE);
>
> > +
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (offset < end) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D offset;
> > +        rep->nr_zones =3D nrz;
> > +
> > +        ret =3D ioctl(s->fd, BLKREPORTZONE, rep);
>
> Can this ioctl() block? It seems likely. If yes, then the call needs to
> be made from the thread pool to avoid blocking the current thread. See
> raw_thread_pool_submit().
>
> > +        if (ret !=3D 0) {
> > +            ret =3D -errno;
> > +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
> > +                         s->fd, offset, errno);
> > +            free(rep);
> > +            return ret;
> > +        }
> > +
> > +        if (!rep->nr_zones) {
> > +            break;
> > +        }
> > +
> > +        for (i =3D 0; i < rep->nr_zones; i++) {
> > +            parse_zone(&bzd, &blkz[i]);
> > +            if (zones) {
> > +                memcpy(&zones[n], &bzd, sizeof(bzd));
>
> n is never incremented so this always overwrites the first element.
>
> > +            }
> > +        }
> > +
> > +        offset =3D blkz[i].start + blkz[i].len;
> > +    }
> > +
>
> Does this function need to update *nr_zones =3D n before returning? How d=
oes
> the caller know how many zones were returned?
>
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
>
> ioctl()'s second argument is unsigned long request. Please use unsigned
> long to keep the types consistent.
>
> > +    int64_t zone_size_mask, end;
> > +    int ret;
> > +
> > +    zone_size_mask =3D zone_start_sector - 1;
> > +    /* align up */
> > +    end =3D ((offset + len + zone_size_mask) & (~zone_size_mask))
> > +            >> BDRV_SECTOR_BITS;
> > +    offset =3D (offset & (~zone_size_mask)) >> BDRV_SECTOR_BITS; /* al=
ign down */
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
> > +    range.sector =3D offset;
> > +    range.nr_sectors =3D end - offset;
> > +    ret =3D ioctl(s->fd, ioctl_op, &range);
> > +    if (ret !=3D 0) {
> > +        error_report("ioctl %s failed %d",
> > +                         ioctl_name, errno);
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static int fd_open(BlockDriverState *bs)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > @@ -3324,6 +3455,9 @@ BlockDriver bdrv_file =3D {
> >      .bdrv_abort_perm_update =3D raw_abort_perm_update,
> >      .create_opts =3D &raw_create_opts,
> >      .mutable_opts =3D mutable_opts,
> > +
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> >  };
> >
> >  /***********************************************/
> > @@ -3703,6 +3837,53 @@ static BlockDriver bdrv_host_device =3D {
> >  #endif
> >  };
> >
> > +static BlockDriver bdrv_zoned_host_device =3D {
> > +        .format_name =3D "zoned_host_device",
> > +        .protocol_name =3D "zoned_host_device",
> > +        .instance_size =3D sizeof(BDRVRawState),
> > +        .bdrv_needs_filename =3D true,
> > +        .bdrv_probe_device  =3D hdev_probe_device,
> > +        .bdrv_parse_filename =3D hdev_parse_filename,
> > +        .bdrv_file_open     =3D hdev_open,
> > +        .bdrv_close         =3D raw_close,
> > +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
> > +        .bdrv_reopen_commit  =3D raw_reopen_commit,
> > +        .bdrv_reopen_abort   =3D raw_reopen_abort,
> > +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> > +        .create_opts         =3D &bdrv_create_opts_simple,
> > +        .mutable_opts        =3D mutable_opts,
> > +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> > +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> > +
> > +        .bdrv_co_preadv         =3D raw_co_preadv,
> > +        .bdrv_co_pwritev        =3D raw_co_pwritev,
> > +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> > +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > +        .bdrv_refresh_limits =3D raw_refresh_limits,
> > +        .bdrv_io_plug =3D raw_aio_plug,
> > +        .bdrv_io_unplug =3D raw_aio_unplug,
> > +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > +
> > +        .bdrv_co_truncate       =3D raw_co_truncate,
> > +        .bdrv_getlength =3D raw_getlength,
> > +        .bdrv_get_info =3D raw_get_info,
> > +        .bdrv_get_allocated_file_size
> > +                            =3D raw_get_allocated_file_size,
> > +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> > +        .bdrv_check_perm =3D raw_check_perm,
> > +        .bdrv_set_perm   =3D raw_set_perm,
> > +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
> > +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> > +        .bdrv_probe_geometry =3D hdev_probe_geometry,
> > +        .bdrv_co_ioctl =3D hdev_co_ioctl,
> > +
> > +        /* zone management operations */
> > +        .bdrv_co_zone_report =3D raw_co_zone_report,
> > +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +};
> > +
> >  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_ke=
rnel__)
> >  static void cdrom_parse_filename(const char *filename, QDict *options,
> >                                   Error **errp)
> > @@ -3964,6 +4145,7 @@ static void bdrv_file_init(void)
> >  #if defined(HAVE_HOST_BLOCK_DEVICE)
> >      bdrv_register(&bdrv_host_device);
> >  #ifdef __linux__
> > +    bdrv_register(&bdrv_zoned_host_device);
> >      bdrv_register(&bdrv_host_cdrom);
> >  #endif
> >  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> > diff --git a/block/io.c b/block/io.c
> > index 789e6373d5..3e8bb83cc3 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3258,6 +3258,29 @@ out:
> >      return co.ret;
> >  }
> >
> > +int bdrv_co_zone_report(BlockDriverState *bs,
> > +                        int64_t offset, int64_t len, int64_t *nr_zones=
,
> > +                        struct BlockZoneDescriptor *zones)
> > +{
> > +    int ret =3D 0;
> > +    if (!bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones=
)) {
> > +        return -ENOTSUP;
> > +    }
>
> This returns -ENOTSUP any time ->bdrv_co_zone_report() returns 0. Should
> this be:
>
>   if (!bs->drv->bdrv_co_zone_report) {
>       return -ENOTSUP;
>   }
>
>   return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones);
>
> ?
>
> > +
> > +    return ret;
> > +}
> > +
> > +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret =3D 0;
> > +    if (!bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len)) {
> > +        return -ENOTSUP;
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
> > index fdb7306e78..24c468d8ad 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -23,7 +23,7 @@
> >   */
> >  #ifndef BLOCK_COMMON_H
> >  #define BLOCK_COMMON_H
> > -
> > +#include <linux/blkzoned.h>
>
> Linux-specific code must be #ifdef __linux__ to avoid compilation errors
> on non-Linux hosts.
>
> >  #include "block/aio.h"
> >  #include "block/aio-wait.h"
> >  #include "qemu/iov.h"
> > @@ -48,6 +48,47 @@
> >  typedef struct BlockDriver BlockDriver;
> >  typedef struct BdrvChild BdrvChild;
> >  typedef struct BdrvChildClass BdrvChildClass;
> > +enum zone_type {
>
> Please use "typedef enum { ... } BdrvZoneType" so that enums follow
> QEMU's coding style.
>
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
>
> This 1:1 correspondence with Linux constants could make the code a
> little harder to port.
>
> Maybe QEMU's block layer should define its own numeric constants so the
> code doesn't rely on operating system-specific headers.
> block/file-posix.c #ifdef __linux__ code can be responsible for
> converting Linux-specific constants to QEMU constants (and the 1:1
> mapping can be used there).
>
Can we define those constants in block-common.h? Because
BlockZoneDescriptor requires zone_condition, zone_type defined and
BlockZoneDesicriptor are used in header files and qemu-io
sub-commands. If we use #ifdef __linux__ in block-common.h, it can be
responsible for converting Linux constants instead.

Thanks for reviewing! If there is any problem, please let me know.

Best regards,
Sam

> > +
> > +enum zone_op {
> > +    zone_open,
> > +    zone_close,
> > +    zone_finish,
> > +    zone_reset,
> > +};
> > +
> > +/*
> > + * Zone descriptor data structure.
> > + * Provide information on a zone with all position and size values in =
bytes.
> > + */
> > +typedef struct BlockZoneDescriptor {
> > +    uint64_t start;
> > +    uint64_t length;
> > +    uint64_t cap;
> > +    uint64_t wp;
> > +    enum zone_type type;
> > +    enum zone_cond cond;
> > +} BlockZoneDescriptor;
> > +
> > +enum zone_model {
> > +    BLK_Z_HM,
> > +    BLK_Z_HA,
> > +};
> >
> >  typedef struct BlockDriverInfo {
> >      /* in bytes, 0 if irrelevant */
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 62c84f0519..deb8902684 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, voi=
d *buf);
> >  /* Ensure contents are flushed to disk.  */
> >  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> >
> > +/* Report zone information of zone block device. */
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t off=
set,
> > +                                     int64_t len, int64_t *nr_zones,
> > +                                     struct BlockZoneDescriptor *zones=
);
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op =
op,
> > +        int64_t offset, int64_t len);
> > +
> >  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> > @@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVec=
tor *qiov, int64_t pos);
> >  int generated_co_wrapper
> >  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t =
pos);
> >
> > +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t of=
fset,
> > +                                         int64_t len, int64_t *nr_zone=
s,
> > +                                         struct BlockZoneDescriptor *z=
ones);
> > +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op=
 op,
> > +        int64_t offset, int64_t len);
> > +
> >  /**
> >   * bdrv_parent_drained_begin_single:
> >   *
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 8947abab76..4d0180a7da 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -63,6 +63,7 @@
> >  #define BLOCK_OPT_EXTL2             "extended_l2"
> >
> >  #define BLOCK_PROBE_BUF_SIZE        512
> > +#define zone_start_sector           512
> >
> >  enum BdrvTrackedRequestType {
> >      BDRV_TRACKED_READ,
> > @@ -94,6 +95,19 @@ typedef struct BdrvTrackedRequest {
> >      struct BdrvTrackedRequest *waiting_for;
> >  } BdrvTrackedRequest;
> >
> > +/**
> > + * Zone device information data structure.
> > + * Provide information on a device.
> > + */
> > +typedef struct zbd_dev {
> > +    enum zone_model model;
> > +    uint32_t block_size;
>
> How does this relate to QEMU's BlockLimits?
>
> > +    uint32_t write_granularity;
>
> Same. Maybe this belongs in BlockLimits?
>
> > +    uint32_t nr_zones;
>
> Should this really be limited to 32-bit? For example, take 256 MB zones,
> then the max nr_zones * 256 MB is much smaller than a uint64_t capacity
> value. It seems safer to make this 64-bit, but maybe Dmitry, Hannes, or
> Damien can tell us what to do here.
>
> > +    struct BlockZoneDescriptor *zones; /* array of zones */
>
> When is this used?

