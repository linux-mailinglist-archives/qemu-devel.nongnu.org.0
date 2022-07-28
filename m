Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041E58393F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:07:33 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxcJ-0002aE-HD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGxI5-0001VD-93
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGxI2-0003am-0Y
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658990793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVlg4ZDriIr9yuhH+5AZkqioVyHgUvTYzgVgHD7Vooc=;
 b=edQSydGwGJctTjBYRCFyAqpM6MTkqtQjmdK3wdGX9WCbMCdjNBDQMEhYTdg8XrSpK1IHvb
 HH2cQ+3QlvesUuGybEGd3i9zIIBaYsv78DDqLNNDwSS3Vusrh26hM8B5WMGKLqLggfAE07
 IQMpqGHrES91wfAsSqddJp6kKa4aaQY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-0m72YrXrO5-9zXEytwC_Jg-1; Thu, 28 Jul 2022 02:46:31 -0400
X-MC-Unique: 0m72YrXrO5-9zXEytwC_Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so550293wma.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=VVlg4ZDriIr9yuhH+5AZkqioVyHgUvTYzgVgHD7Vooc=;
 b=V0ZUf7XTk/l0mqIWjI9+6aQQAUJihwvcJ0zT25o9DP8sskzqmopb8joFOEB4qWrFqn
 gaHfN3bIwFRU/34MS+P3jmMoUCK8iUkYmd00Ecx/zOFwvO6MuwE7Jrw/T41TkyT9vhBz
 gF8uyYK7RAPZaxfS1wiYVSpTRhPOWv4wNMPeBZ4dRyp3y1gkzMkrv/Qsm5KLTyeb99Kx
 JLzOAtDXLn0Yth2OSv0Sb10wNAFxt2AEwoH+QZpEt2XQxaop1Z6FojxST79UR9+F7AKw
 Dz6sXOQ9pbiu9Kui3tY2wq9Iwi7QZJSDyGl+KDXO/07toUwxF39DUgvV12PNpdCsLzui
 /YRA==
X-Gm-Message-State: AJIora+5/+uXzAxP3g53WZl3UIRhkaQrYTKNJ0lz0A1JaHpryy/sxJF9
 JpchJNvRrjUVsYnaJtivZIFfN+TSJ5oIQWti2UwWBYNSx1UeUNvfowXaYiplsYjxYcBEI+E0qIh
 fEtWpSDtI+Si9tTU=
X-Received: by 2002:a7b:c3d4:0:b0:3a3:ce7:7894 with SMTP id
 t20-20020a7bc3d4000000b003a30ce77894mr5479718wmj.134.1658990790283; 
 Wed, 27 Jul 2022 23:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umYkl91s09bq48tXOKYt8gpsMeqKv8QU/I6YvWaUcJ/Vx0RJ4Y0ujyN1l+orJ7RczikeRhjw==
X-Received: by 2002:a7b:c3d4:0:b0:3a3:ce7:7894 with SMTP id
 t20-20020a7bc3d4000000b003a30ce77894mr5479696wmj.134.1658990789752; 
 Wed, 27 Jul 2022 23:46:29 -0700 (PDT)
Received: from redhat.com ([2.54.183.236]) by smtp.gmail.com with ESMTPSA id
 d10-20020adfe84a000000b0021e4982270asm73798wrn.13.2022.07.27.23.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:46:29 -0700 (PDT)
