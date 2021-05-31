Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC13957CE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 11:04:15 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lndqH-0003O2-Or
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 05:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lndoF-00022J-7w
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lndoB-0001Dx-Jc
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622451721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIfKHYGoxDAlco9EwYWb84ApD4P9OUzvy3umVjsoEYY=;
 b=PkUVSlgfPGfGoMs1isP/NqeUuvF+NOhimA0BIpQlBa+pSMgTkefhsTZD4LIDRvdEbproZm
 Vbp5sroopZ3pQHrkk57WLv4gP6zwyIMAi/LZpFyhaDEeDxnP5O/HfZZ20NgUCof81bP7Hz
 j6Nid7EcZiQcGrscJKXmn3v8BOU/LIM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-utdY6jupNYGVbwP6llN7XA-1; Mon, 31 May 2021 05:02:00 -0400
X-MC-Unique: utdY6jupNYGVbwP6llN7XA-1
Received: by mail-pj1-f70.google.com with SMTP id
 fu20-20020a17090ad194b0290163ff5d5867so2329057pjb.2
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RIfKHYGoxDAlco9EwYWb84ApD4P9OUzvy3umVjsoEYY=;
 b=d2zbYoJIOInk4enWqzFZBOWGF+NmrS5fI3Bg8EsTVSkEuzkkR174hRqQrLrkE1Wj5s
 3de6KWMlvgU7HA2OV5PTPPCviOkTUmCpqi1si7EqTCx3/sL5+1ZX4Lk63Q1hvKFbTpQV
 RGvWki9vi2ssSdU5Mh9bCFaD+A67+PJ0MPPn3es53FMj5oTPVSsrhZXZ0o1xAbFPLbS4
 lYcYiw5VrMN3r4bN7uqeLUdOtohqooDEk3WYqikkHs3HoUU4+TPFdU5kz1K8L3EL0hkf
 N0XaM0rZ2/GgJzF7VBhIHoKZPLMdVZ/mhfKehM1wdnNkXqjTH6Re2fQhIKvkD0D1vnfL
 VSKA==
X-Gm-Message-State: AOAM531HITIhI0izQ8WQ53d3E1amppUg4/9QxgBlX2DpV7Er+lzJCIXE
 UUAshhiMA8VwhQX9+NCOfjezeMKMkj4vL+zs04gDvQl+Q1W+TxyADyhjAC6a/t1Dfe0xI9zEx5q
 F0eG01PBeUw9MpoI=
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id
 f16-20020a170902ce90b02900f772beb420mr19897905plg.67.1622451718684; 
 Mon, 31 May 2021 02:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2hdeqGMIfYNTYU8clc9+twdeQAe/m+mhJ7pDFqRy5UGF8hWFQbXEkh+rIP/5mvOlabo0rwg==
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id
 f16-20020a170902ce90b02900f772beb420mr19897872plg.67.1622451718392; 
 Mon, 31 May 2021 02:01:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s9sm10333699pfm.120.2021.05.31.02.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 02:01:57 -0700 (PDT)
Subject: Re: [RFC v3 15/29] vhost: Add enable_custom_iommu to VhostOps
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-16-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8ba8f8fa-cab8-24c6-5226-b5ae372cd84b@redhat.com>
Date: Mon, 31 May 2021 17:01:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-16-eperezma@redhat.com>
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
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
> This operation enable the backend-specific IOTLB entries.
>
> If a backend support this, it start managing its own entries, and vhost
> can disable it through this operation and recover control.
>
> Every enable/disable operation must also clear all IOTLB device entries.
>
> At the moment, the only backend that does so is vhost-vdpa. To fully
> support these, vdpa needs also to expose a way for vhost subsystem to
> map and unmap entries. This will be done in future commits.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I think there's probably no need to introduce this helper.

Instead, we can introduce ops like shadow_vq_start()/stop(). Then the 
details like this could be hided there.

(And hide the backend deatils (avoid calling vhost_vdpa_dma_map()) 
directly from the vhost.c)

Thanks


> ---
>   include/hw/virtio/vhost-backend.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index bcb112c166..f8eed2ace5 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -128,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
>   typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_enable_custom_iommu_op)(struct vhost_dev *dev,
> +                                            bool enable);
> +
>   typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
>                                       hwaddr *first, hwaddr *last);
>   
> @@ -177,6 +180,7 @@ typedef struct VhostOps {
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_vring_pause_op vhost_vring_pause;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_enable_custom_iommu_op vhost_enable_custom_iommu;
>       vhost_get_iova_range vhost_get_iova_range;
>   } VhostOps;
>   


