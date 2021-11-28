Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C2460A74
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 22:53:57 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrS7P-0001AD-Kv
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 16:53:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrS5C-000892-8t
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 16:51:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrS5A-0003dc-A4
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 16:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638136295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEClzdFV5YgPkmzLLPQwPJSmJ14Vj4gIOSeHOJqnpqY=;
 b=K5Gb9xjpRAkYtbab+K7EQkAf+L9hnH+EdbPGXepJSBSxRzIhY1j8RYzUbAcxd5MWdUASvf
 oV1qY7s9DtcnN+S6KcHk8v4+VYeDkK+sCMonLeqHTVJUfzm5Bn6WrjtiYOj9Lgj8ww4FJ0
 AMrJSbj9Jaz6/rBLv165BVM2Nhq3Ucg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-mDvIy5CxM3-27YECOykbEw-1; Sun, 28 Nov 2021 16:51:34 -0500
X-MC-Unique: mDvIy5CxM3-27YECOykbEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b142-20020a1c8094000000b0033f27b76819so4981260wmd.4
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 13:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OEClzdFV5YgPkmzLLPQwPJSmJ14Vj4gIOSeHOJqnpqY=;
 b=p5IbnY2JVLYnXGkFXd0ZR3TjhaW+GpXm2djbJuh3uPNhCbSv/J4Fw1iPAF+Fi44h6U
 Sficl6phPDlOCHX7mzDSpil1MDx0xsPxZ92etA0jZZ7XuEtOcr+lxeyImOZ7PthylH2G
 Cvin9NBAW8y6uK1BmG1AmRQTqGQymkN0/HajB1lyYUX0IxxBUY0Wt/ZNw6vySa2IAa67
 hM6QyiwwFlklR6W0GRwTN3W49QhHM1XeYryPB3C6Ud/6YB8wrY1Pv3QBACojh0LuTfnO
 v9NrbnEmgrusl0NlAQ8dru1ucY9yGyS4rtwaJJKaZXo3xOSXnoix7McSWH1o/68m5D/0
 a2xQ==
X-Gm-Message-State: AOAM530sJMIDVNQrTSLWfN8oTRUKlUC37u8UiF7BBd3FEEASIGspp4nU
 CNOtcRnEN7kMrBBbmBlYf1Kk91YInnOeTgpvexp9n3LRlBn7CmPO1duBPymwT98yfnDt1gxPlCK
 f/hF01CpOPaIJ8oY=
X-Received: by 2002:adf:fa81:: with SMTP id h1mr29063740wrr.27.1638136291734; 
 Sun, 28 Nov 2021 13:51:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU7PWn6LKbETVnTO9CWGb4IOt7t+aTpky9YJJBul7rVYDs/sNiaRKh3WRkLPOa3ZGyLtyw3Q==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr29063713wrr.27.1638136291464; 
 Sun, 28 Nov 2021 13:51:31 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id r17sm13973799wmq.11.2021.11.28.13.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 13:51:30 -0800 (PST)
Date: Sun, 28 Nov 2021 16:51:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/3] ppc/pnv: Tune the POWER9 PCIe Host bridge model
Message-ID: <20211128165114-mutt-send-email-mst@kernel.org>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-2-fbarrat@linux.ibm.com>
 <427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org>
 <988a5133-e1a1-829d-452a-0e1dd72a0098@kaod.org>
