Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E737665F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf0ov-0007Nu-Ng
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lf0ng-0006hr-Oo
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lf0nf-0004qz-5S
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620395150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6rsrNKKkKIOYTitatIISsYE7Z7OBBJ3wILcronS4e8=;
 b=KRCuoP8kt/cCpFtUTVg4bFOdowbI82+fallTLfRihN4Xp4RiMuB3SEaWQXxSK/P/QDZjvr
 x7WJGXsPJp5oKzq1vuVQSqrGCrUufkpf4UVVtF7asFb1KijIFXT1jzNQk8VCJeaH9MC0HT
 kFwt5A7darmTcchXVPSQqNXRdSVo5+Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-E4WcQJ1LOlumXgc2mtE6UA-1; Fri, 07 May 2021 09:45:48 -0400
X-MC-Unique: E4WcQJ1LOlumXgc2mtE6UA-1
Received: by mail-wm1-f71.google.com with SMTP id
 w21-20020a7bc1150000b029014a850581efso2262096wmi.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 06:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T6rsrNKKkKIOYTitatIISsYE7Z7OBBJ3wILcronS4e8=;
 b=YfVS74vrcZQNRj1sgLdhXReG6L+TOi5Vax+sFCwIGh0GTuwjLrAg2wPCSframNsfiU
 0YHkbcjpdv9yj+B+Awijhv6GGi5Cf5iImagxh13Nr2PTv0a9N2qqYUerIJeL3L6zlO32
 nWNU5A2Kh9+hJNCRAEJQkSfgRxSJc1ZRnUs1dNAyzSrcnfARi9A+9PADGeVLZW8imrw9
 1bYbLIv7S5oOaqTfKugBXIGi0BFh/rapf62DaNG24SnxH1SOfB42mO7iTXkTO56IShxr
 DxZ5m90Ip2CiZPOMUE84t51Z+zdjr7ashACJ3gOmLfrCdn3WtBWDkvgcnLFfdAQuqOxa
 fXTw==
X-Gm-Message-State: AOAM530I2e8CWzn0EDs4GjEOczjzVXZjLG2AYs/dQgnD7oYW5nZmudO3
 5MhcgGsUssvJjnV7JgrPj3qe2ghrD9BqETNIJGRpIkK5lS+t1zy3vLX0wHf0jfMX+pyfUITW7LX
 URet1LDEYzw0S6pY=
X-Received: by 2002:a1c:415:: with SMTP id 21mr10354193wme.132.1620395147391; 
 Fri, 07 May 2021 06:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU6lgEvOUQ6ZO0LfD1XwXGyVR1Dm9dNRO1ENAQQXr/QUIV0h4x9V1ZXP7GjjRxPz41y2N4ZQ==
X-Received: by 2002:a1c:415:: with SMTP id 21mr10354160wme.132.1620395147076; 
 Fri, 07 May 2021 06:45:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t23sm742260wmj.31.2021.05.07.06.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 06:45:46 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
 <20210506090621.11848-6-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 5/8] block/write-threshold: don't use aio context lock
Message-ID: <700a25a7-c2aa-51fa-45c8-e97932c07c2e@redhat.com>
Date: Fri, 7 May 2021 15:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506090621.11848-6-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/21 11:06, Vladimir Sementsov-Ogievskiy wrote:
>   void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
>                                         int64_t bytes)
>   {
>       int64_t end = offset + bytes;
> -    uint64_t wtr = bs->write_threshold_offset;
> +    uint64_t wtr;
>   
> -    if (wtr > 0 && end > wtr) {
> -        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
> +retry:
> +    wtr = bdrv_write_threshold_get(bs);
> +    if (wtr == 0 || wtr >= end) {
> +        return;
> +    }
>   
> -        /* autodisable to avoid flooding the monitor */
> -        bdrv_write_threshold_set(bs, 0);
> +    /* autodisable to avoid flooding the monitor */
> +    if (qatomic_cmpxchg(&bs->write_threshold_offset, wtr, 0) != wtr) {
> +        /* bs->write_threshold_offset changed in parallel */
> +        goto retry;
>       }
> +
> +    /* We have cleared bs->write_threshold_offset, so let's send event */
> +    qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
>   }
> 

This has the problem that 64-bit atomics are not always possible on 
32-bit builds.  We can use a spinlock (and probably just drop this patch 
for now).

Paolo


