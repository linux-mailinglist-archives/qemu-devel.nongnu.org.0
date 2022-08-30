Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BF5A62A5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:00:42 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSzv5-000382-5x
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSzsL-0001CC-Gt
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSzsG-0004FN-Uh
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661860663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flWmgS2LqZd4cfAUV9Y3cTiwn1B3qpEeshhUkGwD2Pc=;
 b=FLMmCrzg6fDwvsgcYm0kmQubmtlv3piDEz6eWnIxV6P/V6LriiqcRgOTOsTD9i0q3Zi175
 JIHXxpdI6y1FUDnOqdnHu7gSqk9ZssaYdqmHIw0n4HKWBIKap1XbsGPZhmvE2HdFvmtjGs
 Nimyg0WVY17iOttb1ks8vWBMo4vojjs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-IKMPG7X5PHiN7NV0sIh7Aw-1; Tue, 30 Aug 2022 07:57:38 -0400
X-MC-Unique: IKMPG7X5PHiN7NV0sIh7Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B7E38149AA;
 Tue, 30 Aug 2022 11:57:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49622026D4C;
 Tue, 30 Aug 2022 11:57:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D58B21E6900; Tue, 30 Aug 2022 13:57:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,
 damien.lemoal@opensource.wdc.com,  Dmitry.Fomichev@wdc.com,
 hare@suse.de,  qemu-block@nongnu.org,  hreitz@redhat.com,
 eblake@redhat.com,  fam@euphon.net,  kwolf@redhat.com
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
References: <20220826161704.8076-1-faithilikerun@gmail.com>
Date: Tue, 30 Aug 2022 13:57:36 +0200
In-Reply-To: <20220826161704.8076-1-faithilikerun@gmail.com> (Sam Li's message
 of "Sat, 27 Aug 2022 00:17:04 +0800")
Message-ID: <87h71ugczz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Sam Li <faithilikerun@gmail.com> writes:

> By adding zone management operations in BlockDriver, storage controller
> emulation can use the new block layer APIs including Report Zone and
> four zone management operations (open, close, finish, reset).
>
> Add zoned storage commands of the device: zone_report(zrp), zone_open(zo),
> zone_close(zc), zone_reset(zrs), zone_finish(zf).
>
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
> -c "zrp offset nr_zones"
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>

[...]

> diff --git a/block/file-posix.c b/block/file-posix.c
> index 0a8b4b426e..e3efba6db7 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c

[...]

> @@ -3752,6 +4025,54 @@ static BlockDriver bdrv_host_device = {
>  #endif
>  };
>  
> +#if defined(CONFIG_BLKZONED)
> +static BlockDriver bdrv_zoned_host_device = {
> +        .format_name = "zoned_host_device",

Indentation should be 4, not 8.

> +        .protocol_name = "zoned_host_device",
> +        .instance_size = sizeof(BDRVRawState),
> +        .bdrv_needs_filename = true,
> +        .bdrv_probe_device  = hdev_probe_device,
> +        .bdrv_file_open     = hdev_open,
> +        .bdrv_close         = raw_close,
> +        .bdrv_reopen_prepare = raw_reopen_prepare,
> +        .bdrv_reopen_commit  = raw_reopen_commit,
> +        .bdrv_reopen_abort   = raw_reopen_abort,
> +        .bdrv_co_create_opts = bdrv_co_create_opts_simple,
> +        .create_opts         = &bdrv_create_opts_simple,
> +        .mutable_opts        = mutable_opts,
> +        .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
> +        .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
> +
> +        .bdrv_co_preadv         = raw_co_preadv,
> +        .bdrv_co_pwritev        = raw_co_pwritev,
> +        .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> +        .bdrv_co_pdiscard       = hdev_co_pdiscard,
> +        .bdrv_co_copy_range_from = raw_co_copy_range_from,
> +        .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> +        .bdrv_refresh_limits = raw_refresh_limits,
> +        .bdrv_io_plug = raw_aio_plug,
> +        .bdrv_io_unplug = raw_aio_unplug,
> +        .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> +
> +        .bdrv_co_truncate       = raw_co_truncate,
> +        .bdrv_getlength = raw_getlength,
> +        .bdrv_get_info = raw_get_info,
> +        .bdrv_get_allocated_file_size
> +                            = raw_get_allocated_file_size,
> +        .bdrv_get_specific_stats = hdev_get_specific_stats,
> +        .bdrv_check_perm = raw_check_perm,
> +        .bdrv_set_perm   = raw_set_perm,
> +        .bdrv_abort_perm_update = raw_abort_perm_update,
> +        .bdrv_probe_blocksizes = hdev_probe_blocksizes,
> +        .bdrv_probe_geometry = hdev_probe_geometry,
> +        .bdrv_co_ioctl = hdev_co_ioctl,
> +
> +        /* zone management operations */
> +        .bdrv_co_zone_report = raw_co_zone_report,
> +        .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +};

Differences to bdrv_host_device:

* .bdrv_parse_filename is not set

* .bdrv_co_ioctl is not set

* .bdrv_co_zone_report and .bdrv_co_zone_mgmt are set

Notably common is .bdrv_file_open = hdev_open.  What happens when you
try to create a zoned_host_device where the @filename argument is not in
fact a zoned device?

Do we really need a separate, but almost identical BlockDriver?  Could
the existing one provide zoned functionality exactly when the underlying
host device does?

Forgive me if these are ignorant questions, or have been discussed
before.

> +#endif
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -4012,6 +4333,9 @@ static void bdrv_file_init(void)
>      bdrv_register(&bdrv_file);
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
> +#if defined(CONFIG_BLKZONED)
> +    bdrv_register(&bdrv_zoned_host_device);
> +#endif
>  #ifdef __linux__
>      bdrv_register(&bdrv_host_cdrom);
>  #endif

[...]

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2173e7734a..c6bbb7a037 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2942,6 +2942,7 @@
>  # @compress: Since 5.0
>  # @copy-before-write: Since 6.2
>  # @snapshot-access: Since 7.0
> +# @zoned_host_device: Since 7.2
>  #
>  # Since: 2.9
>  ##
> @@ -2955,7 +2956,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }

QAPI naming conventions ask for 'zoned-host-device'.  We may choose to
ignore them to stay closer to existing 'host_device'.

>  
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4331,9 @@
>        'vhdx':       'BlockdevOptionsGenericFormat',
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
> -      'vvfat':      'BlockdevOptionsVVFAT'
> +      'vvfat':      'BlockdevOptionsVVFAT',
> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> +                             'if': 'CONFIG_BLKZONED' }
>    } }
>  
>  ##

[...]


