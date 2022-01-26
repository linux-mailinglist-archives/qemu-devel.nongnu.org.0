Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE949C98A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:23:01 +0100 (CET)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChKG-0002ZK-Cl
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChHp-0001Dg-9T
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChHn-0002V7-Lr
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643199627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+WzgrhsxE5o/izE/Mp0cFK0pAwesDksyUPL4LV7hBE=;
 b=PMGHuMEuZH4REojiRCWfgn5R5DWA7Dmowbqn3k++Dxhsg5q0Z1KoWjn/tzCABeUSZQqZcQ
 VmBb7Ncu+2TmGefXx6pUMTfIPEmntSWXorvDnHhRsYEtEcNo4rchyJU9z/6bicnYAwV6ic
 aZrlU6crOUp01ADaIMeW0Ptn0XyybCA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-tEUoWJX4O3aT_84GOASTEQ-1; Wed, 26 Jan 2022 07:20:20 -0500
X-MC-Unique: tEUoWJX4O3aT_84GOASTEQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b3-20020a5d4b83000000b001d676462248so4252174wrt.17
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8+WzgrhsxE5o/izE/Mp0cFK0pAwesDksyUPL4LV7hBE=;
 b=hknXXnIwDfse0SxzQoz0J2hBTdeH8kttm+rEvd5C0wGeffjYn6hByq0Hb1QM9CHcCu
 tc4dPYoxg+tACX7il8+XYuiQWOB9AVUPngwHSCNtaJ8iZUiDXVuO0CMSQ7IEz1BV+Yki
 pJ3bkUjHp3bSIRDUrTZaFDD0laEt/4hCV5a5AQQg7uykuCoxkXz5sGe3Xgmi4OzsJAxG
 LA0bO4yu6PBB0GxoXHEluNXYbtgGfglpHpsA2njvLgI/NRYTW4aKTY8Xf4+nwUVxWVSS
 SWsKyvsKXIVkeGmqXrVrpzoWkCTLEfhAvaxg3N68b/TqMs0dz2oNs9vBtqUt9/EzjF3W
 tFAA==
X-Gm-Message-State: AOAM532iFoZ5//4IZVD7dJk7t+lCcPGFH3W+BQFgK7zGJSll3gcFeVOe
 3Kh3r+tQr3K48kXVrCEV5lUx2LxKG3BUwJ6X4dLdTd4TkGmJ644GfxZ0OOEPYYYVh6RTAUs6emG
 JImxez86OQTYOrMs=
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr22636948wri.530.1643199619666; 
 Wed, 26 Jan 2022 04:20:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypRtOdskM7/JJqCHJ6fMs1jyiFgFqPkKgLa8oaopllKr5YPQhMDvCf9hXBttaa9vWM9ljZXw==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr22636905wri.530.1643199619350; 
 Wed, 26 Jan 2022 04:20:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 21sm3175433wmk.45.2022.01.26.04.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:20:19 -0800 (PST)
Message-ID: <1ac3d736-e03a-74d9-d4c2-3baf193cd4e6@redhat.com>
Date: Wed, 26 Jan 2022 13:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 21/33] block: move BQL logic of
 bdrv_co_invalidate_cache in bdrv_activate
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-22-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-22-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Split bdrv_co_invalidate cache in two: the GS code that takes
> care of permissions and running GS callbacks, and leave only the
> I/O code (->bdrv_co_invalidate_cache) running in the I/O coroutine.
>
> The only side effect is that bdrv_co_invalidate_cache is not
> recursive anymore, and so is every direct call to
> bdrv_invalidate_cache().
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 36 +++++++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/block.c b/block.c
> index 7ab5031027..bad834c86e 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -6579,7 +6576,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>        * Note that the required permissions of inactive images are always a
>        * subset of the permissions required after activating the image. This
>        * allows us to just get the permissions upfront without restricting
> -     * drv->bdrv_invalidate_cache().
> +     * drv->bdrv_co_invalidate_cache().

Perhaps just `bdrv_invalidate_cache()`, without the `drv->`?

>        *
>        * It also means that in error cases, we don't have to try and revert to
>        * the old permissions (which is an operation that could fail, too). We can
> @@ -6594,14 +6591,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>               return ret;
>           }
>   
> -        if (bs->drv->bdrv_co_invalidate_cache) {
> -            bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
> -            if (local_err) {
> -                bs->open_flags |= BDRV_O_INACTIVE;
> -                error_propagate(errp, local_err);
> -                return -EINVAL;
> -            }
> -        }
> +        bdrv_invalidate_cache(bs, errp);

We should check the returned value here, and return on error.

Other than that, looks good and makes sense.

Hanna

>           FOR_EACH_DIRTY_BITMAP(bs, bm) {
>               bdrv_dirty_bitmap_skip_store(bm, false);


