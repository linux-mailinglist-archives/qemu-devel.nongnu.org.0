Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDAD5829F4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:48:18 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjGi-00036s-Ol
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjCl-0007Hk-Cr
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjCi-0007sJ-GJ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658936647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xjoftw+lPi/Jdd4dOQv7y6H1hb7jKnp8oUGe5twN9uw=;
 b=ROXneAvBvvsteAFiHIdqI2QhyasWaDGyon5ta9QRDaUkJkZlab7EDdPx2SAFJqlPZh0h8z
 PSt+8IOdEc+rbHSjdDW05TdMjKaTAaF5QJs1hCdk7JYtRm3NStODkMJ/wtCYu8xAjmzCMO
 QKzHoLNVtwDlNZKsBob387oXolGuNOM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-fPezSYlIOs6QhWeuG-M0_A-1; Wed, 27 Jul 2022 11:44:06 -0400
X-MC-Unique: fPezSYlIOs6QhWeuG-M0_A-1
Received: by mail-ed1-f70.google.com with SMTP id
 o2-20020a056402438200b0043ccb3ed7dfso586666edc.22
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Xjoftw+lPi/Jdd4dOQv7y6H1hb7jKnp8oUGe5twN9uw=;
 b=Oo9703TlrJgmbu4lWBLWq0rhkxe/W3rlyvhyMeIZLk2mr7n1Gtlr6VDEzubUDHd66+
 doWdxm8ZAqSDFvZDkajY3igcV5kyyzQ59NzdGJnApN6c9ZBUq4pzHkTFsnspKHl8okZB
 9SN/zlkf5SoJgQlN8gl7Wf/G8eFSC4hRtDCguPoIBq05pXmPPybNkU7DKTc5WqYmYQ3g
 5kAlR7l0VAY6RiM99Lu1/V2lDZbCyxCLeP2vqryVac5hHOG4N+pAiaDR+cxKdh3xwbKC
 EzOa95o44rWay1t3sg1uWuYRa5Y+ZQcPK4W4fsCWAwz7td+6MgNgFA82vrki8CrIwEep
 GiHg==
X-Gm-Message-State: AJIora9JPqA0aKIPbL1BvaICAasLvDpVmLLLTvnABKXl2pD4YbAe/l7i
 SPe0OBrGe7RBMIkmrHgerC/AjA9/A33f7qVn7qHyRl3EkWhNXMzj/YUatjH8JtvyKek4yeGZQco
 7gKffuZKz2+UbWrk=
X-Received: by 2002:a17:907:9810:b0:72f:36e5:266c with SMTP id
 ji16-20020a170907981000b0072f36e5266cmr17963167ejc.105.1658936645138; 
 Wed, 27 Jul 2022 08:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFZGQD3a281tjE4wzKhXvbtnkIpRIqZTMJS8oOccdgxgUCZ2E8X7qMw1LXWcjb+xYUX+5jGg==
X-Received: by 2002:a17:907:9810:b0:72f:36e5:266c with SMTP id
 ji16-20020a170907981000b0072f36e5266cmr17963152ejc.105.1658936644855; 
 Wed, 27 Jul 2022 08:44:04 -0700 (PDT)
Received: from redhat.com ([2.52.132.243]) by smtp.gmail.com with ESMTPSA id
 g16-20020a50ee10000000b0043cc58ca84dsm796262eds.39.2022.07.27.08.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:44:04 -0700 (PDT)
Date: Wed, 27 Jul 2022 11:44:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220727114228-mutt-send-email-mst@kernel.org>
References: <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727053311-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400AE8A41758321E0348764AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR12MB5400AE8A41758321E0348764AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 10:16:19AM +0000, Eli Cohen wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, July 27, 2022 12:35 PM
> > To: Eli Cohen <elic@nvidia.com>
> > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > virtualization@lists.linux-foundation.org
> > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > 
> > On Wed, Jul 27, 2022 at 09:04:47AM +0000, Eli Cohen wrote:
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, July 27, 2022 10:25 AM
> > > > To: Eli Cohen <elic@nvidia.com>
> > > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > > > virtualization@lists.linux-foundation.org
> > > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > > >
> > > > On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > > > > I found out that the reason why I could not enforce the mtu stems from the fact that I did not configure max mtu for the net
> > device
> > > > (e.g. through libvirt <mtu size="9000"/>).
> > > > > Libvirt does not allow this configuration for vdpa devices and probably for a reason. The vdpa backend driver has the freedom
> > to do
> > > > it using its copy of virtio_net_config.
> > > > >
> > > > > The code in qemu that is responsible to allow to consider the device MTU restriction is here:
> > > > >
> > > > > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > > {
> > > > >     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > > >     VirtIONet *n = VIRTIO_NET(dev);
> > > > >     NetClientState *nc;
> > > > >     int i;
> > > > >
> > > > >     if (n->net_conf.mtu) {
> > > > >         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > > > >     }
> > > > >
> > > > > The above code can be interpreted as follows:
> > > > > if the command line arguments of qemu indicates that mtu should be limited, then we would read this mtu limitation from the
> > > > device (that actual value is ignored).
> > > > >
> > > > > I worked around this limitation by unconditionally setting VIRTIO_NET_F_MTU in the host features. As said, it only indicates
> > that
> > > > we should read the actual limitation for the device.
> > > > >
> > > > > If this makes sense I can send a patch to fix this.
> > > >
> > > > Well it will then either have to be for vdpa only, or have
> > > > compat machinery to avoid breaking migration.
> > > >
> > >
> > > How about this one:
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 1067e72b3975..e464e4645c79 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> > >  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> > >  {
> > >      virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
> > > +    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);
> > >
> > >      n->config_size = virtio_feature_get_config_size(feature_sizes,
> > >                                                      host_features);
> > 
> > Seems to increase config size unconditionally?
> 
> Right but you pay for reading two more bytes. Is that such a high price to pay?


That's not a performance question. The issue compatibility, size
should not change for a given machine type.


> > 
> > > @@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > >
> > >     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> > >          struct virtio_net_config netcfg = {};
> > > +        n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> > >          vhost_net_set_config(get_vhost_net(nc->peer),
> > >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> > 
> > And the point is vdpa does not support migration anyway ATM, right?
> > 
> 
> I don't see how this can affect vdpa live migration. Am I missing something?

config size affects things like pci BAR size. This must not change
during migration.

-- 
MST


