Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E45589676
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 05:17:08 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJRMB-0004Mu-Ep
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 23:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJRJe-0002OU-Nv
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJRJc-0007XU-0g
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659582867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1rPi5vX6yxlnUiAiv/yrZjRQbbm5DY5a2pv7XBJEEk=;
 b=FcPBv4B3Z/Jdi/GRspRqOLopnxZmcP2Vs8GJFyJ3FVjHNayQMZBY1czuwbdaJjBhQpybVT
 ujEdrSrrygZlW+laEmMjXAubHutTDXCuV69VuYcXACRvMzyjqtlmY00k5F/bIM+NDoEG3S
 c71+DbW6eaKb5PKzXOi9oVXzQ2dhVc0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-6QK374JNMMKBCB_lboOtjw-1; Wed, 03 Aug 2022 23:14:26 -0400
X-MC-Unique: 6QK374JNMMKBCB_lboOtjw-1
Received: by mail-pj1-f69.google.com with SMTP id
 q12-20020a17090aa00c00b001f228eb8b84so2092318pjp.3
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 20:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A1rPi5vX6yxlnUiAiv/yrZjRQbbm5DY5a2pv7XBJEEk=;
 b=ohy1JIm//dyvColkiJoJ4GMhRXv1cP3E/hOuE3IFN0wNAKUFjsrKlgGt31WP2JIc4F
 4Jibk70wMPDXpxhss21pufIQtcTx3690Adz2GSNcWOu9y4Fzb57Hsla/57cnlFzfxupx
 kiteAcKnmNdxMnVSJZv7EkvzB/KAgnBI6dWF0forvQsqSzjEtOeJy6YvCLLid5xhQ8pq
 kjuvimk49SxA9rIlaY9GtM0QcKnVHk105fPyuoMlb0O+LpEuUcoz5bgIrYpknDz14PFn
 YMcPjK1+p8v6EAdaTHobL6vRBKYwbt1r3zKeb5dOFwDJinAiCV/kHBEdigiGyPckuZJZ
 HMkQ==
X-Gm-Message-State: ACgBeo0QNoVpHocf1oxreEE9zxKbKAbxUUpI26LjQOW32O6t12VHv+TW
 EUje89Xhec/DpEN18xlvmJn8Qo/OvjIaizap0LepWLzEk+5GtK4Khc8eokaqq4ON6JoEGEvOrdr
 ZN5hZSJXyHQgRxhM=
X-Received: by 2002:a17:903:41cc:b0:16e:d522:6b8e with SMTP id
 u12-20020a17090341cc00b0016ed5226b8emr22217869ple.62.1659582864968; 
 Wed, 03 Aug 2022 20:14:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50mrrU/Sf1eg6VNPkUEtjQvJ0xrQ90GkKyp9jPUL1O0aY0AgZ27j5RoKukDYOMKyIaJdq12A==
X-Received: by 2002:a17:903:41cc:b0:16e:d522:6b8e with SMTP id
 u12-20020a17090341cc00b0016ed5226b8emr22217839ple.62.1659582864652; 
 Wed, 03 Aug 2022 20:14:24 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x190-20020a6263c7000000b0052ac99c2c1csm13694405pfb.83.2022.08.03.20.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 20:14:24 -0700 (PDT)
Message-ID: <308c14f4-90c5-9256-3a87-801dbd9eda05@redhat.com>
Date: Thu, 4 Aug 2022 11:14:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 03/10] vhost: Do not depend on !NULL VirtQueueElement
 on vhost_svq_flush
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220802175731.312115-4-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2022/8/3 01:57, Eugenio Pérez 写道:
> Since QEMU will be able to inject new elements on CVQ to restore the
> state, we need not to depend on a VirtQueueElement to know if a new
> element has been used by the device or not. Instead of check that, check
> if there are new elements only using used idx on vhost_svq_flush.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index e6eebd0e8d..fdb550c31b 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -491,7 +491,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>   /**
>    * Poll the SVQ for one device used buffer.
>    *
> - * This function race with main event loop SVQ polling, so extra
> + * This function races with main event loop SVQ polling, so extra
>    * synchronization is needed.
>    *
>    * Return the length written by the device.
> @@ -499,20 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>   size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>   {
>       int64_t start_us = g_get_monotonic_time();
> -    do {
> +    while (true) {
>           uint32_t len;
> -        VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
> -        if (elem) {
> -            return len;
> -        }
>   
>           if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
>               return 0;
>           }
>   
> -        /* Make sure we read new used_idx */
> -        smp_rmb();
> -    } while (true);
> +        if (!vhost_svq_more_used(svq)) {
> +            continue;
> +        }
> +
> +        vhost_svq_get_buf(svq, &len);


I wonder if this means we won't worry about the infinite wait?

Thanks


> +        return len;
> +    }
>   }
>   
>   /**


