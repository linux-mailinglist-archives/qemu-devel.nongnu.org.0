Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E37844E485
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:25:04 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTjz-000860-Af
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlTif-00076A-OJ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlTic-0000xV-TD
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636712617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6lLABcUwgrKVybN765DcyUBtfzW/UaWC2IK9E11l8s=;
 b=GL/SvEuLLgi8YfAUqj0drcugIyzi7fQLinTguEsNLdlrjS+ky5uFKfJq/erR475tSRQSNp
 YAt8S87JBDR7kgvxu9E+lS0QXP/hG/eXupnLfluI0duHakoH9L2M+3LZqUwryshe3AE224
 Fi2ptzn6QV8b0qp3hcj1EmUq9dTvWq4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-Tn4qJg1EMNOQrbeouGnGnQ-1; Fri, 12 Nov 2021 05:23:34 -0500
X-MC-Unique: Tn4qJg1EMNOQrbeouGnGnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so1472273wrp.8
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X6lLABcUwgrKVybN765DcyUBtfzW/UaWC2IK9E11l8s=;
 b=vxPbyhbTz7Eu8apijcb52Ek5qZoDUbmrGZ2Ht3em8qyWjhcyj5IFYSCCIc5TkZNFIo
 ogo8cvk72fGMmQLwRPdUYM29q/DZpNjN0hi02jTjr4fx+20zWKIsJ/PZRiemC7LvbKiH
 EsfuHTHAyGopqrUC+uJbp4yQkdY6GguE4leLUWTpxqB3lRmoTiPtH/5i5BQR+TkP/8MQ
 jxK5cKSJzWenjcxxBiIfPjqgLcYDlw8qPqMoJd8v0TOJhKGCV6R7YZZVG7u1MMkCUu+j
 Xn6125+RdfPHNQ7IRGC47/2DTjiIMjWV3DPHxKGGhuj7z2+fAIoRjilhaCtBz4RPLL00
 bVGw==
X-Gm-Message-State: AOAM533FzPkPqSxme/xyoahKa5Jt7Nvkr4psHNlAc0ov8KzEw8yb36cU
 YHLxroUhspnKuYCLmmPYF8XtppiU2XbfhgNlYHQV312ulrONZabM/vGDdELRuZCczUXuN9k3QC4
 LDxMQFo3fsL9P2nE=
X-Received: by 2002:adf:cf05:: with SMTP id o5mr17791599wrj.325.1636712613071; 
 Fri, 12 Nov 2021 02:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvM7hGt94bANDuLfcaGUi0RAvyD8iZ4Ckrd0EtycfqBAHIK8XOorDtpMrx0JOtqJ3c1lbg1Q==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr17791561wrj.325.1636712612771; 
 Fri, 12 Nov 2021 02:23:32 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c11sm7369413wmq.27.2021.11.12.02.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 02:23:32 -0800 (PST)
