Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3743C4A9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:07:41 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfdyG-0007l6-5o
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfdvt-0006vp-9r
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfdvp-0002h7-OH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635321907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWSnFqnkNGO/io3CoYYb4yT4AmXHIpJgQj/5flRnkmM=;
 b=SySAaDQkLIFx1AyJR1hZd3rJFmu+gW3i8qj7+JvvTYCw5YNyWQIOAtaLOkVd+uESWShypz
 RXgwr4F272RPp1oQJ0TvmaYf8duPrdF56REFKsxo7WccHwoYEM4gViBSK2wwUQtXQeyX0X
 pZMN/6RMqc04uV+EPmeMtLDZGACMcA8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Sxc97pbBMX-z6cyiwXVHqw-1; Wed, 27 Oct 2021 04:05:06 -0400
X-MC-Unique: Sxc97pbBMX-z6cyiwXVHqw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so354530wrv.19
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWSnFqnkNGO/io3CoYYb4yT4AmXHIpJgQj/5flRnkmM=;
 b=A51mt9qWzr/KzWJ2goSJbC+J29wrN4Yk3dpAmmnxK4ib4r1JLECr3if1RZIUzSEMRU
 twSWsN/iNd+VE/LDXW+XYg46oBBBDGAisO0MzmSH7wwVfGuplQF+B1gAdqh/ZvaUFwAR
 xo1ggGaDQlX4amTpMQGRj4wofiEaRWfvTF3kwIU81NynmYG2TClZwgn6xNGwWt6gDUFd
 4SbQb/vaQabfULYbMu5MCnV7W6X2aHwkezwL1NyLe+WyJGBf2BaU4TO+gduWxu7gB8Qb
 O0e2bB5+ucuWuyTxK24Q0GKgMExhqhYwLxXofW6B6iF8X6P1lrFmE5MJQoSSJevoYoZl
 yjKw==
X-Gm-Message-State: AOAM531r8NayOfgEfvj+6sF7Mw88EPa1rjqF3hlz8ZWzz/vpuzOmm4iB
 XZNy+42fvp3lAibXgdOIKU+bF+PtkJm3Q9gUDaiwEappKcuJ+RDv+6pVZkl2b62ztVcKngiRY0e
 q68cPcQh/UzAXKsg=
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr20367184wrz.284.1635321904253; 
 Wed, 27 Oct 2021 01:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFbg+Ey6ZVgLiypFbteHE/J0rEf6I8MosfI78/ROf3DGZbxNEURlhksTkuqteamfTeuSCP8g==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr20367154wrz.284.1635321904023; 
 Wed, 27 Oct 2021 01:05:04 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:a543:72f:c4d1:8911:6346])
 by smtp.gmail.com with ESMTPSA id l2sm2851428wmc.3.2021.10.27.01.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:05:03 -0700 (PDT)
Date: Wed, 27 Oct 2021 04:04:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: specify an alternate MAC address
Message-ID: <20211027034533-mutt-send-email-mst@kernel.org>
References: <20211026150305.51962-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026150305.51962-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 05:03:05PM +0200, Laurent Vivier wrote:
> If the guest driver doesn't support the STANDBY feature, by default
> we keep the virtio-net device and don't hotplug the VFIO device,
> but in some cases, user can prefer to use the VFIO device rather
> than the virtio-net one. We can't unplug the virtio-net device
> (because on migration it is expected on the destination side) but
> we can keep both interfaces if the MAC addresses are different
> (to have the same MAC address can cause kernel crash with old
> kernel). The VFIO device will be unplugged before the migration
> like in the normal failover migration but without a failover device.
> 
> This patch adds a new property to the virtio-net device: "alt-mac"

I'd rather give it some kind of name that reflects that
it's related to failover, and to legacy guests not
supporting STANDBY.  failover-legacy-mac ?

> 
> If an alternate MAC address is provided with "alt-mac" and the
> STANDBY feature is not supported, both interfaces are plugged
> but the standby interface (virtio-net) MAC address is set to the
> value provided by the "alt-mac" parameter.
> 
> If the STANDBY feature is supported by guest and QEMU, the virtio-net
> failover acts as usual.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  docs/system/virtio-net-failover.rst | 17 ++++++++++
>  hw/net/virtio-net.c                 | 48 +++++++++++++++++++++++------
>  include/hw/virtio/virtio-net.h      |  6 ++++
>  3 files changed, 62 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
> index 6002dc5d96e4..0b1699169ef6 100644
> --- a/docs/system/virtio-net-failover.rst
> +++ b/docs/system/virtio-net-failover.rst
> @@ -51,6 +51,23 @@ Usage
>    is only for pairing the devices within QEMU. The guest kernel module
>    net_failover will match devices with identical MAC addresses.
>  
> +  The VIRTIO_NET_F_STANDBY must be supported by both sides, QEMU and guest
> +  kernel, to allow the guest kernel module to pair the devices.
> +  If the kernel module doesn't support the feature, only the standby device
> +  (virtio-net) is plugged, this allows to do a live migration without any
> +  connection loss.
> +
> +  In this case, You can force QEMU to keep both interfaces by providing an

