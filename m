Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC8582366
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:44:17 +0200 (CEST)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdaS-000834-CG
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGdRZ-0008AZ-OD
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGdRX-0004GC-Nj
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nTu5NFFijHvsfn7itaXXmAt2nr30kbr5pULqEuXHg0=;
 b=PJ6YaLE3xMDJg2wN4WHjsgNHm0j8HVsc8Nl8ZSiOTz1MA9VzZtFQgPVeHV2nD81BuH9AZL
 bN8ATrmiZnYUUftOJu76c7DF9mA6d20uvM5El+ky3Iocu3INSjQT9CONJyKXyeTCNB1quW
 pueLOegj1O1lV3cdU2SRaURjzbNzsJA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-F02TgiwqPuawZDwt6orNoA-1; Wed, 27 Jul 2022 05:34:58 -0400
X-MC-Unique: F02TgiwqPuawZDwt6orNoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 o8-20020adfa108000000b0021e903fb612so1365685wro.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5nTu5NFFijHvsfn7itaXXmAt2nr30kbr5pULqEuXHg0=;
 b=kPhCWjE2WcjCcen58SGVHPP0Y7/YuTy0D66JpV3S2JaTU5XYLEJRkS5MtUEM8VCN/e
 KKU2NNIfiJy66IaJNkPYiWOV+2mDYNbIDVTO8FNZK86QPpIbFBhav8eZ4WV2knkhTyoF
 RrQ4MS4wPKkwUzAkXIZsdYJ3ZQ26Wl0+hHT9HHv2ywCzv3DKt1gPczt6+SiIr3QGD8xV
 CdetS6oDmiB6cGp3GH4b2fM2VBJya2Q4+nT34w7U0Kw5S3eL0N0kl8LP8rSK44MnyDMz
 63I36zPk8lDu99auQPbDMHGjRWbd0njXOh7eA8vFCTXWi+uq6oRhbOKl4W9nYevGuXg1
 VfAA==
X-Gm-Message-State: AJIora+C731SbGND5yyM0lvCo8CgAevh1MBoOk3CRFGlyfArmjbxHXv2
 GePvd0WVhfdYVwFMRDYCPfSdOHk74BxFEsl6ZW83xgu+9PDDjIbE5XX2tbRnaMvS4NG3YPJIeZ5
 CPrIVV3aYyMGzmgE=
X-Received: by 2002:a5d:5885:0:b0:21d:ad15:30be with SMTP id
 n5-20020a5d5885000000b0021dad1530bemr13726259wrf.90.1658914497176; 
 Wed, 27 Jul 2022 02:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFOFcPG8gkrtElQFk67gFvNjlebxA3/p1LPmwZVJyGoX9n6idQQnKHi+wCOjIDYpdRVi7/Ig==
X-Received: by 2002:a5d:5885:0:b0:21d:ad15:30be with SMTP id
 n5-20020a5d5885000000b0021dad1530bemr13726243wrf.90.1658914496786; 
 Wed, 27 Jul 2022 02:34:56 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a319bd3278sm1985200wmp.40.2022.07.27.02.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:34:56 -0700 (PDT)
Date: Wed, 27 Jul 2022 05:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220727053311-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
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

On Wed, Jul 27, 2022 at 09:04:47AM +0000, Eli Cohen wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, July 27, 2022 10:25 AM
> > To: Eli Cohen <elic@nvidia.com>
> > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
> > virtualization@lists.linux-foundation.org
> > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > 
> > On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > > I found out that the reason why I could not enforce the mtu stems from the fact that I did not configure max mtu for the net device
> > (e.g. through libvirt <mtu size="9000"/>).
> > > Libvirt does not allow this configuration for vdpa devices and probably for a reason. The vdpa backend driver has the freedom to do
> > it using its copy of virtio_net_config.
> > >
> > > The code in qemu that is responsible to allow to consider the device MTU restriction is here:
> > >
> > > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > {
> > >     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > >     VirtIONet *n = VIRTIO_NET(dev);
> > >     NetClientState *nc;
> > >     int i;
> > >
> > >     if (n->net_conf.mtu) {
> > >         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > >     }
> > >
> > > The above code can be interpreted as follows:
> > > if the command line arguments of qemu indicates that mtu should be limited, then we would read this mtu limitation from the
> > device (that actual value is ignored).
> > >
> > > I worked around this limitation by unconditionally setting VIRTIO_NET_F_MTU in the host features. As said, it only indicates that
> > we should read the actual limitation for the device.
> > >
> > > If this makes sense I can send a patch to fix this.
> > 
> > Well it will then either have to be for vdpa only, or have
> > compat machinery to avoid breaking migration.
> > 
> 
> How about this one:
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b3975..e464e4645c79 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
>  {
>      virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
> +    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);
> 
>      n->config_size = virtio_feature_get_config_size(feature_sizes,
>                                                      host_features);

Seems to increase config size unconditionally?

> @@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> 
>     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
>          struct virtio_net_config netcfg = {};
> +        n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>          vhost_net_set_config(get_vhost_net(nc->peer),
>              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);

And the point is vdpa does not support migration anyway ATM, right?

-- 
MST