Message-ID: <4fad8327-ab56-970b-7aed-9565285904c2@redhat.com>
Date: Fri, 12 Nov 2021 11:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-5-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patches, split block-backend.h
> in block-backend-io.h and block-backend-global-state.h
>
> In addition, remove "block/block.h" include as it seems
> it is not necessary anymore, together with "qemu/iov.h"
>
> block-backend-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c                       |   9 +-
>   include/sysemu/block-backend-common.h       |  74 ++++++
>   include/sysemu/block-backend-global-state.h | 122 +++++++++
>   include/sysemu/block-backend-io.h           | 139 ++++++++++
>   include/sysemu/block-backend.h              | 269 +-------------------
>   5 files changed, 344 insertions(+), 269 deletions(-)
>   create mode 100644 include/sysemu/block-backend-common.h
>   create mode 100644 include/sysemu/block-backend-global-state.h
>   create mode 100644 include/sysemu/block-backend-io.h
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 39cd99df2b..0afc03fd66 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -79,6 +79,7 @@ struct BlockBackend {
>       bool allow_aio_context_change;
>       bool allow_write_beyond_eof;
>   
> +    /* Protected by BQL lock */
>       NotifierList remove_bs_notifiers, insert_bs_notifiers;
>       QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
>   
> @@ -111,12 +112,14 @@ static const AIOCBInfo block_backend_aiocb_info = {
>   static void drive_info_del(DriveInfo *dinfo);
>   static BlockBackend *bdrv_first_blk(BlockDriverState *bs);
>   
> -/* All BlockBackends */
> +/* All BlockBackends. Protected by BQL lock. */
>   static QTAILQ_HEAD(, BlockBackend) block_backends =
>       QTAILQ_HEAD_INITIALIZER(block_backends);
>   
> -/* All BlockBackends referenced by the monitor and which are iterated through by
> - * blk_next() */
> +/*
> + * All BlockBackends referenced by the monitor and which are iterated through by
> + * blk_next(). Protected by BQL lock.
> + */
>   static QTAILQ_HEAD(, BlockBackend) monitor_block_backends =
>       QTAILQ_HEAD_INITIALIZER(monitor_block_backends);
>   
> diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
> new file mode 100644
> index 0000000000..52ff6a4d26
> --- /dev/null
> +++ b/include/sysemu/block-backend-common.h
> @@ -0,0 +1,74 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_COMMON_H
> +#define BLOCK_BACKEND_COMMON_H
> +
> +#include "block/throttle-groups.h"
> +
> +/* Callbacks for block device models */
> +typedef struct BlockDevOps {
> +    /*
> +     * Runs when virtual media changed (monitor commands eject, change)
> +     * Argument load is true on load and false on eject.
> +     * Beware: doesn't run when a host device's physical media
> +     * changes.  Sure would be useful if it did.
> +     * Device models with removable media must implement this callback.
> +     */
> +    void (*change_media_cb)(void *opaque, bool load, Error **errp);
> +    /*
> +     * Runs when an eject request is issued from the monitor, the tray
> +     * is closed, and the medium is locked.
> +     * Device models that do not implement is_medium_locked will not need
> +     * this callback.  Device models that can lock the medium or tray might
> +     * want to implement the callback and unlock the tray when "force" is
> +     * true, even if they do not support eject requests.
> +     */
> +    void (*eject_request_cb)(void *opaque, bool force);
> +    /*
> +     * Is the virtual tray open?
> +     * Device models implement this only when the device has a tray.
> +     */
> +    bool (*is_tray_open)(void *opaque);
> +    /*
> +     * Is the virtual medium locked into the device?
> +     * Device models implement this only when device has such a lock.
> +     */
> +    bool (*is_medium_locked)(void *opaque);
> +    /*
> +     * Runs when the size changed (e.g. monitor command block_resize)
> +     */
> +    void (*resize_cb)(void *opaque);
> +    /*
> +     * Runs when the backend receives a drain request.
> +     */
> +    void (*drained_begin)(void *opaque);
> +    /*
> +     * Runs when the backend's last drain request ends.
> +     */
> +    void (*drained_end)(void *opaque);
> +    /*
> +     * Is the device still busy?
> +     */
> +    bool (*drained_poll)(void *opaque);
> +} BlockDevOps;
> +
> +/*
> + * This struct is embedded in (the private) BlockBackend struct and contains
> + * fields that must be public. This is in particular for QLIST_ENTRY() and
> + * friends so that BlockBackends can be kept in lists outside block-backend.c
> + */
> +typedef struct BlockBackendPublic {
> +    ThrottleGroupMember throttle_group_member;
> +} BlockBackendPublic;
> +
> +#endif /* BLOCK_BACKEND_COMMON_H */
> diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
> new file mode 100644
> index 0000000000..4001b1c02a
> --- /dev/null
> +++ b/include/sysemu/block-backend-global-state.h
> @@ -0,0 +1,122 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_GS_H
> +#define BLOCK_BACKEND_GS_H
> +
> +#include "block-backend-common.h"
> +
> +/*
> + * Global state (GS) API. These functions run under the BQL lock.
> + *
> + * See include/block/block-global-state.h for more information about
> + * the GS API.
> + */
> +
> +BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm);
> +BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
> +                              uint64_t shared_perm, Error **errp);
> +BlockBackend *blk_new_open(const char *filename, const char *reference,
> +                           QDict *options, int flags, Error **errp);
> +int blk_get_refcnt(BlockBackend *blk);
> +void blk_ref(BlockBackend *blk);
> +void blk_unref(BlockBackend *blk);
> +void blk_remove_all_bs(void);
> +const char *blk_name(const BlockBackend *blk);

This is called by send_qmp_error_event(), which in turn is called by 
blk_error_action().  Are those strictly main loop functions?

> +BlockBackend *blk_by_name(const char *name);
> +BlockBackend *blk_next(BlockBackend *blk);
> +BlockBackend *blk_all_next(BlockBackend *blk);
> +bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp);
> +void monitor_remove_blk(BlockBackend *blk);
> +
> +BlockBackendPublic *blk_get_public(BlockBackend *blk);
> +BlockBackend *blk_by_public(BlockBackendPublic *public);
> +
> +void blk_remove_bs(BlockBackend *blk);
> +int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
> +bool bdrv_has_blk(BlockDriverState *bs);
> +bool bdrv_is_root_node(BlockDriverState *bs);
> +int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
> +                 Error **errp);
> +void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm);

