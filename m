Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963944E4D6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:48:25 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlU6a-0002iu-2p
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlU5V-00020H-Fz
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:47:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlU5Q-0003qz-RE
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636714031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDKlGw7GQnHhN4D8+0OzedAzTi1DnvpLgeS02RpV6Nk=;
 b=DPvRjFz7gWi3fmH3nd2jSlGIrDg6OrvljxPYZikuTR/8gFZsTGOt36P04K7vL75DFw7U3i
 UJaLRRfFaOZnxt2nExf4b/nXqNUph5yhijcT5xqjHNmQH+gZ5ez4tH3zu7rQN5PgZbyNAY
 NQO3g51fjBpoK3mPVFqLIkAAGlzs4u4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-A3j7NJG1PZCiS2S9IhWnkg-1; Fri, 12 Nov 2021 05:47:10 -0500
X-MC-Unique: A3j7NJG1PZCiS2S9IhWnkg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso7848019edc.22
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDKlGw7GQnHhN4D8+0OzedAzTi1DnvpLgeS02RpV6Nk=;
 b=TI/zPKYPudVA+Vd0uR/hz814ZwJXozDLpDQhaxUIpCGHq+/dm5KqSTa5I1h0MwzpY8
 mGYd5Jhdk4zwrOwEH+zdOL0Hdz3yLdpLhitIgnCfCqRUq9HVT9rR3sxyJ9MudujF9gk5
 MeOGfpCYKFcZ4BOd8FtAyS7My0Pm4DztJ28KHt3Us2kakb27CtcakV95PZ9dYc9CP4VQ
 X6dL9Jl+KjDz93txLeulL4BqZwc8SF8o0CecEInF/Tf646BNgRidtD7BlRG3dyFnkVYb
 WoL7bYn0HtF3uhwZ4xVZYeKJHReJXNjIV8Iv2obetLSTQZUUqXjqXg+PS5EJudhHp986
 Y6+g==
X-Gm-Message-State: AOAM532iCRM8rCEnnMsjcR6FXsZpz9YoyMJ9LFOn/IJjZU1vqRxbpygG
 Hbg4vu19GCUBp0tfMxLl3nY7uj9RYAg/W0+EAcOl95DXcClhYw6T8J1u/yfFwZfu8b7YzjBNSHu
 M7O3rZsV7Cy+gZVI=
X-Received: by 2002:a05:6402:221b:: with SMTP id
 cq27mr19766674edb.232.1636714029347; 
 Fri, 12 Nov 2021 02:47:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPhIs9NiW6hxLInfwlGLknHnfauMAd7754tUaePOxtvUhrbu/jAFhV0tBSxqLYk1hXRacNQQ==
X-Received: by 2002:a05:6402:221b:: with SMTP id
 cq27mr19766622edb.232.1636714029081; 
 Fri, 12 Nov 2021 02:47:09 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id r3sm2496566ejr.79.2021.11.12.02.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:47:08 -0800 (PST)
Date: Fri, 12 Nov 2021 11:47:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH for 6.2 v2 1/5] pcie: rename 'native-hotplug' to
 'x-native-hotplug'
Message-ID: <20211112114707.0923f553@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2111110853010.133428@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-2-imammedo@redhat.com>
 <alpine.DEB.2.22.394.2111110853010.133428@anisinha-lenovo>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Nov 2021 08:55:24 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, 10 Nov 2021, Igor Mammedov wrote:
> 
> > Mark property as experimental/internal adding 'x-' prefix.
> >
> > Property was introduced in 6.1 and it should have provided
> > ability to turn on native PCIE hotplug on port even when
> > ACPI PCI hotplug is in use is user explicitly sets property
> > on CLI. However that never worked since slot is wired to
> > ACPI hotplug controller.
> > Another non-intended usecase: disable native hotplug on slot
> > when APCI based hotplug is disabled, which works but slot has
> > 'hotplug' property for this taks.
> >
> > It should be relatively safe to rename it to experimental
> > as no users should exist for it and given that the property
> > is broken we don't really want to leave it around for much
> > longer lest users start using it.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Barring the comment below,
> 
> Reviewed-by: Ani Sinha <ani@anisinha.ca>

Thanks!

> 
> > ---
> > CC: qemu-stable@nongnu.org
> > ---
> >  hw/i386/pc_q35.c   | 2 +-
> >  hw/pci/pcie_port.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 797e09500b..fc34b905ee 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
> >                                            NULL);
> >
> >      if (acpi_pcihp) {
> > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> >                                     "false", true);  
> 
> Let us document the fact that this property is experimental. It was not at
> once obvious to me that an "x-" prefix meant to indicate experimental
> status.

it's common knowledge, but quick grep shows we only documented
x- prefix for qmp commands but not for properties even though
properties were the first to use it. So we probably should
document it somewhere.
I thought we have acceptable property name format documented
but I couldn't find it quickly (that would be a good place
to document it).
Care to post a patch?

> 
> 
> >      }
> >
> > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > index da850e8dde..e95c1e5519 100644
> > --- a/hw/pci/pcie_port.c
> > +++ b/hw/pci/pcie_port.c
> > @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
> >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> > +    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >
> > --
> > 2.27.0
> >
> >  
> 


