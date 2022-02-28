Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F474C61C2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 04:20:34 +0100 (CET)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOWaN-0006Ly-RS
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 22:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOWYq-0004sd-Q9
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:18:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOWYm-0001EY-Gt
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646018329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xn+Az+CFSeJBzX65vjUuwFVqmJGow2gEtXe4FrB4xlA=;
 b=TdHWfa4i377Ehh0beYHQVapD12oWaQOh7/GDuI/ruCVio3nht9kx3Epz/vdycH46RVRJUA
 8tXpeu6k8/vh9lJ1k+pLA4/F31gy2hOXNs6AMgzFccR5O04XjuC/SMnIlCIEYhgbKSKWMT
 mrao0hR8LACMcCFGZBpodkf18C2NASQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-mjTNyIvDOKGo220bpmLiAA-1; Sun, 27 Feb 2022 22:18:46 -0500
X-MC-Unique: mjTNyIvDOKGo220bpmLiAA-1
Received: by mail-pj1-f70.google.com with SMTP id
 c14-20020a17090a8d0e00b001bc72e5c3ecso5667140pjo.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 19:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xn+Az+CFSeJBzX65vjUuwFVqmJGow2gEtXe4FrB4xlA=;
 b=tEOZqg0+oohu9SgrpsnUaRw3eVTzfQaIzN8vrus/Y9tfIsQNS1N1KuXUzPQ46Dd6N0
 SPGP/6pCI4OIsF6UsWBU86wVbqw/fZDBUwSNmmilf9hTeDLLHh9sjJh+B6IS5Kp58wfO
 5RRxdkN2XACtBiQ+0E6HraCBGN+QiHDUi5pdKlvYUDM4+qLTAYtV8WsRXlePC9zYovGb
 ZAds9RrNN9XMPg7B1kgHIBlRP5o9BhK/CYNsEWdQ90AujL06TByxyjeuJAfuPnKtERpU
 7o7P8Y6Ky2t8QNE31Vws4DclM6GMmAaDzvDXAjRKTSGEHV7IPKt3Kj8T/juupEhAjViF
 lJ6g==
X-Gm-Message-State: AOAM532yVZTyxyWOac0/YlwQJbLFpV+RxhTkKXfCacMbpEEP/CeqNzoM
 4LufZ9v6B8qL0YlULO9zkbd1d+ETUCzLsBy4JEP0oIelQWT3Gq7iU/vD/tnS7CVrYKBe/QThdqf
 vuCUdCH0QOeWh1J8=
X-Received: by 2002:a17:90a:f48f:b0:1bc:2521:fb0a with SMTP id
 bx15-20020a17090af48f00b001bc2521fb0amr14681752pjb.48.1646018325686; 
 Sun, 27 Feb 2022 19:18:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRheqPOne1hVfTfPRIbBY/rkeKoAuZJNl8PCgJ1Q7bWhhYlKpS5VczN73TCtI6FazI2q4N7w==
X-Received: by 2002:a17:90a:f48f:b0:1bc:2521:fb0a with SMTP id
 bx15-20020a17090af48f00b001bc2521fb0amr14681708pjb.48.1646018325357; 
 Sun, 27 Feb 2022 19:18:45 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 gl5-20020a17090b120500b001bc5d44f233sm14937012pjb.52.2022.02.27.19.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 19:18:44 -0800 (PST)
Message-ID: <627893d5-9976-8cfb-7e2c-edb55ad54254@redhat.com>
Date: Mon, 28 Feb 2022 11:18:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 03/14] vhost: Add Shadow VirtQueue call forwarding
 capabilities
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/27 下午9:41, Eugenio Pérez 写道:
> This will make qemu aware of the device used buffers, allowing it to
> write the guest memory with its contents if needed.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
>   hw/virtio/vhost-shadow-virtqueue.c | 34 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost-vdpa.c             | 31 +++++++++++++++++++++++++--
>   3 files changed, 67 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 1cbc87d5d8..1d4c160d0a 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -28,9 +28,13 @@ typedef struct VhostShadowVirtqueue {
>        * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
>        */
>       EventNotifier svq_kick;
> +
> +    /* Guest's call notifier, where the SVQ calls guest. */
> +    EventNotifier svq_call;
>   } VhostShadowVirtqueue;
>   
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
> +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
>   
>   void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index a5d0659f86..54c701a196 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -23,6 +23,38 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>       event_notifier_set(&svq->hdev_kick);
>   }
>   
> +/* Forward vhost notifications */
> +static void vhost_svq_handle_call(EventNotifier *n)
> +{
> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> +                                             hdev_call);
> +    event_notifier_test_and_clear(n);
> +    event_notifier_set(&svq->svq_call);
> +}
> +
> +/**
> + * Set the call notifier for the SVQ to call the guest
> + *
> + * @svq Shadow virtqueue
> + * @call_fd call notifier
> + *
> + * Called on BQL context.
> + */
> +void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd)


I think we need to have consistent naming for both kick and call. Note 
that in patch 2 we had

vhost_svq_set_svq_kick_fd

Maybe it's better to use vhost_svq_set_guest_call_fd() here.


> +{
> +    if (call_fd == VHOST_FILE_UNBIND) {
> +        /*
> +         * Fail event_notifier_set if called handling device call.
> +         *
> +         * SVQ still needs device notifications, since it needs to keep
> +         * forwarding used buffers even with the unbind.
> +         */
> +        memset(&svq->svq_call, 0, sizeof(svq->svq_call));


I may miss something but shouldn't we stop polling svq_call here like

event_notifier_set_handle(&svq->svq_call, false);

?

Thanks



