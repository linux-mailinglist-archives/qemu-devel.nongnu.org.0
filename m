Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F8612161
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooh9a-0004tt-7I; Sat, 29 Oct 2022 04:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooh9E-0004qi-Ij
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooh98-0002l0-Fm
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667031889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kw/FHtiZvgWRLBUu+6E3JOpTBV74bkbi7gMY0x4Nzk=;
 b=Nks2b3fCTMvEW+Zj3vmE6RpmshgIWqjpG4gBNgWSxpjMhjOSGNKp6ez572ofzz7WrhIXlx
 jdSYIXsh96RD05qKeuM4TInI3F8dJ83HhQtx7ZXqLfkA76xFmldln85uE8mnoWCYCwWcfH
 yPOLgjVqJxBxR3pGmDCeTPwgnpLtYTM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-wXB6mvlWNS6bJe8ssgOdXw-1; Sat, 29 Oct 2022 04:24:46 -0400
X-MC-Unique: wXB6mvlWNS6bJe8ssgOdXw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso1537748wrb.18
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 01:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kw/FHtiZvgWRLBUu+6E3JOpTBV74bkbi7gMY0x4Nzk=;
 b=MfIrYf/EVSXq46FPKcsCOpQyzWpi33idOI8qJ7Ze1yejGZicMcrgb6OZatJtUVT/qH
 Kphnn6231GvDph2nKUEAZvxDZ6lOK8LYU14vtXkfSi1f0WuNxdYTXFfgIUtSluKVFsmI
 zhfWvZTpEkmoSQnCNb5RjDmMYXRz1PCk4si3f4imh+7unBsjawzE6TZYYIGCpsJGAE/Q
 1+sOreBTkfi1hHsgn4xVi/I5b9ZU++DzBZCA0ztAHBpP3k3ytXVH1P6j+sz19RDaXq00
 pOjtdOhyjYz/3WGMTd8uFcYXS+xwJ7R53KrEYZkyKnkFAntipDuscPjoblRxuXgXbHmn
 QlFw==
X-Gm-Message-State: ACrzQf16Hnf4780gxp5LN0ak4Fc4yWt0aP6kwukkWMQkNictbeyzFSov
 D4TPBlhms+2bFvMkzAzTMFYXzCiuzDepXMW73yOHj7xDVnCzrtGza1ixN6Oa+noHKRB8w9G6VH0
 4G/WhDWVmceEOgQA=
X-Received: by 2002:a05:600c:4252:b0:3cf:678a:d189 with SMTP id
 r18-20020a05600c425200b003cf678ad189mr782057wmm.51.1667031884039; 
 Sat, 29 Oct 2022 01:24:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Fv+AyBghFRaMvMN7AtUiONBojpsCHloVpg7Q42g/gW5IAsVcY+pXgwVa43sDLKrNab3phZg==
X-Received: by 2002:a05:600c:4252:b0:3cf:678a:d189 with SMTP id
 r18-20020a05600c425200b003cf678ad189mr782049wmm.51.1667031883837; 
 Sat, 29 Oct 2022 01:24:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003cf55844453sm962784wmp.22.2022.10.29.01.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:24:43 -0700 (PDT)
Date: Sat, 29 Oct 2022 04:24:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 3/3] vhost_vdpa: move VIRTIO_NET_F_STATUS handling to
 vhost_net
Message-ID: <20221029042423-mutt-send-email-mst@kernel.org>
References: <20221028151917.260038-1-eperezma@redhat.com>
 <20221028151917.260038-4-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028151917.260038-4-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

On Fri, Oct 28, 2022 at 05:19:17PM +0200, Eugenio Pérez wrote:
> Since it is emulated on all vhost backends it makes sense to move it.
> 
> Although this feature can be emulated by qemu it benefits from
> information from the device. Ack it as long as the guest ack it.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

So I assume Jason's tree too?


> ---
>  hw/net/vhost_net.c | 13 +++++++++++++
>  net/vhost-vdpa.c   |  1 -
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b974b..b533744211 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -127,8 +127,21 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
>  
>  void vhost_net_ack_features(struct vhost_net *net, uint64_t features)
>  {
> +    static const int status_feature_bit[] = {
> +        VIRTIO_NET_F_STATUS,
> +        VHOST_INVALID_FEATURE_BIT,
> +    };
> +
>      net->dev.acked_features = net->dev.backend_features;
>      vhost_ack_features(&net->dev, vhost_net_get_feature_bits(net), features);
> +    if (net->dev.features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
> +        /*
> +         * If device support _F_STATUS qemu should ack it so it reports link
> +         * status changes. If not supported qemu emulates it reporting an
> +         * always up link.
> +         */
> +        vhost_ack_features(&net->dev, status_feature_bit, features);
> +    }
>  }
>  
>  uint64_t vhost_net_get_max_queues(VHostNetState *net)
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6d64000202..854b27186c 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -72,7 +72,6 @@ const int vdpa_feature_bits[] = {
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_HASH_REPORT,
>      VIRTIO_NET_F_GUEST_ANNOUNCE,
> -    VIRTIO_NET_F_STATUS,
>      VHOST_INVALID_FEATURE_BIT
>  };
>  
> -- 
> 2.31.1


