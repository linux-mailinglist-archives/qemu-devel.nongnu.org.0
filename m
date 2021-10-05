Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143E4225D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:00:21 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXj7L-0007Ig-JF
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXj4r-00067S-EK
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXj4n-0001ta-Ex
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633435059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gb+KQLmd6wMzwN61bPmcWoRFOQr1IXigS02ourGUEk4=;
 b=gaVKLqoZZRxM4+Q3k6wwIlQIOfprjzOC225RzQQ7zI9Lp6BqE4yh5CszTDVvvR9Xdq2dcF
 3h7sNnN9chv9gczxxPhOr4chL53NoBteFtGIdiFPbZpMbpG8qOfRHFGhMg6/WPYf+A3VLP
 VPfHJKaTgdgtJeGc0k5Eag++n0ws3i0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-SqRFaxwmOjO-1GgSbwWfIQ-1; Tue, 05 Oct 2021 07:57:38 -0400
X-MC-Unique: SqRFaxwmOjO-1GgSbwWfIQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5667802wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Gb+KQLmd6wMzwN61bPmcWoRFOQr1IXigS02ourGUEk4=;
 b=n7avYhNFVZF+azarVrzjUV429JB1Ojobj2L5Ql70uc7p20pBpcPjT+lRnadhQ1EU/b
 OP98+dNuJ83UQ6i8sa0D15w1Xlv7NLGfzGIT3edwEZS9/s7RB/dWk1p6FSxZyTiSU1ys
 nJo40Ev7THLySoWsFe80+yDW8utVGoifsddETzYmvRyesHB8xLdZROaJ79KRFbLOmtSK
 6GXkS4vJoLvWQsj0yLVSTlvxKtik5tD5EGFL93OIcDYArSVNXAGXzJi1Vo02FqEsdPBa
 n9X+h2BP4onRuBAldvsgC6T8XUREGNd1i54Wa7IAHWo2juZlqvqL/iqkGzYxD2YxBHWB
 pmVA==
X-Gm-Message-State: AOAM531ixA/P3JtXco5KTszKNq/MfmAawW+JRT2mVicgb3+AvMh8UDfI
 0PHbD0c3Euz3sFP7ShcOkeR9BxX1XZX4eUp27ylAB2zRCIxmjPG7UfYv9S6n2V8up1tH4pTx5Mt
 WnT+6HN72f3DnJIU=
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr2938097wmq.153.1633435057517; 
 Tue, 05 Oct 2021 04:57:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhdTaqDo4SKqBh7TiXDqDScfv/9KgscHg07uw72R0TMHPvqQAw+u6EbEGyXNDDNyUgPO99VA==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr2938067wmq.153.1633435057294; 
 Tue, 05 Oct 2021 04:57:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z1sm13712555wrt.41.2021.10.05.04.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 04:57:36 -0700 (PDT)
Subject: Re: [PATCH v4 03/11] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
Date: Tue, 5 Oct 2021 13:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c |  7 -------
>  2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1d59f0e59f..56e8fc7059 100644
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
actually this does not work. To add a hint you need the *errp to be set.
Otherwise when running through this path you will get

emu-system-x86_64: ../util/error.c:158: error_append_hint: Assertion
`err && errp != &error_abort && errp != &error_fatal' failed.

replace the error_append_hint with an error_setg (without the \n)

Thanks

Eric
>          error_append_hint(errp,
>                            "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {


