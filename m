Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89510662366
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpd6-0002AQ-2D; Mon, 09 Jan 2023 05:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEpd3-00029q-2u
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEpd1-0000ZQ-EP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673261022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jnb5WeHNbExJ4yuwNGr8qjmzbbmpw2qgBrspz2OfmYg=;
 b=DASNnYjDUDqEaTj6lYNBDA0VUXB2IIhdlJ/YMxAtyi4IkzIW1ewG1FkiHGxqglg1e+JN/o
 LlEg5Zm0nJZFUWyaO2kBBQB2nTyUGsNbeNF/KzqMe0PjvzSmhdZd4S02aBvWMB9YCB3sLF
 tD1FOcz+HEwWQlS1WVinqt1NkKTyjo8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-AGgEhfZuODS4gexEWBTNdA-1; Mon, 09 Jan 2023 05:43:41 -0500
X-MC-Unique: AGgEhfZuODS4gexEWBTNdA-1
Received: by mail-wr1-f72.google.com with SMTP id
 b6-20020adfc746000000b002bae2b30112so1161830wrh.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jnb5WeHNbExJ4yuwNGr8qjmzbbmpw2qgBrspz2OfmYg=;
 b=mLTIdDh3l2CxTiijXdvX38dBTc09xp88VUSqS07J5KQPXMKoS697yecGA72HrkcR30
 4mLZBNUPrEBUAv5LrOvQZu12aygmwx3yWxJplVxqD/HY+pw3TW4HvExse57IKKppLHQU
 8uJq5WZpzLHvYyF32pDgA9tah2GHupegkMttXPRWzHqUBu7e+C0O8bjYmbjc+xE1p9JW
 u6gLuvTQWYl1E6E2CWm7P1VQ8sEOchG3Q0WiZIZHMo4hKdwIJFqtpoLy81e0/yE/etr3
 djp0bDJNiESiXpnbLK/XDtj4eNHeBX8kHCKScK9kGhRIJN0hfjzRviNvhQ4lYLFTd9Px
 66sw==
X-Gm-Message-State: AFqh2kqTqNmdqOvvfDcqr3O/sAm8Sf5XnIhqjY6/CL1oNOwfRVvYuWCO
 jV6j/RCYmy324dLEj5Of+NtTqBOI+LL53x6EmgejEFoPv6cabBACF8VsCR7lu7l1I6Ll6Kwn8C5
 Bdst0ajg96J0XtBM=
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr49230428wmq.32.1673261019642; 
 Mon, 09 Jan 2023 02:43:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyMmSfRXjsJRFM/sKQ7R5hRxN9OPuiVRhM0+00kn6TjZy9tZ3OhoEkf2db3wuaBF8tQxSpKg==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr49230408wmq.32.1673261019411; 
 Mon, 09 Jan 2023 02:43:39 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm17305613wms.15.2023.01.09.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:43:39 -0800 (PST)
Date: Mon, 9 Jan 2023 10:43:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, quintela@redhat.com,
 peterx@redhat.com
Subject: Re: [PULL v4 42/83] virtio-rng-pci: Allow setting nvectors, so we
 can use MSI-X
Message-ID: <Y7vv2dfvs47PIiRo@work-vm>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-43-mst@redhat.com>
 <Y7vqfatDXI5RD3I5@work-vm>
 <20230109053440-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109053440-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Mon, Jan 09, 2023 at 10:20:45AM +0000, Dr. David Alan Gilbert wrote:
> > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > From: David Daney <david.daney@fungible.com>
> > > 
> > > Most other virtio-pci devices allow MSI-X, let's have it for rng too.
> > > 
> > > Signed-off-by: David Daney <david.daney@fungible.com>
> > > Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
> > > Message-Id: <20221014160947.66105-1-philmd@fungible.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > This breaks migration compatibility 7.1->7.2 :
> > 
> > (qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
> > qemu: Failed to load PCIDevice:config
> > qemu: Failed to load virtio-rng:virtio
> > qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
> > qemu: load of migration failed: Invalid argument
> > 
> > because the destination is configured with msi-x but the source isn't.
> > 
> > The fix is in theory simple:
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index f589b92909..45459d1cef 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> >  
> >  GlobalProperty hw_compat_7_1[] = {
> >      { "virtio-device", "queue_reset", "false" },
> > +    { "virtio-rng-pci", "vectors", "0" },
> >  };
> >  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> > 
> > the gotcha is that will break 7.2->7.2-fixed.
> > 
> > (I guess you can also work around it by explicitly passing vectors=0 to
> > the virtio-rng on the cli)
> > 
> > Does anyone have preferences as to whether that should be fixed in the
> > 7.2 world or left as is?
> > 
> > This is:
> > https://bugzilla.redhat.com/show_bug.cgi?id=2155749
> > 
> > Dave
> 
> I think that yes, it should be fixed in 7.2.

OK, I'll resend that as a patch in a mo.

Dave

> 
> > > ---
> > >  hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
> > > index 151ece6f94..6e76f8b57b 100644
> > > --- a/hw/virtio/virtio-rng-pci.c
> > > +++ b/hw/virtio/virtio-rng-pci.c
> > > @@ -13,6 +13,7 @@
> > >  
> > >  #include "hw/virtio/virtio-pci.h"
> > >  #include "hw/virtio/virtio-rng.h"
> > > +#include "hw/qdev-properties.h"
> > >  #include "qapi/error.h"
> > >  #include "qemu/module.h"
> > >  #include "qom/object.h"
> > > @@ -31,11 +32,23 @@ struct VirtIORngPCI {
> > >      VirtIORNG vdev;
> > >  };
> > >  
> > > +static Property virtio_rng_properties[] = {
> > > +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
> > > +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
> > > +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> > > +                       DEV_NVECTORS_UNSPECIFIED),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > >  static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> > >  {
> > >      VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
> > >      DeviceState *vdev = DEVICE(&vrng->vdev);
> > >  
> > > +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> > > +        vpci_dev->nvectors = 2;
> > > +    }
> > > +
> > >      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
> > >          return;
> > >      }
> > > @@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
> > >      pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
> > >      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> > >      pcidev_k->class_id = PCI_CLASS_OTHERS;
> > > +    device_class_set_props(dc, virtio_rng_properties);
> > >  }
> > >  
> > >  static void virtio_rng_initfn(Object *obj)
> > > -- 
> > > MST
> > > 
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


