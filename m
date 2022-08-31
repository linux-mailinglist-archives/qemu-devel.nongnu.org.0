Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079E5A792F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:37:34 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJE4-0003CA-Oo
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTJC7-0001ZN-9d
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTJBv-0006cR-Ur
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661934918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aP+8A6ce3v0QaqJkRkWDRaQQEZjgDc7soczMcSyAEyM=;
 b=DhHdFOwhA5eHrnFmpHrOH1UUyHxad28sfC0u2QKhTEGNBCnvL/+SgeWk+p5zlomgLlXFfu
 5rgPZ0kNbfanW3yKHl88KYCoq30kwdXPI4UD0M129bsCfGpBkP2OkfAMkx9gHDDbEHzj0/
 2hYTabALVc93LZrb2zjQ72n8skttz20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-FKcct4u_OBK-egADOd_Gkw-1; Wed, 31 Aug 2022 04:35:13 -0400
X-MC-Unique: FKcct4u_OBK-egADOd_Gkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89912382F1A5;
 Wed, 31 Aug 2022 08:35:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C521C15BB3;
 Wed, 31 Aug 2022 08:35:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58D9421E6900; Wed, 31 Aug 2022 10:35:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,  Hannes Reinecke
 <hare@suse.de>,  qemu block <qemu-block@nongnu.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Eric Blake <eblake@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
 <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
