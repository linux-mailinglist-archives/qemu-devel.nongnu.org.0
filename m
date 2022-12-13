Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62164B960
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57ug-0002MS-Gc; Tue, 13 Dec 2022 11:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p57ue-0002Jc-6L
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p57ua-00020C-Ae
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670948022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxWCamxS2LzOKmOyzFWV+B8X+7w4N3e6/HvGrv/NZJc=;
 b=LFuw5xPmeQlShbXqbKMeBsOUHURF2U6aTm24heJxw2cAoaDEQWa45vQdVg1X6iJlFVwhiM
 GGsodlNofsAorgd3Pf3JM6IpP7o3d7/VIhMAIC1s2vhGdwY5abkzV2YvZ3IqD1w8pxTXTq
 k+JyOv0uYnSUkVh/fgkmG9ZO4OPIhBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-zPz5x1ALOrW9JMlta6prRA-1; Tue, 13 Dec 2022 11:13:41 -0500
X-MC-Unique: zPz5x1ALOrW9JMlta6prRA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so5837024wmb.8
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QxWCamxS2LzOKmOyzFWV+B8X+7w4N3e6/HvGrv/NZJc=;
 b=EHBdgv//lWJTiNPbOR9G8dKMIoUpr9U2yvRXrSijHQ+EMbOxYBmnZZ3AhoZ3hW5hW1
 ul4VvJqmCPZlH1Z774ieie+jHdlzkl19su+ChAjFJY+h+zEStJKg4BTUoOSG756uiyJ3
 HxF888EMNxhhB1pYUSgXZj3vLCor9pu0TEIPqZTIX4NGUymeR68TpXMhodWlykJnQ01b
 GeJzi25ix773wL7oD6fUAHv35vy9L8FPVR2Kgzs4SYEhvviEdeum2Mo7qUDBhCIAebuR
 nkYHLdi7bWOPwIB2Whtph0+Yn1iOkxwF99GDqlyOzryUfVih7LcmYosbTV8z1N5YzePz
 V5MA==
X-Gm-Message-State: ANoB5pnmqstE5aGPP0ST0GwuOVNordaWUOjFlGwyfonV4jaFyP0rIw2/
 7FQ3LnoH3umb0f0I8Wb4ZZ/RG8IhzwcFpfxkHhKs3kbsPZvRjtB4Pz9MGwwGu/e+PtkYy4lhHiO
 zerxm7f81lcyzk5s=
X-Received: by 2002:adf:dd0c:0:b0:242:5d52:53e4 with SMTP id
 a12-20020adfdd0c000000b002425d5253e4mr14116694wrm.17.1670948020121; 
 Tue, 13 Dec 2022 08:13:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZhTR2dAhX6T73Nk7BuGCOrZgy0iLAllZdtnwy1IdIYfNZ1CDvQWObFC4tpD8GMzKEIFxTYw==
X-Received: by 2002:adf:dd0c:0:b0:242:5d52:53e4 with SMTP id
 a12-20020adfdd0c000000b002425d5253e4mr14116677wrm.17.1670948019814; 
 Tue, 13 Dec 2022 08:13:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adff203000000b002423620d356sm182826wro.35.2022.12.13.08.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:13:39 -0800 (PST)
