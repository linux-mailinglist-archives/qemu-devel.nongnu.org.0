Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034142B44D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 06:38:06 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maW1l-00052p-DS
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 00:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maW0i-0003Xt-Tj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maW0c-0002gs-Oe
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634099814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvUhcTTQ2pxsY3jW1PKSwCOFp6YIbWxJGDsBgyWUDwA=;
 b=TtMXSWoOr4NbTxyfQXakoAkmhFoHTiF79lBznOSN4fVB4drFvM3XgUebZyaOSeT6OwCHVe
 uzQPSnUVUCltbP1nRlbqemPEz6SLjNUBg5KtOcyHarYIlCpyTpczHYQTnY9LKOtuyTJFA3
 x5AmxCJ5tNDcCqJpQPZaQmiQ0hjjUAA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-dikVOqzNPcitjbFLHCo_hQ-1; Wed, 13 Oct 2021 00:36:53 -0400
X-MC-Unique: dikVOqzNPcitjbFLHCo_hQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 i3-20020aa79083000000b003efb4fd360dso859683pfa.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 21:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SvUhcTTQ2pxsY3jW1PKSwCOFp6YIbWxJGDsBgyWUDwA=;
 b=jySKJRu9IeZDvRAHZA0rQu9myRdy0L/mjV4P6+vM1e9zH0Uh8Ewnpj497P9z6yyqQ3
 QatnW9yQMnv4njQ9ktajRkohPP2y8zphqU+YKGjEWmyc7VM0AGXC3Pna3yOmxqcGFzl+
 ykSh9piRexajXkJ7CrO93lmCgXOIIff4r4Qg1de3gy/73dNhZyDDgUwzkDyyiWTVM8Bl
 dlxCefXhsD0hvrdJJHdBvF1H3nzh/D4RXjrUxf8EerKyNME7mZdI1e4WhOAeNXBIoBh0
 WWKrzSswHT+rCd+YdYyryfdpmLbQsoz3CX42ElK7U26VSOzDBWHymWX5m0LlB7WgwBQW
 MGeg==
X-Gm-Message-State: AOAM531S3N3Ys5C/bSIfOE1kXmOVJJvl9/fvyCQju4JkxJlemW3l3z+5
 sA+juNpBuRGXMANW/0cQ9e7jVNXTEnVH/AwpU0gkIMqr/YOUeG8Ii+BNw4jS11fOc7nxCfuEWyb
 F6osslpZd+M4nbvI=
X-Received: by 2002:a17:90a:e7cc:: with SMTP id
 kb12mr10884065pjb.182.1634099811658; 
 Tue, 12 Oct 2021 21:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKK75ijthkI1cwqd+QXDZEh29wqU5QfrYGfWA3cVQJ5a2kMcOmuTfCoXY0vbHeqpLY0EI3BQ==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id
 kb12mr10884052pjb.182.1634099811466; 
 Tue, 12 Oct 2021 21:36:51 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w2sm12742496pfq.207.2021.10.12.21.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 21:36:51 -0700 (PDT)
Subject: Re: [RFC PATCH v4 17/20] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at
 device call on shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-18-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6ae86e3f-a922-3576-a73a-a6c80ac7dd3f@redhat.com>
Date: Wed, 13 Oct 2021 12:36:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-18-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:06, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Commit log please.

Thanks


> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 775f8d36a0..2fd0bab75d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -60,6 +60,9 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Next head to consume from device */
>       uint16_t used_idx;
> +
> +    /* Cache for the exposed notification flag */
> +    bool notification;
>   } VhostShadowVirtqueue;
>   
>   /* If the device is using some of these, SVQ cannot communicate */
> @@ -105,6 +108,24 @@ bool vhost_svq_valid_device_features(uint64_t *dev_features)
>       return r;
>   }
>   
> +static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
> +{
> +    uint16_t notification_flag;
> +
> +    if (svq->notification == enable) {
> +        return;
> +    }
> +
> +    notification_flag = cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> +
> +    svq->notification = enable;
> +    if (enable) {
> +        svq->vring.avail->flags &= ~notification_flag;
> +    } else {
> +        svq->vring.avail->flags |= notification_flag;
> +    }
> +}
> +
>   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>                                       const struct iovec *iovec,
>                                       size_t num, bool more_descs, bool write)
> @@ -273,7 +294,7 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
>       do {
>           unsigned i = 0;
>   
> -        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> +        vhost_svq_set_notification(svq, false);
>           while (true) {
>               g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
>               if (!elem) {
> @@ -286,6 +307,7 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
>   
>           virtqueue_flush(vq, i);
>           event_notifier_set(&svq->guest_call_notifier);
> +        vhost_svq_set_notification(svq, true);
>       } while (vhost_svq_more_used(svq));
>   }
>   


