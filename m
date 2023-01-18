Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D955B672004
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:46:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9h7-0003oT-12; Wed, 18 Jan 2023 09:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9gw-0003hs-6i
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9gu-0004OQ-Pz
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674053128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmedLJLUdlRn88yHz1n1e9WByueB3goMrDIQ7EBV3XY=;
 b=i56DK+UU+Cwhqrn5UcRI8twQLWpEfarV62aR8cUDRCY6TbwVZkPIZCz9AYqLr3uUtgosD3
 +SRp6fz6WhEZzVg2ay1jeznaS7BXHz7eKho6TV4w+mLCic7aSq8Xw7iRESLS9d3mknq2R6
 Pg8mC37eL42jcOfOkrYDMc6ebHNGC3o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-5RyAh2vDMeS4RmO6lcFPFQ-1; Wed, 18 Jan 2023 09:45:26 -0500
X-MC-Unique: 5RyAh2vDMeS4RmO6lcFPFQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so6442377edc.6
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmedLJLUdlRn88yHz1n1e9WByueB3goMrDIQ7EBV3XY=;
 b=FftHyB/7xilHGb7jTFnbxKFNrx6pBcB2XzK04THbdhextAm027WAdgNbi4+hx0mpcM
 iHp7G519y7wWwR3IRCroyWtZA8/nfMAJuHJT2YsKpi54mO/vVTfYASl1HK75RAErbBvX
 K5wFEHkHiviowyRcg7EblXnsly7S9Zd7g4lL9lDk5i7x+WtbN2wqJE0z9nijaqEFzfDd
 TpdCnh8F7w0WYN4lG1YmWyVEnVSR4XjQmpQSxN4bM4C+sV+HvB1r70tLYiP+X1ct1bkz
 t1JdIE4L3QGF/xRb89+2MNOF4Q0duDOZPlAc140ONnLaqypPYKS6Xu9JtCkCkLDALPWp
 6Y2Q==
X-Gm-Message-State: AFqh2kpBMQzg8xrnJtl30GobO35zwkbDjUdorm4lPZlyEmcJiZhw+/nR
 7xLKs9Z/mncTPL5EwkdFB1iHZa7SURM7fQJ9aLeh23CAZCCRUFwyayrTzKaWOXyME7+f9UNtxmL
 3jZFx+50n0H3tdHE=
X-Received: by 2002:a17:906:99d1:b0:845:bb21:f638 with SMTP id
 s17-20020a17090699d100b00845bb21f638mr7693851ejn.75.1674053124719; 
 Wed, 18 Jan 2023 06:45:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv461qzP5wHWnbaw6XXdefIZ2D/7T4TLLIQwRP2BfeWEp6UcILpvZC4o5/6rj016F681n5FLA==
X-Received: by 2002:a17:906:99d1:b0:845:bb21:f638 with SMTP id
 s17-20020a17090699d100b00845bb21f638mr7693822ejn.75.1674053124330; 
 Wed, 18 Jan 2023 06:45:24 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm14618835ejo.164.2023.01.18.06.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:45:23 -0800 (PST)
Message-ID: <0f329372-e2e1-50c2-46a3-64ab6db4f5f4@redhat.com>
Date: Wed, 18 Jan 2023 15:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 07/11] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
 <20230115155821.1534598-8-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230115155821.1534598-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index d48b447cca..3d06623355 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c

[...]

> @@ -469,19 +511,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               continue;
>           }
>   
> -        /* cluster outside the image */
> -        if (off > size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> -            res->corruptions++;
> -            if (fix & BDRV_FIX_ERRORS) {
> -                parallels_set_bat_entry(s, i, 0);
> -                res->corruptions_fixed++;
> -            }
> -            prev_off = 0;
> -            continue;
> -        }
> -
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;

parallels_co_check() keeps the `high_off` variable, and now it is also 
bumped for clusters that are outside the image.  This seems to go 
against patch 2’s intentions.

Consider an image whose file length is larger than all of its clusters 
need (i.e. there’s leaked space), except for one cluster, which is 
beyond the EOF.  This one cluster is considered an error (because it’s 
outside the image).  Before this patch, we would have truncated the 
image’s file length to match all the other non-error clusters (and drop 
the leaked space).  With this patch, the error cluster, if it wasn’t 
fixed by parallels_check_outside_image(), the image’s file length is no 
longer truncated.  Basically, this seems to restore the behavior from 
before patch 2.

Was this intentional?

Hanna


