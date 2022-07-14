Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C5F5749A2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:51:03 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvUs-0004U7-CR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvAp-0004Aq-3b
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvAn-0003ju-4t
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657791016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhMJUHi0m9TDkGEkhtRBYm08R7FW7mkNwycOf9hCrI0=;
 b=GpBM8wF+AHYNB5sXuIKOwj8nudVwTf3+vTby8d4gW1oP1/2SVhjZ48VAZ5s0NmUQXbxH8C
 1mT9Ib0HKC8w33gX4wDcM+hHhOWEhMFnt+G+bsMEs+0KU05vYhfdv14s3ozfiTf9kRZ2P7
 nQzYrBLigthfD1NtBAe3FCjJPkuhvWU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-YymI8C6LNVm6RFR6J-ooGg-1; Thu, 14 Jul 2022 05:30:14 -0400
X-MC-Unique: YymI8C6LNVm6RFR6J-ooGg-1
Received: by mail-ed1-f72.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so1147222edc.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OhMJUHi0m9TDkGEkhtRBYm08R7FW7mkNwycOf9hCrI0=;
 b=pECYy8mgDdvcabIXofhjKSQXPG7BVBDTu8s3O+z4sbN74CKfU3vU4ddb89OCeSp1hr
 b3fggJymlKV7PBKLTDOdfkMLUdB48+nw34UCfpBoLwMvOSmL4awQIr1Tss2S16cHoaG1
 LhLTLktcudRyJH/TfjVtKlzZwQDv/80/5qiITWd5Wh5zjMiuZ562Zu1zgHrsSqCw13Kh
 8WLZxageC3ZwH4AW+f9+kNaS9L+shCC6eejoV/8MPcF3JxzXaiV6/29F0cthUSpk2iRS
 B34e6/eqho47iQRHst56vjtxGxy3frrLDWb7t27m9Wh22xLMJExHHa4LgDuMUElGixzp
 5+Sg==
X-Gm-Message-State: AJIora+Owm97MeRAuxCBr8HDWFDRxW7NGY46T2Zf7B6Ik0R0fLX4Xyt/
 IYWRYJK2yfRQhOR/ag/KgEbUjUokY3io1LKwhHccNJBonxW9Lg1rHqAQ7pGnCoytVSdmjbH0SlZ
 w5YfAanzgTt1J9IE=
X-Received: by 2002:a17:907:b08:b0:72b:1bc8:19e4 with SMTP id
 h8-20020a1709070b0800b0072b1bc819e4mr7878023ejl.106.1657791013644; 
 Thu, 14 Jul 2022 02:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s8ow8u7+0kocTmoCabUnk/kXrmDdvFexCRNRhQbpDiWFLQMJaBgDD8bRBOtMcDDUsPA5lCkg==
X-Received: by 2002:a17:907:b08:b0:72b:1bc8:19e4 with SMTP id
 h8-20020a1709070b0800b0072b1bc819e4mr7877998ejl.106.1657791013451; 
 Thu, 14 Jul 2022 02:30:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 mx10-20020a1709065a0a00b00722e5e54fc2sm497894ejc.12.2022.07.14.02.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:30:13 -0700 (PDT)
Message-ID: <9ec50e0f-46b1-8e44-6891-dbfb983cee1f@redhat.com>
Date: Thu, 14 Jul 2022 11:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 5/8] block: add BlockRAMRegistrar
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yanan Wang <wangyanan55@huawei.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-6-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.07.22 06:17, Stefan Hajnoczi wrote:
> Emulated devices and other BlockBackend users wishing to take advantage
> of blk_register_buf() all have the same repetitive job: register
> RAMBlocks with the BlockBackend using RAMBlockNotifier.
>
> Add a BlockRAMRegistrar API to do this. A later commit will use this
> from hw/block/virtio-blk.c.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   MAINTAINERS                          |  1 +
>   include/sysemu/block-ram-registrar.h | 30 +++++++++++++++++++++
>   block/block-ram-registrar.c          | 39 ++++++++++++++++++++++++++++
>   block/meson.build                    |  1 +
>   4 files changed, 71 insertions(+)
>   create mode 100644 include/sysemu/block-ram-registrar.h
>   create mode 100644 block/block-ram-registrar.c

What memory is handled in ram_list?  Is it everything?  If so, won’t 
devices have trouble registering all those buffer, especially if they 
happen to be fragmented in physical memory? (nvme_register_buf() seems 
to say it can run out of slots quite easily.)

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50f340d9ee..d16189449f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2490,6 +2490,7 @@ F: block*
>   F: block/
>   F: hw/block/
>   F: include/block/
> +F: include/sysemu/block-*.h
>   F: qemu-img*
>   F: docs/tools/qemu-img.rst
>   F: qemu-io*

Sneaky. ;)

> diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/block-ram-registrar.h
> new file mode 100644
> index 0000000000..09d63f64b2
> --- /dev/null
> +++ b/include/sysemu/block-ram-registrar.h
> @@ -0,0 +1,30 @@
> +/*
> + * BlockBackend RAM Registrar
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef BLOCK_RAM_REGISTRAR_H
> +#define BLOCK_RAM_REGISTRAR_H
> +
> +#include "exec/ramlist.h"
> +
> +/**
> + * struct BlockRAMRegistrar:
> + *
> + * Keeps RAMBlock memory registered with a BlockBackend using
> + * blk_register_buf() including hotplugged memory.
> + *
> + * Emulated devices or other BlockBackend users initialize a BlockRAMRegistrar
> + * with blk_ram_registrar_init() before submitting I/O requests with the
> + * BLK_REQ_REGISTERED_BUF flag set.

s/BLK/BDRV/, right?

> + */
> +typedef struct {
> +    BlockBackend *blk;
> +    RAMBlockNotifier notifier;
> +} BlockRAMRegistrar;
> +
> +void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
> +void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
> +
> +#endif /* BLOCK_RAM_REGISTRAR_H */


