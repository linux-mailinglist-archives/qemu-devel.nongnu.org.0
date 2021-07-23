Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907ED3D3565
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:36:20 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pjH-0006Zo-La
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6phi-0005cW-3V
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6phe-00056U-Iq
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627025676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+ZTmCUX7wCZ4fBZsdupZ1MOBlVhBTEqmgpt7KO5+V0=;
 b=dJs6EfYaSuMJKwzQX/htCJDAC5ZBBXTUlAPvR69V6+oUG2xo7H3isycmZMGb0ADNEFBQeI
 KFcbCzu2//W9wFtunPBP95UYbvmTLdNh3pEdQYhhYeD8l8Wxt7V0kBySkfeIudf8VvU716
 oIEJF1sTzLTErNeIH4QLIPcSrUmei2E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-0_0SgCB-PgOCYImj64_Tzg-1; Fri, 23 Jul 2021 03:34:35 -0400
X-MC-Unique: 0_0SgCB-PgOCYImj64_Tzg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so632405wri.17
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+ZTmCUX7wCZ4fBZsdupZ1MOBlVhBTEqmgpt7KO5+V0=;
 b=INcDdaKBLbgW1jI1F9/Oh395YVJ1vDthhuRteM/chqqplE8EFZQqwmL8Zub0iwOgKE
 uHTUQoDKWWVI/7ojBBeFT3Y3sLo6v4GPsM+Dt6DqKfdjyD19gloomltCdBQH+RKnRy01
 XbDyb7u8z5ORPdKynCJmjQInwjMA67oW3H7QWfBTnlaqC9JwQyXMXLoiDdO8ZqQ5gpw5
 8OKcfaPXyPLBLi9eKf9Rog8ydR7WoKzPrnbTxZ5Dk7XmTAPcIvteH0ZF0S8NEU/HnFo6
 zoPYxE9m89AktDp4/pGrnUn/n9I9sgF6P6yJi+GUHVHlwb3ZFfR+A1oVrCLxnB7l1jSn
 a+yg==
X-Gm-Message-State: AOAM532kH8/fJDtGqsR1OZbBJRk9d8EcYMZQ+esRmem+m0XksBQEASOM
 TqlDATZQt/JCdf3bGH/X0SBhz52XFc0qH0aGez1dyfKI4oOL3hoFmBFDALpubHGeRLxQJO9REbJ
 WY5XeVvCI3Xscu8o=
X-Received: by 2002:a5d:5271:: with SMTP id l17mr3654875wrc.239.1627025674482; 
 Fri, 23 Jul 2021 00:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFWNmUvJUqpDpkbnqdtjgir7so/NrCYYMKuZ9YUXERjo7o2mKTrWiK46Wc7HLqq0UMbBxTrQ==
X-Received: by 2002:a5d:5271:: with SMTP id l17mr3654857wrc.239.1627025674283; 
 Fri, 23 Jul 2021 00:34:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 140sm27383033wmb.43.2021.07.23.00.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:34:33 -0700 (PDT)
Date: Fri, 23 Jul 2021 09:34:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/2] acpi: x86: pcihp: cleanup devfn usage in
 build_append_pci_bus_devices()
Message-ID: <20210723093431.16a69d01@redhat.com>
In-Reply-To: <20210722135030-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-2-imammedo@redhat.com>
 <20210722135030-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Jul 2021 13:56:18 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> I would add a description: we want to scan all functions
> not just function 0 to describe hotplug into bridges
> at function != 0. in preparation for this, refactor code to not
> skip functions != 0.
> 
> On Thu, Jul 22, 2021 at 06:59:44AM -0400, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/i386/acpi-build.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 17836149fe..b40e284b72 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >      Aml *dev, *notify_method = NULL, *method;
> >      QObject *bsel;
> >      PCIBus *sec;
> > -    int i;
> > +    int devfn;
> >  
> >      bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
> >      if (bsel) {
> > @@ -384,11 +384,11 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >          notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
> >      }
> >  
> > -    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
> > +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
> >          DeviceClass *dc;
> >          PCIDeviceClass *pc;
> > -        PCIDevice *pdev = bus->devices[i];
> > -        int slot = PCI_SLOT(i);
> > +        PCIDevice *pdev = bus->devices[devfn];
> > +        int slot = PCI_SLOT(devfn);
> >          bool hotplug_enabled_dev;
> >          bool bridge_in_acpi;
> >          bool cold_plugged_bridge;  
> 
> I am a bit puzzled about why this is equivalent. so we used to scan just
> function 0 on each slot. now we are scanning them all.
> won't this generate a different AML code? in fact duplicate
> descriptions?
> I suspect you need to move the check for slot == 0 from the next patch
> to this one otherwise bisect will be broken.

this was my mistake when splitting it into separate patch,
I shouldn't have touched += PCI_FUNC_MAX here, point of the patch
was to s/i/devfn/m so it won't distract from what the next patch
is doing.

> Or just squash this part into next patch. up to you.
ok I'll squash it into next.
 
> 
> > @@ -525,13 +525,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >          /* Notify about child bus events in any case */
> >          if (pcihp_bridge_en) {
> >              QLIST_FOREACH(sec, &bus->child, sibling) {
> > -                int32_t devfn = sec->parent_dev->devfn;
> > -
> >                  if (pci_bus_is_root(sec)) {
> >                      continue;
> >                  }
> >  
> > -                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> > +                aml_append(method, aml_name("^S%.02X.PCNT",
> > +                                            sec->parent_dev->devfn));
> >              }
> >          }
> >    
> 
> 
> this is a refactor, sure.
> 
> > -- 
> > 2.27.0  
> 


