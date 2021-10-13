Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C009F42B44C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 06:37:36 +0200 (CEST)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maW1H-0003Zf-Rg
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVze-0002e4-41
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVzT-0001Ur-EL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634099740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wINfqaz/O9+HOfkraCCTULcrWKcCZkgynSGL3NU7D0A=;
 b=hImb8DVGX1nfOvRTmXQs/HUdKLe3xX7xogWepum6XOJQ8f+Ghz8aw207Lami65551+Q7Yz
 bCwrK3sqP3WLjZcYxlIHxfwaEluX/O+8todK2ii42TOLICdt3RScZI+5M/Z/n8T//NHmia
 xfNqW/AnQKMlBtf6HF2Yg85j/PfZb3U=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-VgSsAl8YMBufuFOabVeXoA-1; Wed, 13 Oct 2021 00:35:37 -0400
X-MC-Unique: VgSsAl8YMBufuFOabVeXoA-1
Received: by mail-pg1-f199.google.com with SMTP id
 d6-20020a63d646000000b00268d368ead8so794264pgj.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 21:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wINfqaz/O9+HOfkraCCTULcrWKcCZkgynSGL3NU7D0A=;
 b=lva0mWUlxtczZDmA6bCZGAKcIFOhufWGZQ/0y38aQ8FwRC1jaJqBxTBJ2qe9zIagJq
 UrfN+QD5FqOF2DwAUyZwedMj3LDVtmb58jY1qBe7Bj72qH0qNvLTnm8LKOekkRzcz57e
 KgxEPt4rfVPjfI3dcDK2OM96d7noY3ICpLnHX3agItV/odHEtK4jPi/gIzCLAlCwtSCE
 nM3wJz4dAaSGLL25xhSmlyKgyXvwGFmaVkavNHCgKhENj40iS8/+NGLhRp2D01moyBs6
 CoaYZXAhhItrYbJQDbyaurUhTdojEnceJzbHxBcUgGhXAuXYwWposuPnqEtNUVf+cadt
 YJbA==
X-Gm-Message-State: AOAM533F16v2skG02up0P6AxjzVy0uVq1ANEHzhuZfV9ruFs2gyUTd5y
 nPaKni9OpuZwX9LbUyGctjZG6QCxdJGiD9vtmO11lipPqzYwOBQUWs5aiG/Scn1IajTAmGpTXdX
 g2IC2X8rQu1Cd2YE=
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr10895514pjo.243.1634099736113; 
 Tue, 12 Oct 2021 21:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymiYQaYUkD/ivm8TOAXah7gxwTiuwVjOxrS6LXgOCSK8Aa0tJWdo8QgnQyN2XZGxA7NmShCw==
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr10895484pjo.243.1634099735814; 
 Tue, 12 Oct 2021 21:35:35 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x129sm12562543pfc.140.2021.10.12.21.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 21:35:35 -0700 (PDT)
Subject: Re: [RFC PATCH v4 16/20] vhost: Check for device
 VRING_USED_F_NO_NOTIFY at shadow virtqueue kick
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-17-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f77b8efb-9d6b-5f35-2285-72f2dc59c26a@redhat.com>
Date: Wed, 13 Oct 2021 12:35:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-17-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index df7e6fa3ec..775f8d36a0 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -173,6 +173,15 @@ static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
>       svq->ring_id_maps[qemu_head] = elem;
>   }
>   
> +static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> +{
> +    /* Make sure we are reading updated device flag */


I guess this would be better:

         /* We need to expose available array entries before checking used
          * flags. */

(Borrowed from kernel codes).

Thanks


> +    smp_mb();
> +    if (!(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY)) {
> +        event_notifier_set(&svq->kick_notifier);
> +    }
> +}
> +
>   /* Handle guest->device notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
> @@ -197,7 +206,7 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>               }
>   
>               vhost_svq_add(svq, elem);
> -            event_notifier_set(&svq->kick_notifier);
> +            vhost_svq_kick(svq);
>           }
>   
>           virtio_queue_set_notification(svq->vq, true);


