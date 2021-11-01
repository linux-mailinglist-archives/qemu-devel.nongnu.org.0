Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6044180B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:40:22 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhTnh-0006pY-Ac
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhTmg-00068S-Rw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhTmd-0001aA-6x
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635759553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLRAzjRTsSSovksMnXQtC1p0c7YsanaOIeQPjPe/F38=;
 b=f1T7PPUQKkHfvNAZmX9x7hzGgibCuk2EB0s0WFhd+vtXkqovGCJ/qiMXgSdAWxslJroPRN
 kkA89w0iJpP4LJuQb7ECY9XIO1++rzN8ENCfy4AjpYED1JxZNVykoCjoUcDB6ko9Gs6dhb
 8rB5BKDfRGyUgAYBSuYmhKMCZx/Ps0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-Gq2HQPPBOzSYxE8c1NBaLA-1; Mon, 01 Nov 2021 05:39:10 -0400
X-MC-Unique: Gq2HQPPBOzSYxE8c1NBaLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so2518708wmc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 02:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DLRAzjRTsSSovksMnXQtC1p0c7YsanaOIeQPjPe/F38=;
 b=N7cRVhK6icTs2oUXT4lbKuSGvp/tvoC/lViVynj9u3t5lStXA9cNoV2iwFVIK+RLx8
 QWaPyiHYABI2I7G4eL7Y7ZxGGUxwFCe1Z3DLDtaOtp3lqu1THo+QVOywLei/ApdX/Up0
 Atzx/ZxUUccGSRLYQrU4zpjEBBFtQZzkGgL6WMOWjc9GBVbxE0BIQ+eForsblqTAHbsc
 /1SRsUS6RlxifBVxU8vWjKel3XdcYKOvyzn5uV+0G2CqDnD8jcu1o/hWmABOaFSw6J61
 Viw8xJz7eczk3n2GvpULWA2m0JzVhzixLSJy/TJmtU69LpT0SaaEou9rA71GzVR3orM2
 Mbog==
X-Gm-Message-State: AOAM532GqSqymuPmxD1PVST1dWG7F6A3DTB0a/jaFCsqswTkE5xF68G7
 RQrtIFsHgB0NWp5Q15lXwNF3zIJjw99sHcKn0GFmkP+ptsbqjD0jdMzkymkj2A853sa/F/XDxc1
 D0x85An0n6Km4ddk=
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr7141165wmi.145.1635759548738; 
 Mon, 01 Nov 2021 02:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7E8pgGiVvHlxGSnpL9Habpg8GWbgCSamgG/plKrvMAoXMEBNIOW0+Mg5TLCsEcavyb9ohJA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr7141139wmi.145.1635759548469; 
 Mon, 01 Nov 2021 02:39:08 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107f:7087:907d:ff12:1534:78b7])
 by smtp.gmail.com with ESMTPSA id l22sm8172545wmp.34.2021.11.01.02.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 02:39:07 -0700 (PDT)
Date: Mon, 1 Nov 2021 05:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] failover: specify an alternate MAC address
Message-ID: <20211101053105-mutt-send-email-mst@kernel.org>
References: <20211027095945.86710-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211027095945.86710-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 11:59:45AM +0200, Laurent Vivier wrote:
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
> This patch adds a new property to the virtio-net device:
> "failover-legacy-mac"
> 
> If an alternate MAC address is provided with "failover-legacy-mac" and
> the STANDBY feature is not supported, both interfaces are plugged
> but the standby interface (virtio-net) MAC address is set to the
> value provided by the "failover-legacy-mac" parameter.
> 
> If the STANDBY feature is supported by guest and QEMU, the virtio-net
> failover acts as usual.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Wait a second. What if config is read before features are set?
Are we going to provide a legacy or a new mac?
I guess current guests do not do this, but the spec does allow this,
and then the mac will apparently change for the guests.

It might be cleaner to just add a PRIMARY_MAC feature -
would need guest work though ...


> ---
> 
> Notes:
>     v2: rename alt-mac to failover-legacy-mac
>         update doc with text provided by MST
> 
>  docs/system/virtio-net-failover.rst | 10 ++++++
>  hw/net/virtio-net.c                 | 48 +++++++++++++++++++++++------
>  include/hw/virtio/virtio-net.h      |  6 ++++
>  3 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
> index 6002dc5d96e4..99f21cd55ef7 100644
> --- a/docs/system/virtio-net-failover.rst
> +++ b/docs/system/virtio-net-failover.rst
> @@ -51,6 +51,16 @@ Usage
>    is only for pairing the devices within QEMU. The guest kernel module
>    net_failover will match devices with identical MAC addresses.
>  
> +  For legacy guests (including bios/EUFI) not supporting VIRTIO_NET_F_STANDBY,
> +  two options exist:
> +
> +  1. if failover-legacy-mac has not been configured (default)
> +     only the standby virtio-net device is visible to the guest
> +
> +  2. if failover-legacy-mac has been configured, virtio and vfio devices will
> +     be presented to guest as two NIC devices, with virtio using the
> +     failover-legacy-mac address.
> +
>  Hotplug
>  -------
>  
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0b3..0d47d287de14 100644
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
> +            if (memcmp(&n->legacy_mac, &zero, sizeof(zero)) != 0 &&
> +                memcmp(n->mac, &n->legacy_mac, ETH_ALEN) == 0) {
> +                /*
> +                 * set_features can be called twice, without & with F_STANDBY,
> +                 * so restore original MAC address

Restore can be confusing. Let's just say that we set it to XX.

> +                 */
> +                memcpy(n->mac, &n->nic->conf->macaddr, sizeof(n->mac));
> +                qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
> +            }
> +            failover_plug_primary(n);
> +        } else if (memcmp(&n->legacy_mac, &zero, sizeof(zero)) != 0) {

add a comment here too?

> +            memcpy(n->mac, &n->legacy_mac, ETH_ALEN);
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
> +        memcmp(&n->legacy_mac, &zero, sizeof(zero)) == 0) {
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
> +    DEFINE_PROP_MACADDR("failover-legacy-mac",  VirtIONet, legacy_mac),
>      DEFINE_PROP_UINT32("x-txtimer", VirtIONet, net_conf.txtimer,
>                         TX_TIMER_INTERVAL),
>      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index eb87032627d2..4b9523def5fb 100644
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
> +    MACAddr legacy_mac;
>      VirtioNetRssData rss_data;
>      struct NetRxPkt *rx_pkt;
>      struct EBPFRSSContext ebpf_rss;
> -- 
> 2.31.1


