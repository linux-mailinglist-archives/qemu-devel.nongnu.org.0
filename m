Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A724C2B91
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:21:11 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nND7O-00055V-Hr
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCuX-0006dn-CJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCuU-0001nT-E8
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645704469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoR1fHwFpRou2RnMaE6kN04keiVR0Xc221G2NtZY/dw=;
 b=RDkeiMKVON/9AqLBgICtHmOIXKzqhp/JZhXXyy9T+NaKlxVKcnMgPFNEYNKE9esVayn+EO
 Zpp58L+L/aJ+Sa+SgqB+iZ3DdRYzoif0sSQ7U7EI6jvW+hZDojpAGWQwV0Mgjs1VBiF9pC
 YddXSRFymPiJOJP7F2ISOAfC0dx8Ixk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-fP28F5dvNkGGJtARUHbq1Q-1; Thu, 24 Feb 2022 07:07:48 -0500
X-MC-Unique: fP28F5dvNkGGJtARUHbq1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 j9-20020a056402238900b004128085d906so625085eda.19
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FoR1fHwFpRou2RnMaE6kN04keiVR0Xc221G2NtZY/dw=;
 b=jYHfY7z4JLpFCRfK1ptWqe6mETAabIIZbt1R42M4I365aCeUlxFMyM98KCtoDjK2Ii
 8V+VTLXYzJOTGXPGwL0cPvlb1hgHhU7IIy5xK0PVV87lwhqLHVK98q06BiCDjbyqDKxT
 3v4yuFGHK3NNZ0jE+9WTP1PqI1MwUgrVWp8hCXVXDut2oAOEwKPHIK+hvqoYLXkHQGwD
 4ick2ANbI+v3wvbuiOhfQaKx9MCreGxWIUTB94PNCsAjBE4ulszu91A7qHr5uDIIT71V
 dikzBvqXYTBjUHObGA3Iv51XUjUlMtLz/ChIcgmE+SpBmx9wPiM+wQGI2ruq1C4IYDKm
 fK1w==
X-Gm-Message-State: AOAM533nZ48zgc6iPqDdEeGEOclIZfP+gFL2XWfAP391DWZPFv4Qa23j
 PgkTpt3ho90CsLZOB600xtD9ZRNjcgTn9kgL6WgJt47PCvkcTHI10ZBnr12CfCM6j+446Yjjog/
 R54MPoccQFqrQ3VA=
X-Received: by 2002:a50:baaa:0:b0:410:a098:2a7f with SMTP id
 x39-20020a50baaa000000b00410a0982a7fmr2001138ede.53.1645704466899; 
 Thu, 24 Feb 2022 04:07:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzp/GXIKvnn+/5K40fRhRgzxU1M7HOKfSpd2kVh0YGcbdEHm+Mi6GvfD0fpo4xREFnVI9r6w==
X-Received: by 2002:a50:baaa:0:b0:410:a098:2a7f with SMTP id
 x39-20020a50baaa000000b00410a0982a7fmr2001084ede.53.1645704466360; 
 Thu, 24 Feb 2022 04:07:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id x7sm1240064edr.12.2022.02.24.04.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:07:46 -0800 (PST)
Message-ID: <681b2420-e4c3-5849-3d08-c85711243fa1@redhat.com>
Date: Thu, 24 Feb 2022 13:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/18] block/copy-before-write: add bitmap open
 parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-5-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-5-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> This brings "incremental" mode to copy-before-write filter: user can
> specify bitmap so that filter will copy only "dirty" areas.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json      | 10 +++++++-
>   block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9a5a3641d0..3bab597506 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4171,11 +4171,19 @@
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

Sorry, missed this last time: There should be a “since: 7.0” here.

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
> index 799223e3fb..91a2288b66 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -34,6 +34,8 @@
>   
>   #include "block/copy-before-write.h"
>   
> +#include "qapi/qapi-visit-block-core.h"
> +
>   typedef struct BDRVCopyBeforeWriteState {
>       BlockCopyState *bcs;
>       BdrvChild *target;
> @@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>       }
>   }
>   
> +static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
> +                                    Error **errp)
> +{
> +    QDict *bitmap_qdict = NULL;
> +    BlockDirtyBitmap *bmp_param = NULL;
> +    Visitor *v = NULL;
> +    bool ret = false;
> +
> +    *bitmap = NULL;
> +
> +    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
> +    if (!qdict_size(bitmap_qdict)) {
> +        ret = true;
> +        goto out;
> +    }
> +
> +    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
> +    if (!v) {
> +        goto out;
> +    }
> +
> +    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
> +    if (!bmp_param) {
> +        goto out;
> +    }
> +
> +    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
> +                                        errp);
> +    if (!*bitmap) {
> +        goto out;
> +    }
> +
> +    ret = true;
> +
> +out:
> +    qapi_free_BlockDirtyBitmap(bmp_param);
> +    visit_free(v);
> +    qobject_unref(bitmap_qdict);
> +
> +    return ret;
> +}
> +
>   static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>                       Error **errp)
>   {
>       BDRVCopyBeforeWriteState *s = bs->opaque;
> +    BdrvDirtyBitmap *bitmap = NULL;
>   
>       bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> @@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>           return -EINVAL;
>       }
>   
> +    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
> +        return -EINVAL;

Hm...  Just to get a second opinion on this: We don’t need to close 
s->target here, because the failure paths of bdrv_open_inherit() and 
bdrv_new_open_driver_opts() both call bdrv_unref(), which will call 
bdrv_close(), which will close all children including s->target, right?

> +    }
> +
>       bs->total_sectors = bs->file->bs->total_sectors;
>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
>               (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
> @@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>                bs->file->bs->supported_zero_flags);
>   
> -    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
> +    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
>       if (!s->bcs) {
>           error_prepend(errp, "Cannot create block-copy-state: ");
>           return -EINVAL;