Date: Wed, 31 Aug 2022 10:35:10 +0200
In-Reply-To: <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
 (Sam Li's message of "Tue, 30 Aug 2022 23:05:31 +0800")
Message-ID: <87fshcdd4x.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Sam Li <faithilikerun@gmail.com> writes:

> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Sam Li <faithilikerun@gmail.com> writes:
>>
>> > By adding zone management operations in BlockDriver, storage controller
>> > emulation can use the new block layer APIs including Report Zone and
>> > four zone management operations (open, close, finish, reset).
>> >
>> > Add zoned storage commands of the device: zone_report(zrp), zone_open(=
zo),
>> > zone_close(zc), zone_reset(zrs), zone_finish(zf).
>> >
>> > For example, to test zone_report, use following command:
>> > $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D=
/dev/nullb0
>> > -c "zrp offset nr_zones"
>> >
>> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> > Reviewed-by: Hannes Reinecke <hare@suse.de>
>>
>> [...]
>>
>> > diff --git a/block/file-posix.c b/block/file-posix.c
>> > index 0a8b4b426e..e3efba6db7 100644
>> > --- a/block/file-posix.c
>> > +++ b/block/file-posix.c
>>
>> [...]
>>
>> > @@ -3752,6 +4025,54 @@ static BlockDriver bdrv_host_device =3D {
>> >  #endif
>> >  };
>> >
>> > +#if defined(CONFIG_BLKZONED)
>> > +static BlockDriver bdrv_zoned_host_device =3D {
>> > +        .format_name =3D "zoned_host_device",
>>
>> Indentation should be 4, not 8.
>>
>> > +        .protocol_name =3D "zoned_host_device",
>> > +        .instance_size =3D sizeof(BDRVRawState),
>> > +        .bdrv_needs_filename =3D true,
>> > +        .bdrv_probe_device  =3D hdev_probe_device,
>> > +        .bdrv_file_open     =3D hdev_open,
>> > +        .bdrv_close         =3D raw_close,
>> > +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
>> > +        .bdrv_reopen_commit  =3D raw_reopen_commit,
>> > +        .bdrv_reopen_abort   =3D raw_reopen_abort,
>> > +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
>> > +        .create_opts         =3D &bdrv_create_opts_simple,
>> > +        .mutable_opts        =3D mutable_opts,
>> > +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
>> > +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
>> > +
>> > +        .bdrv_co_preadv         =3D raw_co_preadv,
>> > +        .bdrv_co_pwritev        =3D raw_co_pwritev,
>> > +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
>> > +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
>> > +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
>> > +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
>> > +        .bdrv_refresh_limits =3D raw_refresh_limits,
>> > +        .bdrv_io_plug =3D raw_aio_plug,
>> > +        .bdrv_io_unplug =3D raw_aio_unplug,
>> > +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
>> > +
>> > +        .bdrv_co_truncate       =3D raw_co_truncate,
>> > +        .bdrv_getlength =3D raw_getlength,
>> > +        .bdrv_get_info =3D raw_get_info,
>> > +        .bdrv_get_allocated_file_size
>> > +                            =3D raw_get_allocated_file_size,
>> > +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
>> > +        .bdrv_check_perm =3D raw_check_perm,
>> > +        .bdrv_set_perm   =3D raw_set_perm,
>> > +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
>> > +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
>> > +        .bdrv_probe_geometry =3D hdev_probe_geometry,
>> > +        .bdrv_co_ioctl =3D hdev_co_ioctl,
>> > +
>> > +        /* zone management operations */
>> > +        .bdrv_co_zone_report =3D raw_co_zone_report,
>> > +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>> > +};
>>
>> Differences to bdrv_host_device:
>>
>> * .bdrv_parse_filename is not set
>>
>> * .bdrv_co_ioctl is not set
>>
>> * .bdrv_co_zone_report and .bdrv_co_zone_mgmt are set
>
> As Stefan mentioned, zoned_host_device is a new driver that doesn't
> work with string filenames. .bdrv_parse_filename() helps legacy
> drivers strip the optional protocol prefix off the filename and no use
> here. Therefore it can be dropped.

Makes sense.

> .bdrv_co_ioctl is set actually.

You're right; I diffed the two and misread the result.

> Zoned_host_device is basically host_device + zone operations. It
> serves for a simple purpose: if the host device is zoned, register
> zoned_host_device driver; else, register host_device.

Why would I ever want to use host_device instead of zoned_host_device?

To answer this question, we need to understand how their behavior
differs.

We can ignore the legacy protocol prefix / string filename part.

All that's left seems to be "if the host device is zoned, then using the
zoned_host_device driver gets you the zoned features, whereas using the
host_device driver doesn't".  What am I missing?

>> Notably common is .bdrv_file_open =3D hdev_open.  What happens when you
>> try to create a zoned_host_device where the @filename argument is not in
>> fact a zoned device?
>
> If the device is a regular block device, QEMU will still open the
> device. For instance, I use a loopback device to test zone_report in
> qemu-io. It returns ENOTTY which indicates Inappropriate ioctl for the
> device. Meanwhile, if using a regular block device when emulation a
> zoned device on a guest os, the best case is that the guest can boot
> but has no emulated block device. In some cases, QEMU just terminates
> because the block device has not met the alignment requirements.

I'm not sure I understand all of this.  I'm also not sure I have to :)

>> Do we really need a separate, but almost identical BlockDriver?  Could
>> the existing one provide zoned functionality exactly when the underlying
>> host device does?
>
> I did use the existing one host device to add zoned commands at first.
> But then, we decided to change that and use a separate BlockDriver.
> Though the existing one can provide zoned functionality, a new
> BlockDriver makes it clear when mixing block drivers, adding more
> configurations/constraints, etc. For example, zoned devices must
> enforce direct I/O instead of using page cache to ensure the order of
> writes. It would be good to print a message for users when using
> zoned_host_device without setting direct I/O.
>
> However, it's still a simple version I was thinking about and can be
> improved/changed afterward. Using host_device only is possible I think
> but needs more carefully thinking.

I'm not opposed to making this a separate driver.  But the case for it
should be made in the commit message.  Discussing it in review is a fine
way to get to a better commit message, of course.

> Maybe Damien and Stefan can talk more about this?
>
>>
>> Forgive me if these are ignorant questions, or have been discussed
>> before.
>
> Always a pleasure.

Thanks!

[...]


