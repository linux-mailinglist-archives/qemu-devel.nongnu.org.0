Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFD4EECB4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:01:28 +0200 (CEST)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFy3-0001fs-Dz
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:01:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naFvk-0000A0-3Q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naFvg-0000h0-Mi
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648814339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMF5yIKJeg5ByLsqJthj+9WvrpKB1nUHLo7ccsf8PUk=;
 b=BQUDMrLq32h20l6DKr1IovtxZjWWzabtHIOYRFDodsr+fvhAGD6Zps5CSAfB+YqlycMDZY
 ZkmqmHywIALXlMaxEtngBrjmXU7jggvtM/0hs+wwdzJK5Jw8BWYeW96N8NL6wO5fa1tNJd
 pY1lQRI+gmPsuXTxfy6jryguJgDAhxw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-GRNfjrxUO0C2pBjSCGKKVg-1; Fri, 01 Apr 2022 07:58:58 -0400
X-MC-Unique: GRNfjrxUO0C2pBjSCGKKVg-1
Received: by mail-ej1-f69.google.com with SMTP id
 do20-20020a170906c11400b006e0de97a0e9so1420329ejc.19
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 04:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qMF5yIKJeg5ByLsqJthj+9WvrpKB1nUHLo7ccsf8PUk=;
 b=Bh1vMlapoRXk3j57jiREadwoZY2Nhyp5P9A3DoQShbGfoUVneU9qIj8pwNdVgvy1kV
 ZM4NV/FAgMAjukGKXQmkn4Fu5x9DFE+4o1HeVNbjZ+1sB+4ZQsOilpB7lTFayNtE7ZmN
 r5AzM4px24duyHoyOVpt5jMpUQt4y+dTQUBEGJfMmO2EOoM3YXZ27olen6E4bR9gK1aj
 gwmESr5Q5zi2J43Jo3iYSV5ygODxAP6yZHwoUXzUhXY9lbD9uOfzQ7oMDbKtIXH43gvL
 68GYqRQ7DJuKccGcQ5LqlcZPYYFBTUcFipBLD3jM7r4xagx6gDnBTULOlhApyZ+aI2Sp
 Bnhg==
X-Gm-Message-State: AOAM530pfYhlVHLD/6uDwdXn+ir7cRvlPVrJEl8FvFw7ElWlHO16eXIM
 fvsbTUg3vvIfspw8zb2tw04X0PCpLMu+FCiVxlCMcMRnBOaJ+mDw0zQyzqiU+7QxAt9PXrscasC
 KnCLxNL47DwAw5wU=
X-Received: by 2002:a05:6402:d0a:b0:418:ec3b:2242 with SMTP id
 eb10-20020a0564020d0a00b00418ec3b2242mr13158510edb.229.1648814337564; 
 Fri, 01 Apr 2022 04:58:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnfs1aFUCOTudI6TRRDAsBalEbbGfznV4YAstkrjx3IjGzwzLDCtcg/lu3+XzjM/oOeLilbA==
X-Received: by 2002:a05:6402:d0a:b0:418:ec3b:2242 with SMTP id
 eb10-20020a0564020d0a00b00418ec3b2242mr13158491edb.229.1648814337241; 
 Fri, 01 Apr 2022 04:58:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a50e18e000000b0041b6f23f7f6sm1140134edl.22.2022.04.01.04.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 04:58:56 -0700 (PDT)
