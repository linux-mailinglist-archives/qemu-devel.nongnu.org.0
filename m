Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D160EA88
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnIO-000133-Sx; Wed, 26 Oct 2022 16:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnIK-0000RS-Cs
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnIB-00012W-F2
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666817185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLDfktWHU69scAACtHvTmKiGE7E7RxH9U5HNYSEfkHs=;
 b=IIcZBbwky4/rbndpVztscVEwg+O3CMHIma5BDHux591Du+bi1P9FvSdBoSWY91izO11rVb
 AgrOKUNh8Ns0S5wwlpK6H60iQTdlTmHbxDEaXLZAVCf7viYWXbP08HoI6nxbnjJK3fgIt3
 Czq3dnDCTLPvzrYBcIYR0OsW73Q58C4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-9ulRCV52MTKRkjaUaZmE5w-1; Wed, 26 Oct 2022 16:46:24 -0400
X-MC-Unique: 9ulRCV52MTKRkjaUaZmE5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso1724241wmq.1
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLDfktWHU69scAACtHvTmKiGE7E7RxH9U5HNYSEfkHs=;
 b=qTaDp1o2gCHLSjLO0h6vc/CuPPB6+cZZG2B7PrUDsBSnn4ECazAzW8Xbu1frDmZbcr
 cb6j4a+eaLXXkfHpXHJCzThGlatPFlH2x1W77+YJI0QbD4tL+QPZkC4iY5p435YlgzC3
 CHJFE8Bs4U1osjibgLeen0T0PJXbE14E+oI5LA4mjOjdxRGxMGo1yyvd2GbP7LfCtc/Z
 Zz4acOg4DvEDEUz3gtNiIamj6/sCdAdf+HG4MvV6Yk+DusK50pZo8GKQUa3BMQs2FAZV
 QaN7d061eqI/XDKveGrmIkpWrUUQ8jmndsk9R1HN4iHIby0JSwlmoEkopFTNqGs9T9nx
 XkAg==
X-Gm-Message-State: ACrzQf3wrhxpXY4VHM7ltsqL3/Kz+etJXbWN2W7TIC1lOCcmhBVpxa9a
 7nx0uYZnDBHRxbpsGJaTOcAMqe/778vc4Am7+Q+O+JTmy/7Vk4he4FiipEbVLpg266mVkg9eA2i
 P5TEh4LKcU19RhaE=
X-Received: by 2002:a05:600c:474a:b0:3c7:6df:4493 with SMTP id
 w10-20020a05600c474a00b003c706df4493mr3792130wmo.44.1666817181977; 
 Wed, 26 Oct 2022 13:46:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QCqNOYY94UCR49mSaq/OC/1mLBl4zB6wjxzitYJuuBxMkh2TJoZAirE8P9K6g3pz+7U6/sw==
X-Received: by 2002:a05:600c:474a:b0:3c7:6df:4493 with SMTP id
 w10-20020a05600c474a00b003c706df4493mr3792112wmo.44.1666817181651; 
 Wed, 26 Oct 2022 13:46:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c29cf00b003c6c3fb3cf6sm2738905wmd.18.2022.10.26.13.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:46:21 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:46:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>,
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/7] Guest announce feature emulation using Shadow
 VirtQueue
Message-ID: <20221026164544-mutt-send-email-mst@kernel.org>
References: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020103429.347525-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, Oct 20, 2022 at 12:34:22PM +0200, Eugenio Pérez wrote:
> A gratuitous ARP is recommended after a live migration to reduce the amount of
> time needed by the network links to be aware of the new location. A hypervisor
> may not have the knowledge of the guest network configuration, and this is
> especially true on passthrough devices, so its simpler to ask the guest to
> do it.
> 
> However, the device control part of this feature can be totally emulated by
> qemu and shadow virtqueue, not needing any special feature from the actual
> vdpa device.
> 
> VIRTIO_NET_F_STATUS is also needed for the guest to access the status of
> virtio net config where announcement status bit is set. Emulating it as
> always active in case backend does not support it.
> 
> This series need two fixes applied:
> * https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03242.html
> * https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03241.html


Jason you seem to have queued these so you will have to take
this patchset too.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> v1:
> * Move code from vhost_net_get_config to virtio_net_get_config.
> 
> RFC v2:
> * Add VIRTIO_NET_F_STATUS emulation.
> 
> Eugenio Pérez (7):
>   vdpa: Save emulated features list in vhost_vdpa
>   virtio_net: Modify virtio_net_get_config to early return
>   virtio_net: Handle _F_STATUS emulation in virtio_net_get_config
>   vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
>   vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
>     vhost_vdpa_net_handle_ctrl_avail
>   virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model has it
>   vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if SVQ is enabled
> 
>  include/hw/virtio/vhost-vdpa.h |  2 ++
>  hw/net/virtio-net.c            | 40 +++++++++++++++++++++-------------
>  hw/virtio/vhost-vdpa.c         |  8 +++----
>  net/vhost-vdpa.c               | 25 ++++++++++++++++++---
>  4 files changed, 53 insertions(+), 22 deletions(-)
> 
> -- 
> 2.31.1
> 


