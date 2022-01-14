Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D948EF5C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 18:49:17 +0100 (CET)
Received: from localhost ([::1]:52956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8QhP-0004Mh-Vw
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 12:49:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8QgA-0003N5-Of
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 12:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Qg7-0005EU-T2
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 12:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642182470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c05nlHt4IYf1KJs2O5FHonvIDCSfCDr/J+ef7Y5AkII=;
 b=FsdbA+s0qMw/ZLnklMHQSvecwfGsSTYjgRBdBGC1qHz3qSK2JLONBQuXg3RZWQ+dck0eGb
 je5lfSB32AKI3UOVJoNYl1EXCNna6RzZLH3G5QQEl8LbGWlexG12wWNm+MdOLl1u38d2fx
 GVpADGjUM4uVezkhVRoQ0Ylxyg85rBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-2h0t5bZ1Mr2_dq3vwtEVWg-1; Fri, 14 Jan 2022 12:47:47 -0500
X-MC-Unique: 2h0t5bZ1Mr2_dq3vwtEVWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k36-20020a05600c1ca400b0034aeea679a5so1459066wms.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 09:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c05nlHt4IYf1KJs2O5FHonvIDCSfCDr/J+ef7Y5AkII=;
 b=Z48ipFBm+fdbFfdim/Cw6WTK9qcIqevcGlFtFpWk9596S7L21yKvTWh9yzEDcd2LI/
 6LXX33ZAxt3Y7KpmSNxjc9yKcSZ54Wm7w8rDf41oSf5W97cKucugHYQ8tObDLc1PQOkY
 Yb0PnpHJid/Fhfh8bmjfPDCHQa3hUf2X/QOwv0aDlVTUzkK77VkIZzTPP7V09w9MPBr4
 ZtgX5wydMaYFFvYdzS/wOixX7m0bJPA5sRBLy2EixCrwy1zYmXKVoEEn2bcf34poYQBI
 8Gbj8im+L1KsIg2JzESwsfMSfoKrhzmUM5g7oGkybICDwYbo0Adp2yHhOmTfv5NDDpvl
 LPLg==
X-Gm-Message-State: AOAM531qhEnLzAVTi8ivDgiZJMX6fA/YuppF4//VCRSIwOJehswlq5SA
 9FjCVTRhlT7kDlpi8SJmo6eWt07ne5wsaagFUs44LNmm0WJbX/8na6K+D0G0aXP5Six7EFm5D+h
 P9Q2QLriJ+pfPx6c=
X-Received: by 2002:adf:ce07:: with SMTP id p7mr9391244wrn.329.1642182465872; 
 Fri, 14 Jan 2022 09:47:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybc0BeuxZd7s8OscYsv+ISjg4PGxztpmt6oH7vjhq3lq2Vjp3GBYgZJd784KOOKqyrBk12vg==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr9391226wrn.329.1642182465658; 
 Fri, 14 Jan 2022 09:47:45 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b5sm5744043wrr.19.2022.01.14.09.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 09:47:45 -0800 (PST)
Message-ID: <947302c8-66dd-6b71-922d-c791cc87875f@redhat.com>
Date: Fri, 14 Jan 2022 18:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 04/19] block/copy-before-write: add bitmap open
 parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-5-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-5-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> This brings "incremental" mode to copy-before-write filter: user can
> specify bitmap so that filter will copy only "dirty" areas.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json      | 10 +++++++++-
>   block/copy-before-write.c | 30 +++++++++++++++++++++++++++++-
>   2 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 1d3dd9cb48..6904daeacf 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4167,11 +4167,19 @@
>   #
>   # @target: The target for copy-before-write operations.
>   #
> +# @bitmap: If specified, copy-before-write filter will do
> +#          copy-before-write operations only for dirty regions of the
> +#          bitmap. Bitmap size must be equal to length of file and
> +#          target child of the filter. Note also, that bitmap is used
> +#          only to initialize internal bitmap of the process, so further
> +#          modifications (or removing) of specified bitmap doesn't
> +#          influence the filter.
> +#
>   # Since: 6.2
>   ##
>   { 'struct': 'BlockdevOptionsCbw',
>     'base': 'BlockdevOptionsGenericFormat',
> -  'data': { 'target': 'BlockdevRef' } }
> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>   
>   ##
>   # @BlockdevOptions:
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 799223e3fb..4cd90d22df 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -149,6 +149,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>                       Error **errp)
>   {
>       BDRVCopyBeforeWriteState *s = bs->opaque;
> +    BdrvDirtyBitmap *bitmap = NULL;
>   
>       bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> @@ -163,6 +164,33 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>           return -EINVAL;
>       }
>   
> +    if (qdict_haskey(options, "bitmap.node") ||
> +        qdict_haskey(options, "bitmap.name"))
> +    {
> +        const char *bitmap_node, *bitmap_name;
> +
> +        if (!qdict_haskey(options, "bitmap.node")) {
> +            error_setg(errp, "bitmap.node is not specified");
> +            return -EINVAL;
> +        }
> +
> +        if (!qdict_haskey(options, "bitmap.name")) {
> +            error_setg(errp, "bitmap.name is not specified");
> +            return -EINVAL;
> +        }
> +
> +        bitmap_node = qdict_get_str(options, "bitmap.node");
> +        bitmap_name = qdict_get_str(options, "bitmap.name");
> +        qdict_del(options, "bitmap.node");
> +        qdict_del(options, "bitmap.name");

I’m not really a fan of this manual parsing, but I can see nothing 
technically wrong with it.

Still, what do you think of using an input visitor, like:

QDict *bitmap_qdict;

qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
if (qdict_size(bitmap_qdict) > 0) {
     BlockDirtyBitmap *bmp_param;
     Visitor *v = qobject_input_visitor_new_flat_confused(bitmap_qdict, 
errp);
     visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
     visit_free(v);
     qobject_unref(bitmap_qdict);

     bitmap = block_dirty_bitmap_lookup(bmp_param->node, 
bmp_param->name, ...);
     qapi_free_BlockDirtyBitmap(bmp_param);
}

(+ error handling, which is why perhaps the first block should be put 
into a separate function cbw_get_bitmap_param() to simplify error handling)

> +
> +        bitmap = block_dirty_bitmap_lookup(bitmap_node, bitmap_name, NULL,
> +                                           errp);
> +        if (!bitmap) {
> +            return -EINVAL;
> +        }
> +    }
> +
>       bs->total_sectors = bs->file->bs->total_sectors;
>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
>               (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
> @@ -170,7 +198,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>                bs->file->bs->supported_zero_flags);
>   
> -    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
> +    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
>       if (!s->bcs) {
>           error_prepend(errp, "Cannot create block-copy-state: ");
>           return -EINVAL;


