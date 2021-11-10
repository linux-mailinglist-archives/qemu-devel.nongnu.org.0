Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7644C4B2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:53:24 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpud-00072Z-IH
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkptf-0006MW-KA
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkptb-00087A-SW
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636559538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OC2rSZrz43AkkfCIPwAJMfCIQ+48cWKvK8dGkeMNzs0=;
 b=I+oM0vTEKaUMlMPBBbeSgNlwAokR2nB/AEzVMFosMrJhd4i9/W+528d7pUp2pAOwzTuMMA
 NmTjFh8Wqdb9AMM7RUDE3rQ5o5sHdMvwFaPRLzi2HaCjlq8PpoenxmPSe4wZ/Si380LnSa
 jYUNtvFLbSY9QKts/8muPOMcmfwBL4k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-bEdmmwLmOGiRVhjwSHlyMw-1; Wed, 10 Nov 2021 10:52:14 -0500
X-MC-Unique: bEdmmwLmOGiRVhjwSHlyMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso433708wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OC2rSZrz43AkkfCIPwAJMfCIQ+48cWKvK8dGkeMNzs0=;
 b=QYE3/qNyDGzr71VBOykyBAbYxfoY6ibCD1Ri0a0zjukihjvWVJICEtMuDxfaECUXyH
 VkOSpsUvMIdNbbmNkRBG1y6A8t5yGxkBjo/8mQohk71LYlnpYa23o/IJHq/GOBclIsun
 4dFUCNvIDaQvK8eI+x5GrPqGTEPtNR7SlSgAHSHwaZZE/ZlWKopMj9rz+16ZvDB/cNjD
 blDJlx3NgMQe2sUe1H5dwxjLl3uC/9k5gW4xgHV95Cv4f0f/qn4H5ZBIVYfFvpvCe0/j
 XMlN99PEK95b/9O8S6WmMi2RnADC6Z9NCKiT4OKFrwMYkDP88CvGqd3rr1a0ES2vGiDY
 URtA==
X-Gm-Message-State: AOAM530G3dUdK9YQ/h5UxejGwpEuSqHFk7bnqCrDA8Hu5apXwSCZ5/hN
 iwvvpGfRsngzKB4DD4Kjoh4FFTEBW471wLyAxckdk2S3wosg4b2EzgS2D5VtmU+sTpnM3TKKFSo
 w3jWZDGNVhAfa9ao=
X-Received: by 2002:a05:600c:2206:: with SMTP id
 z6mr17251907wml.132.1636559533743; 
 Wed, 10 Nov 2021 07:52:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9952hgPaIJAoDauD7wMNYlomVraaus85a9ZQpthpLTENgWX90pDIidqozBqQHwqeYo7dLOQ==
X-Received: by 2002:a05:600c:2206:: with SMTP id
 z6mr17251865wml.132.1636559533462; 
 Wed, 10 Nov 2021 07:52:13 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id j38sm6555749wms.29.2021.11.10.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 07:52:12 -0800 (PST)
Date: Wed, 10 Nov 2021 10:52:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/5] hw/pci/pcie_port: Rename 'native-hotplug' to
 'native-hpc-bit'
Message-ID: <20211110103852-mutt-send-email-mst@kernel.org>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-2-jusual@redhat.com>
 <20211110010239-mutt-send-email-mst@kernel.org>
 <YYuMEtYOSCNO5whZ@redhat.com> <20211110143027.72f7ca0b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211110143027.72f7ca0b@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 02:30:27PM +0100, Igor Mammedov wrote:
