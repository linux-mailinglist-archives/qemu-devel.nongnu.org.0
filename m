Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9D403662
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:52:36 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtJr-0000ra-4g
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNtIj-000092-JW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNtIg-0000NH-Cx
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631091080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWWc80+hx1jVvy+E8s8+dXqL+M65v0yw+6l4b3QPkUM=;
 b=LEYpbOIy2n5UxxTeRK36NH+7agjJ5owEraSlq6s0ca3X3gN2CmxOQnvT5ph2daEdRUL256
 G4y5A4TObuV94MRKahBfFjpBPevmG1vxPJPEqFhXahsWqn9KmFc+0Rka3TWiy56hBWZi6d
 KLLmQ0SdOspba/b+Yh4c/OMM8tT9QsU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-wAHLZpqjNKeHaMlHktzDIQ-1; Wed, 08 Sep 2021 04:51:19 -0400
X-MC-Unique: wAHLZpqjNKeHaMlHktzDIQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so671485ejb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWWc80+hx1jVvy+E8s8+dXqL+M65v0yw+6l4b3QPkUM=;
 b=BXlNI1dtks9PJXbqbY29Y4hXMWx+D9cbBaLpXK4A7iLdf94SEmfBq3Q2cmA6a0Cqkm
 iJk5oXfh/JSYkDzAKU61+VhOBXcbZbKSMgfCOVRMPruSNlP/7EMcPisGhvHknxpjIc0w
 bpvk8MjhTAye8ChcCx32mRGyur9edkOpPYnS3+39ThcnPofyRVSjuKrqcgGo6wu7MPXn
 nh7fb1ehGn0QLoIrrsq/n9NXVB8RzDytVN+IxyrxlPf2X6e7yhkrOmMpXTHWSs40AGiO
 g99U1NYvrSXIzySU+RdPzgt8OhTutbEfnqMVIgWuAQ22xGBmdo1Ac2v1URc18/4RT/cM
 MgZQ==
X-Gm-Message-State: AOAM532ck+nZC9vVlLpqrH+y+2lutWt6G389nlTgVncWyJwBZmi1OK3x
 A81aakYTXDB6OW6iyN9JC29qM8TR7dJRAjDWafa7rfbIZQqfuVjIcdGpOLqVBTvFJdCDeUzRjHd
 RAg+8efFFBQLdLjQ=
X-Received: by 2002:aa7:de16:: with SMTP id h22mr2612644edv.3.1631091078467;
 Wed, 08 Sep 2021 01:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPaMvUhehiYkIoeH3fokvfv/WBjEJd87jIgon4aSaejMaKJhL+Py2kDxNjrSm2P8arXD27tg==
X-Received: by 2002:aa7:de16:: with SMTP id h22mr2612626edv.3.1631091078258;
 Wed, 08 Sep 2021 01:51:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y20sm636395eje.113.2021.09.08.01.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:51:17 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:51:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
Message-ID: <20210908105117.487a73f5@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2109081359400.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <alpine.DEB.2.22.394.2109081359400.2227929@anisinha-lenovo>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: jusual@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sep 2021 14:13:20 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, 8 Sep 2021, Ani Sinha wrote:
> 
> >
> >
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
> >  
> 
> Also verified that setting ACPI_PCIHP_ADDR_ICH9 to 0x0cc0 also works and
> resolves the conflict.
> 
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
> >  
> > >  
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
> > >
> > > that's ABI change, it must be versioned  
> 
> Any pointers how to do this? I see some property values for attributes
> being set in hw/i386/pc.c for older models but this one is not exactly a
> property as it is currently written.
in case we would need it, it should be converted to set-able property.
But we might not need it after all, lets see what Michael thinks about it. 

> 
> 
> > >  
> > > >
> > > >  typedef struct ICH9LPCPMRegs {
> > > >      /*  
> > >
> > >  
> >  
> 


