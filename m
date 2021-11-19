Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D045791E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:51:26 +0100 (CET)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCj7-0003zw-D8
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbD-0006pi-Ag
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbB-0002l9-Jp
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5Ola+gIwTU9NSD3tyAzEacjZtoRogz0gsmuU0c42/0=;
 b=Hmz+gelD3/2mPNcna6XFpIDBCUkQFPAdClF80pMrcwqWD0NdNvVNj7w+tjVJgFJtx/kdzT
 2UMG1qqmcS0ZYgfijheBTfYUJWyweEmv2aPi+jgAoDBu9lVkzZ3S0Py5lDO7j8iUCSECv2
 a10fO+/wIYVn3vra7vg+ovWy6xyMiUQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-i9u-9ogLOCWGYGrF7gcorw-1; Fri, 19 Nov 2021 17:43:11 -0500
X-MC-Unique: i9u-9ogLOCWGYGrF7gcorw-1
Received: by mail-oi1-f199.google.com with SMTP id
 r8-20020acac108000000b002a78cec0558so7654264oif.10
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5Ola+gIwTU9NSD3tyAzEacjZtoRogz0gsmuU0c42/0=;
 b=6WWEndKXmu7Mz/XkRtkxdzVFndwWAIGvd/BuWvgz0K6dzdDMlxnYCK3E/sqfd/3TKp
 VNml4Q057hCePLiGrREXjcJIus5x9XiJFHA+dXduOEz99anMRZnz3/Vv4hsmvja6eniR
 mpQDGd3CrzgTIBE0bQWQd2LBIcDDhrGqbKjcruWHphYvmKYhgocUcYP4FFOF7MKrQgsS
 9W3m/DYmquscXlJcPnGZvLidvo87vemYG3Oz2HP97V7KEyanhyXTBq5I3w9NkMowc2tf
 NZQ3Wc4OsD9fRxL6qnAzOplWJ/sHdOcj05WExdycV8nK+HTL4qvFG66unzshbzJzCIY8
 BJaw==
X-Gm-Message-State: AOAM5315EJ0UEZoLvc24vu1bH767Ki8VCgsrGyMaZUebxIO/mxTnq4wr
 RlwlnfnMLYvZ8Z6zs+WtHomKFumh3bdPA6H43EQcn8t6Ir/ham863CsSkZquNvMGj6Tyjo7Tp90
 FcKFvSja6AQMACzY=
X-Received: by 2002:a9d:61ce:: with SMTP id h14mr7879042otk.303.1637361790829; 
 Fri, 19 Nov 2021 14:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl0E2EsRB23RH9n9qtGEy8exGBGkYy6xnUoq/Zy+ZzlQKEqxy8+cQLoDf/1UOEb2M7yAV/Mw==
X-Received: by 2002:a9d:61ce:: with SMTP id h14mr7879015otk.303.1637361790613; 
 Fri, 19 Nov 2021 14:43:10 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:10 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 13/19] vfio-user: pci_user_realize PCI setup
Message-ID: <20211119154230.0a06ea21.alex.williamson@redhat.com>
In-Reply-To: <faab1fd983815a5563b246849d68d57884d3fb41.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <faab1fd983815a5563b246849d68d57884d3fb41.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:41 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> PCI BARs read from remote device
> PCI config reads/writes sent to remote server
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index d5f9987..f8729b2 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3551,8 +3551,93 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>          goto error;
>      }
>  

There's a LOT of duplication with the kernel realize function here.
Thanks,

Alex


> +    /* Get a copy of config space */
> +    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
> +                           MIN(pci_config_size(pdev), vdev->config_size),
> +                           pdev->config);
> +    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
> +        error_setg_errno(errp, -ret, "failed to read device config space");
> +        goto error;
> +    }
> +
> +    /* vfio emulates a lot for us, but some bits need extra love */
> +    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
> +
> +    /* QEMU can choose to expose the ROM or not */
> +    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
> +    /* QEMU can also add or extend BARs */
> +    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
> +    vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
> +    vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
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
> +        goto error;
> +    }
> +
> +    vfio_bars_register(vdev);
> +
> +    ret = vfio_add_capabilities(vdev, errp);
> +    if (ret) {
> +        goto out_teardown;
> +    }
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
> +    if (vdev->pdev.config[PCI_INTERRUPT_PIN] != 0) {
> +        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
> +                                             vfio_intx_mmap_enable, vdev);
> +        pci_device_set_intx_routing_notifier(&vdev->pdev,
> +                                             vfio_intx_routing_notifier);
> +        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
> +        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
> +        ret = vfio_intx_enable(vdev, errp);
> +        if (ret) {
> +            goto out_deregister;
> +        }
> +    }
> +
>      return;
>  
> +out_deregister:
> +    pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
> +    kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
> +out_teardown:
> +    vfio_teardown_msi(vdev);
> +    vfio_bars_exit(vdev);
>  error:
>      vfio_user_disconnect(proxy);
>      error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> @@ -3565,7 +3650,9 @@ static void vfio_user_instance_finalize(Object *obj)
>  
>      vfio_put_device(vdev);
>  
> -    vfio_user_disconnect(vbasedev->proxy);
> +    if (vbasedev->proxy != NULL) {
> +        vfio_user_disconnect(vbasedev->proxy);
> +    }
>  }
>  
>  static Property vfio_user_pci_dev_properties[] = {