Date: Thu, 28 Jul 2022 02:46:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220728024257-mutt-send-email-mst@kernel.org>
References: <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727053311-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400AE8A41758321E0348764AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727114228-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E23C3E7DA97E034F02BEAB969@DM8PR12MB5400.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR12MB5400E23C3E7DA97E034F02BEAB969@DM8PR12MB5400.namprd12.prod.outlook.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 05:51:32AM +0000, Eli Cohen wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, July 27, 2022 6:44 PM
> > To: Eli Cohen <elic@nvidia.com>
> > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > virtualization@lists.linux-foundation.org
> > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > 
> > On Wed, Jul 27, 2022 at 10:16:19AM +0000, Eli Cohen wrote:
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, July 27, 2022 12:35 PM
> > > > To: Eli Cohen <elic@nvidia.com>
> > > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > > > virtualization@lists.linux-foundation.org
> > > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > > >
> > > > On Wed, Jul 27, 2022 at 09:04:47AM +0000, Eli Cohen wrote:
> > > > > > -----Original Message-----
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Wednesday, July 27, 2022 10:25 AM
> > > > > > To: Eli Cohen <elic@nvidia.com>
> > > > > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > > > > > virtualization@lists.linux-foundation.org
> > > > > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > > > > >
> > > > > > On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > > > > > > I found out that the reason why I could not enforce the mtu stems from the fact that I did not configure max mtu for the net
> > > > device
> > > > > > (e.g. through libvirt <mtu size="9000"/>).
> > > > > > > Libvirt does not allow this configuration for vdpa devices and probably for a reason. The vdpa backend driver has the
> > freedom
> > > > to do
> > > > > > it using its copy of virtio_net_config.
> > > > > > >
> > > > > > > The code in qemu that is responsible to allow to consider the device MTU restriction is here:
> > > > > > >
> > > > > > > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > > > > {
> > > > > > >     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > > > > >     VirtIONet *n = VIRTIO_NET(dev);
> > > > > > >     NetClientState *nc;
> > > > > > >     int i;
> > > > > > >
> > > > > > >     if (n->net_conf.mtu) {
> > > > > > >         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > > > > > >     }
> > > > > > >
> > > > > > > The above code can be interpreted as follows:
> > > > > > > if the command line arguments of qemu indicates that mtu should be limited, then we would read this mtu limitation from
> > the
> > > > > > device (that actual value is ignored).
> > > > > > >
> > > > > > > I worked around this limitation by unconditionally setting VIRTIO_NET_F_MTU in the host features. As said, it only indicates
> > > > that
> > > > > > we should read the actual limitation for the device.
> > > > > > >
> > > > > > > If this makes sense I can send a patch to fix this.
> > > > > >
> > > > > > Well it will then either have to be for vdpa only, or have
> > > > > > compat machinery to avoid breaking migration.
> > > > > >
> > > > >
> > > > > How about this one:
> > > > >
> > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > index 1067e72b3975..e464e4645c79 100644
> > > > > --- a/hw/net/virtio-net.c
> > > > > +++ b/hw/net/virtio-net.c
> > > > > @@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> > > > >  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> > > > >  {
> > > > >      virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
> > > > > +    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);
> > > > >
> > > > >      n->config_size = virtio_feature_get_config_size(feature_sizes,
> > > > >                                                      host_features);
> > > >
> > > > Seems to increase config size unconditionally?
> > >
> > > Right but you pay for reading two more bytes. Is that such a high price to pay?
> > 
> > 
> > That's not a performance question. The issue compatibility, size
> > should not change for a given machine type.
> > 
> 
> Did you mean it should not change for virtio_net pci devices?

yes

> Can't management controlling the live migration process take care of this?

Management does what it always did which is set flags consistently.
If we tweak them with virtio_add_feature it can do nothing.

> > 
> > > >
> > > > > @@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > >
> > > > >     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> > > > >          struct virtio_net_config netcfg = {};
> > > > > +        n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > > > >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> > > > >          vhost_net_set_config(get_vhost_net(nc->peer),
> > > > >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> > > >
> > > > And the point is vdpa does not support migration anyway ATM, right?
> > > >
> > >
> > > I don't see how this can affect vdpa live migration. Am I missing something?
> > 
> > config size affects things like pci BAR size. This must not change
> > during migration.
> > 
> 
> Why should this change during live migration?

Simply put features need to match on both ends.

> > --
> > MST


