Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00E436391
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:55:35 +0200 (CEST)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYXT-0004jW-CS
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYVW-0003J0-Kc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYVU-0006GR-VA
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKbyJTdxpEjK5nV0vqJvtMsg5+E7yquIbZbyhZcc8Y0=;
 b=NUsLwjFgNoZy2bDnVFyk+S3kpo4eohQnO7Vt8sT4h1/I7OK7XNa9EzrL7ciXyHIMT+aLMh
 2OfL4jEemIA2QEYFLiFqYvtOgbPvZNidigkbC9rYsvtmjFhgGa9jzTy8/uRvNg01GqcxeZ
 oE4v37G75iQT+9UmRu9rI8OP8yOSpB8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-iCObXVCkPJi-BkYGcZUvFA-1; Thu, 21 Oct 2021 09:53:17 -0400
X-MC-Unique: iCObXVCkPJi-BkYGcZUvFA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so440706edj.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKbyJTdxpEjK5nV0vqJvtMsg5+E7yquIbZbyhZcc8Y0=;
 b=NvIVC8zD5Mq9xHSWONeQ1MjaW2AjP+dSC09PQl5Gb1mB9Pc6vTojOtAlyQoTdX74ds
 AoRRXYK9CGVhJ0ihvs6/tuSAzKZbmuHm9aPJzTYhnoNUqwvuqfunYSmYARwJ3PYCSo4P
 0XoorGcQ8gSN2aB6nSsFzUK2rXGwQxCoLdTLkpllh7P8EsFNhThUXydVrv3RzjHs+P33
 XR8IWgwlKC80JDDa5ZsDWd/O3azD+uu/f4ny1QYg4kKOvER/+yRgzcjB4Rv5Of7c6uF4
 L+NHYsI4qBt1KlyEdAP8et9oAi8I2oXtEk22hSY3n7vKm7GZ8EEEFaHxLs6tCch8GZH5
 LlrA==
X-Gm-Message-State: AOAM530M5WRUir1KSIArdByeaXfIHzBroOp4mYUDU0wsQ/oXM6tALQzk
 ERiiu82bN04ycv3wJzBBqOmjFmTyirsxXbwrRGEJL5Bt0sdes/eEgamz6zdu28ObF2PQSBd2aZ5
 lrZXWUw0AZYKpFmg=
X-Received: by 2002:a17:907:7e81:: with SMTP id
 qb1mr7382885ejc.65.1634824395945; 
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdd9YcKOxSUqR0G52qi4Q7wKuSqRLAEu5k74W6NsW5/IfBtdQlSpMRlD4RLQGtQNVRna06Qg==
X-Received: by 2002:a17:907:7e81:: with SMTP id
 qb1mr7382832ejc.65.1634824395718; 
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a13sm2545230ejx.39.2021.10.21.06.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:53:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 06/12] hw/arm/virt: Remove device tree restriction
 for virtio-iommu
Message-ID: <20211021155314.1ccd3999@redhat.com>
In-Reply-To: <20211020172745.620101-7-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-7-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 18:27:40 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c | 12 ++----------
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f7f456bf58..3da7a86e37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2561,16 +2561,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>  
>      if (device_is_dynamic_sysbus(mc, dev) ||
> -       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> -        VirtMachineState *vms = VIRT_MACHINE(machine);
> -
> -        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) {
> -            return HOTPLUG_HANDLER(machine);
> -        }
> -    }
>      return NULL;
>  }
>  
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..5c0b87316a 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,16 +48,8 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> -
> -        error_setg(errp,
> -                   "%s machine fails to create iommu-map device tree bindings",
> -                   mc->name);
> -        error_append_hint(errp,
> -                          "Check your machine implements a hotplug handler "
> -                          "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
> +        error_setg(errp, "Check your machine implements a hotplug handler "
> +                         "for the virtio-iommu-pci device");
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {


