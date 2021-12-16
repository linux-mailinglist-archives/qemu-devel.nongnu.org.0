Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FE4775B6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:20:34 +0100 (CET)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxsYb-00058X-N6
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:20:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxsVX-0002qP-Nq
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxsVV-0006bY-8O
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639667840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwBayHBiFe6NdAnXE1FAHg5+uvd0tHfRlCiaRIojRcA=;
 b=K4+fIIw6+oO+tiNO5OYUi1ochHCBTtCz83MhWKqwk29zH8/wAH/2dGfdVACrUutXYApCXP
 ccih8S1Sl+6fpNjgWNLXl7+21h7c+NX7ABvznTeJ9BSJ6sxIYNsstSXjPN59fC3XB4NjOQ
 DhJuwcMe3DQSmeElOt8qWKi5zzNmOm8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513--igXDLsjMcaFEPPL9swzIg-1; Thu, 16 Dec 2021 10:17:18 -0500
X-MC-Unique: -igXDLsjMcaFEPPL9swzIg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso7019164wrj.12
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 07:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FwBayHBiFe6NdAnXE1FAHg5+uvd0tHfRlCiaRIojRcA=;
 b=oaV2R3wVxUGBrkP06NaKtj8IMIckyFOZ+Auja2K8KuciFze84zvyN6bQahLedG3cRG
 HhAMgTJGfp9eOZ7Ecqcy1J5uPrdymTeKUZxY1a4Jy8XQ2+yk4Da4MtjCxroruiPOVFWH
 RRJ3Tbiea4P95GjPGEMkp5jA9NHQwwpWMLJidMj5a03QWxUo3LUBzxZgg5BHS1BpVlJ1
 X5mvdqrrcQHfeLbmYw+sKBbZnQVYBLG9Pkeyfc5J2jJ+Pnx43s34q7mg4yvztE0uLduw
 xMPHGNlyb8KmQsVsJP464qlm8ivCQUkZUlwSrOjZAtXsii3d8Iv6oOvJdJLf8DJdvX1L
 tWiw==
X-Gm-Message-State: AOAM530AJ+caMI93+FeJZ2rfOGE6KOOuQaoH0667ssw1dljkTZdqj6oo
 sD/GhjzKKvODQtpRGaVsc6Kpf0HNLw4hyC7S3TJwmhxskjJwKFnSs4kIeIzbghkREvARb1HKXRr
 ooFwGY1cL2RUiUYM=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr9686778wrb.16.1639667835509;
 Thu, 16 Dec 2021 07:17:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRDsFCPqSgkBx8lRLFmZibjERp0CaAlCT7It73MQcBQjCeD8UGP7N4KUAENazVXh1LmON4Gw==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr9686737wrb.16.1639667835204;
 Thu, 16 Dec 2021 07:17:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n24sm4857591wms.45.2021.12.16.07.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:17:14 -0800 (PST)
Message-ID: <57a6f75e-5722-eda1-de64-c2f24dd4d8e3@redhat.com>
Date: Thu, 16 Dec 2021 16:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 03/31] assertions for block global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-4-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-4-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c        | 135 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   block/commit.c |   2 +
>   block/io.c     |  14 +++++
>   blockdev.c     |   1 +
>   4 files changed, 150 insertions(+), 2 deletions(-)
>
> diff --git a/block.c b/block.c
> index 84de6867e6..49bee69e27 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -975,6 +992,7 @@ BlockDriver *bdrv_probe_all(const uint8_t *buf, int buf_size,
>   {
>       int score_max = 0, score;
>       BlockDriver *drv = NULL, *d;
> +    assert(qemu_in_main_thread());

While reviewing patch 13 and the find_image_format() it touches, I 
noticed that this function is called from raw_co_pwritev() to prevent 
the guest from writing image headers into probed-raw images.

Reproducible like so:

$ qemu-img create -f raw test.img 64M
Formatting 'test.img', fmt=raw size=67108864
$ ./qemu-system-x86_64 \
     -object iothread,id=iothr0 \
     -drive if=none,id=drv0,file=test.img \
     -device virtio-blk,drive=drv0,iothread=iothr0 \
     -monitor stdio
WARNING: Image format was not specified for 'test.img' and probing 
guessed raw.
          Automatically detecting the format is dangerous for raw 
images, write operations on block 0 will be restricted.
          Specify the 'raw' format explicitly to remove the restrictions.
QEMU 6.1.93 monitor - type 'help' for more information
(qemu) qemu-io drv0 "write 0 512"
qemu-system-x86_64: ../block.c:1004: bdrv_probe_all: Assertion 
`qemu_in_main_thread()' failed.
[1]    108256 IOT instruction (core dumped)  ./qemu-system-x86_64 
-object iothread,id=iothr0 -drive  -device  -monitor


I don’t think there’s any reason not to classify bdrv_probe_all() as an 
I/O function then, is there?

(Also, bdrv_probe_all() is part of block_int.h, so this assertion would 
actually belong in patch 8, not here.)

Hanna

>   
>       QLIST_FOREACH(d, &bdrv_drivers, list) {
>           if (d->bdrv_probe) {


