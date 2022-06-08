Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61E542161
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:58:45 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoiK-0004K7-Vu
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyobQ-00022j-5T
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyobO-0006Z1-5P
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654667490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAXz06tpjUQX+xufmidkDHPq8MAGIP1GU5mvhuinTao=;
 b=a/UGynBQJFWg4n2830PJ4fXkUaachUlnNEuy1tIMqRM9kb8iYXPsB9QYd7mLWvmrx5XEys
 hEEWs2vxF2BOzuG/2uYbIs+L1E+td3Tqz35qPeJf30VZ0ikDU5yinItAFVCcX7jnrVJox8
 uP+7hAjGeikrPBW6hGlcaQXA9FQa55I=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-HGvDqpbLMGKPKhTTaNqtkw-1; Wed, 08 Jun 2022 01:51:29 -0400
X-MC-Unique: HGvDqpbLMGKPKhTTaNqtkw-1
Received: by mail-pg1-f198.google.com with SMTP id
 y63-20020a638a42000000b003fd47b6f280so5874480pgd.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cAXz06tpjUQX+xufmidkDHPq8MAGIP1GU5mvhuinTao=;
 b=krNsmO14J4CZ8PAHow0eA+OBrI7CVbZiq8Won9yoqb5Yih2QMaNMn2G+dtCLaKNDwK
 NN8k9OrnxsPRXs1q2Hsc+jsaN7W1GjUXNejLn78h4Gcod9/5b8/AhnPXdbf9iiuFIQ10
 fJ31jt2DQro+OviXcnh32Wv8MavKhmUUW6dPRYLsKrIAuYYFm3NryaES5qh5pGFvLYZA
 H4PGJXMQ1WT2piiaa9splh6iRTMMZogHPNC8Cm513KwKnaJZasLS/BIi6sdfm+D+6L6Z
 qy5DcV/TWCzbpTqA4ktD0TACS+fC41vsRWde9hrDzRNy3NeHxywKWwTqAHLvszbzHyqB
 wvVg==
X-Gm-Message-State: AOAM530b7c+aqK6evP2m9QVwi1KcPZhprcphkcVcqipEyU/9wL4qUYKs
 9AYRrDv+ws5VSl+yPviOLyTkxE7jfIQ8lUk176rfI/DbwysYEoz4ZzfBwDU0rVRi9dKu+T/Ajzk
 hrRRxw6laPLWxdcg=
X-Received: by 2002:a63:f09:0:b0:3fd:7e20:6508 with SMTP id
 e9-20020a630f09000000b003fd7e206508mr16384578pgl.32.1654667488039; 
 Tue, 07 Jun 2022 22:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOnzMtA7NbaufSMP5RcTAP4Y56CRTATjrkyOMwDy8kvoa0BD8whWlE4vK/ZZUKF7YYKcuNnw==
X-Received: by 2002:a63:f09:0:b0:3fd:7e20:6508 with SMTP id
 e9-20020a630f09000000b003fd7e206508mr16384543pgl.32.1654667487733; 
 Tue, 07 Jun 2022 22:51:27 -0700 (PDT)
Received: from [10.72.13.97] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902cec900b0016378bfeb90sm13548051plg.227.2022.06.07.22.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 22:51:26 -0700 (PDT)
Message-ID: <d34131b7-4193-d82c-056f-23b9d99f897a@redhat.com>
Date: Wed, 8 Jun 2022 13:51:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> Control virtqueue is used by networking device for accepting various
> commands from the driver. It's a must to support multiqueue and other
> configurations.
>
> Shadow VirtQueue (SVQ) already makes possible migration of virtqueue
> states, effectively intercepting them so qemu can track what regions of memory
> are dirty because device action and needs migration. However, this does not
> solve networking device state seen by the driver because CVQ messages, like
> changes on MAC addresses from the driver.
>
> To solve that, this series uses SVQ infraestructure proposed to intercept
> networking control messages used by the device. This way, qemu is able to
> update VirtIONet device model and to migrate it.
>
> However, to intercept all queues would slow device data forwarding. To solve
> that, only the CVQ must be intercepted all the time. This is achieved using
> the ASID infraestructure, that allows different translations for different
> virtqueues. The most updated kernel part of ASID is proposed at [1].
>
> You can run qemu in two modes after applying this series: only intercepting
> cvq with x-cvq-svq=on or intercept all the virtqueues adding cmdline x-svq=on:
>
> -netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=vhost-vdpa0,x-cvq-svq=on,x-svq=on
>
> First three patches enable the update of the virtio-net device model for each
> CVQ message acknoledged by the device.
>
> Patches from 5 to 9 enables individual SVQ to copy the buffers to QEMU's VA.
> This allows simplyfing the memory mapping, instead of map all the guest's
> memory like in the data virtqueues.
>
> Patch 10 allows to inject control messages to the device. This allows to set
> state to the device both at QEMU startup and at live migration destination. In
> the future, this may also be used to emulate _F_ANNOUNCE.
>
> Patch 11 updates kernel headers, but it assign random numbers to needed ioctls
> because they are still not accepted in the kernel.
>
> Patches 12-16 enables the set of the features of the net device model to the
> vdpa device at device start.
>
> Last ones enables the sepparated ASID and SVQ.
>
> Comments are welcomed.


