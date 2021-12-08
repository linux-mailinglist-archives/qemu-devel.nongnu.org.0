Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181046D235
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 12:31:30 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muvAW-0003I7-3F
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 06:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muv8y-0002QT-2A
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muv8u-0003Q0-F9
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638962987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2b62NQXKOt8ppnkv+Bg3xKl55NRicgHvHjq4fhYetg=;
 b=NnvIhmYG2ClL4IBmz45tjC9VNz27VnW5Tnnj0zKJaeUvy6K3l1CumpBB8w9/CSefLTAZgF
 LJUImsKkVbGUHSyatVmUuGkdNw19S1Ds1heNcuQL6ZDRuOj4eScG/ouhmc/8f6i5ShVeDP
 13kPv/h7IAgWitRAhfszv80qCKeuHAQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-HiNitNdlPRiM5iUjckwrAA-1; Wed, 08 Dec 2021 06:29:46 -0500
X-MC-Unique: HiNitNdlPRiM5iUjckwrAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1285079wms.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 03:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N2b62NQXKOt8ppnkv+Bg3xKl55NRicgHvHjq4fhYetg=;
 b=eJeHXqXqEA8Z8UiArqnd//N3VF514lHckqShYcnQfl+O5iPfuQ9LoNdd4hhHMF3AWJ
 Vnh+fR75WWWhz8OnhU9875AZm7cajrf57FUa64fQ6CCXqJpyMlx/e+9DaBfSJDAp3mtX
 SS8JuTZL1zHFknyZV0ILpUo7TXBzxxB8wa9HLxeMCYLCqubMA3g/hT98eqplnyVeT8g5
 ym1pKLmGsovuEL8UsNhbJAPSDxVxgNyN/Iq4awW7R7ygAqD9QsKarW7KXEBKyDA/LC6x
 9Sm8lNbZD63scg+LqgARhoyfmV36lQK30ZLi9lJffbmlJIOb64BECSVboDjOn/RsbBDx
 7avw==
X-Gm-Message-State: AOAM531v8HNx6Rjt0kAhwkdrr60kHWkIsqErZB27uuJOgTqB6zV7vxcB
 ZI4yfeuUNzDLueD/l0wQhJpS8yZXIBJuTDYSI1+OF+FFxHoqRpRDQLt24fJpFdYClBiruoHWzrS
 noVLiUlrp12NvXRI=
X-Received: by 2002:a05:600c:2292:: with SMTP id
 18mr15358116wmf.6.1638962985110; 
 Wed, 08 Dec 2021 03:29:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDBkCT2nOYJ9nLv7falHMNfi4tp2O1mOqA3XtIs880cErvvJYO9FXvHpNY7ZCZk3BazlIczg==
X-Received: by 2002:a05:600c:2292:: with SMTP id
 18mr15358051wmf.6.1638962984642; 
 Wed, 08 Dec 2021 03:29:44 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id r8sm3060095wrz.43.2021.12.08.03.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:29:44 -0800 (PST)
Message-ID: <6e4e0755-3ecb-c9d8-6e09-9cee5c9f3fb7@redhat.com>
Date: Wed, 8 Dec 2021 12:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 09/12] s390x/pci: enable adapter event notification for
 interpreted devices
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-10-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207210425.150923-10-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 22.04, Matthew Rosato wrote:
> Use the associated vfio feature ioctl to enable adapter event notification
> and forwarding for devices when requested.  This feature will be set up
> with or without firmware assist based upon the 'intassist' setting.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c          | 24 +++++++--
>   hw/s390x/s390-pci-inst.c         | 54 +++++++++++++++++++-
>   hw/s390x/s390-pci-vfio.c         | 88 ++++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-bus.h  |  1 +
>   include/hw/s390x/s390-pci-vfio.h | 20 ++++++++
>   5 files changed, 182 insertions(+), 5 deletions(-)
[...]
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 78093aaac7..6f9271df87 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -152,6 +152,94 @@ int s390_pci_update_passthrough_fh(S390PCIBusDevice *pbdev)
>       return 0;
>   }
>   
> +int s390_pci_probe_aif(S390PCIBusDevice *pbdev)
> +{
> +    VFIOPCIDevice *vdev = container_of(pbdev->pdev, VFIOPCIDevice, pdev);

Should this use VFIO_PCI() instead of container_of ?

> +    struct vfio_device_feature feat = {
> +        .argsz = sizeof(struct vfio_device_feature),
> +        .flags = VFIO_DEVICE_FEATURE_PROBE + VFIO_DEVICE_FEATURE_ZPCI_AIF
> +    };
> +
> +    assert(vdev);

... then you could likely also drop the assert(), I think?

> +    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, &feat);
> +}
> +
> +int s390_pci_set_aif(S390PCIBusDevice *pbdev, ZpciFib *fib, bool enable,
> +                     bool assist)
> +{
> +    VFIOPCIDevice *vdev = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
> +    g_autofree struct vfio_device_feature *feat;
> +    struct vfio_device_zpci_aif *data;
> +    int size;
> +
> +    assert(vdev);

dito

> +    size = sizeof(*feat) + sizeof(*data);
> +    feat = g_malloc0(size);
> +    feat->argsz = size;
> +    feat->flags = VFIO_DEVICE_FEATURE_SET + VFIO_DEVICE_FEATURE_ZPCI_AIF;
> +
> +    data = (struct vfio_device_zpci_aif *)&feat->data;
> +    if (enable) {
> +        data->flags = VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT;
> +        if (!pbdev->intassist) {
> +            data->flags |= VFIO_DEVICE_ZPCI_FLAG_AIF_HOST;
> +        }
> +        /* Fill in the guest fib info */
> +        data->ibv = fib->aibv;
> +        data->sb = fib->aisb;
> +        data->noi = FIB_DATA_NOI(fib->data);
> +        data->isc = FIB_DATA_ISC(fib->data);
> +        data->sbo = FIB_DATA_AISBO(fib->data);
> +    } else {
> +        data->flags = 0;
> +    }
> +
> +    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, feat);
> +}
> +
> +int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable, bool assist)
> +{
> +    VFIOPCIDevice *vdev = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
> +    g_autofree struct vfio_device_feature *feat;
> +    struct vfio_device_zpci_aif *data;
> +    int size, rc;
> +
> +    assert(vdev);

dito

> +    size = sizeof(*feat) + sizeof(*data);
> +    feat = g_malloc0(size);
> +    feat->argsz = size;
> +    feat->flags = VFIO_DEVICE_FEATURE_GET + VFIO_DEVICE_FEATURE_ZPCI_AIF;
> +
> +    rc = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, feat);
> +    if (rc) {
> +        return rc;
> +    }
> +
> +    /* Determine if current interrupt settings match the host */
> +    data = (struct vfio_device_zpci_aif *)&feat->data;
> +    if (enable && (!(data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT))) {
> +        rc = -EINVAL;
> +    } else if (!enable && (data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_FLOAT)) {
> +        rc = -EINVAL;
> +    }
> +
> +    /*
> +     * When enabled for interrupts, the assist and forced host-delivery are
> +     * mututally exclusive
> +     */
> +    if (enable && assist && (data->flags & VFIO_DEVICE_ZPCI_FLAG_AIF_HOST)) {
> +        rc = -EINVAL;
> +    } else if (enable && (!assist) && (!(data->flags &
> +                                         VFIO_DEVICE_ZPCI_FLAG_AIF_HOST))) {
> +        rc = -EINVAL;
> +    }
> +
> +    return rc;
> +}

  Thomas


