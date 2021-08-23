Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928DA3F53A3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 01:27:27 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIJLh-0004DK-AC
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 19:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJKF-0003Qw-Do
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJKB-0001H2-Ot
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629761149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQsxcHMgMgVSP88O+3GbQMmdXsjiS0nHEiHsVlwGbpA=;
 b=AAkUgGaxuLtYZhL92HhoqRtGHWBW+i5LzP/nZctsDZENUaa2DJDHaydUdiDk4/OseCblt0
 XBXc8wcP8zlxu7H6H4ZUMKjCgxCrf76fsYh6QLahCdolMoqcvysdXgUA6dyqiTZT/Nmadk
 U3bb8aenfZRqDADP5FpPFNVdTIpIF08=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-sqcAdmBqNj6xmzGV9G9LVA-1; Mon, 23 Aug 2021 19:25:48 -0400
X-MC-Unique: sqcAdmBqNj6xmzGV9G9LVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso9526787edh.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 16:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQsxcHMgMgVSP88O+3GbQMmdXsjiS0nHEiHsVlwGbpA=;
 b=lQ9XUUYq/9PGz39Ru2xb/9ua3T7OZ6Cs4N8N40Z5l/tfjTzwYsXIpOQIV8ElbrPyqk
 KPaah6uzKDXZSs8sWE+MQsTDrn4KVP/Ub13G6UcgdeFXP+QznuPF10ifgKNed5z07rfR
 RmTwrDqjqOHoRA+MDMsxTiApMQgAMfc/LFVDX1Xh7obfwdtiN2w6+QSWqUwoARNdhv+w
 ald9qT6m0egW3InwH0mdfSj8CJRZHULyAsKQd7kWTYk+v6990LtgBfM2qsg+8f7q6NE8
 wiQ/p3pZgF63h1Sb0l7kD17KJ0psI/zFXnc9/J40Q3/qn9c3Ljb34fvWZmxAAQ9VSzzF
 LRUg==
X-Gm-Message-State: AOAM530AOkidGuxlIG7KwXKsCMDPnUG4gFT6BuxDHKM9mTHqD6utzxpt
 M9TgOmc7LNGcMrZk507a8cvmRd0Rj9xD7ugUsIx7OrPwQHXQg9ZS3R/ygNaknQqiy1cyXhy0oon
 KQ1G8QeBxFvzfiyg=
X-Received: by 2002:a17:906:30d8:: with SMTP id
 b24mr37653155ejb.358.1629761147330; 
 Mon, 23 Aug 2021 16:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEp/JdLlDDdugWv2yVxed8gVRyDWiyieoWIW1ovzJiSHPGOfg7h+v/x/O8mKX0Dk5eXe+F0w==
X-Received: by 2002:a17:906:30d8:: with SMTP id
 b24mr37653135ejb.358.1629761147040; 
 Mon, 23 Aug 2021 16:25:47 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id x9sm8082829edj.95.2021.08.23.16.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:25:46 -0700 (PDT)
Date: Mon, 23 Aug 2021 19:25:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 1/1] virtio: failover: define the default device to
 use in case of error
Message-ID: <20210823192119-mutt-send-email-mst@kernel.org>
References: <20210809171342.18146-1-lvivier@redhat.com>
 <20210809171342.18146-2-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210809171342.18146-2-lvivier@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 07:13:42PM +0200, Laurent Vivier wrote:
> If the guest driver doesn't support the STANDBY feature, by default
> we keep the virtio-net device and don't hotplug the VFIO device,
> but in some cases, user can prefer to use the VFIO device rather
> than the virtio-net one. We can't unplug the virtio-net device
> (because on migration it is expected on the destination side)
> but we can force the guest driver to be disabled. Then, we can
> hotplug the VFIO device that will be unplugged before the migration
> like in the normal failover migration but without the failover device.
> 
> This patch adds a new property to virtio-net device: "failover-default".
> 
> By default, "failover-default" is set to true and thus the default NIC
> to use if the failover cannot be enabled is the virtio-net device
> (this is what is done until now with the virtio-net failover).
> 
> If "failover-default" is set to false, in case of error, the virtio-net
> device is not the default anymore and the failover primary device
> is used instead.
> 
> If the STANDBY feature is supported by guest and host, the virtio-net
> failover acts as usual.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Three things I dislike here. First this is limited to 1.0.
OTOH this is all about legacy guests without STANDBY,
would be nicer to support legacy.
Second: the reason we don't want both
virtio and VFIO is because their mac addresses match.
This tends to confuse guest tools.
I don't see this solved here.