As discussed, I think we need to split this huge series into smaller ones:

1) shadow CVQ only, this makes rx-filter-event work
2) ASID support for CVQ

And for 1) we need consider whether or not it could be simplified.

Or do it in reverse order, since if we do 1) first, we may have security 
issues.

Thoughts?

Thanks


>
> TODO:
> * Fallback on regular CVQ if QEMU cannot isolate in its own ASID by any
>    reason, blocking migration. This is tricky, since it can cause that the VM
>    cannot be migrated anymore, so some way of block it must be used.
> * Review failure paths, some are with TODO notes, other don't.
>
> Changes from rfc v7:
> * Don't map all guest space in ASID 1 but copy all the buffers. No need for
>    more memory listeners.
> * Move net backend start callback to SVQ.
> * Wait for device CVQ commands used by the device at SVQ start, avoiding races.
> * Changed ioctls, but they're provisional anyway.
> * Reorder commits so refactor and code adding ones are closer to usage.
> * Usual cleaning: better tracing, doc, patches messages, ...
>
> Changes from rfc v6:
> * Fix bad iotlb updates order when batching was enabled
> * Add reference counting to iova_tree so cleaning is simpler.
>
> Changes from rfc v5:
> * Fixes bad calculus of cvq end group when MQ is not acked by the guest.
>
> Changes from rfc v4:
> * Add missing tracing
> * Add multiqueue support
> * Use already sent version for replacing g_memdup
> * Care with memory management
>
> Changes from rfc v3:
> * Fix bad returning of descriptors to SVQ list.
>
> Changes from rfc v2:
> * Fix use-after-free.
>
> Changes from rfc v1:
> * Rebase to latest master.
> * Configure ASID instead of assuming cvq asid != data vqs asid.
> * Update device model so (MAC) state can be migrated too.
>
> [1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx.com/
>
> Eugenio Pérez (21):
>    virtio-net: Expose ctrl virtqueue logic
>    vhost: Add custom used buffer callback
>    vdpa: control virtqueue support on shadow virtqueue
>    virtio: Make virtqueue_alloc_element non-static
>    vhost: Add vhost_iova_tree_find
>    vdpa: Add map/unmap operation callback to SVQ
>    vhost: move descriptor translation to vhost_svq_vring_write_descs
>    vhost: Add SVQElement
>    vhost: Add svq copy desc mode
>    vhost: Add vhost_svq_inject
>    vhost: Update kernel headers
>    vdpa: delay set_vring_ready after DRIVER_OK
>    vhost: Add ShadowVirtQueueStart operation
>    vhost: Make possible to check for device exclusive vq group
>    vhost: add vhost_svq_poll
>    vdpa: Add vhost_vdpa_start_control_svq
>    vdpa: Add asid attribute to vdpa device
>    vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
>    vhost: Add reference counting to vhost_iova_tree
>    vdpa: Add x-svq to NetdevVhostVDPAOptions
>    vdpa: Add x-cvq-svq
>
>   qapi/net.json                                |  13 +-
>   hw/virtio/vhost-iova-tree.h                  |   7 +-
>   hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-
>   include/hw/virtio/vhost-vdpa.h               |   3 +
>   include/hw/virtio/vhost.h                    |   3 +
>   include/hw/virtio/virtio-net.h               |   4 +
>   include/hw/virtio/virtio.h                   |   1 +
>   include/standard-headers/linux/vhost_types.h |  11 +-
>   linux-headers/linux/vhost.h                  |  25 +-
>   hw/net/vhost_net.c                           |   5 +-
>   hw/net/virtio-net.c                          |  84 +++--
>   hw/virtio/vhost-iova-tree.c                  |  35 +-
>   hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++++++---
>   hw/virtio/vhost-vdpa.c                       | 206 +++++++++-
>   hw/virtio/virtio.c                           |   2 +-
>   net/vhost-vdpa.c                             | 294 ++++++++++++++-
>   hw/virtio/trace-events                       |  10 +-
>   17 files changed, 1012 insertions(+), 130 deletions(-)
>