MIME-Version: 1.0
In-Reply-To: <988a5133-e1a1-829d-452a-0e1dd72a0098@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 alfredo.junior@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 06:08:30PM +0100, Cédric Le Goater wrote:
> [ Adding Alfredo the thread ]
> 
> On 11/26/21 10:09, Cédric Le Goater wrote:
> > On 11/16/21 18:01, Frederic Barrat wrote:
> > > The PHB v4 found on POWER9 doesn't request any LSI, so let's clear the
> > > Interrupt Pin register in the config space so that the model matches
> > > the hardware.
> > > 
> > > If we don't, then we inherit from the default pcie root bridge, which
> > > requests a LSI. And because we don't map it correctly in the device
> > > tree, all PHBs allocate the same bogus hw interrupt. We end up with
> > > inconsistent interrupt controller (xive) data. The problem goes away
> > > if we don't allocate the LSI in the first place.
> > > 
> > > Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > > ---
> > >   hw/pci-host/pnv_phb4.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> > > index 5c375a9f28..1659d55b4f 100644
> > > --- a/hw/pci-host/pnv_phb4.c
> > > +++ b/hw/pci-host/pnv_phb4.c
> > > @@ -1234,10 +1234,13 @@ static void pnv_phb4_reset(DeviceState *dev)
> > >       PCIDevice *root_dev = PCI_DEVICE(&phb->root);
> > >       /*
> > > -     * Configure PCI device id at reset using a property.
> > > +     * Configure the PCI device at reset:
> > > +     *   - set the Vendor and Device ID to for the root bridge
> > > +     *   - no LSI
> > >        */
> > >       pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
> > >       pci_config_set_device_id(root_dev->config, phb->device_id);
> > > +    pci_config_set_interrupt_pin(root_dev->config, 0);
> > >   }
> > >   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
> > > 
> > 
> > FYI, I am seeing an issue with FreeBSD when booting from iso :
> > 
> >    https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz
> > 
> > Thanks,
> > 
> > C.
> > 
> > SIGTERM received, booting...
> > KDB: debugger backends: ddb
> > KDB: current backend: ddb
> > ---<<BOOT>>---
> > Copyright (c) 1992-2021 The FreeBSD Project.
> > Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
> >      The Regents of the University of California. All rights reserved.
> > FreeBSD is a registered trademark of The FreeBSD Foundation.
> > FreeBSD 14.0-CURRENT #0 main-n250301-4827bf76bce: Thu Oct 28 06:53:58 UTC 2021
> >      root@releng1.nyi.freebsd.org:/usr/obj/usr/src/powerpc.powerpc64/sys/GENERIC64 powerpc
> > FreeBSD clang version 12.0.1 (git@github.com:llvm/llvm-project.git llvmorg-12.0.1-0-gfed41342a82f)
> > WARNING: WITNESS option enabled, expect reduced performance.
> > VT: init without driver.
> > ofw_initrd: initrd loaded at 0x28000000-0x28c7928c
> > cpu0: IBM POWER9 revision 2.0, 1000.00 MHz
> > cpu0: Features dc007182<PPC32,PPC64,ALTIVEC,FPU,MMU,SMT,ISNOOP,ARCH205,ARCH206,VSX,TRUELE>
> > cpu0: Features2 bee00000<ARCH207,DSCR,ISEL,TAR,VCRYPTO,ARCH300,IEEE128,DARN>
> > real memory  = 1014484992 (967 MB)
> > avail memory = 117903360 (112 MB)
> > random: registering fast source PowerISA DARN random number generator
> > random: fast provider: "PowerISA DARN random number generator"
> > arc4random: WARNING: initial seeding bypassed the cryptographic random device because it was not yet seeded and the knob 'bypass_before_seeding' was enabled.
> > random: entropy device external interface
> > kbd0 at kbdmux0
> > ofwbus0: <Open Firmware Device Tree> on nexus0
> > opal0: <OPAL Abstraction Firmware> irq 1048560,1048561,1048562,1048563,1048564,1048565,1048566,1048567,1048568,1048569,1048570,1048571,1048572,1048573 on ofwbus0
> > opal0: registered as a time-of-day clock, resolution 0.002000s
> > simplebus0: <Flattened device tree simple bus> mem 0x6030000000000-0x60300ffffffff on ofwbus0
> > pcib0: <OPAL Host-PCI bridge> mem 0x600c3c0000000-0x600c3c0000fff,0x600c300000000-0x600c30fffffff on ofwbus0
> > pci0: <OFW PCI bus> numa-domain 0 on pcib0
> > qemu-system-ppc64: ../hw/pci/pci.c:1487: pci_irq_handler: Assertion `0 <= irq_num && irq_num < PCI_NUM_PINS' failed.
> > 


Frederic?

-- 
MST


