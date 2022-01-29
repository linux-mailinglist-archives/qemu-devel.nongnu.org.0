Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891254A2CD1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 09:13:17 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDirE-0002pn-LG
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 03:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDibt-0004vU-Na
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 02:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDibq-00036z-2h
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 02:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643443040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkafsaZps3dDz9BRkZqTxUflY/BaeGS+eaV1LY84TSk=;
 b=StzjN7lYlgg6kPGV7+RLbGPU9OIHalWnUdo1BW3UoXWdKs5k2A5ezfXqaSdZ74y/wgkKko
 JEQo3fZVHi7osTlSZRwlJZThpm59x4CVN+gJdsI/8mwGZBWy6MbzJmcuxlt5VxojDIhQmW
 G4EPT4KrWlKXAlbA5N2yXr4O7Ukmu48=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-8fGmkfZqN2uN9vbSwXqH2w-1; Sat, 29 Jan 2022 02:57:18 -0500
X-MC-Unique: 8fGmkfZqN2uN9vbSwXqH2w-1
Received: by mail-pg1-f198.google.com with SMTP id
 c19-20020a637253000000b0035e0ba5a1bfso4708535pgn.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 23:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QkafsaZps3dDz9BRkZqTxUflY/BaeGS+eaV1LY84TSk=;
 b=43miWoGu9ez/Z92b8EsgLFpfW3yYitgJsh5htegtdAyq+IEWSn2o8rxYpEU85ZrXQG
 N2c4aey+lwR3o0ATgHN1YwAWBvJg+RKdiqwDapAfk4NZJddiPY9G2Jclvn2YbJResC4u
 gLDr8fVrJTj8JRWQMim282BhgIriqlVoIrA03MmZkGBrCyetq4ltTIUIZ6PYbf9k7nfY
 qwhijZqjqLRTD1AR+U2V9GGVfCEc3tu4eCuyR7WpkAbTGfQsFOl4oq0PalixMm6jl4oS
 mNnXMlBn1N6Zg6QxYdDuZYrTNEEOkzvCO2javG3fe0fLDsiNJ45h4XY6Rr2LfO0WPNki
 QhYA==
X-Gm-Message-State: AOAM533gGSkEpikdrD0bVV3aqziwwHai0wLkHsrM1M37HwGGJjHueO33
 PPYWUuEXByUM5GeFbzDLlYoyXmRb3EE3UT2uPT71o9tubEGdsc+HZ6OkBgFz1hCL6yUGQup/UkZ
 BBEuhxv85HKEJtv0=
X-Received: by 2002:a63:1c10:: with SMTP id c16mr9352634pgc.275.1643443037343; 
 Fri, 28 Jan 2022 23:57:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoWDIZLjuFBvxtCOzzo4d+2mkQA6jW+Z88WYfhoCNaja1pAwTGCEIc5alZWL7lbK05EhNm5g==
X-Received: by 2002:a63:1c10:: with SMTP id c16mr9352603pgc.275.1643443037029; 
 Fri, 28 Jan 2022 23:57:17 -0800 (PST)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k12sm11998772pfc.107.2022.01.28.23.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 23:57:16 -0800 (PST)
Message-ID: <05ff460b-1d9a-935b-8a1d-28ba0b5be8b8@redhat.com>
Date: Sat, 29 Jan 2022 15:57:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 07/31] vhost: dd vhost_svq_get_svq_call_notifier
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-8-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> This allows vhost-vdpa device to retrieve device -> svq call eventfd.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


What did 'dd' mean in the title?

Thanks


> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 4c583a9171..a78234b52b 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   const EventNotifier *vhost_svq_get_dev_kick_notifier(
>                                                 const VhostShadowVirtqueue *svq);
> +const EventNotifier *vhost_svq_get_svq_call_notifier(
> +                                              const VhostShadowVirtqueue *svq);
>   
>   void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 8991f0b3c3..25fcdf16ec 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -55,6 +55,18 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>       event_notifier_set(&svq->hdev_kick);
>   }
>   
> +/**
> + * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
> + * exists pending used buffers.
> + *
> + * @svq Shadow Virtqueue
> + */
> +const EventNotifier *vhost_svq_get_svq_call_notifier(
> +                                               const VhostShadowVirtqueue *svq)
> +{
> +    return &svq->hdev_call;
> +}
> +
>   /**
>    * Set a new file descriptor for the guest to kick SVQ and notify for avail
>    *


