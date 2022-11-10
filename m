Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CE624255
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:26:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6ch-0001Iq-GN; Thu, 10 Nov 2022 07:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ot6cW-0001Gn-29
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ot6cT-00041X-V2
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668083121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9sOq3ArB3nGOxvV39adhirp0xPiw6BD46Br6A3jim4=;
 b=f0hy8ucXxMdtyqARk53CWI67tT6S/0Il9/vrlvnT1rpDyTzPFAPDPJ1lGuT5OpIl8pSzVG
 zoR1kS90yM3MD15Mu7bxFke/vLow4AQdqb9KszcDyoEKw7jM37SKGlo51+STlsXw730AAq
 M1hz6KtypT7QJNhIxYF+zwpwvQA7Hoo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-Q0t4tepAPWuv5peWvx2jBg-1; Thu, 10 Nov 2022 07:25:20 -0500
X-MC-Unique: Q0t4tepAPWuv5peWvx2jBg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so308263wru.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9sOq3ArB3nGOxvV39adhirp0xPiw6BD46Br6A3jim4=;
 b=2mWjcanHfvkuQ0j+NjlXrSbXLnoFWpVoY1WBN9XzPDJbAtydYmnyrTxd98CYuVRWm9
 e/eX0uU67GmnaTXxhqOgYgqSNAbkqrw/1ApLFlWs0q2or26lBai2Y8B7TJSfkhcfUxpr
 ll57/zMZCwZsCLOOmKKBiS+X3RzgdfZiygBIoTb2haEyN7tXe//QFJtA1t5Q0mHs5z6Y
 FekKcufUrPh0d8NgXbpIfPqzaS1yo/4M3cwLywu7IZeS+Nttg1WGeIfKqmxfWbTaql/L
 lTwnGHCwxj5C45fv5uZ0DrzHcFn52Ywwca1hhvjwuEZKtrBM2DU0N3Xq+4z3zY5RL7bL
 9DqQ==
X-Gm-Message-State: ACrzQf3VNIrQQtXumqadTt2eh/hpQy5W7hLv4MQgabqomC3s14hsHMy2
 1O59NOX2z5SdrwBKyAJUU78uUCPxMEN59qNET0nOXUUNZGA4ffZ8HJZ0HduiHmXbYyPEGfuMgP+
 /dQuSWX+2gVLPzck=
X-Received: by 2002:a5d:524e:0:b0:236:6a61:3b92 with SMTP id
 k14-20020a5d524e000000b002366a613b92mr41610104wrc.328.1668083119177; 
 Thu, 10 Nov 2022 04:25:19 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5VfDGphCWD0wa/3ITH7C2PrQKLc6MdsOLKLzBuXOa0/FOieRvBzvsJePXHxj/NtZCzwdRbIA==
X-Received: by 2002:a5d:524e:0:b0:236:6a61:3b92 with SMTP id
 k14-20020a5d524e000000b002366a613b92mr41610077wrc.328.1668083118894; 
 Thu, 10 Nov 2022 04:25:18 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5404000000b00228d52b935asm16032641wrv.71.2022.11.10.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 04:25:18 -0800 (PST)
Date: Thu, 10 Nov 2022 07:25:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 00/10] ASID support in vhost-vdpa net
Message-ID: <20221110072455-mutt-send-email-mst@kernel.org>
References: <20221108170755.92768-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108170755.92768-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 06:07:45PM +0100, Eugenio Pérez wrote:
> Control VQ is the way net devices use to send changes to the device state, like
> the number of active queues or its mac address.
> 
> QEMU needs to intercept this queue so it can track these changes and is able to
> migrate the device. It can do it from 1576dbb5bbc4 ("vdpa: Add x-svq to
> NetdevVhostVDPAOptions"). However, to enable x-svq implies to shadow all VirtIO
> device's virtqueues, which will damage performance.
> 
> This series adds address space isolation, so the device and the guest
> communicate directly with them (passthrough) and CVQ communication is split in
> two: The guest communicates with QEMU and QEMU forwards the commands to the
> device.
> 
> Comments are welcome. Thanks!


This is not 7.2 material, right?

> v6:
> - Do not allocate SVQ resources like file descriptors if SVQ cannot be used.
> - Disable shadow CVQ if the device does not support it because of net
>   features.
> 
> v5:
> - Move vring state in vhost_vdpa_get_vring_group instead of using a
>   parameter.
> - Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> 
> v4:
> - Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> - Squash vhost_vdpa_cvq_group_is_independent.
> - Do not check for cvq index on vhost_vdpa_net_prepare, we only have one
>   that callback registered in that NetClientInfo.
> - Add comment specifying behavior if device does not support _F_ASID
> - Update headers to a later Linux commit to not to remove SETUP_RNG_SEED
> 
> v3:
> - Do not return an error but just print a warning if vdpa device initialization
>   returns failure while getting AS num of VQ groups
> - Delete extra newline
> 
> v2:
> - Much as commented on series [1], handle vhost_net backend through
>   NetClientInfo callbacks instead of directly.
> - Fix not freeing SVQ properly when device does not support CVQ
> - Add BIT_ULL missed checking device's backend feature for _F_ASID.
> 
> Eugenio Pérez (10):
>   vdpa: Use v->shadow_vqs_enabled in vhost_vdpa_svqs_start & stop
>   vhost: set SVQ device call handler at SVQ start
>   vhost: Allocate SVQ device file descriptors at device start
>   vdpa: add vhost_vdpa_net_valid_svq_features
>   vdpa: move SVQ vring features check to net/
>   vdpa: Allocate SVQ unconditionally
>   vdpa: Add asid parameter to vhost_vdpa_dma_map/unmap
>   vdpa: Store x-svq parameter in VhostVDPAState
>   vdpa: Add listener_shadow_vq to vhost_vdpa
>   vdpa: Always start CVQ in SVQ mode
> 
>  include/hw/virtio/vhost-vdpa.h     |  10 +-
>  hw/virtio/vhost-shadow-virtqueue.c |  35 +-----
>  hw/virtio/vhost-vdpa.c             | 114 ++++++++++---------
>  net/vhost-vdpa.c                   | 171 ++++++++++++++++++++++++++---
>  hw/virtio/trace-events             |   4 +-
>  5 files changed, 222 insertions(+), 112 deletions(-)
> 
> -- 
> 2.31.1
> 


