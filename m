Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749D56FA6F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:17:44 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApXz-00008u-8y
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApV3-0006jq-8F
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApV0-0004wS-58
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657530874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0thS6qaoJIy83ARbJ1BPX3EhCeX7JwFbKlYHd5SXDo=;
 b=fpNaSd7n8KIwLnznGLsbYx0QAJpWzrdEanSRcpOKSi8ZpnwBfhU3wS/kWV8dq/6Vd8CAVW
 lWqxuyl8/KB85DD15P5Cjw59UZJB3T9HNTKj8Mx/DVu5yTHR3cfpaisJM+5kI2KfLrXFuD
 VeeiyXtK8UDWvvrX3xUuy6Egb9wKgfw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-dpK8xxN5NImqHSaX_6o0uA-1; Mon, 11 Jul 2022 05:14:33 -0400
X-MC-Unique: dpK8xxN5NImqHSaX_6o0uA-1
Received: by mail-pl1-f199.google.com with SMTP id
 c16-20020a170902b69000b0016a71a49c0cso3656873pls.23
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I0thS6qaoJIy83ARbJ1BPX3EhCeX7JwFbKlYHd5SXDo=;
 b=KxTtd2XW7NqMDJWjCYtRajevHsybeBSyuEtvk8TAeOOtROHrlbB8Iabq8ddd/3ZE3l
 831KYa7Rl5862DTvlcVvOaghkXHtYQWN3IZZY/o3UhT04dEK2Pj9z78Kdxp0OXXsoRrI
 aha1zt3lSZ518v7qhw9DKOc51FhEfYN7eaQL+3O8dtU6tl5EJwTdVxI66hOZU3v3eprp
 OOWtWcoSltIMacF5dBtOvd8RcOpiH5z0aKTxsSgMOQCWousYXbVH3khY4K1AzmR45/Ps
 n7pzKvKnO3WXOy+hcJclnl4Js0fURCBqYY82HhwFbjJiz2Em0UYMJSqqxecZgAViYkjn
 fBVw==
X-Gm-Message-State: AJIora+OacSc26bonDrhIbnT/GWgBxqDLNDNN+r1UKYW6VjKc0UWJwxX
 8o9AULm12R3hy7nrmkeaMzNaSH776zZT7gilqJvgJEALpn0BhLqnPfkdddgMNYEFa2TOnNMAGge
 inXrat8jBDPZtyWI=
X-Received: by 2002:a17:902:9a07:b0:16c:39bc:876 with SMTP id
 v7-20020a1709029a0700b0016c39bc0876mr9431639plp.42.1657530872231; 
 Mon, 11 Jul 2022 02:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZUab0JVdVUfRr4KMTWvD5ruzDeSIlymUd3+7U8m4uLh5oosml8DOBg38J+nVNE95hvkJd8w==
X-Received: by 2002:a17:902:9a07:b0:16c:39bc:876 with SMTP id
 v7-20020a1709029a0700b0016c39bc0876mr9431602plp.42.1657530871924; 
 Mon, 11 Jul 2022 02:14:31 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902a3c500b0015e8d4eb2easm4160279plb.308.2022.07.11.02.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:14:31 -0700 (PDT)
Message-ID: <5f1c6d8f-5d3f-8e13-05d5-3afed733626f@redhat.com>
Date: Mon, 11 Jul 2022 17:14:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 13/23] vhost: Add vhost_svq_inject
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-14-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-14-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/7/7 02:39, Eugenio Pérez 写道:
> This allows qemu to inject buffers to the device.


Not a native speaker but we probably need a better terminology than 
inject here.

Since the CVQ is totally under the control of the Qemu anyhow.


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 34 ++++++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index a811f90e01..d01d2370db 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -98,6 +98,8 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
>   
>   void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
>                            const VirtQueueElement *elem, uint32_t len);
> +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
> +                     size_t out_num, size_t in_num, void *opaque);
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
>   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 492bb12b5f..bd9e34b413 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -283,6 +283,40 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
>       return ok;
>   }
>   
> +/**
> + * Inject a chain of buffers to the device
> + *
> + * @svq: Shadow VirtQueue
> + * @iov: I/O vector
> + * @out_num: Number of front out descriptors
> + * @in_num: Number of last input descriptors
> + * @opaque: Contextual data to store in descriptor
> + *
> + * Return 0 on success, -ENOMEM if cannot inject
> + */
> +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
> +                     size_t out_num, size_t in_num, void *opaque)


If we manage to embed opaque into VirtqueueElement, we can simply use 
vhost_svq_add() here.

Thanks


> +{
> +    bool ok;
> +
> +    /*
> +     * All vhost_svq_inject calls are controlled by qemu so we won't hit this
> +     * assertions.
> +     */
> +    assert(out_num || in_num);
> +    assert(svq->ops);
> +
> +    if (unlikely(svq->next_guest_avail_elem)) {
> +        error_report("Injecting in a full queue");
> +        return -ENOMEM;
> +    }
> +
> +    ok = vhost_svq_add(svq, iov, out_num, iov + out_num, in_num, opaque);
> +    assert(ok);
> +    vhost_svq_kick(svq);
> +    return 0;
> +}
> +
>   /**
>    * Forward available buffers.
>    *


