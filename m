Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7C44722B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 09:27:09 +0100 (CET)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjdW8-0005fk-JB
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 03:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdUq-0004uf-Lf
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdUj-00083Y-Ku
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636273540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnKVz+FfA4cdaehJ6t/pPo+f++1T/wpLXiC6Cc+oCPk=;
 b=PK/VUnzvm06u3jLWobFkIiMdqnzzJfQaK1QT1TqFtcKEpfzbQFvcDf5zVzWX/ALb1m7flb
 5qrZghBjF++2TGPsoNwzsFJ+GMBY4ugGrGBfZN5itcH9zhxKwQ4UyoEwM8hRDb94ppKzCe
 /jb3yR7MANUQEt/SXSLJb0IJamjw7Pk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-hgVWYhRXOUGtVIRoGyBrvg-1; Sun, 07 Nov 2021 03:25:36 -0500
X-MC-Unique: hgVWYhRXOUGtVIRoGyBrvg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso12291010edc.22
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 01:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YnKVz+FfA4cdaehJ6t/pPo+f++1T/wpLXiC6Cc+oCPk=;
 b=so0psfp/awlhk68u1TXicD891vY2iWWIYFidjIAlhKXI7G1RxGL+Z8s8foTejNYDOq
 +C3nmRLqXQs7HvvcJUNAg04h9eC3RXjhvVl4lt0/IDoySnAt0ay5vA47m2LXory24ISM
 B+x3s+tQW2EUQPjqBrLuTS25MwO2lKrm5lyXzRUu/SwPIuJ4A7ZIC/snTm4t3qMU37IR
 wop9iKqa69sMPbtputBkZz7unRD53EKbMuGirAprx1bj35lOPS8D3PMgXzcFb6rUqMmL
 R0xvQq+eCI+xLFRbPsruxVj9mlrDOi9nDVVYHZjRSvdhc5b8AQmILMB8fE6DFEJ3VYHO
 082Q==
X-Gm-Message-State: AOAM530FTB+BvwsFLbr2bBLsZBq2oO0jbU8YqzcxOd3f6WEO1ulVthvW
 x2pAjH82OVulqUyt1OmOzFfGkuRBuRVkFevURw96R1XMNt0fXYTimDvWA3+njzvvLOn4qvxkcFL
 bcPIn0DrUpxm1b+A=
X-Received: by 2002:a17:906:d20c:: with SMTP id
 w12mr65815979ejz.521.1636273535496; 
 Sun, 07 Nov 2021 01:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6utNQ+ayeB2oHrviavDgYFVmmCHFqezGoMMgHgxLP/KYZMJv9QlUe6roTiuqD92GYqYCO7g==
X-Received: by 2002:a17:906:d20c:: with SMTP id
 w12mr65815957ejz.521.1636273535268; 
 Sun, 07 Nov 2021 01:25:35 -0700 (PDT)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id t22sm7268204eds.65.2021.11.07.01.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:25:34 -0700 (PDT)
Date: Sun, 7 Nov 2021 03:25:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] failover: specify an alternate MAC address
Message-ID: <20211107031702-mutt-send-email-mst@kernel.org>
References: <20211027095945.86710-1-lvivier@redhat.com>
 <20211101053105-mutt-send-email-mst@kernel.org>
 <913b4d85-9c05-0bb8-2dd5-02744a44b388@redhat.com>
