Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B022D401D30
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:40:00 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFmx-0005W2-9N
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFm4-0004fM-OA
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFm3-0006uf-0c
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630939142;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hD2DgVkuL0eKnO1s63CcIuBdztRtwDhIrROJ2rKhexM=;
 b=NMS2uKhOIzdffIhnWfZyuHxfFlnuko9ZI3wLNihTw+lgsPUTFZUfCfW/ipiYc+qf78Z9Uy
 wPiL+zO+jcsdT1ItxPqD98g8eflw2uTUY2fWLutIV//pM7bOpD6CR4uVWFDkCUs23rmrqs
 Edi67+DWvUivZhEEYIP1avVIzGAtqck=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-4XMQUIEIM7mLVjt5gXLWfQ-1; Mon, 06 Sep 2021 10:39:01 -0400
X-MC-Unique: 4XMQUIEIM7mLVjt5gXLWfQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2410354wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hD2DgVkuL0eKnO1s63CcIuBdztRtwDhIrROJ2rKhexM=;
 b=l/veEozrUnVfgrzMHk43T4ReJ2sBjSHMH4YCF+repTZXweZLSoSaY72DaxTdAj5Hll
 yfwCKBmXli9NFc0jqVz18/Tn2Pakqf10CkuqhYJSc8jXJK9nVvS/GoYgIpfPlNEHE3zr
 p2eqadUyZRpZxgEMqvGwbA0NLTPiZ0UchBIERU1tfNLqIMxSCPwV/LmNrwq8+DD3VQ+t
 I/UBJD/R1aMbUP4M3dmtufZ8N2B7TlUB5/iNGDFQxpZZ8W75EgsPKWwsFxfIIeCr6K7o
 oToca7HZaNzwvNj0XVDaMlRTFr9rdCBfQk//mEncW1rw824FmNrkTLV24G8LD7isurpz
 k/uA==
X-Gm-Message-State: AOAM531cMUnXXZZe7pg6ALtMv/IczQJb1D9Qg0leKbUzjd+Rl9XlCx30
 mIGvoS8EeAY3UYm9Epku42hpxzbkEOrtsKfZNiXxGFlnJBy/c9Dsn8/YY3Zqrk7IlLFxJm3sbRD
 5aFAU+mXn9xAr3A8=
X-Received: by 2002:a5d:548e:: with SMTP id h14mr13914081wrv.7.1630939140070; 
 Mon, 06 Sep 2021 07:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMS1IkltCvS7A4VCAAwMaQIL3aJnCgVp7e7yB/zWwZoMiuS9eZ/vBR83Ere9u6RVL21qf2Lg==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr13914052wrv.7.1630939139878; 
 Mon, 06 Sep 2021 07:38:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id h8sm7351319wmb.35.2021.09.06.07.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:38:59 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <79d2016a-7736-c680-0c60-074dc8e37e52@redhat.com>
Date: Mon, 6 Sep 2021 16:38:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c |  7 -------
>  2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..b4598d3fe6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2551,16 +2551,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
> index 770c286be7..f30eb16cbf 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> -
> -        error_setg(errp,
> -                   "%s machine fails to create iommu-map device tree bindings",
> -                   mc->name);
>          error_append_hint(errp,
>                            "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {


