Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E933C7305
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:18:44 +0200 (CEST)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KBH-0004lj-Fi
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KAN-00046O-7A
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KAI-0005qZ-HT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yovSSQEGbUYCWJX8x+9468hcCINettZUXT6OxIzKb70=;
 b=YpQ9KGbxSZvsQ60elbqqPq7CiCyagWyd44hr4sKOGWaarY6l/CrRmADW+rsouOK5gPV95L
 gS9dOD8jR5ubY3IuMhaSx17sAXxpoX9UGAfHDTZs2i1I9x47pMu0AlYy2TaR8m2h/INQeu
 3auSU/JRNzXNQM3qydNgr0bUoYYvong=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-sCqF1JiVPhaa37rHUCcZLw-1; Tue, 13 Jul 2021 11:17:09 -0400
X-MC-Unique: sCqF1JiVPhaa37rHUCcZLw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso4841408wrx.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yovSSQEGbUYCWJX8x+9468hcCINettZUXT6OxIzKb70=;
 b=OCZiuhz8cXYCXqJkCKfPnv9IOzx9+ZZ94Z7b0qw6pe7lbVUHDeXy88SiL2vsv+F8Yh
 GIyyhy7sQX+PSxO1GAzqTHZ4k+dYnhGm1CCcDcYT4qjudmb0tedpbeb67XOiPqXMIXok
 W5/6hyZzrY7IjdcX3gQauXRstNi9hO2n2Zfacc043sFkNQ9CgwX220jtPd8oVLoQAeFg
 JmWaTMCM/ZUJ+wwdfkTS4UeOXKHMu12j+xM/6grfhqBPxTpulZRo0vqIqjeqnxVWzcPr
 X0TUym7vTjsrh3kveWJ/crliXA1Hsgqx0msMFohB3bpaqxoFdYpTfrawUeUUL79iNTBH
 LrGQ==
X-Gm-Message-State: AOAM533J4cCu/oNeDfM72OjsVLNSx3zNEgjREvu1wda5noW5vZWmAPOD
 +uIrCunZVLjVCxrNaWUSc/E5mV/3kW+i2jyb8ZFWHRPMKzeHkPQ6M8O6qAvwEtJf1zeLRSbsV2b
 Z3irWKALE6sV5C6U=
X-Received: by 2002:a5d:6943:: with SMTP id r3mr6408711wrw.3.1626189426720;
 Tue, 13 Jul 2021 08:17:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykLwt/Pdhx2nsz3LkcRCBixvE8FfGZ8wRrG0rT434xcPRoWWUbP9FBPue/bQBMJnr6vguZBQ==
X-Received: by 2002:a5d:6943:: with SMTP id r3mr6408681wrw.3.1626189426531;
 Tue, 13 Jul 2021 08:17:06 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id p15sm15001724wmq.43.2021.07.13.08.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:17:04 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:17:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 5/6] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
Message-ID: <20210713111542-mutt-send-email-mst@kernel.org>
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-6-jusual@redhat.com>
 <20210713095931.61fa1281@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713095931.61fa1281@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: David Gibson <dgibson@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 09:59:31AM +0200, Igor Mammedov wrote:
> On Tue, 13 Jul 2021 02:42:04 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
> 
> > Q35 has three different types of PCI devices hot-plug: PCIe Native,
> > SHPC Native and ACPI hot-plug. This patch changes the default choice
> > for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> > ability to use SHPC and PCIe Native for hot-plugged bridges.
> 
> Before we flip the switch,
> has the issue about not hotplug ports not getting IO (Michael)
> been addressed, if not are there any plans to fix it?
> 

I think it's a guest bug frankly. We'll workaround it
by setting io-reserve to 4k for hotplugged bridges,
I think this is minor enough that it's better to just
merge now and fix on top.
I've added this note to the commit log though.

> > This is a list of the PCIe Native hot-plug issues that led to this
> > change:
> >     * no racy behavior during boot (see 110c477c2ed)
> >     * no delay during deleting - after the actual power off software
> >       must wait at least 1 second before indicating about it. This case
> >       is quite important for users, it even has its own bug:
> >           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> >     * no timer-based behavior - in addition to the previous example,
> >       the attention button has a 5-second waiting period, during which
> >       the operation can be canceled with a second press. While this
> >       looks fine for manual button control, automation will result in
> >       the need to queue or drop events, and the software receiving
> >       events in all sort of unspecified combinations of attention/power
> >       indicator states, which is racy and uppredictable.
> >     * fixes:
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
> >         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> > 
> > To return to PCIe Native hot-plug:
> >     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/acpi/ich9.c | 2 +-
> >  hw/i386/pc.c   | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 2f4eb453ac..778e27b659 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      pm->disable_s3 = 0;
> >      pm->disable_s4 = 0;
> >      pm->s4_val = 2;
> > -    pm->use_acpi_hotplug_bridge = false;
> > +    pm->use_acpi_hotplug_bridge = true;
> >  
> >      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8e1220db72..7e03848792 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] = {
> >      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
> >      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> >      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> > +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
> >  };
> >  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >  


