Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AE700008
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 07:53:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxLh2-0006zH-8E; Fri, 12 May 2023 01:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pxLh0-0006z1-Ir
 for qemu-devel@nongnu.org; Fri, 12 May 2023 01:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pxLgy-0006PK-NA
 for qemu-devel@nongnu.org; Fri, 12 May 2023 01:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683870707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yR4OS+Q+gKvgnFok5mmqkQQXDFoWS4UNodcReC63GNA=;
 b=JET3vBAl6zYyj3sUpf/3WbBF5Iv6ub6r8cb4J0ko+UIBQPYE7T2fgb2gWNS03utMK/kHcT
 7sZykcMgz1F5NAywje81EdxU8RUDZXe8IZ1Rk87WxbPpYu/3SeFHmWwqCHqPW9rF7TeDNf
 kjQICfaExingJyi8vOrna+OW8TLKRJE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-Sv9jfM8pOhy9zcGrWAyATg-1; Fri, 12 May 2023 01:51:45 -0400
X-MC-Unique: Sv9jfM8pOhy9zcGrWAyATg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-306286b3573so5760501f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 22:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683870704; x=1686462704;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yR4OS+Q+gKvgnFok5mmqkQQXDFoWS4UNodcReC63GNA=;
 b=Siep7j2mFk/UtbLBtFc7MrnN7ScCGDzd1M4DeFpFX3WSTA17WZ3rdGkwph3unjfyTQ
 qkEgTl8s/otWsQEDSwZ0gRPz0DrveeHJ63Mfef1IzuRfDeqs7EzioltZUHv+xLRBoZdS
 1JUrtLKfFZlJcC1q7IrKO14bKyA6LrKZerfmxH3tyHond8UIuB6b514L2QMgpSehzuXR
 4Tz0o9rznXgG1uzP4tCjQXTpZPOr64WOSHDTM7Gkri7z3Kd/YSPsRDzjv8oZfbO1PBqs
 Q3lGNcaed86D36wjQXg3Ku+1lPOb7fPsb6JFmkolvteg0piZU9Lj7t3adGPA+Jaw7NVn
 gkWA==
X-Gm-Message-State: AC+VfDyH/srTB85EFSw5svHM1r65TKR7CdtVRqp2kGVQQt97p6T71wMx
 29Dk/T+eNX4wQjirYYNZIJfX5cr5dqPRzfp+Zv9siaH6KptMidWKwv/c6nGdPXdUNb+Tz9hX1kH
 4huGRNjTx8eAssSk=
X-Received: by 2002:a05:6000:124d:b0:307:8800:bbdd with SMTP id
 j13-20020a056000124d00b003078800bbddmr16425449wrx.64.1683870704388; 
 Thu, 11 May 2023 22:51:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4V2fJ43hZLgth0SmWGzZjWg7c59U5eoxDOJDSjLvyUf35EcthqPXnYOFeCrP2OEuUlBwjoxQ==
X-Received: by 2002:a05:6000:124d:b0:307:8800:bbdd with SMTP id
 j13-20020a056000124d00b003078800bbddmr16425438wrx.64.1683870704027; 
 Thu, 11 May 2023 22:51:44 -0700 (PDT)
Received: from redhat.com ([31.187.78.61]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d6650000000b003062c0ef959sm22157402wrw.69.2023.05.11.22.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 22:51:43 -0700 (PDT)
Date: Fri, 12 May 2023 01:51:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 03/18] hw/pci: use PCIDevice gpio for device IRQ
Message-ID: <20230512005242-mutt-send-email-mst@kernel.org>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
 <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
 <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 11, 2023 at 09:44:51PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 11. Mai 2023 08:57:16 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
