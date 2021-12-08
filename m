Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D446CE74
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:40:00 +0100 (CET)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murYV-0007aB-4O
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murVT-0004cU-Do
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murVR-0000Dr-Ak
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q2RL3ImqOPKx7cUO/sZATykbFeiIgMwuC3lKOVbiONw=;
 b=jCnUuwn6TDqbJNVu4ek646zYzxfOkwKmN/8+CbjqBatGhyjwuAVGBGWAERBc0g0ctAwweW
 FSqCqFa6JPe/dOM0mdb9Vrr8zBXEtRscdTcYLbKdQYuFSwS0F2CW/5NjQJpUbuLUAzBtP8
 /QaTDLiquVXQeQ8vY6A+hx09wmOYS5Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-uHJ0zwxVNmybguHgPy91Ig-1; Wed, 08 Dec 2021 02:36:47 -0500
X-MC-Unique: uHJ0zwxVNmybguHgPy91Ig-1
Received: by mail-ed1-f69.google.com with SMTP id
 w5-20020a05640234c500b003f1b9ab06d2so1375831edc.13
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q2RL3ImqOPKx7cUO/sZATykbFeiIgMwuC3lKOVbiONw=;
 b=tprI7ly9Vz2ax7aiNakU+rhFhx6vnDIOdvdOw6msNDjum3YE2FukTvY8fM7w+baMhb
 0OguU+icWm98JXjxR3oRYlPCZaj8vFjDraFBXFZm8gMnMFS/s8YEovjZypLsxZC5EgOF
 TRORZoDhnrwbonzR0E3qjFgzPInQqkoghe0ug4HqjLF0T24dJQo2uE9a19x4x+Vm+H6E
 iK/hQ2y6hAcPaEW3y4hAs492zzL8sAX/Yr/RqlXAtHrlj8dhLYjFnhaTt7cse+yIjb7e
 07eTRG2/AKHc9DmHTY/fMGHVRytryaQjUSesvzLJaVSfQ4bmyZ10vK4kmUDfLCfpSUxS
 PMqA==
X-Gm-Message-State: AOAM530W0itbAvDnWm/wENDHpmmY/4HnReN8FGAf8wNdwqaAkdedfKrz
 uBu/tBIpbIBUZ84Mv7HdUtiJT6dGrh+GavkVRQHDbUJdWxlu2vdoCniLPOMOgF4NkEHCn56ISJd
 v6M7tgxyHSUfDM1Y=
X-Received: by 2002:a05:6402:26c8:: with SMTP id
 x8mr17110902edd.156.1638949005981; 
 Tue, 07 Dec 2021 23:36:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTwjShxrRi++Z1rdIL9S9rtATuIGddzgDaO9HI+QjVR4RowmFFUcEIwGUqztp6cgzJytKx6w==
X-Received: by 2002:a05:6402:26c8:: with SMTP id
 x8mr17110880edd.156.1638949005783; 
 Tue, 07 Dec 2021 23:36:45 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id r3sm985257ejr.79.2021.12.07.23.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:36:45 -0800 (PST)
Date: Wed, 8 Dec 2021 02:36:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v5 3/4] failover: fix unplug pending detection
Message-ID: <20211208023603-mutt-send-email-mst@kernel.org>
References: <20211119090718.440793-1-lvivier@redhat.com>
 <20211119090718.440793-4-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211119090718.440793-4-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 10:07:17AM +0100, Laurent Vivier wrote:
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

Hmm.  I think this one may be needed for this release actually.
Isolate from testing changes and repost?

> ---
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
> 2.33.1


