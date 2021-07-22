Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9743D20FD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:35:37 +0200 (CEST)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6V7A-0006iY-VJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6V60-0005re-Ox
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6V5y-0003J4-Hb
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626946461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cc2kpZTJ8fRxdb5EuCvkUGRw0gegp6BAv4qmfdCRW54=;
 b=DpmBKzVu+GPI6GBTwpOB14srHRjJkcktEzlZEHGEhws+j26A2cY1CdaVrjM+FSdVKooJPq
 judxMNiHnsd4NZW9fbMkTDBt1E6PN3f7hBQSwaMVfoDNwqKgciRGs23DS0hcs/fMllhY86
 6pKrEuRnRdQmYg5z8cr7dIvL7ZB3FSo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-kkoQtWloM4aSkxKB2-qBTw-1; Thu, 22 Jul 2021 05:34:16 -0400
X-MC-Unique: kkoQtWloM4aSkxKB2-qBTw-1
Received: by mail-pl1-f197.google.com with SMTP id
 v16-20020a170902e8d0b0290124e63feb68so2458008plg.17
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cc2kpZTJ8fRxdb5EuCvkUGRw0gegp6BAv4qmfdCRW54=;
 b=QdIR8LPvnUOEc6pRQvk3EqrJY9Pg00bJx4eN6ARsMopKPcK6/AlY8dJEBZP37iKADz
 cIb5paRcKebl1kkXm+37T8da7c095sCJzA6uMHh7dLYUSuk2OIbIUFDTiuMW6sfbfhx6
 mauYXtLeHDKFvYGFnwIjMoRJpKyOapnh/VOaklu2Rw1JlDPXDf8RMeuw4Y2Sxb42zAex
 MhrbUj5Gu6Fyat/5h+sBR2DF89AqVs9+hO3kAlupmkd0qNR4qND508vJDPfn4Wro5Aex
 IVqxhQtBALqDY9V1salmVmytPg+UgTgmfaffUjs0dIDhyUFQ/kCmoflrRg5AujU8sPzt
 xVDQ==
X-Gm-Message-State: AOAM531V8y/bXafrRgqJh0ZJJN/cB85P8Hr349fkM47X8aCsXlcBwVGN
 kx6/1wPkmS0HAhuUdHVbm5tCw3qUaVF6fN5FwHN21syhngtSEuZf/+kq028eEfhBAkx5WJN6yYS
 r/lbE+lgHYh8Ny/A=
X-Received: by 2002:a63:ce14:: with SMTP id y20mr39463116pgf.432.1626946455404; 
 Thu, 22 Jul 2021 02:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA4vCANWOwaE+xV0F8/XM6INFJHy0nKlvjqekUVjyunIs1OpsQlCrvMDATAqRVqy0m6tkUwg==
X-Received: by 2002:a63:ce14:: with SMTP id y20mr39463079pgf.432.1626946454785; 
 Thu, 22 Jul 2021 02:34:14 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x6sm2542947pjr.5.2021.07.22.02.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:34:14 -0700 (PDT)
Subject: Re: [PATCH] hw/net/vmxnet3: Do not abort QEMU if guest specified bad
 queue numbers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20210721141559.3647945-1-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <593ce988-9108-8599-c2bd-183f5fe211ef@redhat.com>
Date: Thu, 22 Jul 2021 17:34:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721141559.3647945-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/21 ÏÂÎç10:15, Thomas Huth Ð´µÀ:
> QEMU should never terminate unexpectedly just because the guest is
> doing something wrong like specifying wrong queue numbers. Let's
> simply refuse to set the device active in this case.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890160
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Applied.

Thanks


> ---
>   hw/net/vmxnet3.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index f6bd8c53b1..41f796a247 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1381,7 +1381,7 @@ static void vmxnet3_validate_interrupts(VMXNET3State *s)
>       }
>   }
>   
> -static void vmxnet3_validate_queues(VMXNET3State *s)
> +static bool vmxnet3_validate_queues(VMXNET3State *s)
>   {
>       /*
>       * txq_num and rxq_num are total number of queues
> @@ -1390,12 +1390,18 @@ static void vmxnet3_validate_queues(VMXNET3State *s)
>       */
>   
>       if (s->txq_num > VMXNET3_DEVICE_MAX_TX_QUEUES) {
> -        hw_error("Bad TX queues number: %d\n", s->txq_num);
> +        qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Bad TX queues number: %d\n",
> +                      s->txq_num);
> +        return false;
>       }
>   
>       if (s->rxq_num > VMXNET3_DEVICE_MAX_RX_QUEUES) {
> -        hw_error("Bad RX queues number: %d\n", s->rxq_num);
> +        qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Bad RX queues number: %d\n",
> +                      s->rxq_num);
> +        return false;
>       }
> +
> +    return true;
>   }
>   
>   static void vmxnet3_activate_device(VMXNET3State *s)
> @@ -1419,6 +1425,16 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>           return;
>       }
>   
> +    s->txq_num =
> +        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numTxQueues);
> +    s->rxq_num =
> +        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numRxQueues);
> +
> +    VMW_CFPRN("Number of TX/RX queues %u/%u", s->txq_num, s->rxq_num);
> +    if (!vmxnet3_validate_queues(s)) {
> +        return;
> +    }
> +
>       vmxnet3_adjust_by_guest_type(s);
>       vmxnet3_update_features(s);
>       vmxnet3_update_pm_state(s);
> @@ -1445,14 +1461,6 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>           VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.intrConf.autoMask);
>       VMW_CFPRN("Automatic interrupt masking is %d", (int)s->auto_int_masking);
>   
> -    s->txq_num =
> -        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numTxQueues);
> -    s->rxq_num =
> -        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numRxQueues);
> -
> -    VMW_CFPRN("Number of TX/RX queues %u/%u", s->txq_num, s->rxq_num);
> -    vmxnet3_validate_queues(s);
> -
>       qdescr_table_pa =
>           VMXNET3_READ_DRV_SHARED64(d, s->drv_shmem, devRead.misc.queueDescPA);
>       VMW_CFPRN("TX queues descriptors table is at 0x%" PRIx64, qdescr_table_pa);
> @@ -2404,7 +2412,9 @@ static int vmxnet3_post_load(void *opaque, int version_id)
>           }
>       }
>   
> -    vmxnet3_validate_queues(s);
> +    if (!vmxnet3_validate_queues(s)) {
> +        return -1;
> +    }
>       vmxnet3_validate_interrupts(s);
>   
>       return 0;


