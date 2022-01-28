Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61549F3E5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:57:57 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDLCg-0006vj-4e
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKoh-00032l-SK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKof-0007pZ-PX
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643351581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTBa8Rxe83S7/zRBXu+VYt7bO/6tlqvapp+sSbPm424=;
 b=QtJe1l9CR6KCbA2QHROahU+GMg1cJ9mcLaaEwZUjGHPkS/UfwIJ+66NxOuYNsLNiUJP8Fy
 3TbX3R303uR3OUr1LJ1XKgPKkgDet3LhDQftU1FQWpP44zP88vpYfwLXlzfSHX91U31Prx
 ivLynr9aT8yjCQr/VHL1sornvwzs59w=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-hzyJijmNO7qYCeEbgi2J7A-1; Fri, 28 Jan 2022 01:33:00 -0500
X-MC-Unique: hzyJijmNO7qYCeEbgi2J7A-1
Received: by mail-pg1-f198.google.com with SMTP id
 k13-20020a65434d000000b00342d8eb46b4so2818491pgq.23
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 22:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xTBa8Rxe83S7/zRBXu+VYt7bO/6tlqvapp+sSbPm424=;
 b=L28vFo11dbCAczyZ7FR5r+86a5bRsxheXC1dP1RMIJk6e4/qeT6puaDfIvrOMV1xsn
 OU3ASJRxhScylFPc6Gwq/Lr7FSPdIR4MqwstrkLlzHUKIPxkXc7GNkKlznaNg4w1elej
 b5cr6NDwIYKBZailY7WjmAOV8Li1fwYmzmbV1IzA4cG+2hQzk9Qh9tOwcdBcYN3Bhk6D
 PrjKxzpMxOkrOrjmglgMSMCXdxCCprcvWi656m/EKcP0Gd91WgbuGnOhLbRW7BCsfHb6
 2t4I0XUKzHr8LDcvbXcG2aZpnPQu9NXfqQCKpAx5C/ABrEEWkECo0PGHY/G4RN/zezGv
 ljiw==
X-Gm-Message-State: AOAM530wkeWSqit6UMB24pWqKBH9wzBYYEubGXzaoW9j4/SPDywWCFb4
 pFbruLhArNxaONgg0LhuxMx27QLhQBNS60s+RRqr0ho4qYfxcAk7GvndW0DtW01dynQIZozU26a
 6ZLqke1vkwiT7uaw=
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr6966092pfp.55.1643351578998; 
 Thu, 27 Jan 2022 22:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3Og3f6UrdRAE4sr1QlpWNx1A+eBVCL0XpNjIr3KrHEDQCi1uZipitBvrcKHFlQTuhPO1Mbw==
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr6966071pfp.55.1643351578753; 
 Thu, 27 Jan 2022 22:32:58 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id l191sm18969415pga.65.2022.01.27.22.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:32:58 -0800 (PST)
Message-ID: <5d51d7c9-7066-e72e-e775-ad3956733779@redhat.com>
Date: Fri, 28 Jan 2022 14:32:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 05/31] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-6-eperezma@redhat.com>
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
> At this mode no buffer forwarding will be performed in SVQ mode: Qemu
> will just forward the guest's kicks to the device.
>
> Also, host notifiers must be disabled at SVQ start, and they will not
> start if SVQ has been enabled when the device is stopped. This will be
> addressed in next patches.


We need to disable host_notifier_mr as well, otherwise guest may touch 
the hardware doorbell directly without going through eventfd.


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 27 ++++++++++++++++++++++++++-
>   2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index a56ecfc09d..4c583a9171 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -19,6 +19,8 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   const EventNotifier *vhost_svq_get_dev_kick_notifier(
>                                                 const VhostShadowVirtqueue *svq);
>   
> +void vhost_svq_stop(VhostShadowVirtqueue *svq);
> +
>   VhostShadowVirtqueue *vhost_svq_new(void);
>   
>   void vhost_svq_free(VhostShadowVirtqueue *vq);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 21534bc94d..8991f0b3c3 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -42,11 +42,26 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>       return &svq->hdev_kick;
>   }
>   
> +/* Forward guest notifications */
> +static void vhost_handle_guest_kick(EventNotifier *n)
> +{
> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> +                                             svq_kick);
> +
> +    if (unlikely(!event_notifier_test_and_clear(n))) {
> +        return;
> +    }
> +
> +    event_notifier_set(&svq->hdev_kick);
> +}
> +
>   /**
>    * Set a new file descriptor for the guest to kick SVQ and notify for avail
>    *
>    * @svq          The svq
> - * @svq_kick_fd  The new svq kick fd
> + * @svq_kick_fd  The svq kick fd
> + *
> + * Note that SVQ will never close the old file descriptor.
>    */
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>   {
> @@ -65,12 +80,22 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>        * need to explicitely check for them.
>        */
>       event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> +    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick);
>   
>       if (!check_old || event_notifier_test_and_clear(&tmp)) {
>           event_notifier_set(&svq->hdev_kick);
>       }
>   }
>   
> +/**
> + * Stop shadow virtqueue operation.
> + * @svq Shadow Virtqueue
> + */
> +void vhost_svq_stop(VhostShadowVirtqueue *svq)
> +{
> +    event_notifier_set_handler(&svq->svq_kick, NULL);
> +}


This function is not used in the patch.

Thanks


> +
>   /**
>    * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>    * methods and file descriptors.


