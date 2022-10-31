Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135DE6131A0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:21:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ2i-0007FI-Rp; Mon, 31 Oct 2022 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opQ2e-0007Cz-Hd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opQ2d-0000jT-3h
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667204466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=im6vMDpZ4QR8KDTirDvE233dWKuaLZGJIPJhOg4Fv98=;
 b=BcIoNmaGF3PiXe+W676CggQM+IRD47HO5GhYtIntarCA+cJjnfUeqccql391uqkfZqeCo5
 h/FuoGcnKnpSjs5aUaEIlhK+K2LhgrY0BW7H7IpqzuhMSQDsbLBcZ+geBqhUhaZVTiB8mc
 Nz0zEz6FSiiueymX0lo8K/WJfqcBmNw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-FT8FjOWNNVybzgifTPtJUw-1; Mon, 31 Oct 2022 04:21:04 -0400
X-MC-Unique: FT8FjOWNNVybzgifTPtJUw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so2823512wrg.21
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=im6vMDpZ4QR8KDTirDvE233dWKuaLZGJIPJhOg4Fv98=;
 b=Fh0s1vTTLhwLE9YQ9k9knIpAexCc/fzcIg2BFSZzeUS57ORUPdkeggpn2BA5APSGh5
 0fEkUuhsNTQRU3H84bW6dsx/bny2JZaV8a6A0d2TSmUxHhyfL8VCxkPBDT55YmmkXD+H
 I6VyvTcx2LCKeXUAAgI30CWLR/WafDgvvs0JvDfnnwrUKY+hDd2fJDz1kSjjszkzeNFr
 Wkr5LC+HzXsSMMnEMeE9RipnS/jzWD3GowqteD/+QC78xR/PH9moEWbpOnN9WPL/XFjP
 x7HhXgB6tR1cuV+N+wkLALYzBa591DegKZqCIFCpSR72IILZiuMYmINfU2iSmii+3brl
 OzfQ==
X-Gm-Message-State: ACrzQf1PGMYKmUJuDk/OlqSTChR4C+VTUk/iaWjAYzM1GNgbgzR9iQha
 VZjkVzz2T/8k9Ut/pQ9Y6VEszthGdnWwaChEElgVutw47ii4vRDJ3y4jGiMGMp8Q+J7J1VYFeyz
 jQaudNWgMxPAydu4=
X-Received: by 2002:a05:6000:1d94:b0:22e:34ef:b07f with SMTP id
 bk20-20020a0560001d9400b0022e34efb07fmr7242217wrb.272.1667204463539; 
 Mon, 31 Oct 2022 01:21:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pWhEuLLTmll7+NNqrSauhIVegJ+TqYCAjjkPUTJ1qckmTM1uMN7lpqxldGowx+uM/YWLxgQ==
X-Received: by 2002:a05:6000:1d94:b0:22e:34ef:b07f with SMTP id
 bk20-20020a0560001d9400b0022e34efb07fmr7242193wrb.272.1667204463276; 
 Mon, 31 Oct 2022 01:21:03 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t12-20020adff60c000000b002366ded5864sm6267581wrp.116.2022.10.31.01.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 01:21:02 -0700 (PDT)
Date: Mon, 31 Oct 2022 04:20:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH v5 2/6] vdpa: Allocate SVQ unconditionally
Message-ID: <20221031041821-mutt-send-email-mst@kernel.org>
References: <20221011104154.1209338-1-eperezma@redhat.com>
 <20221011104154.1209338-3-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011104154.1209338-3-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 11, 2022 at 12:41:50PM +0200, Eugenio Pérez wrote:
> SVQ may run or not in a device depending on runtime conditions (for
> example, if the device can move CVQ to its own group or not).
> 
> Allocate the resources unconditionally, and decide later if to use them
> or not.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

I applied this for now but I really dislike it that we are wasting
resources like this.

Can I just drop this patch from the series? It looks like things
will just work anyway ...

I know, when one works on a feature it seems like everyone should
enable it - but the reality is qemu already works quite well for
most users and it is our resposibility to first do no harm.


> ---
>  hw/virtio/vhost-vdpa.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7f0ff4df5b..d966966131 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -410,6 +410,21 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>      int r;
>      bool ok;
>  
> +    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> +    for (unsigned n = 0; n < hdev->nvqs; ++n) {
> +        g_autoptr(VhostShadowVirtqueue) svq;
> +
> +        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> +                            v->shadow_vq_ops_opaque);
> +        if (unlikely(!svq)) {
> +            error_setg(errp, "Cannot create svq %u", n);
> +            return -1;
> +        }
> +        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> +    }
> +
> +    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
> +
>      if (!v->shadow_vqs_enabled) {
>          return 0;
>      }
> @@ -426,20 +441,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>          return -1;
>      }
>  
> -    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> -    for (unsigned n = 0; n < hdev->nvqs; ++n) {
> -        g_autoptr(VhostShadowVirtqueue) svq;
> -
> -        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> -                            v->shadow_vq_ops_opaque);
> -        if (unlikely(!svq)) {
> -            error_setg(errp, "Cannot create svq %u", n);
> -            return -1;
> -        }
> -        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> -    }
> -
> -    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
>      return 0;
>  }
>  
> @@ -580,10 +581,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
>      struct vhost_vdpa *v = dev->opaque;
>      size_t idx;
>  
> -    if (!v->shadow_vqs) {
> -        return;
> -    }
> -
>      for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
>          vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
>      }
> -- 
> 2.31.1


