Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE14243A6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:03:09 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAJw-0006cG-FH
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYAFf-0001Sa-Hk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYAFd-0006ht-QJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633539521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulIcCg8fpZ74K00PA87QdoZ5T60cfaYFxfRptTv10Xk=;
 b=fbgowAaj7eL6tU3Ufo4GtWEQfdIoUyXUVbfB6B/j/nRXkTZf96+sFC1Vq5WQ9lu6eCg6ZU
 LIzatX4OcdKWeV2jgKVXUMQsNtmbgrp8aBA7489t3SmJkn47r2+DZVrAnueh7fgh5dhfgd
 WtPMmdfX0hipljWZnFX3L5gfwIpsvFE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-svT3aW0ePHeeXiMC5SApTA-1; Wed, 06 Oct 2021 12:58:40 -0400
X-MC-Unique: svT3aW0ePHeeXiMC5SApTA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso2566252wrb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulIcCg8fpZ74K00PA87QdoZ5T60cfaYFxfRptTv10Xk=;
 b=mQFMU5K2r/lXHmF0d1AUvS3Fvyn0+4SeYkb1IRL+O/lcS4Q/VFTngE1mv4g1sQmFdp
 cIPg4jqSYG+fOIneiO6wMq7V/zR+sMM1cNPR/Am3xV5kItLONYlYRNeXXglMwQGdUVzb
 N1HuWmpcVt6Rzjxdu2LCyd3h+LIUZdcRss45yEdWZNHX6iuFLFZlFaid5LU/F26xKbO6
 4mKA480gwbx9n5dIrH5mKJxGY4JfV1BDn3nP6kQEHYTgsxar3QbN6C4+Ly8bnxgNsF//
 IN+W1IlvK8iRhU5mc5SINiSYhX7mveM7jBZtX9Ija9ZVBCA2Thx88IM3lf17oZ3Sd649
 2iFA==
X-Gm-Message-State: AOAM530UrawSJhbsksoiXWkTb3TRNnWTsdElJ1SpsEDuQawaWqvzbxaB
 NFuf5qwCcHDWqJidZ5VCUEpmWNQVROqU7dcKQUU8ey2hfZ2mUsqFgb8lJQPFX7xO1w1MeSVJ7b6
 SB7WeBL4gfUkdyDQCquuZ6GHsy+TCRAL2O1bafmCzMVCDlWjIIME2zndFE5EmzqUU
X-Received: by 2002:a1c:a9d5:: with SMTP id
 s204mr11035643wme.193.1633539518968; 
 Wed, 06 Oct 2021 09:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNX8+cyhfxh93vIquFE1jFSiuMKgmMINnbp/3u+sapA3Vn7mubwIgRyGy1dI8dmRBGCPGAUA==
X-Received: by 2002:a1c:a9d5:: with SMTP id
 s204mr11035626wme.193.1633539518821; 
 Wed, 06 Oct 2021 09:58:38 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z5sm7915485wmp.26.2021.10.06.09.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 09:58:38 -0700 (PDT)
Message-ID: <f834eb51-393a-1f62-1dae-f6ef225128d3@redhat.com>
Date: Wed, 6 Oct 2021 18:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
To: qemu-devel@nongnu.org
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211006164931.172349-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 18:49, Philippe Mathieu-Daudé wrote:
> nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
> but we never release them. Do it in nvme_free_queue() which is called
> from nvme_free_queue_pair().
> 
> Reported by valgrind:
> 
>   ==252858== 520,192 bytes in 1 blocks are still reachable in loss record 8,293 of 8,302

BTW the "8302" number is kinda depressing...

Good news, with this patch I'm now at 8301.

>   ==252858==    at 0x4846803: memalign (vg_replace_malloc.c:1265)
>   ==252858==    by 0x484691F: posix_memalign (vg_replace_malloc.c:1429)
>   ==252858==    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210)
>   ==252858==    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
>   ==252858==    by 0xAA0125: nvme_init (nvme.c:799)
>   ==252858==    by 0xAA081C: nvme_file_open (nvme.c:953)
>   ==252858==    by 0xA23DDD: bdrv_open_driver (block.c:1550)
>   ==252858==    by 0xA24806: bdrv_open_common (block.c:1827)
>   ==252858==    by 0xA2889B: bdrv_open_inherit (block.c:3747)
>   ==252858==    by 0xA28DE4: bdrv_open (block.c:3840)
>   ==252858==    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
>   ==252858==    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)
> 
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 6e476f54b9f..903c8ffa060 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
>  
>  static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
>  {
> +    qemu_vfio_dma_unmap(s->vfio, q->queue);
>      qemu_vfree(q->queue);
>  }
>  
> 


