Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585C654C68
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 07:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8bJy-0001S8-5g; Fri, 23 Dec 2022 01:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8bJt-0001Qm-NA
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 01:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8bJr-0003xs-1N
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 01:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671776047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsM+/wfHpfg8Me/8wtsIelcG9nyNw5a3jcfgv4wkZrc=;
 b=LRQiYnMNStK9j8C9d6+eMq3/vq8AULdt8l4t9Oqo9SkVVFzsOGXvqAWTDvmwEbRyFjCpJ1
 zPVaD0vCOxJpz8yAtwjXVW66Emwap+KFhqFQ7X2cNBlQy5Zw/DoWmaNw/l1rnfNAzKKrVk
 GAFsDLKpDTB7S06zblHndBytWRGWRk4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-ABMFvHO2PlyA9sNKq8a__Q-1; Fri, 23 Dec 2022 01:14:06 -0500
X-MC-Unique: ABMFvHO2PlyA9sNKq8a__Q-1
Received: by mail-pl1-f199.google.com with SMTP id
 z3-20020a170903018300b0018fb8ca1688so2898155plg.5
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 22:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TsM+/wfHpfg8Me/8wtsIelcG9nyNw5a3jcfgv4wkZrc=;
 b=xTVT0LmUNV0v2wKEv5PQfIaqQ/5i8xFc2Ll/Rzy0W5B5O3l6n0wZ/uT0cd2LRgYr0k
 kjUPu/TLkgnIYCRT9huK3gK1zVVOMw7bIcmruijhwVDbTLC86Mp2aePpiav4lGRMw9x9
 FxSFb5p001ZaX4CYYHS2JVL6+2VZNs9ZduLoiLr4toqvK8WB3s4gwNB9hZXyaoJvmr83
 c56GXjgoQRKuM7K7T7qbbKSeOK2vl2U0z9oEvmf8HPcZTKPmE/DQEjO+0SvGeBnow/+J
 waui8jllF1zNUsfS9EfCl9m/hl61Pdmm1fduTjcMWDMli6Ph41CjbbmrHtl8ZCpVEmof
 mwrg==
X-Gm-Message-State: AFqh2kq3/ZHYGd2wlI0I7dL51hhnj4rzn7p6HfP0Q2yY4YOuNfCjFD/W
 lGO/IZ0u25CogXo/G2+WO/2+ACArxRGPYLvx/0peeqoOvo5VIU1dYcYq0ubfJK2/irk2FH+1xWf
 DM/CPMn95XiPTk18=
X-Received: by 2002:a05:6a20:13a6:b0:af:9c75:6699 with SMTP id
 w38-20020a056a2013a600b000af9c756699mr14123822pzh.1.1671776045313; 
 Thu, 22 Dec 2022 22:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtYrX8TixhbrhyqKdCe/M+JgnZncvLXg4jh74pQfdttAObCzspjHR0afUGAT5CdKPQFRI7lCQ==
X-Received: by 2002:a05:6a20:13a6:b0:af:9c75:6699 with SMTP id
 w38-20020a056a2013a600b000af9c756699mr14123801pzh.1.1671776045007; 
 Thu, 22 Dec 2022 22:14:05 -0800 (PST)
Received: from [10.72.12.204] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 g130-20020a625288000000b0056c2e497b02sm1703324pfb.173.2022.12.22.22.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 22:14:04 -0800 (PST)
Message-ID: <c95598d3-7e42-224a-6267-4608e12689f1@redhat.com>
Date: Fri, 23 Dec 2022 14:14:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v21 00/10] vhost-vdpa: add support for configure interrupt
Content-Language: en-US
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20221222070451.936503-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221222070451.936503-1-lulu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/12/22 15:04, Cindy Lu 写道:
> These patches introduced the support for configure interrupt
>
> These codes are tested on x86_64 and aarch64 platforms.
>
> the test scenario is based on vp-vdpa/vdpa_sim_net /vhost/vhost_user/testpmd,
> with/without irqfd.
>
> Tested in virtio-pci bus and virtio-mmio bus
>
>
> Change in v2:
> Add support for virtio-mmio bus
> active the notifier while the backend support configure interrupt
> misc fixes from v1
>
> Change in v3
> fix the coding style problems
>
> Change in v4
> misc fixes from v3
> merge the set_config_notifier to set_guest_notifier
> when vdpa start, check the feature by VIRTIO_NET_F_STATUS
>
> Change in v5
> misc fixes from v4
> split the code to introduce configure interrupt type and the callback function
> will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
> only active while using vhost-vdpa driver
>
> Change in v6
> misc fixes from v5
> decouple vq from interrupt setting and misc process
> fix the bug in virtio_net_handle_rx
>
> Change in v7
> misc fixes from v6
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt
>
> Change in v8
> misc fixes from v7
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move the vhost configure interrupt to vhost_net
>
> Change in v9
> misc fixes from v8
> address the comments from v8
>
> Change in v10
> fix the hang issue in qtest
> address the comments from v9
>
> Change in v11
> fix the crash in aarch64 plateform.
> fix the crash upstream reported
>
> Change in v12
> fix the typo and the comments
>
> changes in v13
> re-send the patches by git-publish
>
> changes in v14
> rebased the code based on upstream
>
> changes in v15
> rebased the code based on upstream
>
> changes in v16
> resend the patch, seems there not send successfully
>
> changes in v18
> fix the crash in qtest
> Because hw/virtio/vhost-user-gpio.c is a new device,So I missed
> to add the VIRTIO_CONFIG_IRQ_IDX check in notifier_mask
>
> changes in v19
> fix the crash in qtest
> rebased the code based on upstream
>
> changes in v20
> fix the compile issue in mingw32


For the series

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>
> Cindy Lu (10):
>    virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
>    virtio-pci: decouple notifier from interrupt process
>    virtio-pci: decouple the single vector from the interrupt process
>    vhost: introduce new VhostOps vhost_set_config_call
>    vhost-vdpa: add support for config interrupt
>    virtio: add support for configure interrupt
>    vhost: add support for configure interrupt
>    virtio-net: add support for configure interrupt
>    virtio-mmio: add support for configure interrupt
>    virtio-pci: add support for configure interrupt
>
>   hw/display/vhost-user-gpu.c       |  18 ++
>   hw/net/vhost_net-stub.c           |   9 +
>   hw/net/vhost_net.c                |   9 +
>   hw/net/virtio-net.c               |  22 ++-
>   hw/virtio/trace-events            |   1 +
>   hw/virtio/vhost-user-fs.c         |  18 ++
>   hw/virtio/vhost-user-gpio.c       |  10 +
>   hw/virtio/vhost-vdpa.c            |   8 +
>   hw/virtio/vhost-vsock-common.c    |  18 ++
>   hw/virtio/vhost.c                 |  78 +++++++-
>   hw/virtio/virtio-crypto.c         |  18 ++
>   hw/virtio/virtio-mmio.c           |  27 +++
>   hw/virtio/virtio-pci.c            | 291 +++++++++++++++++++++---------
>   hw/virtio/virtio.c                |  29 +++
>   include/hw/virtio/vhost-backend.h |   3 +
>   include/hw/virtio/vhost.h         |   4 +
>   include/hw/virtio/virtio-pci.h    |   4 +-
>   include/hw/virtio/virtio.h        |   7 +
>   include/net/vhost_net.h           |   2 +
>   19 files changed, 487 insertions(+), 89 deletions(-)
>