MIME-Version: 1.0
In-Reply-To: <913b4d85-9c05-0bb8-2dd5-02744a44b388@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On Tue, Nov 02, 2021 at 09:14:51AM +0100, Laurent Vivier wrote:
> On 01/11/2021 10:39, Michael S. Tsirkin wrote:
> > On Wed, Oct 27, 2021 at 11:59:45AM +0200, Laurent Vivier wrote:
> > > If the guest driver doesn't support the STANDBY feature, by default
> > > we keep the virtio-net device and don't hotplug the VFIO device,
> > > but in some cases, user can prefer to use the VFIO device rather
> > > than the virtio-net one. We can't unplug the virtio-net device
> > > (because on migration it is expected on the destination side) but
> > > we can keep both interfaces if the MAC addresses are different
> > > (to have the same MAC address can cause kernel crash with old
> > > kernel). The VFIO device will be unplugged before the migration
> > > like in the normal failover migration but without a failover device.
> > > 
> > > This patch adds a new property to the virtio-net device:
> > > "failover-legacy-mac"
> > > 
> > > If an alternate MAC address is provided with "failover-legacy-mac" and
> > > the STANDBY feature is not supported, both interfaces are plugged
> > > but the standby interface (virtio-net) MAC address is set to the
> > > value provided by the "failover-legacy-mac" parameter.
> > > 
> > > If the STANDBY feature is supported by guest and QEMU, the virtio-net
> > > failover acts as usual.
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > 
> > Wait a second. What if config is read before features are set?
> > Are we going to provide a legacy or a new mac?
> We provide the new MAC and at this point the primary device is not plugged.
> 
> When features are set:
> - if STANDBY is set, the primary device is plugged, and secondary
> (virtio-net) uses the new MAC
> - if STANDBY is not set:
>     - if legacy MAC is provided:
>         the primary device is plugged and legacy MAC is used
>     - else
>         the primary device is not plugged and new MAC is used.
> 
> > I guess current guests do not do this, but the spec does allow this,
> > and then the mac will apparently change for the guests.
> 
> What I read in virtio 1.0 specs, "3.1.1 Driver requirements: Device
> initialization", is the virtio configuration space (step 7) is is accessed
> after the features are negotiated. I don't think the part in step 4 can
> involve the MAC address, and moreover the config is not read before, but
> during the negotiation (I guess we can see that as the config access is part
> of the negotiation).
> 
> 3.1.1 Driver Requirements: Device Initialization
> 
> The driver MUST follow this sequence to initialize a device:
> 1. Reset the device.
> 2. Set the ACKNOWLEDGE status bit: the guest OS has notice the device.
> 3. Set the DRIVER status bit: the guest OS knows how to drive the device.
> 4. Read device feature bits, and write the subset of feature bits understood
> by the OS and driver to the device. During this step the driver MAY read
> (but MUST NOT write) the device-specific configuration fields to check that
> it can support the device before accepting it.

Note this part here. config is read before FEATURES_OK.

> 5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature
> bits after this step.
> 6. Re-read device status to ensure the FEATURES_OK bit is still set:
> otherwise, the device does not support our subset of features and the device
> is unusable.
> 7. Perform device-specific setup, including discovery of virtqueues for the
> device, optional per-bus setup, reading and possibly writing the device’s
> virtio configuration space, and population of virtqueues.
> 8. Set the DRIVER_OK status bit. At this point the device is “live”.
> 
> > 
> > It might be cleaner to just add a PRIMARY_MAC feature -
> > would need guest work though ...
> 
> We can't add a new feature: the goal of this patch is to be able to use the
> primary device (VFIO) with kernel that doesn't support STANDBY feature. If
> we can add a feature, to add the STANDBY feature would be a better choice.

The point would be a new feature replacing STANDBY: instead of using the
same MAC for both devices it specifies the MAC of the primary.
And if we go there, I would add a third MAC as the mac of the
failover device itself. Thus:

standby-mac: used by legacy virtio drivers
primary-mac: used to locate the primary device and by legacy primary drivers
failover-mac: programmed by guest driver into whatever device guest is using at the moment


What we lose there is all these drivers already supporting STANDBY,
but hey, won't matter so much in X years. Some primary devices
do not support mac programming. I guess specifying failover-mac=primary-mac
would be an option for these.

Thoughts?


> If changing the MAC address is not acceptable we can return to a mix of v1 and v2 of my patch:
> 
> "virtio: failover: allow to keep the VFIO device rather than the virtio-net one"
> 
> https://patchew.org/QEMU/20210729191910.317114-1-lvivier@redhat.com/
> 
> that disables the virtio-net driver on the module probe.
> 
> Thanks,
> Laurent


