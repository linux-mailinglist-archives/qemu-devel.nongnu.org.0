Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E7273839
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 03:57:04 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKXYF-0003Oo-Bv
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 21:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kKXWM-0002kZ-Ep
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 21:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kKXWJ-00010p-PS
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 21:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600739702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7HR886flX/6ypC227zOY3RqICeZIpZA1edTbcB5Al0=;
 b=BTwLPssCwpP+4E5GcDPvyDrzDcXUewjp3eeupTWRspBWzOoICSLfSNLKYUAacKuyTRRIDd
 znE4Us9BFYzxLhoUjxpzE+kXGhCYY4F36PfS50dcBteXer5n5SVbL5T1bHcDd0UdkZOoJS
 h6ExSI2Q80s7DKVBt6I8+gLFC7JabrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-GcZ_XmXYNc27uPAvdv6bZw-1; Mon, 21 Sep 2020 21:55:00 -0400
X-MC-Unique: GcZ_XmXYNc27uPAvdv6bZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 116271084D6B;
 Tue, 22 Sep 2020 01:54:59 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC5A87366D;
 Tue, 22 Sep 2020 01:54:54 +0000 (UTC)
Subject: Re: [PATCH 1/3] virtio-net: Set mac address to hardware if the peer
 is vdpa
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20200917155851.20636-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b5ac3a30-6d81-117c-37af-e16b9a21ddad@redhat.com>
Date: Tue, 22 Sep 2020 09:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917155851.20636-1-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/17 下午11:58, Cindy Lu wrote:
> If the peer's type is vdpa,set the mac address to NIC in virtio_net_device_realize,
> Also sometime vdpa get an all 0 macaddress from the hardware, this will cause the traffic down
> So we add the check for this part.
> if we get an 0 mac address we will use the default mac address instead
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/virtio-net.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cb0d27084c..7db9da1482 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>       VirtIONet *n = VIRTIO_NET(vdev);
>       struct virtio_net_config netcfg;
>       NetClientState *nc = qemu_get_queue(n->nic);
> +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>   
>       int ret = 0;
>       memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> @@ -151,7 +152,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>           ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>                                      n->config_size);
>           if (ret != -1) {
> -            memcpy(config, &netcfg, n->config_size);
> +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) != 0) {
> +                memcpy(config, &netcfg, n->config_size);
> +        } else {
> +                error_report("Get an all zero mac address from hardware");


This is probably a hint that MAC is not properly provisioned.

So I guess we can leave this as is, or simply warn until the management 
interface is finalized.


> +            }
>           }
>       }
>   }
> @@ -3399,6 +3404,11 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>       nc = qemu_get_queue(n->nic);
>       nc->rxfilter_notify_enabled = 1;
>   
> +   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        struct virtio_net_config netcfg = {};
> +        memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> +        virtio_net_set_config(vdev, (uint8_t *)&netcfg);


Won't this overwrite all other fields in the netcfg? I think we should 
only touch mac part.

Thanks


> +    }
>       QTAILQ_INIT(&n->rsc_chains);
>       n->qdev = dev;
>   