you ?

> +  alternate MAC address to the virtio-net device with the parameter alt-mac.
> +  Both interfaces will be available separately:
> +
> +  -device virtio-net-pci,netdev=hostnet1,id=net1,mac=52:54:00:6f:55:cc, \
> +    bus=root2,failover=on,alt-mac=52:54:00:12:34:56
> +
> +  As in the failover case, the (vfio)-pci device will be unplugged
> +  automatically before the migration and plugged back on the destination side
> +  after the migration.

That's a weird way to explain this. I'd rather the documentation
just listed both options in a straight forward way.
And there's no need to repeat here how feature is used etc.

E.g. along the lines of

	For legacy guests (including bios/EUFI) not supporting
	VIRTIO_NET_F_STANDBY, two options exist:
	
	1. if alt-mac has not been configured (default)
	only the standby virtio-net device is visible to the guest

	2. if alt-mac has been configured, virtio and vfio devices will be
	presented to guest as two NIC devices, with virtio using
	the alt-mac address.




> +
>  Hotplug
>  -------
>  
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0b3..7aba2ac78f87 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -45,6 +45,9 @@
>  #include "net_rx_pkt.h"
>  #include "hw/virtio/vhost.h"
>  
> +/* zero MAC address to check with */
> +static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> +
>  #define VIRTIO_NET_VM_VERSION    11
>  
>  #define MAC_TABLE_ENTRIES    64
> @@ -126,7 +129,6 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>      VirtIONet *n = VIRTIO_NET(vdev);
>      struct virtio_net_config netcfg;
>      NetClientState *nc = qemu_get_queue(n->nic);
> -    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>  
>      int ret = 0;
>      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> @@ -871,10 +873,21 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>      error_propagate(errp, err);
>  }
>  
> +static void failover_plug_primary(VirtIONet *n)
> +{
> +    Error *err = NULL;
> +
> +    qapi_event_send_failover_negotiated(n->netclient_name);
> +    qatomic_set(&n->failover_primary_hidden, false);
> +    failover_add_primary(n, &err);
> +    if (err) {
> +        warn_report_err(err);
> +    }
> +}
> +
>  static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
> -    Error *err = NULL;
>      int i;
>  
>      if (n->mtu_bypass_backend &&
> @@ -921,12 +934,22 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>          memset(n->vlans, 0xff, MAX_VLAN >> 3);
>      }
>  
> -    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
> -        qapi_event_send_failover_negotiated(n->netclient_name);
> -        qatomic_set(&n->failover_primary_hidden, false);
> -        failover_add_primary(n, &err);
> -        if (err) {
> -            warn_report_err(err);
> +    if (n->failover) {
> +        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
> +            if (memcmp(&n->altmac, &zero, sizeof(zero)) != 0 &&
> +                memcmp(n->mac, &n->altmac, ETH_ALEN) == 0) {
> +                /*
> +                 * set_features can be called twice, without & with F_STANDBY,
> +                 * so restore original MAC address
> +                 */
> +                memcpy(n->mac, &n->nic->conf->macaddr, sizeof(n->mac));
> +                qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
> +            }
> +            failover_plug_primary(n);
> +        } else if (memcmp(&n->altmac, &zero, sizeof(zero)) != 0) {
> +            memcpy(n->mac, &n->altmac, ETH_ALEN);
> +            qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
> +            failover_plug_primary(n);
>          }
>      }
>  }
> @@ -3595,9 +3618,15 @@ static bool primary_unplug_pending(void *opaque)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIONet *n = VIRTIO_NET(vdev);
>  
> -    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
> +    if (!n->failover) {
>          return false;
>      }
> +
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY) &&
> +        memcmp(&n->altmac, &zero, sizeof(zero)) == 0) {
> +        return false;
> +    }
> +
>      primary = failover_find_primary_device(n);
>      return primary ? primary->pending_deleted_event : false;
>  }
> @@ -3672,6 +3701,7 @@ static Property virtio_net_properties[] = {
>      DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
>                         VIRTIO_NET_RSC_DEFAULT_INTERVAL),
>      DEFINE_NIC_PROPERTIES(VirtIONet, nic_conf),
> +    DEFINE_PROP_MACADDR("alt-mac",  VirtIONet, altmac),
>      DEFINE_PROP_UINT32("x-txtimer", VirtIONet, net_conf.txtimer,
>                         TX_TIMER_INTERVAL),
>      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index eb87032627d2..c768c7662002 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -213,6 +213,12 @@ struct VirtIONet {
>      QDict *primary_opts;
>      bool primary_opts_from_json;
>      Notifier migration_state;
> +    /*
> +     * failover: to provide an alternate MAC address allows to keep both
> +     * cards, primary and stand-by, if the STANDBY feature is not supported
> +     * by the guest
> +     */
> +    MACAddr altmac;
>      VirtioNetRssData rss_data;
>      struct NetRxPkt *rx_pkt;
>      struct EBPFRSSContext ebpf_rss;
> -- 
> 2.31.1