> >Change pci_set_irq() to call qemu_set_irq() on the PCI device IRQ rather than
> >calling PCI bus IRQ handler function directly. In order to preserve the
> >existing behaviour update pci_qdev_realize() so that it automatically connects
> >the PCI device IRQ to the PCI bus IRQ handler.
> >
> >Finally add a "QEMU interface" description documenting the new PCI device IRQ
> >gpio next to the declaration of TYPE_PCI_DEVICE.
> >
> >Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >---
> > hw/pci/pci.c | 12 ++++++++++--
> > 1 file changed, 10 insertions(+), 2 deletions(-)
> >
> >diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >index 9471f996a7..3da1481eb5 100644
> >--- a/hw/pci/pci.c
> >+++ b/hw/pci/pci.c
> >@@ -1680,8 +1680,7 @@ qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
> > 
> > void pci_set_irq(PCIDevice *pci_dev, int level)
> > {
> >-    int intx = pci_intx(pci_dev);
> >-    pci_irq_handler(pci_dev, intx, level);
> >+    qemu_set_irq(pci_dev->irq, level);
> > }
> > 
> > /* Special hooks used by device assignment */
> >@@ -2193,6 +2192,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
> >     pci_set_power(pci_dev, true);
> > 
> >     pci_dev->msi_trigger = pci_msi_trigger;
> >+
> >+    /* Connect device IRQ to bus */
> >+    qdev_connect_gpio_out(DEVICE(pci_dev), 0,
> >+                          pci_get_bus(pci_dev)->irq_in[pci_dev->devfn]);
> 
> I think this is confusing a few things. In my understanding -- unlike
> ISA -- PCI considers interrupt lanes only for PCI slots but not for
> buses.
> So for example each PCI slot could have its own direct
> connections (up to four, intA..intD) to the interrupt controller. IOW
> interrupt lanes and PCI buses are unrelated, thus PCIBus shouldn't
> really have IRQs.

True, interrupt lines (not lanes I think - lanes is a PCI express
unrelated to interrupts since interrupts are just messages under PCIe)
bypass the PCI bus. They are in fact even used outside the
normal GNT#/REQ# protocol.

	The system vendor is free to combine the various INTx# signals from the PCI connector(s)
	in any way to connect them to the interrupt controller. They may be wire-ORed or
	electronically switched under program control, or any combination thereof. The system
	designer must insure that each INTx# signal from each connector is connected to an input
	on the interrupt controller. This means the device driver may not make any assumptions
	about interrupt sharing. All PCI device drivers must be able to share an interrupt (chaining)
	with any other logical device including devices in the same multi-function package.

> 
> Moreover, in case the interrupt lines are shared between multiple PCI slots, a usual pattern is to swizzle these lines such that the intAs from the slots don't all occupy just one IRQ line. That means that depending on the slot the device is plugged into a different lane is triggered. Above code, however, would always trigger the same line and wouldn't even allow for modeling the swizzeling.

the swizzeling always applies in case of PCI bridges:

However, since bridges will be used on add-in cards, the BIOS will assume an association
between device location and which INTx# line it uses when requesting an interrupt.
...
The BIOS code will assume the following binding behind the bridge and will
write the IRQ number in each device as described in Table 9-1. The interrupt binding
defined in this table is mandatory for add-in cards utilizing a bridge.





> Also, above code would cause out of bounds array accesses if a PCI device had more functions than there are on "the bus":
> For example, consider PIIX which has four PIRQs, so ARRAY_SIZE(irq_fn) == 4, right? devfn can be up to 8 according to the PCI spec which would cause an out if bounds array access above.
> 
> I think that this commit does actually re-define how PCI buses work in QEMU although the cover letter claims to save this for another day. We should probably not apply the series in its current form.
> 
> Best regards,
> Bernhard
> 
> > }
> > 
> > static void pci_device_init(Object *obj)
> >@@ -2850,6 +2853,11 @@ void pci_set_power(PCIDevice *d, bool state)
> >     }
> > }
> > 
> >+/*
> >+ * QEMU interface:
> >+ * + Unnamed GPIO output: set to 1 if the PCI Device has asserted its irq
> >+ */
> >+
> > static const TypeInfo pci_device_type_info = {
> >     .name = TYPE_PCI_DEVICE,
> >     .parent = TYPE_DEVICE,


