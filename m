Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C409A436330
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:36:54 +0200 (CEST)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYFZ-0008Ab-LE
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYDF-0006nE-Oe
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYDC-0000Rw-Vj
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634823266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3mLcux7jZj4mWCVnWCeCwIte0mY9b/6kM8JkmAPZ2o=;
 b=hb3wQby3+zeJIY3MoXSRNwHM0q2L7aIuYXNnXeAhj3wZv/SVjI2pQGsMbgMVusIQqqf1Ys
 AX9E12lzDrwB2XMxo0hzB+RWOaX87yLKdaLBQy0jU9xrVc4x9P52R/xSlCZaN1LDlb7X07
 lsTMos0ya5MOXz9n6ZC8zxYltEPTGOk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-Zih4cyM-M1KK5v20LmKscA-1; Thu, 21 Oct 2021 09:34:25 -0400
X-MC-Unique: Zih4cyM-M1KK5v20LmKscA-1
Received: by mail-ed1-f70.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso340527edt.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3mLcux7jZj4mWCVnWCeCwIte0mY9b/6kM8JkmAPZ2o=;
 b=4ahffHBZVZry5fPxtb1KJB0BSWCB2zfdZKlF5y2wIaGOr1Zq70X7oSrjFaNoZeVeVX
 wuFfLYG8uSBjw7XWSxhi1oYFSJVTsexTgzj8wI+PXSW/zxfj5hhvh51tKuLrFTdq1qAv
 C5DLiobsNIN/rr6eDiVq4FlRMEC0FmjBWikUHvmivp3Ccidae6vHvU8laIFQQhd7F6g4
 JlpfpuslmJeQAOq2K0NCebNNAwYy0RXUziMeLK+Tt7HmkwGIHTfbLt6rlkktH1b/7B6j
 IQKocRq6M0lkC2u95cMZShR4dB55FaPh6EXKrNyw8XO+XMcEvBdLFjWxE7FiRyGyCMII
 HVig==
X-Gm-Message-State: AOAM532G/9eau3n3Qt1cFOk21F+7+YGCDS/wq7NdM337GQa1I4yvsEFn
 4LnyzI2uUdO7xs3e1Mw9cgFppSYc3NZ2lgyQbhsVQIS4NXnd2dGjvcHUUQMdX3iWuIMGhNVlgAx
 8JOIBdazo6tCfDyg=
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr7260668ejb.3.1634823264064; 
 Thu, 21 Oct 2021 06:34:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfYYdpekPqEq/IVbFKUenJm7kAbIwsri3G7VZiqy69oTKN3aHIc8fvEdO/xyd/4PkC9TtbIw==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr7260632ejb.3.1634823263730; 
 Thu, 21 Oct 2021 06:34:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id kw5sm2554132ejc.110.2021.10.21.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:34:23 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:34:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 03/12] hw/i386/pc: Move IOMMU singleton into
 PCMachineState
Message-ID: <20211021153422.5399a4dc@redhat.com>
In-Reply-To: <20211020172745.620101-4-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-4-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 20 Oct 2021 18:27:37 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We're about to support a third vIOMMU for x86, virtio-iommu which
> doesn't inherit X86IOMMUState. Move the IOMMU singleton into
> PCMachineState, so it can be shared between all three vIOMMUs.
> 
> The x86_iommu_get_default() helper is still needed by KVM and IOAPIC to
> fetch the default IRQ-remapping IOMMU. Since virtio-iommu doesn't
> support IRQ remapping, this interface doesn't need to change for the
> moment. We could later replace X86IOMMUState with an "IRQ remapping
> IOMMU" interface if necessary.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/pc.h |  1 +
>  hw/i386/pc.c         | 12 +++++++++++-
>  hw/i386/x86-iommu.c  | 26 ++++++++------------------
>  3 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 11426e26dc..b72e5bf9d1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -35,6 +35,7 @@ typedef struct PCMachineState {
>      I2CBus *smbus;
>      PFlashCFI01 *flash[2];
>      ISADevice *pcspk;
> +    DeviceState *iommu;
>  
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 54e4c00dce..fcbf328e8d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1330,6 +1330,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +
> +        if (pcms->iommu) {
> +            error_setg(errp, "QEMU does not support multiple vIOMMUs "
> +                       "for x86 yet.");
> +            return;
> +        }
> +        pcms->iommu = dev;
>      }
>  }
>  
> @@ -1384,7 +1393,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index dc968c7a53..01d11325a6 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -77,25 +77,17 @@ void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *msg_out)
>      msg_out->data = msg.msi_data;
>  }
>  
> -/* Default X86 IOMMU device */
> -static X86IOMMUState *x86_iommu_default = NULL;
> -
> -static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
> +X86IOMMUState *x86_iommu_get_default(void)
>  {
> -    assert(x86_iommu);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    PCMachineState *pcms =
> +        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
>  
> -    if (x86_iommu_default) {
> -        error_report("QEMU does not support multiple vIOMMUs "
> -                     "for x86 yet.");
> -        exit(1);
> +    if (pcms &&
> +        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
> +        return X86_IOMMU_DEVICE(pcms->iommu);
>      }
> -
> -    x86_iommu_default = x86_iommu;
> -}
> -
> -X86IOMMUState *x86_iommu_get_default(void)
> -{
> -    return x86_iommu_default;
> +    return NULL;
>  }
>  
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
> @@ -131,8 +123,6 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
>      if (x86_class->realize) {
>          x86_class->realize(dev, errp);
>      }
> -
> -    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
>  }
>  
>  static Property x86_iommu_properties[] = {


