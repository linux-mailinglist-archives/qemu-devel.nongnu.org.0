Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D9422CCF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:43:22 +0200 (CEST)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmbB-0000Wu-Pj
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm9b-0000ls-M7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm9V-0001uK-KT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hkSyN5n/xcQPNpYH+R2nnf4rJDijTrcAxnnJcO92PEo=;
 b=GOPxFUHcWfoj+wMoWAKH2LMPC3SAVBGG5r4y4jsv6C7Qbb2pQ4lYsD/KFuYLVKff8Pat/7
 SLvL5+tzF0z4u3Un3KAvQP9FTnFSGxkn9carpCqOreD+IhmAcN51WyWHxOat6FnWr/WMAR
 z68m5NZD66jsOK5DQORt2sS03O1YqaU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Q1mY-3uKMle_XhOHTOH6cA-1; Tue, 05 Oct 2021 11:14:43 -0400
X-MC-Unique: Q1mY-3uKMle_XhOHTOH6cA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso5276536wrr.15
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkSyN5n/xcQPNpYH+R2nnf4rJDijTrcAxnnJcO92PEo=;
 b=JZFjr1zt3qmugYqlivrQn2rx1XkrPgP5lp9TVQx5lQ3AzUkqXyelNYgag+EG6kOdQM
 LGLKHYeA9zrsjw0HwOPF1RzY2CAil3FidhjSYB7GkjuJ0RWY+Y9AaparmQTo5WeigQJy
 FP7/wC9ERBILTpbTM4jRzZgbrZlWpOjq6iUrDOQgrP37si/taIKGjgmDsmRinRtfTf6s
 KiQqQMQqDwZHdgW+DXdP1PM8+jsDTr0pYd7+GtjFyMsyuZFSfag8qJxgNZWVySxRqT5k
 8Pmv+6MQHUwoD/Al1NHpIJ/zptDRWhUbz8uXZcLPonTGWNYa7k16vIyMCQPx4dDZo1Vf
 zoeA==
X-Gm-Message-State: AOAM533KgxclJHPGptqD9njEaBS05afJ0dGsvRT6efRmNjlo0BFyhMU5
 z3UUNFQOxohJe0pde9bQqFf3xGjTfdbU3YBtT6ZFSHjTwToB+RLlLNsmiVAGMuudFTvwyRn9DIE
 cVtyRyFOE6KyLYtY=
X-Received: by 2002:a1c:a508:: with SMTP id o8mr4075715wme.29.1633446881839;
 Tue, 05 Oct 2021 08:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVNPzt9UEtQPKWoEif4exr80P9RLy67M4veRVax2IxQ0dd7tl/unAjUtYeicE+mYnD8VBkWQ==
X-Received: by 2002:a1c:a508:: with SMTP id o8mr4075685wme.29.1633446881610;
 Tue, 05 Oct 2021 08:14:41 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l16sm2361219wmj.33.2021.10.05.08.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:14:40 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:14:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
Message-ID: <20211005111401-mutt-send-email-mst@kernel.org>
References: <20211001082502.1342878-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211001082502.1342878-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
> Failover needs to detect the end of the PCI unplug to start migration
> after the VFIO card has been unplugged.
> 
> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> pcie_unplug_device().
> 
> But since
>     17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> we have switched to ACPI unplug and these functions are not called anymore
> and the flag not set. So failover migration is not able to detect if card
> is really unplugged and acts as it's done as soon as it's started. So it
> doesn't wait the end of the unplug to start the migration. We don't see any
> problem when we test that because ACPI unplug is faster than PCIe native
> hotplug and when the migration really starts the unplug operation is
> already done.
> 
> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>     a99c4da9fc2a ("pci: mark devices partially unplugged")
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>

Laurent, are you thinking of addressing Gerd's comment?

> ---
> 
> Notes:
>     v3: add some inlined comments to explain partially_hotplugged and
>         pending_deleted_event
>     v2: move partially_hotplugged to acpi_pcihp_eject_slot()
> 
>  hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f610a25d2ef9..30405b5113d7 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
>          PCIDevice *dev = PCI_DEVICE(qdev);
>          if (PCI_SLOT(dev->devfn) == slot) {
>              if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
> -                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> -                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> -                object_unparent(OBJECT(qdev));
> +                /*
> +                 * partially_hotplugged is used by virtio-net failover:
> +                 * failover has asked the guest OS to unplug the device
> +                 * but we need to keep some references to the device
> +                 * to be able to plug it back in case of failure so
> +                 * we don't execute hotplug_handler_unplug().
> +                 */
> +                if (dev->partially_hotplugged) {
> +                    /*
> +                     * pending_deleted_event is set to true when
> +                     * virtio-net failover asks to unplug the device,
> +                     * and set to false here when the operation is done
> +                     * This is used by the migration loop to detect the
> +                     * end of the operation and really start the migration.
> +                     */
> +                    qdev->pending_deleted_event = false;
> +                } else {
> +                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> +                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> +                    object_unparent(OBJECT(qdev));
> +                }
>              }
>          }
>      }
> @@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>  
> +    /*
> +     * pending_deleted_event is used by virtio-net failover to detect the
> +     * end of the unplug operation, the flag is set to false in
> +     * acpi_pcihp_eject_slot() when the operation is completed.
> +     */
> +    pdev->qdev.pending_deleted_event = true;
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> -- 
> 2.31.1