Proposal: management supplies an extra dummy mac.
This mac is used with virtio and its link it down.
Link state reporting is also optional but
it has been there for many years.
If link state reporting is disabled then maybe do not
expose VFIO after all.

Third thing is option name. Does not hint at the fact that
for legacy guests we do not get failover at all.
Let's try to be more explicit please.



> ---
>  include/hw/virtio/virtio-net.h |  1 +
>  hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
>  2 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f06..ab77930a327e 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -208,6 +208,7 @@ struct VirtIONet {
>      /* primary failover device is hidden*/
>      bool failover_primary_hidden;
>      bool failover;
> +    bool failover_default;
>      DeviceListener primary_listener;
>      Notifier migration_state;
>      VirtioNetRssData rss_data;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52a..972c03232a96 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -935,12 +935,23 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>          memset(n->vlans, 0xff, MAX_VLAN >> 3);
>      }
>  
> -    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
> -        qapi_event_send_failover_negotiated(n->netclient_name);
> -        qatomic_set(&n->failover_primary_hidden, false);
> -        failover_add_primary(n, &err);
> -        if (err) {
> -            warn_report_err(err);
> +    /*
> +     * if the virtio-net driver has the STANDBY feature, we can plug the primary
> +     * if not but is not the default failover device,
> +     * we need to plug the primary alone and the virtio-net driver will
> +     * be disabled in the validate_features() function but validate_features()
> +     * is only available with virtio 1.0 spec
> +     */
> +    if (n->failover) {
> +        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY) ||
> +           (virtio_has_feature(features, VIRTIO_F_VERSION_1) &&
> +            !n->failover_default)) {
> +            qapi_event_send_failover_negotiated(n->netclient_name);
> +            qatomic_set(&n->failover_primary_hidden, false);
> +            failover_add_primary(n, &err);
> +            if (err) {
> +                warn_report_err(err);
> +            }
>          }
>      }
>  }
> @@ -3625,9 +3636,34 @@ static Property virtio_net_properties[] = {
>      DEFINE_PROP_INT32("speed", VirtIONet, net_conf.speed, SPEED_UNKNOWN),
>      DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),
>      DEFINE_PROP_BOOL("failover", VirtIONet, failover, false),
> +    DEFINE_PROP_BOOL("failover-default", VirtIONet, failover_default, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +/* validate_features() is only available with VIRTIO_F_VERSION_1 */
> +static int failover_validate_features(VirtIODevice *vdev)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +
> +    /*
> +     * If the guest driver doesn't support the STANDBY feature, by default
> +     * we keep the virtio-net device and don't hotplug the VFIO device,
> +     * but in some cases, user can prefer to use the VFIO device rather
> +     * than the virtio-net one. We can't unplug the virtio-net device
> +     * (because on migration it is expected on the destination side)
> +     * but we can force the guest driver to be disabled. In this case, We can
> +     * hotplug the VFIO device that will be unplugged before the migration
> +     * like in the normal failover migration but without the failover device.
> +     */
> +    if (n->failover && !n->failover_default &&
> +        !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
> +        /* disable virtio-net */
> +        return -ENODEV;
> +    }
> +
> +    return 0;
> +}
> +
>  static void virtio_net_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -3651,6 +3687,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>      vdc->post_load = virtio_net_post_load_virtio;
>      vdc->vmsd = &vmstate_virtio_net_device;
>      vdc->primary_unplug_pending = primary_unplug_pending;
> +    vdc->validate_features = failover_validate_features;
>  }
>  
>  static const TypeInfo virtio_net_info = {
> -- 
> 2.31.1


