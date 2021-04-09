Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FD35961E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:13:37 +0200 (CEST)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlKi-00014o-Q0
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlJf-0000dH-ET
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlJd-0005dY-Ib
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617952348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsCIaQ3ULKEZdcwVawpAhhnTxem7JifQo4DwwXcb63k=;
 b=GwUvBgRmTsM/L7pd5ZA21Dh0KMzDcNJqAUp0nj3dJ757CYL3bo1g8WUfEpbFXTujdJhjTH
 ln3rmpzC/8mh8xXzLC33AdUntmTVtMyJ7md8GakLPpV6Es+Rhq70fmWLV/mI/y+Js/+6wF
 y/nlldtle4XRwt7T5oKdUlde66L5WHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-0MpW1spKPr2yo6u9ncRr8Q-1; Fri, 09 Apr 2021 03:12:26 -0400
X-MC-Unique: 0MpW1spKPr2yo6u9ncRr8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD8F801814
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 07:12:25 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3236EF50;
 Fri,  9 Apr 2021 07:12:19 +0000 (UTC)
Subject: Re: [PATCH v5 2/6] vhost: add new call back function for config
 interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ce3cb890-f91f-c458-4db1-b8bd19bfed02@redhat.com>
Date: Fri, 9 Apr 2021 15:12:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408093824.14985-3-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/8 ÏÂÎç5:38, Cindy Lu Ð´µÀ:
> to support configure interrupt, we need to
> Add new call back function for config interrupt.


There're brunch of capital issues.


> nowÂ this call back function only used in vhost-vdpa driver


And looks like anthoer traditional chinese character.


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/trace-events            | 2 ++
>   hw/virtio/vhost-vdpa.c            | 7 +++++++
>   include/hw/virtio/vhost-backend.h | 3 +++
>   3 files changed, 12 insertions(+)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 2060a144a2..6710835b46 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
> +
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..9ba2a2bed4 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int *fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> +}
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
> @@ -611,4 +617,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>   };
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8a6f8e2a7a..adaf6982d2 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>   
>   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> +                                       int *fd);
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -170,6 +172,7 @@ typedef struct VhostOps {
>       vhost_vq_get_addr_op  vhost_vq_get_addr;
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_set_config_call_op vhost_set_config_call;
>   } VhostOps;


Let's split the vhost-vdpa implementation into another patch.

Thanks


>   
>   extern const VhostOps user_ops;


