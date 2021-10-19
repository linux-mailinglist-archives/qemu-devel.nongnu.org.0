Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA4432EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:57:34 +0200 (CEST)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcj41-0000aV-D2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj1c-0007OI-M5
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj1a-0008D5-CW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH25ui8ir/QqGbttyecX4Ed6qlHn0MGOYkdfEIeuOgE=;
 b=GQ+IFcxRb9bjzQsnsf7Vnw1sPoLzQgdK352PFU1JFhxMnMcQdZryFWVSCyoKrgegFaD+M3
 Cr/Mbz+SJlItVMIRfZcuRrSUK8RCbTqwS/SYN2tosSCh6WiGUBB/136Rpai0pdFNHAs9XZ
 rOjQs1VplNXCxasID1HUUlObcoEXTQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-O7O7jNgQOOOX8JiC2Z_b0A-1; Tue, 19 Oct 2021 02:55:00 -0400
X-MC-Unique: O7O7jNgQOOOX8JiC2Z_b0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 z26-20020a05600c221a00b0030da55bc454so2383397wml.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YH25ui8ir/QqGbttyecX4Ed6qlHn0MGOYkdfEIeuOgE=;
 b=3vkvhr/BZTb8xMo6AEyGm3xYHwPqpYnhrGZJiAK4LDV1nCRCG5bE7ehqLTKVj7zcsN
 4f15SZOUJgR2myQzC53cfPiWrY6dLlBs1jtbB3FihH3T8IkAsPJ+aW4tHqCQtevp8CAB
 yblD9WYglvlxbk1SbIY/s/karYQNj92MVYimMsZU7/M8QPCjP7ZRca+sMuobEnaGE8J9
 OrhpzpLto+RXOevBd0jYeVeV0Qr4ZBremViwsLTR9ZaLrgEeSOGTed54I+tAAcSD50Z3
 LmGNzikWdYoNy71Z5cjkJuFEkQ6qDCr7ar1ewxHshM9AsJjuYq2bgA9/fV44RBwvohjW
 7xxg==
X-Gm-Message-State: AOAM531mk8C29YZo8tfVPBYqdl4QHYbQMFk58WPWUZ5uXfBeR5/YnP/5
 fFgMzMX10xGyPofJxswNNfgAb4LOaT2c8Sx6/seaemGnE1reuwP6EhLkWWuLEFrBq08FhEOYGxJ
 26BUt1oilfnZ0u4s=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr4106645wmq.82.1634626499148; 
 Mon, 18 Oct 2021 23:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSkvxkoJWbIthQ9sRtdwNXyLiucJFYRcFbxL6oiL7usNR89Vslyzp5Hus2hRIxj82QNuI5jg==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr4106626wmq.82.1634626498961; 
 Mon, 18 Oct 2021 23:54:58 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id e9sm9784314wrn.2.2021.10.18.23.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:54:58 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:54:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v9 05/10] vhost-vdpa: add support for config interrupt
 call back
Message-ID: <20211019025230-mutt-send-email-mst@kernel.org>
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-6-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930023348.17770-6-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:33:43AM +0800, Cindy Lu wrote:
> Add new call back function in vhost-vdpa, this call back function will
> set the fb number to hardware.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

fb being what? you mean fd. said fd doing what exactly?
all this needs to be in the commit log pls.

> ---
>  hw/virtio/trace-events | 2 ++
>  hw/virtio/vhost-vdpa.c | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8ed19e9d0c..836e73d1f7 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>  vhost_vdpa_set_owner(void *dev) "dev: %p"
>  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
> +
>  
>  # virtio.c
>  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4fa414feea..73764afc61 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -622,6 +622,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>      trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>      return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>  }
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
> +}
>  
>  static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                       uint64_t *features)
> @@ -688,4 +694,5 @@ const VhostOps vdpa_ops = {
>          .vhost_get_device_id = vhost_vdpa_get_device_id,
>          .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>          .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>  };
> -- 
> 2.21.3


