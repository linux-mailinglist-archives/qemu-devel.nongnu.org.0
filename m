Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDAA3985B9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:53:21 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNYu-0000fA-Og
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNXl-0007RH-Td
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNXk-00018Y-7M
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg+84APsNS25yQpVptn8SNrnNPDbi/ATETB/fjwsP80=;
 b=hKn+0dNVSYK6Par36ORtJdDHDCHyMSF1sjru1lfVjQCASWY87tAsXrqWd8CyZeVL/JGJCa
 NHHhojUEU9dM8sms0h1pdVjZm/fL31DbKOCrvZbjou25obkjE2YsaOEX4KWd+T76yoOcxU
 udCwgi1mCTB1x5Y9DNDtRBcrTnjHmDM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-wjyco9KUOV-cryDhxkvpBg-1; Wed, 02 Jun 2021 05:52:03 -0400
X-MC-Unique: wjyco9KUOV-cryDhxkvpBg-1
Received: by mail-pj1-f72.google.com with SMTP id
 f8-20020a17090a9b08b0290153366612f7so1142715pjp.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Zg+84APsNS25yQpVptn8SNrnNPDbi/ATETB/fjwsP80=;
 b=bayHJ8B3Rq3s52k95aCHEv0cESHdz/z9beUltPBAHy6g3vFH7IRGIQY0UMURVK17UJ
 fpBZEKmBNp/yCs4181nnFdcQ0aJ8s/q6vQ5mt8sH2aMUE/+h2qUdUVKx/0EtkFMP3cDk
 LGx2hj1zVOEde6hfUwKm0XbQWvk8fgk2Q3yaLXjs5Qn/eM54MgWD74K0tdCHIQO0IUBV
 hce3rxf51xemcT7p3AtdiHnRh4Y1T0KAgadl1GF0IVT729O2MBK89WkA+s4SNGuOaIxi
 /JCWb2MofQAe7kYuxs/sc5hobCYemvQLfJfWNjGTdy6qJYIwlN3vzZeSOuw5mdyczpy2
 m3Wg==
X-Gm-Message-State: AOAM5322XHOt7rzfdhWTVGF9dGl1eldpDXa0r2USgQT43xQ8lGy8TABb
 VKuyuAhVTFN6RYP6lVA6+wowO3caY1zaRmJ2hoFrPY7D6e4u815tuS7/BLLJs6mWxDKM3paPu76
 BlfsMhFifbuMxvSo=
X-Received: by 2002:a63:f615:: with SMTP id m21mr33231350pgh.282.1622627522949; 
 Wed, 02 Jun 2021 02:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4EOfE9UMVuhU5wQ9lpQsAAs49arqW8IAxCW/pRWiW4JPhjKI3zMbvc+Lss7x1/7mR2BYvGw==
X-Received: by 2002:a63:f615:: with SMTP id m21mr33231333pgh.282.1622627522723; 
 Wed, 02 Jun 2021 02:52:02 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c130sm14872136pfc.51.2021.06.02.02.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 02:52:02 -0700 (PDT)
Subject: Re: [RFC v3 25/29] vhost: Add custom IOTLB translations to SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-26-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ae560866-4598-3157-a0cb-e0e79b4dca42@redhat.com>
Date: Wed, 2 Jun 2021 17:51:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-26-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> Use translations added in IOVAReverseMaps in SVQ if the vhost device
> does not support the mapping of the full qemu's virtual address space.
> In other cases, Shadow Virtqueue still uses the qemu's virtual address
> of the buffer pointed by the descriptor, which has been translated
> already by qemu's VirtQueue machinery.


I'd say let stick to a single kind of translation (iova allocator) that 
works for all the cases first and add optimizations on top.


>
> Now every element needs to store the previous address also, so VirtQueue
> can consume the elements properly. This adds a little overhead per VQ
> element, having to allocate more memory to stash them. As a possible
> optimization, this allocation could be avoided if the descriptor is not
> a chain but a single one, but this is left undone.
>
> Checking also for vhost_set_iotlb_callback to send used ring remapping.
> This is only needed for kernel, and would print an error in case of
> vhost devices with its own mapping (vdpa).
>
> This could change for other callback, like checking for
> vhost_force_iommu, enable_custom_iommu, or another. Another option could
> be to, at least, extract the check of "is map(used, writable) needed?"
> in another function. But at the moment just copy the check used in
> vhost_dev_start here.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 134 ++++++++++++++++++++++++++---
>   hw/virtio/vhost.c                  |  29 +++++--
>   2 files changed, 145 insertions(+), 18 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 934d3bb27b..a92da979d1 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -10,12 +10,19 @@
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost.h"
>   #include "hw/virtio/virtio-access.h"
> +#include "hw/virtio/vhost-iova-tree.h"
>   
>   #include "standard-headers/linux/vhost_types.h"
>   
>   #include "qemu/error-report.h"
>   #include "qemu/main-loop.h"
>   
> +typedef struct SVQElement {
> +    VirtQueueElement elem;
> +    void **in_sg_stash;
> +    void **out_sg_stash;


Any reason for the trick like this?

Can we simply use iovec and iov_copy() here?

Thanks