These functions are called from fuse_do_truncate(), which I believe runs 
in the context of the export’s BlockBackend.  I’m not saying that’s 
necessarily correct, but as of the next patch, this happens:

$ touch /tmp/fuse-export
$ storage-daemon/qemu-storage-daemon \
   --object iothread,id=iothr0 \
   --blockdev file,node-name=node0,filename=/tmp/fuse-export \
   --export 
fuse,id=exp0,node-name=node0,mountpoint=/tmp/fuse-export,iothread=iothr0,writable=true 
\
   &
[1] 27395
$ truncate /tmp/fuse-export -s 1M
qemu-storage-daemon: ../block/block-backend.c:935: blk_get_perm: 
Assertion `qemu_in_main_thread()' failed.
truncate: failed to truncate '/tmp/fuse-export' at 1048576 bytes: 
Software caused connection abort
truncate: failed to close '/tmp/fuse-export': Transport endpoint is not 
connected
[1]  + 27395 IOT instruction (core dumped) 
storage-daemon/qemu-storage-daemon --object iothread,id=iothr0 --blockdev

> +
> +void blk_iostatus_enable(BlockBackend *blk);
> +bool blk_iostatus_is_enabled(const BlockBackend *blk);
> +BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk);
> +void blk_iostatus_disable(BlockBackend *blk);
> +void blk_iostatus_reset(BlockBackend *blk);
> +void blk_iostatus_set_err(BlockBackend *blk, int error);
> +int blk_attach_dev(BlockBackend *blk, DeviceState *dev);
> +void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
> +DeviceState *blk_get_attached_dev(BlockBackend *blk);
> +char *blk_get_attached_dev_id(BlockBackend *blk);
> +BlockBackend *blk_by_dev(void *dev);
> +BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
> +void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
> +
> +int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
> +int64_t blk_nb_sectors(BlockBackend *blk);

I’d have considered this an I/O function, and blk_getlength() is 
classified as such.  Why not this?

> +int blk_commit_all(void);
> +void blk_drain(BlockBackend *blk);

I’m again wondering a bit why this is a GS function, when 
bdrv_drained_begin() is an I/O function.  However, less than in the case 
of bdrv_drain(), given that there is no blk_drained_begin() that’s 
classified as I/O.

> +void blk_drain_all(void);
> +void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
> +                      BlockdevOnError on_write_error);
> +bool blk_supports_write_perm(BlockBackend *blk);
> +bool blk_is_sg(BlockBackend *blk);
> +bool blk_enable_write_cache(BlockBackend *blk);
> +void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
> +void blk_lock_medium(BlockBackend *blk, bool locked);
> +void blk_eject(BlockBackend *blk, bool eject_flag);
> +int blk_get_flags(BlockBackend *blk);
> +void blk_set_guest_block_size(BlockBackend *blk, int align);
> +bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp);
> +void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason);
> +void blk_op_block_all(BlockBackend *blk, Error *reason);
> +void blk_op_unblock_all(BlockBackend *blk, Error *reason);
> +int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
> +                        Error **errp);
> +void blk_add_aio_context_notifier(BlockBackend *blk,
> +        void (*attached_aio_context)(AioContext *new_context, void *opaque),
> +        void (*detach_aio_context)(void *opaque), void *opaque);
> +void blk_remove_aio_context_notifier(BlockBackend *blk,
> +                                     void (*attached_aio_context)(AioContext *,
> +                                                                  void *),
> +                                     void (*detach_aio_context)(void *),
> +                                     void *opaque);
> +void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify);
> +void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify);
> +BlockBackendRootState *blk_get_root_state(BlockBackend *blk);
> +void blk_update_root_state(BlockBackend *blk);
> +bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk);
> +int blk_get_open_flags_from_root_state(BlockBackend *blk);
> +
> +int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
> +                     int64_t pos, int size);
> +int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
> +int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz);
> +int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo);
> +BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
> +                                  BlockCompletionFunc *cb,
> +                                  void *opaque, int ret);

This sounds more like an I/O function to me.

> +
> +void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg);
> +void blk_io_limits_disable(BlockBackend *blk);
> +void blk_io_limits_enable(BlockBackend *blk, const char *group);
> +void blk_io_limits_update_group(BlockBackend *blk, const char *group);
> +void blk_set_force_allow_inactivate(BlockBackend *blk);
> +
> +void blk_register_buf(BlockBackend *blk, void *host, size_t size);
> +void blk_unregister_buf(BlockBackend *blk, void *host);
> +
> +const BdrvChild *blk_root(BlockBackend *blk);
> +
> +#endif /* BLOCK_BACKEND_GS_H */
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> new file mode 100644
> index 0000000000..ab0463cb69
> --- /dev/null
> +++ b/include/sysemu/block-backend-io.h
> @@ -0,0 +1,139 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_IO_H
> +#define BLOCK_BACKEND_IO_H
> +
> +#include "block-backend-common.h"
> +
> +/*
> + * I/O API functions. These functions are thread-safe.
> + *
> + * See include/block/block-io.h for more information about
> + * the I/O API.
> + */
> +
> +BlockDriverState *blk_bs(BlockBackend *blk);
> +
> +int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);

This sounds like a GS function to me.

> +
> +void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow);
> +void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow);
> +void blk_set_disable_request_queuing(BlockBackend *blk, bool disable);
> +
> +int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
> +int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
> +               BdrvRequestFlags flags);
> +int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
> +                               int64_t bytes, QEMUIOVector *qiov,
> +                               BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
> +                                     int64_t bytes,
> +                                     QEMUIOVector *qiov, size_t qiov_offset,
> +                                     BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
> +                                int64_t bytes, QEMUIOVector *qiov,
> +                                BdrvRequestFlags flags);
> +
> +static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
> +                                            int64_t bytes, void *buf,
> +                                            BdrvRequestFlags flags)
> +{
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> +
> +    assert(bytes <= SIZE_MAX);
> +
> +    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
> +}
> +
> +static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
> +                                             int64_t bytes, void *buf,
> +                                             BdrvRequestFlags flags)
> +{
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> +
> +    assert(bytes <= SIZE_MAX);
> +
> +    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
> +}
> +
> +BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                                  int64_t bytes, BdrvRequestFlags flags,
> +                                  BlockCompletionFunc *cb, void *opaque);
> +
> +BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
> +                           QEMUIOVector *qiov, BdrvRequestFlags flags,
> +                           BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
> +                            QEMUIOVector *qiov, BdrvRequestFlags flags,
> +                            BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_flush(BlockBackend *blk,
> +                          BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                             BlockCompletionFunc *cb, void *opaque);
> +void blk_aio_cancel(BlockAIOCB *acb);
> +void blk_aio_cancel_async(BlockAIOCB *acb);
> +int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
> +BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
> +                          BlockCompletionFunc *cb, void *opaque);
> +int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> +                                 int64_t bytes);
> +int coroutine_fn blk_co_flush(BlockBackend *blk);
> +int blk_flush(BlockBackend *blk);
> +void blk_inc_in_flight(BlockBackend *blk);
> +void blk_dec_in_flight(BlockBackend *blk);
> +bool blk_is_inserted(BlockBackend *blk);
> +bool blk_is_available(BlockBackend *blk);
> +int64_t blk_getlength(BlockBackend *blk);
> +void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
> +void *blk_try_blockalign(BlockBackend *blk, size_t size);
> +void *blk_blockalign(BlockBackend *blk, size_t size);
> +bool blk_is_writable(BlockBackend *blk);
> +BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read);
> +BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
> +                                      int error);
> +void blk_error_action(BlockBackend *blk, BlockErrorAction action,
> +                      bool is_read, int error);
> +int blk_get_max_iov(BlockBackend *blk);
> +int blk_get_max_hw_iov(BlockBackend *blk);
> +
> +void blk_invalidate_cache(BlockBackend *blk, Error **errp);
> +
> +void blk_io_plug(BlockBackend *blk);
> +void blk_io_unplug(BlockBackend *blk);
> +AioContext *blk_get_aio_context(BlockBackend *blk);
> +BlockAcctStats *blk_get_stats(BlockBackend *blk);
> +void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
> +                  BlockCompletionFunc *cb, void *opaque);
> +int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
> +                          int64_t bytes);
> +int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> +int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                      int64_t bytes, BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                                      int64_t bytes, BdrvRequestFlags flags);
> +int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
> +                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
> +
> +uint32_t blk_get_request_alignment(BlockBackend *blk);
> +uint32_t blk_get_max_transfer(BlockBackend *blk);
> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
> +
> +int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
> +                                   BlockBackend *blk_out, int64_t off_out,
> +                                   int64_t bytes, BdrvRequestFlags read_flags,
> +                                   BdrvRequestFlags write_flags);
> +
> +
> +int blk_make_empty(BlockBackend *blk, Error **errp);

bdrv_make_empty() (called by this function) is classified as a GS 
Function, and asserts that it’s running in the main thread.  I can also 
see that the next patch adds the same assertion to blk_make_empty(), so 
I believe this should be a GS function, too.

Hanna


