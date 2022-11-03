Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB561858A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdbS-0007gP-PE; Thu, 03 Nov 2022 13:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdbQ-0007fd-3E
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdbO-0007MN-A1
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMKW7JdB8nyqnjLo3bFDZzXeOajwaYkvue28PDCK4fI=;
 b=jDtrqZoabBs4fC7AdrWTo3YQd2Cx8R804RY0Q7upxKTfHJ24q0edrB3nLnKEQHQLox5GKG
 GxNUpnHghNEE+i3gxzxTnC64E2YnoYUKz4yMksgmEVSwjNhJ62eBEAHQDm/c/8VOYkX1fr
 S2jy1N26SXkAHlTIfqoeYroiS+xduHM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-JGtfUJQWO2uXBIPiYIa8xg-1; Thu, 03 Nov 2022 13:02:00 -0400
X-MC-Unique: JGtfUJQWO2uXBIPiYIa8xg-1
Received: by mail-ej1-f71.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so1628742ejb.19
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMKW7JdB8nyqnjLo3bFDZzXeOajwaYkvue28PDCK4fI=;
 b=wUdna8p2AemHv1/PuVSgybQRJml2TMQFgbu53dNdYa26MBPCHEa2JgxDE3FGuH7YFb
 usLgQQyUlaGmwA3cYmi7+mf/OQWRLo92U4tzFaD3UDqff1rA43jhNFa5MttMGVb10tGY
 dM8HAuJ/pt2FGYU6REbdSyJe3MGKjaxH0H03RFZNPDZw8xTzJAqfvHVQ0EuUmnqaRLbO
 i13l6d3A7JMCzUtM+oF+1sYgvSudh+IHs736GOuPcTeNsEOHCNaEPHIAq5Y8WDuXie8s
 uhrZHg0EClp4/nNtTI/Z0W8p105dXTzXkJYUtWjPamLdOeLT7I8nDYjrVF0zwmxFm+n+
 nwDg==
X-Gm-Message-State: ACrzQf27M4Oi89UG20z8RgRKp0YwyvDJl7wkpT21XM7DJjdp98OtBD7b
 meDXVW3tcUqYy8rnGcETGGOL80d7yiI5CVS41aKlS+XS1RL401wpR98LrT7IabjxnwkjDYsfZCH
 DGfBB7ZQAvJPsDe0=
X-Received: by 2002:a17:907:6d06:b0:7ad:b45c:dcab with SMTP id
 sa6-20020a1709076d0600b007adb45cdcabmr28448100ejc.72.1667494916777; 
 Thu, 03 Nov 2022 10:01:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bK7VVBYRNCefp4swMDpHtO9Q1/OdjvOX+AoLlwD1vGv4gnwzxH/pyAmBJD8QnOWkSUZaWIg==
X-Received: by 2002:a17:907:6d06:b0:7ad:b45c:dcab with SMTP id
 sa6-20020a1709076d0600b007adb45cdcabmr28448073ejc.72.1667494916538; 
 Thu, 03 Nov 2022 10:01:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d8-20020a170906344800b0073dc5bb7c32sm709487ejb.64.2022.11.03.10.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:01:56 -0700 (PDT)
Message-ID: <72512aed-9968-0f15-9f3e-aef3643590e6@redhat.com>
Date: Thu, 3 Nov 2022 18:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 7/9] block: bdrv_create_file is a coroutine_fn
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-8-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:42, Emanuele Giuseppe Esposito wrote:
> It is always called in coroutine_fn callbacks, therefore
> it can directly call bdrv_co_create().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                            | 6 ++++--
>   include/block/block-global-state.h | 3 ++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/block.c b/block.c
> index eeb7a02aa2..e5e70acf15 100644
> --- a/block.c
> +++ b/block.c
> @@ -527,6 +527,7 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
>   {
>       int ret;
>       GLOBAL_STATE_CODE();
> +    assert(qemu_in_coroutine());
>       assert(*errp == NULL);
>   
>       if (!drv->bdrv_co_create_opts) {
> @@ -717,7 +718,8 @@ out:
>       return ret;
>   }
>   
> -int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
> +int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
> +                                  Error **errp)
>   {
>       QemuOpts *protocol_opts;
>       BlockDriver *drv;
> @@ -758,7 +760,7 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>           goto out;
>       }
>   
> -    ret = bdrv_create(drv, filename, protocol_opts, errp);
> +    ret = bdrv_co_create(drv, filename, protocol_opts, errp);
>   out:
>       qemu_opts_del(protocol_opts);
>       qobject_unref(qdict);
> diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
> index 73795a0095..bd461f06a1 100644
> --- a/include/block/block-global-state.h
> +++ b/include/block/block-global-state.h
> @@ -57,7 +57,8 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>   BlockDriver *bdrv_find_format(const char *format_name);
>   int bdrv_create(BlockDriver *drv, const char* filename,
>                   QemuOpts *opts, Error **errp);
> -int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
> +int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
> +                                  Error **errp);
>   
>   BlockDriverState *bdrv_new(void);
>   int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,

Ah, I see now why patch 6 is needed, but please adjust the commit message.

Paolo


