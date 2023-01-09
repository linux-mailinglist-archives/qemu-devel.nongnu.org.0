Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0ED66230F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:21:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpHF-0002jJ-B5; Mon, 09 Jan 2023 05:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEpGy-0002cI-Ul
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEpGv-0007n5-0B
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673259651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwdmXHLp6BzFKQoNDcoTFkfHoGPiP5e5nxuIdCafljQ=;
 b=SwCwToL5XlW4NPY2+cKhNZ5XSyw9SAfQJ2EHvo+Yjx9Hmx8DqvGrEMQOrdmDzh2pnsdFnX
 auQcUjUNiI/1ClZ34TlSv8PF6qFXEKZl1mZ1QroL5GwoPjpJi7VCWz7t8wqjKqNUmcFrim
 ZhGTrj6aKlYBPap5SIprdfnsDUrpld0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-2Yf0cSmEMpeaaBQrGhh9HA-1; Mon, 09 Jan 2023 05:20:49 -0500
X-MC-Unique: 2Yf0cSmEMpeaaBQrGhh9HA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d27-20020adfa35b000000b002bc813ba677so35029wrb.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KwdmXHLp6BzFKQoNDcoTFkfHoGPiP5e5nxuIdCafljQ=;
 b=7x3xqt81XGYf9ONKHanROAMALOOXZfNhfwFmH/57LyEnO07sq4+GoK5OkDqwPwjvYH
 8c9tlL9EpoiCGcOVRUXyzSPo1nae4VHiLzq6XeuH8j1Wbyq6ykya1BOOnA6ydpw/qLlJ
 I9OBH56aFURbCH5PvcEGxeAQjlCtCKQx+7YwT4R8c4OIMM6mzBCTOzxQ9sk2QoAW9XGm
 pUqAzjTeczpFZ23ChJ/KhVfJqrziKGcQYWTSVFHaAeowq3f/Jhxhvc+sDIi64IGuAYT6
 KLjKw3f8uT0XP/zPltI3wrHoLKYrxOqoRiRkpOB/KzbcSOSRGzZ1hAAOVfauT+vh08WB
 6zMg==
X-Gm-Message-State: AFqh2kpeD2eWN80lhfLZ9Epf43fFcfz64klsFGTYVy/LfSjsP1QL3hbN
 sGE6G7NZ5dLTAzKQJxWr3D0CsaokmQjh1xtQlUP6uN+MNKOze2TSnmleveTIj9s/sCryIDxBuHK
 QflboxTXW3/Xl5Zw=
X-Received: by 2002:a05:6000:49:b0:242:6777:c7e2 with SMTP id
 k9-20020a056000004900b002426777c7e2mr37971480wrx.31.1673259647923; 
 Mon, 09 Jan 2023 02:20:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXulN0m3Cf0+Pvw1mTjvcR2/6si66hrcOiEYm9AoIheEWMwAyiVx8jK6rFGAyT6edfO9tugaeQ==
X-Received: by 2002:a05:6000:49:b0:242:6777:c7e2 with SMTP id
 k9-20020a056000004900b002426777c7e2mr37971468wrx.31.1673259647688; 
 Mon, 09 Jan 2023 02:20:47 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b00241cfe6e286sm8057713wrs.98.2023.01.09.02.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:20:47 -0800 (PST)
Date: Mon, 9 Jan 2023 10:20:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, quintela@redhat.com,
 peterx@redhat.com
Subject: Re: [PULL v4 42/83] virtio-rng-pci: Allow setting nvectors, so we
 can use MSI-X
Message-ID: <Y7vqfatDXI5RD3I5@work-vm>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-43-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-43-mst@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> From: David Daney <david.daney@fungible.com>
> 
> Most other virtio-pci devices allow MSI-X, let's have it for rng too.
> 
> Signed-off-by: David Daney <david.daney@fungible.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
> Message-Id: <20221014160947.66105-1-philmd@fungible.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

This breaks migration compatibility 7.1->7.2 :

(qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
qemu: Failed to load PCIDevice:config
qemu: Failed to load virtio-rng:virtio
qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
qemu: load of migration failed: Invalid argument

because the destination is configured with msi-x but the source isn't.

The fix is in theory simple:
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f589b92909..45459d1cef 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
+    { "virtio-rng-pci", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);

the gotcha is that will break 7.2->7.2-fixed.

(I guess you can also work around it by explicitly passing vectors=0 to
the virtio-rng on the cli)

Does anyone have preferences as to whether that should be fixed in the
7.2 world or left as is?

This is:
https://bugzilla.redhat.com/show_bug.cgi?id=2155749

Dave

> ---
>  hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
> index 151ece6f94..6e76f8b57b 100644
> --- a/hw/virtio/virtio-rng-pci.c
> +++ b/hw/virtio/virtio-rng-pci.c
> @@ -13,6 +13,7 @@
>  
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-rng.h"
> +#include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> @@ -31,11 +32,23 @@ struct VirtIORngPCI {
>      VirtIORNG vdev;
>  };
>  
> +static Property virtio_rng_properties[] = {
> +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>  {
>      VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
>      DeviceState *vdev = DEVICE(&vrng->vdev);
>  
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = 2;
> +    }
> +
>      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>          return;
>      }
> @@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
>      pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
>      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>      pcidev_k->class_id = PCI_CLASS_OTHERS;
> +    device_class_set_props(dc, virtio_rng_properties);
>  }
>  
>  static void virtio_rng_initfn(Object *obj)
> -- 
> MST
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


