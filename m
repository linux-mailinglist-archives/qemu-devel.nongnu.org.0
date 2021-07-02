Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCAE3BA246
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:36:27 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKHJ-0004Wj-Qx
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKGH-0003lb-DI
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKGE-0005eq-6r
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625236517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rvni66UAYcCbEKW40i4MbLOD9oZkyYxYz4EFJNpApRI=;
 b=iZ8dv1z6QnPqtyfXe3KHDUDCGzw1iSR+ejYlBEjGGhD7iN2k0tf4qQBmmh1P7xRQX2RtiQ
 smvk9xuDPcy+GBLzqPyKGwAowNP0lXV8+uHA/ZXhmFvhw4jSLXo4+Y7eS6lT0+DDw+oxff
 NW3snkj8cOdTGMOS0X/HqeUeCehk2Uk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-CkEYWGdSMs2cCN6KTiuQOQ-1; Fri, 02 Jul 2021 10:35:13 -0400
X-MC-Unique: CkEYWGdSMs2cCN6KTiuQOQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso3594345ejt.20
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rvni66UAYcCbEKW40i4MbLOD9oZkyYxYz4EFJNpApRI=;
 b=MwxPdykhXaFdUNtMD09Q2lhcorkNNjiyttObPc8vdSWKEKh/RWHpKXg0N6CRQVh1Og
 JmNnJOFNPTXLKBOofqDUaWlXr4x7BBtbEuVNATeXk0FcKB6D8JC/aEafeFrlIki/xhLR
 OSI6BkOcCEZq2yAIIC6f99y/AODfy71e2443ZPYxE8dFHgkY8LcGWevjR3amy/vQfqT/
 h4fdZv3GMrwgD6oBav+j7eapJseGXuAj0DeI8apjlrfIqmK4dGvZI7sj3ZA1sAM1wu0p
 9TCAQJxJbjm046O0IrIDlHr81/oExGPrp5RV55M4xCUiRBPSDTM9nW99K40jJlIdftMc
 hJJw==
X-Gm-Message-State: AOAM530b0jF6kBfqyHdvjQdYU+HhLDV/nef+rPlSI1MawXJV7haYVb/W
 beL7UIAFtgeN5xRfBmZ3zRLX46oYyn5bbHV/1M8BnUJmgCYd5infmBrzazpcTHgjDs062srRZSQ
 iPs47BiH6Me8u9lE=
X-Received: by 2002:a17:906:cc87:: with SMTP id oq7mr2771ejb.193.1625236512691; 
 Fri, 02 Jul 2021 07:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypzNdCPEFLk2Y2ybzY5wMjXu12HRkXznvxgbHkwKjNbrTddpHwJS8V+J2CGclC6/ILOLIOkA==
X-Received: by 2002:a17:906:cc87:: with SMTP id oq7mr2754ejb.193.1625236512492; 
 Fri, 02 Jul 2021 07:35:12 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id ec40sm1403218edb.57.2021.07.02.07.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 07:35:11 -0700 (PDT)
Date: Fri, 2 Jul 2021 10:35:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 2/7] hw/i386/acpi-build: Add ACPI PCI hot-plug methods
 to Q35
Message-ID: <20210702103411-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-3-jusual@redhat.com>
 <YN1GTsJmU5oQdFOJ@yekko>
MIME-Version: 1.0
In-Reply-To: <YN1GTsJmU5oQdFOJ@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 01, 2021 at 02:36:30PM +1000, David Gibson wrote:
> On Thu, Jun 17, 2021 at 09:07:34PM +0200, Julia Suvorova wrote:
> > Implement notifications and gpe to support q35 ACPI PCI hot-plug.
> > Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> 
> I don't know ACPI or x86 particular well, so I could well have missed
> something, but..
> 
> [snip]
> > @@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >  
> >          if (!pdev) {
> >              if (bsel) { /* add hotplug slots for non present devices */
> > +                if (pci_bus_is_express(bus) && slot > 0) {
> > +                    break;
> > +                }
> >                  dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> >                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> >                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> > @@ -516,7 +519,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >              QLIST_FOREACH(sec, &bus->child, sibling) {
> >                  int32_t devfn = sec->parent_dev->devfn;
> >  
> > -                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> > +                if (pci_bus_is_root(sec)) {
> >                      continue;
> >                  }
> 
> .. what will this logic do if we encounter a PCIe-switch.  AIUI, it
> should be possible to hotplug 1 slot under each downstream port, but
> we can't hotplug anything directly under the upstream port.  AFAICT
> both the upstream and downstream ports will show up as 'is_bridge'
> though.
> 
> So, IIUC we want to traverse a PCIe upstream switch port, but not
> generate hotplug slots until we encounter the downstream ports below
> it.

Julia could you comment on this please?
I already applied the patches so patch on top if necessary please ...

> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