> On Wed, 10 Nov 2021 09:08:34 +0000
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Wed, Nov 10, 2021 at 01:04:54AM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Nov 10, 2021 at 06:30:10AM +0100, Julia Suvorova wrote:  
> > > > Rename the option to better represent its function - toggle Hot-Plug
> > > > Capable bit in the PCIe Slot Capability.
> > > > 
> > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > ---
> > > >  include/hw/pci/pcie_port.h         | 2 +-
> > > >  hw/i386/pc_q35.c                   | 2 +-
> > > >  hw/pci-bridge/gen_pcie_root_port.c | 6 +++++-
> > > >  hw/pci/pcie.c                      | 2 +-
> > > >  hw/pci/pcie_port.c                 | 2 +-
> > > >  5 files changed, 9 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > > > index e25b289ce8..0da6d66c95 100644
> > > > --- a/include/hw/pci/pcie_port.h
> > > > +++ b/include/hw/pci/pcie_port.h
> > > > @@ -60,7 +60,7 @@ struct PCIESlot {
> > > >      /* Indicates whether any type of hot-plug is allowed on the slot */
> > > >      bool        hotplug;
> > > >  
> > > > -    bool        native_hotplug;
> > > > +    bool        native_hpc_bit;
> > > >  
> > > >      QLIST_ENTRY(PCIESlot) next;
> > > >  };
> > > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c  
> > > 
> > > 
> > > This is ok.
> > > 
> > >   
> > > > index 797e09500b..ded61f8ef7 100644
> > > > --- a/hw/i386/pc_q35.c
> > > > +++ b/hw/i386/pc_q35.c
> > > > @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
> > > >                                            NULL);
> > > >  
> > > >      if (acpi_pcihp) {
> > > > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> > > > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
> > > >                                     "false", true);
> > > >      }
> > > >  
> > > 
> > > 
> > > This part is problematic since we made the feature user-settable in 6.1.
> > > We can have two features if we really want to ...
> > > I don't think we have a way to mark properties deprecated, do we? 
> 
> describe them in deprecated.rst
>  
> > 
> > IMHO just leave the feature with its current name. It won't be the
> > first thing without a "perfect" name and the name doesn't have a
> > negative impact on mgmt apps. Changing the name will cause more
> > pain than it solves.
> 
> looking at the code, it was introduced in 6.1 for internal needs mostly
> 
>  3f3cbbb23 hw/pci/pcie: Do not set HPC flag if acpihp is used
> 
> to hide slot from guest's native-hotplug module.
> Even if user tried explicitly to set native-hoplug=on on a slot
> with ACPI hotplug enabled, native hotplug will not work properly
> as slot's hotplug is still handled by acpi_pcihp_device_plug_cb().
> 
> Given above and that it shouldn't been used by users,
> I'd rather rename it to x-native-hotplug now than go through deprecation
> process and expose it for 2 more releases.
> 

Well what works is disabling native hotplug. Has same effect as
disabling hotplug really. Yes, I see little point
in keeping it. Technically an ABI breakage but hey.
And I would also try to backport a patch renaming it to stable
(if another stable release happens). So users don't start
using this.

> > >     
> > > > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> > > > index 20099a8ae3..ed079d72b3 100644
> > > > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > > > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > > > @@ -87,7 +87,11 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
> > > >          return;
> > > >      }
> > > >  
> > > > -    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> > > > +    /*
> > > > +     * Make sure that IO is assigned in case the slot is hot-pluggable
> > > > +     * but it is not visible through the PCIe Slot Capabilities
> > > > +     */
> > > > +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hpc_bit) {
> > > >          grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> > > >      }
> > > >      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
> > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > index 914a9bf3d1..ebe002831e 100644
> > > > --- a/hw/pci/pcie.c
> > > > +++ b/hw/pci/pcie.c
> > > > @@ -535,7 +535,7 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
> > > >       * hot-plug is disabled on the slot.
> > > >       */
> > > >      if (s->hotplug &&
> > > > -        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
> > > > +        (s->native_hpc_bit || DEVICE(dev)->hotplugged)) {
> > > >          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> > > >                                     PCI_EXP_SLTCAP_HPS |
> > > >                                     PCI_EXP_SLTCAP_HPC);
> > > > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > > > index da850e8dde..eae06d10e2 100644
> > > > --- a/hw/pci/pcie_port.c
> > > > +++ b/hw/pci/pcie_port.c
> > > > @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
> > > >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> > > >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> > > >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > > > -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> > > > +    DEFINE_PROP_BOOL("native-hpc-bit", PCIESlot, native_hpc_bit, true),
> > > >      DEFINE_PROP_END_OF_LIST()
> > > >  };
> > > >  
> > > > -- 
> > > > 2.31.1  
> > > 
> > >   
> > 
> > Regards,
> > Daniel


