Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B906C44E7F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 14:53:22 +0100 (CET)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlWzZ-0003lk-1z
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 08:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlWxc-0002tf-Hk
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:51:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlWxW-0004pj-SF
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636725073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DwYtwAKFpzVCqwlg+u0S+BdezLvdzII6ZWzxwh0D+OY=;
 b=IuD0koyzqlYJD/KBI7PBYlSsfTyUUvzzYv/5URlFxYfwKXyHHCAI0fXOl5ds3fO24SDCsx
 GY8+AHhLd8irpA/DLW/tFSFmHIR3J7wE+r/gw9O0uCMw5WCwJkL48FR2PFuLycv+W/O/cB
 070Fb+ITvHk0TBFUV8MoaNlz0RKW9AY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-IqdIQATBPZyXCz-AyfQmVQ-1; Fri, 12 Nov 2021 08:51:12 -0500
X-MC-Unique: IqdIQATBPZyXCz-AyfQmVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso4312596wms.1
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 05:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DwYtwAKFpzVCqwlg+u0S+BdezLvdzII6ZWzxwh0D+OY=;
 b=Lb7Ch43n2pyk49BMSgm4vOQeqcdDuhOpCjwmkjkUOstU2BHfwbgXec/lbOWd+Of1Ku
 NofQi4xoZvoWU2a6r41Ohvp7p6sR3MZC4GFq6cB6HYnSpKGJNeeeIos34sX/P5HOU2js
 3H3YLroiD3BhCFDv3bhZDeTIoXt4hOiia08yKMTwBo0Gff0BBVv7IWtaYDaX/s7AtzGu
 OkhxzZ6I2kYT2rni06Ip+Whb8WGKSdZjvxSCsMVvtg21GU5rYHErCUVU7/0ekLKpFMGn
 GYbzdOrHMtQ0h9ZyPTDoO/bI9UwUJay1pi9hx/mOYPiWuJY7PcqCstYfGkn/bHfB7tNk
 COmw==
X-Gm-Message-State: AOAM5321bTE8DQpngGinW1mq9D1bS57iOnwlTFcb2+4U43c8/xQpX6IJ
 LPmEtDne+FALmX/XXTtX4Ch+XY0llN1lo1PxXNxHHrCPQbEBbDd22yE1xp2We1bHxZYy4G6grTa
 4qIfhvO32cfeo2QI=
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr16410616wmq.7.1636725071101; 
 Fri, 12 Nov 2021 05:51:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt2y/8FgHymTD8Rf4D2ak77518xNs4SLg7xLEi3YizN84NfBJ3Yn7wrFna4R5VbcBngJufng==
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr16410583wmq.7.1636725070774; 
 Fri, 12 Nov 2021 05:51:10 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id x1sm5745392wru.40.2021.11.12.05.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 05:51:10 -0800 (PST)
Message-ID: <3a330894-9276-7357-ab6d-4386151661f7@redhat.com>
Date: Fri, 12 Nov 2021 14:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 07/25] assertions for block_int global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-8-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-8-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c                         | 17 +++++++++++++++++
>   block/backup.c                  |  1 +
>   block/block-backend.c           |  3 +++
>   block/commit.c                  |  2 ++
>   block/dirty-bitmap.c            |  1 +
>   block/io.c                      |  6 ++++++
>   block/mirror.c                  |  4 ++++
>   block/monitor/bitmap-qmp-cmds.c |  6 ++++++
>   block/stream.c                  |  2 ++
>   blockdev.c                      |  7 +++++++
>   10 files changed, 49 insertions(+)
>
> diff --git a/block.c b/block.c
> index 672f946065..41c5883c5c 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -7473,6 +7488,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
>    * would result in exactly bs->backing. */
>   bool bdrv_backing_overridden(BlockDriverState *bs)
>   {
> +    assert(qemu_in_main_thread());
>       if (bs->backing) {
>           return strcmp(bs->auto_backing_file,
>                         bs->backing->bs->filename);

This function is in block_int-common.h, though.

[...]

> diff --git a/block/io.c b/block/io.c
> index c5d7f8495e..f271ab3684 100644
> --- a/block/io.c
> +++ b/block/io.c

[...]

> @@ -3419,6 +3423,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
>   {
>       trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
>                                     read_flags, write_flags);
> +    assert(qemu_in_main_thread());
>       return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
>                                          bytes, read_flags, write_flags, true);
>   }

This is a block_int-io.h function.

> @@ -3435,6 +3440,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
>   {
>       trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
>                                   read_flags, write_flags);
> +    assert(qemu_in_main_thread());
>       return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
>                                          bytes, read_flags, write_flags, false);
>   }

This, too.

Hanna