Message-ID: <3197a82a-8c51-d60c-3aae-921d77095af5@redhat.com>
Date: Tue, 13 Dec 2022 17:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 13/24] vfio-user: pci_user_realize PCI setup
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <9b5702602c3bc0c79df893b269276c74b057026b.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <9b5702602c3bc0c79df893b269276c74b057026b.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/22 00:13, John Johnson wrote:
> PCI BARs read from remote device
> PCI config reads/writes sent to remote server
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/pci.c | 277 ++++++++++++++++++++++++++++++++++++----------------------
>   1 file changed, 174 insertions(+), 103 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 027f9d5..7abe44e 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2874,6 +2874,133 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>       vdev->req_enabled = false;
>   }
>   
> +static void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp)
> +{
> +    PCIDevice *pdev = &vdev->pdev;
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +    Error *err = NULL;
> +
> +    /* vfio emulates a lot for us, but some bits need extra love */
> +    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
> +
> +    /* QEMU can choose to expose the ROM or not */
> +    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
> +    /* QEMU can also add or extend BARs */
> +    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
> +
> +    /*
> +     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
> +     * device ID is managed by the vendor and need only be a 16-bit value.
> +     * Allow any 16-bit value for subsystem so they can be hidden or changed.
> +     */
> +    if (vdev->vendor_id != PCI_ANY_ID) {
> +        if (vdev->vendor_id >= 0xffff) {
> +            error_setg(errp, "invalid PCI vendor ID provided");
> +            return;
> +        }
> +        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
> +        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
> +    } else {
> +        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
> +    }
> +
> +    if (vdev->device_id != PCI_ANY_ID) {
> +        if (vdev->device_id > 0xffff) {
> +            error_setg(errp, "invalid PCI device ID provided");
> +            return;
> +        }
> +        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
> +        trace_vfio_pci_emulated_device_id(vbasedev->name, vdev->device_id);
> +    } else {
> +        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
> +    }
> +
> +    if (vdev->sub_vendor_id != PCI_ANY_ID) {
> +        if (vdev->sub_vendor_id > 0xffff) {
> +            error_setg(errp, "invalid PCI subsystem vendor ID provided");
> +            return;
> +        }
> +        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
> +                               vdev->sub_vendor_id, ~0);
> +        trace_vfio_pci_emulated_sub_vendor_id(vbasedev->name,
> +                                              vdev->sub_vendor_id);
> +    }
> +
> +    if (vdev->sub_device_id != PCI_ANY_ID) {
> +        if (vdev->sub_device_id > 0xffff) {
> +            error_setg(errp, "invalid PCI subsystem device ID provided");
> +            return;
> +        }
> +        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
> +        trace_vfio_pci_emulated_sub_device_id(vbasedev->name,
> +                                              vdev->sub_device_id);
> +    }
> +
> +    /* QEMU can change multi-function devices to single function, or reverse */
> +    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
> +                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
> +
> +    /* Restore or clear multifunction, this is always controlled by QEMU */
> +    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
> +        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
> +    } else {
> +        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
> +    }
> +
> +    /*
> +     * Clear host resource mapping info.  If we choose not to register a
> +     * BAR, such as might be the case with the option ROM, we can get
> +     * confusing, unwritable, residual addresses from the host here.
> +     */
> +    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
> +    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
> +
> +    vfio_pci_size_rom(vdev);
> +
> +    vfio_bars_prepare(vdev);
> +
> +    vfio_msix_early_setup(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    vfio_bars_register(vdev);
> +}
> +
> +static int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
> +{
> +    PCIDevice *pdev = &vdev->pdev;
> +    int ret;
> +
> +    /* QEMU emulates all of MSI & MSIX */
> +    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
> +        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
> +               MSIX_CAP_LENGTH);
> +    }
> +
> +    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
> +        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
> +               vdev->msi_cap_size);
> +    }
> +
> +    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
> +        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
> +                                                  vfio_intx_mmap_enable, vdev);
> +        pci_device_set_intx_routing_notifier(&vdev->pdev,
> +                                             vfio_intx_routing_notifier);
> +        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
> +        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
> +        ret = vfio_intx_enable(vdev, errp);
> +        if (ret) {
> +            pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
> +            kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
> +            return ret;
> +        }
> +    }
> +    return 0;
> +}
> +
>   static void vfio_realize(PCIDevice *pdev, Error **errp)
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> @@ -2990,92 +3117,16 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>           goto error;
>       }
>   
> -    /* vfio emulates a lot for us, but some bits need extra love */
> -    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
> -
> -    /* QEMU can choose to expose the ROM or not */
> -    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
> -    /* QEMU can also add or extend BARs */
> -    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
> -
> -    /*
> -     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
> -     * device ID is managed by the vendor and need only be a 16-bit value.
> -     * Allow any 16-bit value for subsystem so they can be hidden or changed.
> -     */
> -    if (vdev->vendor_id != PCI_ANY_ID) {
> -        if (vdev->vendor_id >= 0xffff) {
> -            error_setg(errp, "invalid PCI vendor ID provided");
> -            goto error;
> -        }
> -        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
> -        trace_vfio_pci_emulated_vendor_id(vbasedev->name, vdev->vendor_id);
> -    } else {
> -        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
> -    }
> -
> -    if (vdev->device_id != PCI_ANY_ID) {
> -        if (vdev->device_id > 0xffff) {
> -            error_setg(errp, "invalid PCI device ID provided");
> -            goto error;
> -        }
> -        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
> -        trace_vfio_pci_emulated_device_id(vbasedev->name, vdev->device_id);
> -    } else {
> -        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
> -    }
> -
> -    if (vdev->sub_vendor_id != PCI_ANY_ID) {
> -        if (vdev->sub_vendor_id > 0xffff) {
> -            error_setg(errp, "invalid PCI subsystem vendor ID provided");
> -            goto error;
> -        }
> -        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
> -                               vdev->sub_vendor_id, ~0);
> -        trace_vfio_pci_emulated_sub_vendor_id(vbasedev->name,
> -                                              vdev->sub_vendor_id);
> -    }
> -
> -    if (vdev->sub_device_id != PCI_ANY_ID) {
> -        if (vdev->sub_device_id > 0xffff) {
> -            error_setg(errp, "invalid PCI subsystem device ID provided");
> -            goto error;
> -        }
> -        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
> -        trace_vfio_pci_emulated_sub_device_id(vbasedev->name,
> -                                              vdev->sub_device_id);
> -    }
> -
> -    /* QEMU can change multi-function devices to single function, or reverse */
> -    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
> -                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
> -
> -    /* Restore or clear multifunction, this is always controlled by QEMU */
> -    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
> -        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
> -    } else {
> -        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
> -    }
> -
> -    /*
> -     * Clear host resource mapping info.  If we choose not to register a
> -     * BAR, such as might be the case with the option ROM, we can get
> -     * confusing, unwritable, residual addresses from the host here.
> -     */
> -    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
> -    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
> -
> -    vfio_pci_size_rom(vdev);
> -
> -    vfio_bars_prepare(vdev);
> -
> -    vfio_msix_early_setup(vdev, &err);
> +    vfio_pci_config_setup(vdev, &err);
>       if (err) {
> -        error_propagate(errp, err);
>           goto error;
>       }
>   
> -    vfio_bars_register(vdev);
> +    /*
> +     * vfio_pci_config_setup will have registered the device's BARs
> +     * and setup any MSIX BARs, so errors after it succeeds must
> +     * use out_teardown
> +     */
>   
>       ret = vfio_add_capabilities(vdev, errp);
>       if (ret) {
> @@ -3116,29 +3167,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>           }
>       }
>   
> -    /* QEMU emulates all of MSI & MSIX */
> -    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
> -        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
> -               MSIX_CAP_LENGTH);
> -    }
> -
> -    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
> -        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
> -               vdev->msi_cap_size);
> +    ret = vfio_interrupt_setup(vdev, errp);
> +    if (ret) {
> +        goto out_teardown;
>       }
>   
> -    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
> -        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
> -                                                  vfio_intx_mmap_enable, vdev);
> -        pci_device_set_intx_routing_notifier(&vdev->pdev,
> -                                             vfio_intx_routing_notifier);
> -        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
> -        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
> -        ret = vfio_intx_enable(vdev, errp);
> -        if (ret) {
> -            goto out_deregister;
> -        }
> -    }
> +    /*
> +     * vfio_interrupt_setup will have setup INTx's KVM routing
> +     * so errors after it succeeds must use out_deregister
> +     */
>   
>       if (vdev->display != ON_OFF_AUTO_OFF) {
>           ret = vfio_display_probe(vdev, errp);
> @@ -3525,8 +3562,42 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>           goto error;
>       }
>   
> +    /* Get a copy of config space */
> +    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
> +                           MIN(pci_config_size(pdev), vdev->config_size),
> +                           pdev->config);
> +    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
> +        error_setg_errno(errp, -ret, "failed to read device config space");
> +        goto error;
> +    }
> +
> +    vfio_pci_config_setup(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
> +    /*
> +     * vfio_pci_config_setup will have registered the device's BARs
> +     * and setup any MSIX BARs, so errors after it succeeds must
> +     * use out_teardown
> +     */
> +
> +    ret = vfio_add_capabilities(vdev, errp);
> +    if (ret) {
> +        goto out_teardown;
> +    }
> +
> +    ret = vfio_interrupt_setup(vdev, errp);
> +    if (ret) {
> +        goto out_teardown;
> +    }
> +
>       return;
>   
> +out_teardown:
> +    vfio_teardown_msi(vdev);
> +    vfio_bars_exit(vdev);
>   error:
>       error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>   }


