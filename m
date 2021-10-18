Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5A431224
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 10:29:40 +0200 (CEST)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcO1b-0005e7-CX
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 04:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcNzs-0004k3-JO
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 04:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcNzo-0004aF-TE
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 04:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634545666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2gk6N3M1gLNhpK5w6xclib9ZscSGic5d7zBsRNmVZ20=;
 b=CpjCZnO40oCauwkAddiHj9orBMioz/avZGaA13+tUUsjqRVfNsenR9to9cuhF4RD26NVE0
 YEozQk+A6wEJwfTqTGYkVVNxUhJjBC/zb608IrDQ7JfZXD0xwaIVWlx3q7Qe84Y+8SmZyw
 o62/wT4gQ6ar7i+qm0G98UrZTvJx2zQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-MWOovghEPUaP382gX6UR3g-1; Mon, 18 Oct 2021 04:27:43 -0400
X-MC-Unique: MWOovghEPUaP382gX6UR3g-1
Received: by mail-ed1-f71.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so13608050eda.23
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 01:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2gk6N3M1gLNhpK5w6xclib9ZscSGic5d7zBsRNmVZ20=;
 b=qwVePdLOd6t0QgoKi23ah5kQzWPGIEqiYsgcvJKbd7ZOUvrrjQsP8sjom1OkCjG+Pi
 8wUEXvIYMsS7/xFu/fJslt7kPfHQC2zMo3MqekUly4r9eBpgXEa0zBC/kWs1aVHJ1hCP
 zo/d5FvUqv7nqP3jZmVsmAsqDEndV/BqCyD+6qlQKJTcMjfeAu53KDJ6N6trZlGw/aYy
 VOXAa5l0CuklbMa+rnvcM2mUAx1i3RiNoeRnt7Y6iuWB1LnEGRLsWy2DO0nTSkt1mNwE
 JxhVg3cXECUL75RTIxZG04qE/ns51gH4bdjRwNbfeFGIi9uyI4oKk10WWobLbPLLDyRl
 DgAA==
X-Gm-Message-State: AOAM533wTvOS2VujYy0fNfO+CZw6z27me5LD0HxPmXr6haGcWaD6vgVq
 mM2qY4v50cV3yXmuSmu0LsH9TDEtAnR7pgBkaZVFMTQE6gFVswbB/7hi2gKM7VdrRErsgQrc4iv
 DCz3p2ifUaSfjkTQ=
X-Received: by 2002:a17:907:935:: with SMTP id
 au21mr29259357ejc.156.1634545661753; 
 Mon, 18 Oct 2021 01:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEaBMWXtW0J9z36PPvdB1aSt1DTCLKmBCpa8wex/R5nAJv0qxMPFooNOp3QL4TYQIcRvjkZw==
X-Received: by 2002:a17:907:935:: with SMTP id
 au21mr29259325ejc.156.1634545661520; 
 Mon, 18 Oct 2021 01:27:41 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
 by smtp.gmail.com with ESMTPSA id o3sm8417340eju.123.2021.10.18.01.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:27:41 -0700 (PDT)
Date: Mon, 18 Oct 2021 04:27:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
Message-ID: <20211018041855-mutt-send-email-mst@kernel.org>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <187a516b-9989-954a-4cab-834379d2a1d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <187a516b-9989-954a-4cab-834379d2a1d8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 09:19:16AM +0200, Laurent Vivier wrote:
> Hi,
> 
> I don't understand if there are some issues

Gerd did identify some issues, you felt they aren't related to the patch
and need to be addressed separately.

Gerd posted patches that are supposed to address them since.
"try improve native hotplug for pcie root ports"
Could you please either
- test and report that your series depend on
  Gerd's one to now work without the issues.
  preferably by reposting a patch that applies on top.
- test and report that the functionality is still partially
  broken but explain in the commit log that this is not due
  to the patch itself, and not made worse.

in both cases please CC reviewers: Daniel, Gerd.

Thanks!

> to address to have this patch merged?
> 
> Thanks,
> Laurent


> On 01/10/2021 10:25, Laurent Vivier wrote:
> > Failover needs to detect the end of the PCI unplug to start migration
> > after the VFIO card has been unplugged.
> > 
> > To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> > pcie_unplug_device().
> > 
> > But since
> >      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> > we have switched to ACPI unplug and these functions are not called anymore
> > and the flag not set. So failover migration is not able to detect if card
> > is really unplugged and acts as it's done as soon as it's started. So it
> > doesn't wait the end of the unplug to start the migration. We don't see any
> > problem when we test that because ACPI unplug is faster than PCIe native
> > hotplug and when the migration really starts the unplug operation is
> > already done.
> > 
> > See c000a9bd06ea ("pci: mark device having guest unplug request pending")
> >      a99c4da9fc2a ("pci: mark devices partially unplugged")
> > 
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > ---
> > 
> > Notes:
> >      v3: add some inlined comments to explain partially_hotplugged and
> >          pending_deleted_event
> >      v2: move partially_hotplugged to acpi_pcihp_eject_slot()
> > 
> >   hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
> >   1 file changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index f610a25d2ef9..30405b5113d7 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
> >           PCIDevice *dev = PCI_DEVICE(qdev);
> >           if (PCI_SLOT(dev->devfn) == slot) {
> >               if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
> > -                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> > -                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> > -                object_unparent(OBJECT(qdev));
> > +                /*
> > +                 * partially_hotplugged is used by virtio-net failover:
> > +                 * failover has asked the guest OS to unplug the device
> > +                 * but we need to keep some references to the device
> > +                 * to be able to plug it back in case of failure so
> > +                 * we don't execute hotplug_handler_unplug().
> > +                 */
> > +                if (dev->partially_hotplugged) {
> > +                    /*
> > +                     * pending_deleted_event is set to true when
> > +                     * virtio-net failover asks to unplug the device,
> > +                     * and set to false here when the operation is done
> > +                     * This is used by the migration loop to detect the
> > +                     * end of the operation and really start the migration.
> > +                     */
> > +                    qdev->pending_deleted_event = false;
> > +                } else {
> > +                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> > +                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> > +                    object_unparent(OBJECT(qdev));
> > +                }
> >               }
> >           }
> >       }
> > @@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >           return;
> >       }
> > +    /*
> > +     * pending_deleted_event is used by virtio-net failover to detect the
> > +     * end of the unplug operation, the flag is set to false in
> > +     * acpi_pcihp_eject_slot() when the operation is completed.
> > +     */
> > +    pdev->qdev.pending_deleted_event = true;
> >       s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> >       acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> >   }
> > 


