Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D994672010
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9iX-0004kD-5X; Wed, 18 Jan 2023 09:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9iU-0004hi-SK
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:47:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9iT-0004h1-7U
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674053224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsZIPCB2o2VdoB/N6gZW/7xpCToYgXucMg27FF2lsRg=;
 b=dPt1CcvsgSOjT4dBUFMlZECtoE9RqyGZcHBhDSoeLLQn3KhdWJqwKr4g8YH/UweV3y99Lq
 Dwzv9P9uQEdQnWF4fymLdOJA9YEIrLcF+oB10cmSnhfWqhYsBk61M1ZzxPaIlj6pzA0/5Y
 3X1jiG3D8oeRyNxG0dAKkhCYkPQ1WAo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-NmhTcpoNPt2fca-k8E4EPA-1; Wed, 18 Jan 2023 09:46:55 -0500
X-MC-Unique: NmhTcpoNPt2fca-k8E4EPA-1
Received: by mail-ej1-f70.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so23809056ejc.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsZIPCB2o2VdoB/N6gZW/7xpCToYgXucMg27FF2lsRg=;
 b=QR2CffdY0vU9tjEvF2EZtndhJAkadOXRgkkO5XYHUQ7k8zXBdRHukImbfhwbP2/oka
 BhL8pFrS8t3bWapfhIlEDuyPuUCe3eWP3KbfrqUTylkl1uS0f1ce6W+KNtynKfrnC+m8
 5BQujnVr/eQ15flqjxK0oIn65rW3glld+J6d1y0WYvGfLR7Z+sB8+nbw5HzPNX+J8GnA
 HiM6QGk/QXXKZ++0cyPgVY5FHRRM/tCcP4R14zS9xqImPxMiCKAYzkTuuTmunCyzhN7Y
 vRvk6Xc/Zk1r6ikEr0DdummKrF9vu01j6Lg/hwlO9hff1xuVk5+dYFLs3P6J2gs40V2R
 wozQ==
X-Gm-Message-State: AFqh2krLVPvZS9LZ6G7jTTuCOUsCpYEeoaTdRKMQlnH2tGBHSu+e7D0L
 UE7U4DV6edoPcmAffB8K9KlxqMytXAJULUnEfK+uvBMrDKhgOjc6r1hx1vj5x48N2DT+AqfsBwC
 osZjW9CMl3xWFsEw=
X-Received: by 2002:a17:906:1851:b0:86e:4067:b699 with SMTP id
 w17-20020a170906185100b0086e4067b699mr9637619eje.4.1674053214478; 
 Wed, 18 Jan 2023 06:46:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgyTCMdhRBNsq/HgiHf9G6A/C4THFqL2OPcOhJVSlFOxkWsLiWwCNmfQ8SwR4BRrMiZKVaxQ==
X-Received: by 2002:a17:906:1851:b0:86e:4067:b699 with SMTP id
 w17-20020a170906185100b0086e4067b699mr9637596eje.4.1674053214298; 
 Wed, 18 Jan 2023 06:46:54 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b007c16f120aacsm14641561ejn.121.2023.01.18.06.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:46:53 -0800 (PST)
Message-ID: <130ba67b-e954-0785-72c7-594ef12d2862@redhat.com>
Date: Wed, 18 Jan 2023 15:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 11/11] parallels: Incorrect condition in out-of-image
 check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
 <20230115155821.1534598-12-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230115155821.1534598-12-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15.01.23 16:58, Alexander Ivanov wrote:
> All the offsets in the BAT must be lower than the file size.
> Fix the check condition for correct check.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   block/parallels.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 621dbf623a..eda3fb558d 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       high_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > size) {
> +        if (off >= size) {

Should this not be the even stricter `off + s->cluster_size > size` 
instead, or is it possible to have partial clusters at the image end?

Hanna

>               fprintf(stderr, "%s cluster %u is outside image\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;


