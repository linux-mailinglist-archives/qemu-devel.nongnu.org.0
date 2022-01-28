Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1C49F357
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:09:31 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDKRu-0001hK-9P
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKJQ-00089O-D1
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKJO-0003Fn-Gn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643349641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYgQt0/KeFSCIkAhuFPGEarb+no47SgZxYR96SrPZ0c=;
 b=RGai5OC9iAw6KCjh/c5FMO9sBfF5yfCUPMLwpGci49tprkgbWt3lMVCSdQWPXTOSTs59j8
 9qyv7aXXyzc9jvcImGmDvzmW3cZu/WK+0ZxypMq8MqVASD4DM1IrqPhFMOhCJv7U92Qsz6
 DsOt4rFGQDOkACBfSf5YLLgMbbK+KJo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-K0WP5PhwO_m1qKwZyyJ_GQ-1; Fri, 28 Jan 2022 01:00:39 -0500
X-MC-Unique: K0WP5PhwO_m1qKwZyyJ_GQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 b15-20020a1709027e0f00b0014a922bc3a9so2684344plm.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 22:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OYgQt0/KeFSCIkAhuFPGEarb+no47SgZxYR96SrPZ0c=;
 b=7Nuq0I9prAd1QxGlYjm+OENNzUDgzHvZ6wkswyH2TMzBCEU3hOYkVeQQNw6WsktnEA
 lLrQo5z35FFqIw2peFIIg8BkjX+ezWAm4T+Ow36DiKt8ojgORtC8s3JCdca5HYAAoL2g
 MFaO+gOmHPNve3YafuijKP+xEjrWnZdAWJ5G40h5VC+dqd/F+5Lvpf/NGw+DDLgM7Tz6
 tVTpUokNwakx6grJ1swN5xpCHNbsI0s5jHyvTEKGxJL3OSv5HGyCa4ZV5MwlFu3aDrmd
 xnLRW+UCFgst4ovX4lPe4KXA+hEdzcrtvg2FSNVY5Pqr6QsHiV+uuB6BB2R5Yjh1vbuq
 Kkpg==
X-Gm-Message-State: AOAM532GJ8tourgnMZuvifefrwETPiFUdDcGy3M6pvIgtBjWVF7pfvtG
 jwPK3BNf1pJ4cJRNrkdQhUvFm49bQWyRxQkICrm64lwQgQvEIQTbeoVewIFySgUycbK5s0N/VzI
 n8seACDn6KZMZVV0=
X-Received: by 2002:a17:902:7e0a:: with SMTP id
 b10mr6658073plm.17.1643349638602; 
 Thu, 27 Jan 2022 22:00:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7hNeWWqb8aRBUDh65gGxA3ifNtHPG4/49IrbOF8G9VrCDqBH4KQA7MYQApwmP4y74Q+g8mA==
X-Received: by 2002:a17:902:7e0a:: with SMTP id
 b10mr6658050plm.17.1643349638328; 
 Thu, 27 Jan 2022 22:00:38 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b13sm7427295pfm.27.2022.01.27.22.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:00:37 -0800 (PST)
Message-ID: <3900d7cc-a7a0-90a0-5ba4-6fc37a84922f@redhat.com>
Date: Fri, 28 Jan 2022 14:00:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 02/31] vhost: Add VhostShadowVirtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
> Vhost shadow virtqueue (SVQ) is an intermediate jump for virtqueue
> notifications and buffers, allowing qemu to track them. While qemu is
> forwarding the buffers and virtqueue changes, it is able to commit the
> memory it's being dirtied, the same way regular qemu's VirtIO devices
> do.
>
> This commit only exposes basic SVQ allocation and free. Next patches of
> the series add functionality like notifications and buffers forwarding.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h | 21 ++++++++++
>   hw/virtio/vhost-shadow-virtqueue.c | 64 ++++++++++++++++++++++++++++++
>   hw/virtio/meson.build              |  2 +-
>   3 files changed, 86 insertions(+), 1 deletion(-)
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> new file mode 100644
> index 0000000000..61ea112002
> --- /dev/null
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -0,0 +1,21 @@
> +/*
> + * vhost shadow virtqueue
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef VHOST_SHADOW_VIRTQUEUE_H
> +#define VHOST_SHADOW_VIRTQUEUE_H
> +
> +#include "hw/virtio/vhost.h"
> +
> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> +
> +VhostShadowVirtqueue *vhost_svq_new(void);
> +
> +void vhost_svq_free(VhostShadowVirtqueue *vq);
> +
> +#endif
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> new file mode 100644
> index 0000000000..5ee7b401cb
> --- /dev/null
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -0,0 +1,64 @@
> +/*
> + * vhost shadow virtqueue
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
> +
> +#include "qemu/error-report.h"
> +#include "qemu/event_notifier.h"
> +
> +/* Shadow virtqueue to relay notifications */
> +typedef struct VhostShadowVirtqueue {
> +    /* Shadow kick notifier, sent to vhost */
> +    EventNotifier hdev_kick;
> +    /* Shadow call notifier, sent to vhost */
> +    EventNotifier hdev_call;
> +} VhostShadowVirtqueue;
> +
> +/**
> + * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
> + * methods and file descriptors.
> + */
> +VhostShadowVirtqueue *vhost_svq_new(void)
> +{
> +    g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
> +    int r;
> +
> +    r = event_notifier_init(&svq->hdev_kick, 0);
> +    if (r != 0) {
> +        error_report("Couldn't create kick event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_hdev_kick;
> +    }
> +
> +    r = event_notifier_init(&svq->hdev_call, 0);
> +    if (r != 0) {
> +        error_report("Couldn't create call event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_hdev_call;
> +    }
> +
> +    return g_steal_pointer(&svq);
> +
> +err_init_hdev_call:
> +    event_notifier_cleanup(&svq->hdev_kick);
> +
> +err_init_hdev_kick:
> +    return NULL;
> +}
> +
> +/**
> + * Free the resources of the shadow virtqueue.
> + */
> +void vhost_svq_free(VhostShadowVirtqueue *vq)
> +{
> +    event_notifier_cleanup(&vq->hdev_kick);
> +    event_notifier_cleanup(&vq->hdev_call);
> +    g_free(vq);
> +}
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 521f7d64a8..2dc87613bc 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>   
>   virtio_ss = ss.source_set()
>   virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))


I wonder if we need a dedicated config option for shadow virtqueue.

Thanks


>   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))