Message-ID: <ebed5d8a-5a07-1030-596e-d9f943c2ba83@redhat.com>
Date: Fri, 1 Apr 2022 13:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/7] block/copy-before-write: add on-cbw-error open
 parameter
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-3-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-3-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> Currently, behavior on copy-before-write operation failure is simple:
> report error to the guest.
>
> Let's implement alternative behavior: break the whole copy-before-write
> process (and corresponding backup job or NBD client) but keep guest
> working. It's needed if we consider guest stability as more important.
>
> The realisation is simple: on copy-before-write failure we immediately
> continue guest write operation and set s->snapshot_ret variable which
> will lead to all further and in-flight snapshot-API requests failure.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/copy-before-write.c | 62 ++++++++++++++++++++++++++++++++++-----
>   qapi/block-core.json      | 27 ++++++++++++++++-
>   2 files changed, 81 insertions(+), 8 deletions(-)
>
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 394e73b094..0614c3d08b 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -41,6 +41,7 @@
>   typedef struct BDRVCopyBeforeWriteState {
>       BlockCopyState *bcs;
>       BdrvChild *target;
> +    OnCbwError on_cbw_error;
>   
>       /*
>        * @lock: protects access to @access_bitmap, @done_bitmap and
> @@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
>        * node. These areas must not be rewritten by guest.
>        */
>       BlockReqList frozen_read_reqs;
> +
> +    /*
> +     * @snapshot_error is normally zero. But on first copy-before-write failure
> +     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
> +     * value of this error (<0). After that all in-flight and further
> +     * snaoshot-API requests will fail with that error.

*snapshot

> +     */
> +    int snapshot_error;
>   } BDRVCopyBeforeWriteState;
>   
>   static coroutine_fn int cbw_co_preadv(
> @@ -99,11 +108,25 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
>       end = QEMU_ALIGN_UP(offset + bytes, cluster_size);

Wouldn’t it make sense to completely cease CBW if snapshot_error is 
non-zero?  (I.e. always returning 0 here, skipping block_copy().) You 
can’t read from it anyway anymore.  (Except from below the 
copy-before-write node, but users shouldn’t be doing this, because they 
can’t know which areas are valid to read and which aren’t.)

>       ret = block_copy(s->bcs, off, end - off, true);
> -    if (ret < 0) {
> +    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
>           return ret;
>       }
>   
>       WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        if (ret < 0) {
> +            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
> +            if (!s->snapshot_error) {
> +                s->snapshot_error = ret;
> +            }
> +            /*
> +             * No need to wait for s->frozen_read_reqs: they will fail anyway,
> +             * as s->snapshot_error is set.
> +             *
> +             * We return 0, as error is handled. Guest operation should be
> +             * continued.
> +             */
> +            return 0;

Hm, OK.  Naively, it looks to me like we could save us this explanation 
and simplify the code just by unconditionally waiting here (I guess we 
could skip the wait if snapshot_error was non-zero before) and not 
checking snapshot_error in cbw_snapshot_read_unlock().  I don’t think 
not waiting here meaningfully saves time.

> +        }
>           bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
>           reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
>       }
> @@ -176,6 +199,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
>   
>       QEMU_LOCK_GUARD(&s->lock);
>   
> +    if (s->snapshot_error) {
> +        g_free(req);
> +        return NULL;
> +    }
> +
>       if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
>           g_free(req);
>           return NULL;
> @@ -198,19 +226,26 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
>       return req;
>   }
>   
> -static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
> +static int cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
>   {
>       BDRVCopyBeforeWriteState *s = bs->opaque;
>   
>       if (req->offset == -1 && req->bytes == -1) {
>           g_free(req);
> -        return;
> +        /*
> +         * No real need to read snapshot_error under mutex here: we are actually
> +         * safe to ignore it and return 0, as this request was to s->target, and
> +         * can't be influenced by guest write. But if we can new read negative
> +         * s->snapshot_error let's return it, so that backup failed earlier.
> +         */
> +        return s->snapshot_error;
>       }
>   
>       QEMU_LOCK_GUARD(&s->lock);
>   
>       reqlist_remove_req(req);
>       g_free(req);
> +    return s->snapshot_error;
>   }
>   
>   static coroutine_fn int
> @@ -219,7 +254,7 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
>   {
>       BlockReq *req;
>       BdrvChild *file;
> -    int ret;
> +    int ret, ret2;
>   
>       /* TODO: upgrade to async loop using AioTask */
>       while (bytes) {
> @@ -232,10 +267,13 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
>   
>           ret = bdrv_co_preadv_part(file, offset, cur_bytes,
>                                     qiov, qiov_offset, 0);
> -        cbw_snapshot_read_unlock(bs, req);
> +        ret2 = cbw_snapshot_read_unlock(bs, req);
>           if (ret < 0) {
>               return ret;
>           }
> +        if (ret2 < 0) {
> +            return ret2;
> +        }
>   
>           bytes -= cur_bytes;
>           offset += cur_bytes;
> @@ -253,7 +291,7 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
>   {
>       BDRVCopyBeforeWriteState *s = bs->opaque;
>       BlockReq *req;
> -    int ret;
> +    int ret, ret2;
>       int64_t cur_bytes;
>       BdrvChild *child;
>   
> @@ -273,7 +311,14 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
>           assert(ret & BDRV_BLOCK_ALLOCATED);
>       }
>   
> -    cbw_snapshot_read_unlock(bs, req);
> +    ret2 = cbw_snapshot_read_unlock(bs, req);
> +
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    if (ret2 < 0) {
> +        return ret2;
> +    }
>   
>       return ret;
>   }
> @@ -366,6 +411,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
>        * object for original options.
>        */
>       qdict_extract_subqdict(options, NULL, "bitmap");
> +    qdict_del(options, "on-cbw-error");
>   
>   out:
>       visit_free(v);
> @@ -407,6 +453,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>               return -EINVAL;
>           }
>       }
> +    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
> +            ON_CBW_ERROR_BREAK_GUEST_WRITE;
>   
>       bs->total_sectors = bs->file->bs->total_sectors;
>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index e89f2dfb5b..3f08025114 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4162,6 +4162,27 @@
>     'base': 'BlockdevOptionsGenericFormat',
>     'data': { '*bottom': 'str' } }
>   
> +##
> +# @OnCbwError:
> +#
> +# An enumeration of possible behaviors for copy-before-write operation
> +# failures.
> +#
> +# @break-guest-write: report the error to the guest. This way the state
> +#                     of copy-before-write process is kept OK and

I’d be more verbose here: “This way, the guest will not be able to 
overwrite areas that cannot be backed up, so the backup remains valid.”

I like the bluntness of how these two options are named, by the way.  
That does clearly tell users what they’ll have to expect.

> +#                     copy-before-write filter continues to work normally.
> +#
> +# @break-snapshot: continue guest write. Since this, the snapshot state
> +#                  provided by copy-before-write filter becomes broken.

Maybe “Doing so will invalidate the backup snapshot”?

> +#                  So, all in-flight and all further snapshot-access
> +#                  operations (through snapshot-access block driver)
> +#                  will fail.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'OnCbwError',
> +  'data': [ 'break-guest-write', 'break-snapshot' ] }
> +
>   ##
>   # @BlockdevOptionsCbw:
>   #
> @@ -4183,11 +4204,15 @@
>   #          modifications (or removing) of specified bitmap doesn't
>   #          influence the filter. (Since 7.0)
>   #
> +# @on-cbw-error: Behavior on failure of copy-before-write operation.
> +#                Default is @break-guest-write. (Since 7.0)

*7.1

> +#
>   # Since: 6.2
>   ##
>   { 'struct': 'BlockdevOptionsCbw',
>     'base': 'BlockdevOptionsGenericFormat',
> -  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
> +            '*on-cbw-error': 'OnCbwError' } }
>   
>   ##
>   # @BlockdevOptions:


