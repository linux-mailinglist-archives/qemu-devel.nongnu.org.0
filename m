Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D243AE03
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:30:30 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHqn-0002MO-Im
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHV2-0004wJ-CQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHUx-0003X1-Cu
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635235674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcVcKbMGpeDbL1bfqr8eJBF7IqCFPZj0g6TEkfScESw=;
 b=EKF9UPu2xUhg9jquuTbm+IMtOZteKe6FsMcP27df+yYoPrGadGxiH/RzNgXN0qxz+sn1ZE
 qGK6UybWcbbD8fagX254AGMUd1kaUg1OMTu0CVQKj6YZKHqwjH8Mz8dhSNIbhAJi8e+rmJ
 8e/f0n0ZbeWPruoZnj+3Mmkalv9wipw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-AgxTGtkVNtK1EC03DkYSug-1; Tue, 26 Oct 2021 04:07:50 -0400
X-MC-Unique: AgxTGtkVNtK1EC03DkYSug-1
Received: by mail-wm1-f72.google.com with SMTP id
 y12-20020a1c7d0c000000b0032ccaad73d0so275980wmc.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OcVcKbMGpeDbL1bfqr8eJBF7IqCFPZj0g6TEkfScESw=;
 b=Si1Aicjs1w7g7BNjWiUi5ZhNswetK6qO40WVk2zjkduQjp8x0tFoBBc9xgftrJHzLh
 vaMMpwZ9a+StVjqx2NZKN3+0qEDphAgQZbs1iYEC3+d6K/3+i/KvgBaQVBmjRUCTRhhd
 XK9oXAh3hVd0zlZpwoBvoN7TF1HTe2o6zWxPqgHGs1xY1panpec4fFb7tYL5KjUL6xD8
 gnFV89RT7AcULT3bSZizS/Jc6FR2pGZvrT1obAR2iCh0K20B4BDMcRYikZ2nA95NFG66
 5Z3zZ6FKBJkE7//0YxILOEZv+jv18XOJYqRZtn0W2KkvZJ8F8bGiFC8znxpoUlA7sRWO
 5Z8g==
X-Gm-Message-State: AOAM5339p7UeiDCx4zUUX3NgXSAA8eAxHhXbvrPP6BkfjCuoHXzhdT+i
 8ITSSYF/5v3JOzE77wMQVupZVzQCQUSjHXhxven1/p62eitzcUtCqzQLV4RlFOPMA52mNCkjG0L
 ZOqYiCPqaQgatWc0=
X-Received: by 2002:adf:e483:: with SMTP id i3mr21639857wrm.175.1635235669852; 
 Tue, 26 Oct 2021 01:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ0yjgkr9qVHccAL3DbGPRcCLvGAKSvVBCGEtv8ZYwQBPYbhxen565JW1xxIK/pC/fG6ocjw==
X-Received: by 2002:adf:e483:: with SMTP id i3mr21639820wrm.175.1635235669547; 
 Tue, 26 Oct 2021 01:07:49 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id x2sm7625079wmj.3.2021.10.26.01.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:07:49 -0700 (PDT)
Message-ID: <3afe188c-e6de-e956-b068-af6ae1f988da@redhat.com>
Date: Tue, 26 Oct 2021 10:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] qemu-img: make --block-size optional for compare
 --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211021101236.1144824-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
> Let's detect block-size automatically if not specified by user:
>
>   If both files define cluster-size, use minimum to be more precise.
>   If both files don't specify cluster-size, use default of 64K
>   If only one file specify cluster-size, just use it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/tools/qemu-img.rst |  7 +++-
>   qemu-img.c              | 71 ++++++++++++++++++++++++++++++++++++-----
>   qemu-img-cmds.hx        |  4 +--
>   3 files changed, 71 insertions(+), 11 deletions(-)

Looks good, just grammar nits and a request for an assertion below.

> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 21164253d4..4b382ca2b0 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -170,6 +170,11 @@ Parameters to compare subcommand:
>     Block size for comparing with ``--stat``. This doesn't guarantee exact
>     size of comparing chunks, but that guarantee that data chunks being
>     compared will never cross aligned block-size boundary.
> +  When unspecified the following logic is used:
> +
> +    - If both files define cluster-size, use minimum to be more precise.
> +    - If both files don't specify cluster-size, use default of 64K
> +    - If only one file specify cluster-size, just use it.

s/specify/specifies/; and perhaps s/it/that/

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index 79a0589167..61e7f470bb 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1407,6 +1407,61 @@ static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
>       }
>   }
>   
> +/* Get default value for qemu-img compare --block-size option. */
> +static int img_compare_block_size(BlockDriverState *bs1,
> +                                  BlockDriverState *bs2,
> +                                  bool quiet)
> +{
> +    const int default_block_size = 64 * 1024; /* 64K */
> +
> +    int ret;
> +    BlockDriverInfo bdi;
> +    int cluster_size1, cluster_size2, block_size;
> +    const char *note = "Note: to alter it, set --block-size option.";
> +    const char *fname1 = bs1->filename;
> +    const char *fname2 = bs2->filename;
> +
> +    ret = bdrv_get_info(bs1, &bdi);
> +    if (ret < 0 && ret != -ENOTSUP) {
> +        error_report("Failed to get info of %s: %s", fname1, strerror(-ret));
> +        return ret;
> +    }
> +    cluster_size1 = ret < 0 ? 0 : bdi.cluster_size;
> +
> +    ret = bdrv_get_info(bs2, &bdi);
> +    if (ret < 0 && ret != -ENOTSUP) {
> +        error_report("Failed to get info of %s: %s", fname2, strerror(-ret));
> +        return ret;
> +    }
> +    cluster_size2 = ret < 0 ? 0 : bdi.cluster_size;
> +

I’d feel better with an `assert(cluster_size1 >= 0 && cluster_size2 >= 
0);` here.

> +    if (cluster_size1 > 0 && cluster_size2 > 0) {
> +        if (cluster_size1 == cluster_size2) {
> +            block_size = cluster_size1;
> +        } else {
> +            block_size = MIN(cluster_size1, cluster_size2);
> +            qprintf(quiet, "%s and %s has different cluster sizes: %d and %d "

s/has/have/

> +                    "correspondingly. Use minimum as block-size for "

s/correspondingly/respectively/; s/Use/Using/ (“Use” sounds like an 
imperative)

> +                    "accuracy: %d. %s\n",
> +                    fname1, fname2, cluster_size1,
> +                    cluster_size2, block_size, note);
> +        }
> +    } else if (cluster_size1 == 0 && cluster_size2 == 0) {
> +        block_size = default_block_size;
> +        qprintf(quiet, "Neither of %s and %s has explicit cluster size. Use "

s/has/have an/; s/Use/Using/

> +                "default of %d bytes. %s\n", fname1, fname2, block_size, note);
> +    } else {
> +        block_size = MAX(cluster_size1, cluster_size2);
> +        qprintf(quiet, "%s has explicit cluster size of %d and %s "

s/has/has an/

> +                "doesn't have one. Use %d as block-size. %s\n",

s/Use/Using/

Hanna

> +                cluster_size1 ? fname1 : fname2, block_size,
> +                cluster_size1 ? fname2 : fname1,
> +                block_size, note);
> +    }
> +
> +    return block_size;
> +}
> +
>   /*
>    * Compares two images. Exit codes:
>    *


