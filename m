Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7A662347
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpXt-000089-VG; Mon, 09 Jan 2023 05:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEpXr-0008VQ-6a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEpXp-000605-31
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673260699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwEbHAI/ILXxZ39poqmpCFWerv2Gso6tcoozdAn6fr0=;
 b=iNfGgQZX3aXWJcqLc0pgncHeWUZyTAdlkz0Dng4IvHPfLdwU7Pn3obgOAlO0hAbfSv2C06
 a4fKl9zu0GmrtWymKH3PCGp5qo+0oyqMd3MYhK4ZExuNferv/EIMh2Gc3V6q6NAF5nY18l
 ZXC4hZuSKKXIZMjoyIfYZ5OUNOmUNEw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-Syu7QcfmN4ywFW5T9BPSgw-1; Mon, 09 Jan 2023 05:38:17 -0500
X-MC-Unique: Syu7QcfmN4ywFW5T9BPSgw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q22-20020adfb196000000b002bbe8a76d8dso581578wra.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cwEbHAI/ILXxZ39poqmpCFWerv2Gso6tcoozdAn6fr0=;
 b=DbQZErs10nJ8Dkx7eLXCbS4zdcyhrCxGIziurNsvKiJdgyNPcdTFdZGI1CG4IDkm5k
 uKdSWDmO2z5Ch8psCRjN53F8iLYHUy3cyCiVINIA7W2pA9/dPuS9x/KyTmNjgYrCmVP4
 PDB7sbuEwPhPfNPRjo5FnTjWNu2OYOLtLWZL3PAxfDU0MJ2lixUaPIa0Ih9sIYfkoRxV
 zfexXsM40LGp2Fdl7B8LW7kU2FlOcJ9T+GT29oVP+xWkVEOG7sPhDhEj5iLb8b6otkFI
 j3xpCBpOvNaV1KPwSXAhMZ0D1t1dEkMLqHXN2pTcwyDN+CWMXykA1n33oxnqRWWveYhO
 zaQA==
X-Gm-Message-State: AFqh2kqC5XImy3i24og8IDAgRy8ZpdrxuP30RjmdbzCOkElbQ4yvGQxF
 yuAl8eFwjpc3ETdoMIO5ZtRuZG0HeTwu6A3qT+8qP0ljeO1Qe3LZNvXUwMeTK3y5YLR145VjbcN
 5xrZ11RJdDuDG24Y=
X-Received: by 2002:a05:600c:3d05:b0:3d3:5c21:dd94 with SMTP id
 bh5-20020a05600c3d0500b003d35c21dd94mr47660081wmb.9.1673260696474; 
 Mon, 09 Jan 2023 02:38:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRjyQNj8kkFKzSwxPDIlISt5Rvz6m1v78k2QLh9hbXNug9M/DWqeoodZBoMS8iDuE9vziAnA==
X-Received: by 2002:a05:600c:3d05:b0:3d3:5c21:dd94 with SMTP id
 bh5-20020a05600c3d0500b003d35c21dd94mr47660068wmb.9.1673260696204; 
 Mon, 09 Jan 2023 02:38:16 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003d9ea176d54sm7553198wmq.27.2023.01.09.02.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:38:15 -0800 (PST)
Date: Mon, 9 Jan 2023 05:38:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, quintela@redhat.com,
 peterx@redhat.com
Subject: Re: [PULL v4 42/83] virtio-rng-pci: Allow setting nvectors, so we
 can use MSI-X
Message-ID: <20230109053440-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-43-mst@redhat.com>
 <Y7vqfatDXI5RD3I5@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7vqfatDXI5RD3I5@work-vm>
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

On Mon, Jan 09, 2023 at 10:20:45AM +0000, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > From: David Daney <david.daney@fungible.com>
> > 
> > Most other virtio-pci devices allow MSI-X, let's have it for rng too.
> > 
> > Signed-off-by: David Daney <david.daney@fungible.com>
> > Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
> > Message-Id: <20221014160947.66105-1-philmd@fungible.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> This breaks migration compatibility 7.1->7.2 :
> 
> (qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
> qemu: Failed to load PCIDevice:config
> qemu: Failed to load virtio-rng:virtio
> qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
> qemu: load of migration failed: Invalid argument
> 
> because the destination is configured with msi-x but the source isn't.
> 
> The fix is in theory simple:
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f589b92909..45459d1cef 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>  
>  GlobalProperty hw_compat_7_1[] = {
>      { "virtio-device", "queue_reset", "false" },
> +    { "virtio-rng-pci", "vectors", "0" },
>  };
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> 
> the gotcha is that will break 7.2->7.2-fixed.
> 
> (I guess you can also work around it by explicitly passing vectors=0 to
> the virtio-rng on the cli)
> 
> Does anyone have preferences as to whether that should be fixed in the
> 7.2 world or left as is?
> 
> This is:
> https://bugzilla.redhat.com/show_bug.cgi?id=2155749
> 
> Dave

I think that yes, it should be fixed in 7.2.


> > ---
> >  hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
> > index 151ece6f94..6e76f8b57b 100644
> > --- a/hw/virtio/virtio-rng-pci.c
> > +++ b/hw/virtio/virtio-rng-pci.c
> > @@ -13,6 +13,7 @@
> >  
> >  #include "hw/virtio/virtio-pci.h"
> >  #include "hw/virtio/virtio-rng.h"
> > +#include "hw/qdev-properties.h"
> >  #include "qapi/error.h"
> >  #include "qemu/module.h"
> >  #include "qom/object.h"
> > @@ -31,11 +32,23 @@ struct VirtIORngPCI {
> >      VirtIORNG vdev;
> >  };
> >  
> > +static Property virtio_rng_properties[] = {
> > +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
> > +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
> > +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> > +                       DEV_NVECTORS_UNSPECIFIED),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> >  static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >  {
> >      VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
> >      DeviceState *vdev = DEVICE(&vrng->vdev);
> >  
> > +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> > +        vpci_dev->nvectors = 2;
> > +    }
> > +
> >      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
> >          return;
> >      }
> > @@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
> >      pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
> >      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> >      pcidev_k->class_id = PCI_CLASS_OTHERS;
> > +    device_class_set_props(dc, virtio_rng_properties);
> >  }
> >  
> >  static void virtio_rng_initfn(Object *obj)
> > -- 
> > MST
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


