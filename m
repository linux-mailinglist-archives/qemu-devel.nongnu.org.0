Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF35409CDD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:23:55 +0200 (CEST)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrYX-00068k-Su
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPrWL-0005E0-JI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPrWH-0004UJ-Qp
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631560891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkf2vUTfeAdZ74tXA2MvoTghdZh7EQ9kWTMxswOScIE=;
 b=KPHxq28wUW2c17nj6ASVbG+LO2+pTvbJKE44BviRKKj/LiUuW4C4yhQbgKevT8uDrRZDLP
 TgBdjxpoDI/IqIrXjUKvLsK0sYfvpMEpJHB+QyI3log0bx+3w2udW1SmGCKIuvh+8ygvPl
 1GCbJuS6Z7jA7tzQAPAFpFuvl6+mpiY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-mQT28XHoMyOlxBs6XjgIPQ-1; Mon, 13 Sep 2021 15:21:31 -0400
X-MC-Unique: mQT28XHoMyOlxBs6XjgIPQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 g18-20020a17090670d200b005f0df5ce29bso1404125ejk.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tkf2vUTfeAdZ74tXA2MvoTghdZh7EQ9kWTMxswOScIE=;
 b=GpZ9L+vQelOA4FoGInem1QvZTvS4b9kyPL1MZcyRkpEdFnQVepooTddn4X3kweNOC8
 98+L4kYJI08tSYdLJVXBtt4SLCcixC9rSybVSRIZAuEcsT2L+4sz/SaQNEHSY9Im1rp+
 TVX4E9iyoAOahRCq6vyw83f6BtF6iXyAIcBR6N5Vgp6xBVPZcsSnZbtF/T4rGJsx6nEH
 pYbFjt3QxKt64RoGSct/hcNDvtqScDdPFmCEVluYckGQLJAflRWCUg0eV4t+8YyPjuqk
 Hv7wmqKbkpZhIR76rtffkmWM0nBzPAioB09RXEfjF0ag8phlD8B2QrNXOU1b9kXC2S5P
 6MZQ==
X-Gm-Message-State: AOAM531t2iviv68VFEtAAQLfXM+W8lvSXW/1fdDYDRUtEr6LPpBBwyZW
 20fKMP3d4oarwqONvWYa0iGcLSeLhFXFfLPLJaLN6rnjEQJouROwBaR/8a3zOReX8HsLJ6aU+I/
 RdnsctR8xmc4W8Vs=
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr14590878ejm.325.1631560889680; 
 Mon, 13 Sep 2021 12:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBeNadEAOeot9FZDtB7XRdY+2AYvPsgwRgalDOE4m3b7ct0O6jzE6lyh7VuAjXWhJtk2yKuA==
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr14590852ejm.325.1631560889410; 
 Mon, 13 Sep 2021 12:21:29 -0700 (PDT)
Received: from redhat.com ([2.55.151.134])
 by smtp.gmail.com with ESMTPSA id n13sm3810971ejk.97.2021.09.13.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 12:21:26 -0700 (PDT)
Date: Mon, 13 Sep 2021 15:21:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
Message-ID: <20210913152107-mutt-send-email-mst@kernel.org>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908104351.72d0bb19@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Ani Sinha <ani@anisinha.ca>, jusual@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:43:51AM +0200, Igor Mammedov wrote:
> On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
> 
> > On Wed, 8 Sep 2021, Igor Mammedov wrote:
> > 
> > > On Wed,  8 Sep 2021 09:41:39 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >  
> > > > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > > > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > > > range was free and available. However, upon more testing, it seems this address
> > > > range to be not available for some latest versions of windows.  
> > >
> > > The range is something assigned by QEMU, and guest has no say where it should be.
> > > but perhaps we failed to describe it properly or something similar, so one gets
> > > 'no resource' error.  
> > 
> > OK dug deeper. The existing range of IO address conflicts with the CPU
> > hotplug range.
> > 
> > CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> > 
> > This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
> 
> Looking at 'info mtree' it's indeed wrong:
> 
>     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
>     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
> 
> which of them eventually handles IO request in intersection range?
> 
> Please, add to commit message your findings, so it would point out
> where problem comes from and what it breaks(doesn't work as expect).
> 
> Given it's broken to begin with (and possibly regression if it broke cpu hotplug),
> I'm inclined to fix it without adding compat stuff.
> Michael, what do you think?

Agreed.

> > We need to change one or the other.
> > 
> > From the windows device manager, I see that the other IO address range is
> > 0x0620 to 0x062F which is reserved for GPE0.
> > 
> > .
> > > We need a find out a reason why Windows doesn't like it. You might get more
> > > detailed error running Windows debug build with ACPI debugger attached.  
> > 
> > bummer. This is beyond my expertize and I do not have a windows debug
> > build.
> never mind, you already found the issue.
>   
> > > > Hence, this
> > > > change modifies the IO address range so that windows can allocate the address
> > > > range without any conflict. The new address range would start at 0x0dd4 and end
> > > > at address 0x0deb.
> > > >
> > > > This change has been tested using a Windows Server 2019 guest VM.
> > > >
> > > > Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  include/hw/acpi/ich9.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > > > index a329ce43ab..b68c5a2174 100644
> > > > --- a/include/hw/acpi/ich9.h
> > > > +++ b/include/hw/acpi/ich9.h
> > > > @@ -29,7 +29,7 @@
> > > >  #include "hw/acpi/acpi_dev_interface.h"
> > > >  #include "hw/acpi/tco.h"
> > > >
> > > > -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> > > > +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
> maybe 0xcc0 to fit right under acpi-cpu-hotplug as it was intended?
> 
> > >
> > > that's ABI change, it must be versioned
> > >  
> > > >
> > > >  typedef struct ICH9LPCPMRegs {
> > > >      /*  
> > >
> > >  
> > 


