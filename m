Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E532AE8F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 03:55:01 +0100 (CET)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHHfA-0001Pl-9D
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 21:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHHe0-0000zB-H6
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHHdx-00084I-KG
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614740024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+7ZcOrrEnDK9h6LFRWi3kzifcI13AT7pW+Ot6VN230=;
 b=ZJlhO1b5eazJioribtyIUWe9DyJ8GG4xubKI2py+Dg8V1oag8RA3b7EEaxKsD5dBouAxKj
 MxLJ/C6FuS23jYKmx+1Cf9leV75SF+6CC3nau0GbZoXctY8egG1MURbk0cXfdhxZAi54AM
 NMgBHbBRD7DyMmaRYjXn7kQOTUxxpnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-jAOxuQ36OKuVdgA52nXEEg-1; Tue, 02 Mar 2021 21:53:40 -0500
X-MC-Unique: jAOxuQ36OKuVdgA52nXEEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE78B10066F1;
 Wed,  3 Mar 2021 02:53:38 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-128.pek2.redhat.com
 [10.72.12.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963A719C48;
 Wed,  3 Mar 2021 02:53:30 +0000 (UTC)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Xie Yongji <xieyongji@bytedance.com>
References: <20210302162129.52912-1-david@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <81c675cd-1573-7555-7d20-07b0ed950ebb@redhat.com>
Date: Wed, 3 Mar 2021 10:53:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302162129.52912-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/3 12:21 上午, David Hildenbrand wrote:
> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
> that used to be discarded will get re-populated and if we
> discard+re-access memory after mapping+pinning, the pages mapped into the
> vDPA IOMMU will go out of sync with the actual pages mapped into the user
> space page tables.
>
> Set discarding of RAM broken such that:
> - virtio-mem and vhost-vdpa run mutually exclusive
> - virtio-balloon is inhibited and no memory discards will get issued
>
> In the future, we might be able to support coordinated discarding of RAM
> as used by virtio-mem and as planned for VFIO.
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>
> Note: I was not actually able to reproduce/test as I fail to get the
> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa, vhost_vdpa,
> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa devices
> appear under /sys/bus/vdpa/devices/ or /dev/).


The device creation was switched to use vdpa tool that is integrated 
with iproue2[1].

[1] 
https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=143610383da51e1f868c6d5a2a5e2fb552293d18


>
> ---
>   hw/virtio/vhost-vdpa.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..86058d4041 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -278,6 +278,17 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
>       uint64_t features;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       trace_vhost_vdpa_init(dev, opaque);
> +    int ret;
> +
> +    /*
> +     * Similar to VFIO, we end up pinning all guest memory and have to
> +     * disable discarding of RAM.
> +     */
> +    ret = ram_block_discard_disable(true);
> +    if (ret) {
> +        error_report("Cannot set discarding of RAM broken");
> +        return ret;
> +    }


vDPA will support non pinning (shared VM) backend soon[2]. So I guess we 
need a flag to be advertised to usersapce then we can conditionly enable 
the discard here.

[2] https://www.spinics.net/lists/netdev/msg723944.html

Thanks


>   
>       v = opaque;
>       v->dev = dev;
> @@ -302,6 +313,8 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       memory_listener_unregister(&v->listener);
>   
>       dev->opaque = NULL;
> +    ram_block_discard_disable(false);
> +
>       return 0;
>   }
>   


