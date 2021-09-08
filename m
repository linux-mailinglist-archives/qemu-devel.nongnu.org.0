Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99393403647
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:45:59 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtDS-0004rR-Ns
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNtBW-0003QD-Fy
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNtBT-0002Mj-Sy
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631090635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLQNqZ28xnjE+xYencfeM+WX5mkS6uELSYR+kbVaH0U=;
 b=A8RNgMx2jDRHOW5reeTJNaQsRjZLhigNw+tplgvzbWox2gXFPIBiJaZVE9+zD5CQvfVLH4
 fWPYOiqfX+hYsk6xLA5Ap9G+7RDhCUCbiIwroS5DbDjrKRdfmQ6X+q8DywW8mJE6csQrmu
 FRZJDj3g+aucVs/Qvp7lEM2o9rokq1I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-rgMLqgjoOeW0ZgBdk_55wg-1; Wed, 08 Sep 2021 04:43:54 -0400
X-MC-Unique: rgMLqgjoOeW0ZgBdk_55wg-1
Received: by mail-ej1-f70.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so663137ejb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLQNqZ28xnjE+xYencfeM+WX5mkS6uELSYR+kbVaH0U=;
 b=AYF/nHqpamHAuBX/uNLib0Sfp9q9YoP5fiAsTn6aYipvcN1Y4oGb/s+oIl4PqBZ7zM
 4vcmQtSuS1s9wivvmbDRWIvfDPiCBtQ8uYi2/dzSblG2Tt/tBLt/Bi7gTrc6vwAi6dgk
 9Ohq3GIP51I8GADlrhA7CsEKEO6orcYQAxF4Fw3L5baB196/zjLhBs6hT/QbeQVbv+m1
 elXdJqTHa0psZd4DRzkN27PYcvZfiCYi46sHonQt1QvwlNRgcdyX6a6Ztg+3TANYgEob
 AGOM55HIQSMcF2+7JbHuQjlHL/333XoTxVukYkH7WU1sU7cgWuNcQ4yZ0tbh7c+B9cDI
 gcMQ==
X-Gm-Message-State: AOAM5330SzHhQbLLjcE7zpCGuy+ypCXqaPoQaXW6JfXz6oSMZF4NY3VK
 yNaKtT2h1aBdCJMX4nlPQMgWArpIaC7o1zFxViRqspnjFMSqG7ZqVB8tz6pkVDM5rmjgeCemr6d
 y8E6KZrxjgyskugA=
X-Received: by 2002:a50:f0d5:: with SMTP id a21mr2671001edm.244.1631090632676; 
 Wed, 08 Sep 2021 01:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6emel3XFMeapi1XqlE2mrnzhkpGGtjeim0KsgQcr1aJKBHUOiGyotMKODMiiq3ydvXtSuXw==
X-Received: by 2002:a50:f0d5:: with SMTP id a21mr2670984edm.244.1631090632508; 
 Wed, 08 Sep 2021 01:43:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o21sm659343eji.29.2021.09.08.01.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:43:52 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:43:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
Message-ID: <20210908104351.72d0bb19@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: jusual@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, 8 Sep 2021, Igor Mammedov wrote:
> 
> > On Wed,  8 Sep 2021 09:41:39 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > > range was free and available. However, upon more testing, it seems this address
> > > range to be not available for some latest versions of windows.  
> >
> > The range is something assigned by QEMU, and guest has no say where it should be.
> > but perhaps we failed to describe it properly or something similar, so one gets
> > 'no resource' error.  
> 
> OK dug deeper. The existing range of IO address conflicts with the CPU
> hotplug range.
> 
> CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> 
> This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .

Looking at 'info mtree' it's indeed wrong:

    0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
    0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

which of them eventually handles IO request in intersection range?

Please, add to commit message your findings, so it would point out
where problem comes from and what it breaks(doesn't work as expect).

Given it's broken to begin with (and possibly regression if it broke cpu hotplug),
I'm inclined to fix it without adding compat stuff.
Michael, what do you think?

> We need to change one or the other.
> 
> From the windows device manager, I see that the other IO address range is
> 0x0620 to 0x062F which is reserved for GPE0.
> 
> .
> > We need a find out a reason why Windows doesn't like it. You might get more
> > detailed error running Windows debug build with ACPI debugger attached.  
> 
> bummer. This is beyond my expertize and I do not have a windows debug
> build.
never mind, you already found the issue.
  
> > > Hence, this
> > > change modifies the IO address range so that windows can allocate the address
> > > range without any conflict. The new address range would start at 0x0dd4 and end
> > > at address 0x0deb.
> > >
> > > This change has been tested using a Windows Server 2019 guest VM.
> > >
> > > Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  include/hw/acpi/ich9.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > > index a329ce43ab..b68c5a2174 100644
> > > --- a/include/hw/acpi/ich9.h
> > > +++ b/include/hw/acpi/ich9.h
> > > @@ -29,7 +29,7 @@
> > >  #include "hw/acpi/acpi_dev_interface.h"
> > >  #include "hw/acpi/tco.h"
> > >
> > > -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> > > +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
maybe 0xcc0 to fit right under acpi-cpu-hotplug as it was intended?

> >
> > that's ABI change, it must be versioned
> >  
> > >
> > >  typedef struct ICH9LPCPMRegs {
> > >      /*  
> >
> >  
> 


