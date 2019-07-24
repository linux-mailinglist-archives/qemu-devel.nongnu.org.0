Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6B72B91
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 11:39:44 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqDkN-0007J3-Vy
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 05:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49397)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hqDkC-0006ua-03
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hqDkA-0004tM-7s
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:39:31 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hqDkA-0004t4-2J
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:39:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id h18so44791184qtm.9
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 02:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxiHTGWqGdmASGy6w9cHfO1fuobRvnwQ7tprNZ+QCNI=;
 b=R3tW7i1qKR432AvDNFz9yY61h+BPVZKjlw65c4M7aR7O2iav1i31efCKdjWXEAt1re
 rLlTxf2beNeIId5e3SiHKXYkaToXYAvWEv4LhAx04E/+nGtb9B7J/43xfUC+jteua1ng
 X3ADwxrhPXUhcW/j+Q0d1wj4YdqhFSmCXBuwRkbf19xJjKY3xnABVKxQdOagWgYmwopR
 iyc9eES/naYoPNBwzJPHqrrPpCefLEopngC+mb41lZqtgjb0p4clcADFBbliv1n1jq5e
 8qvbzt0UJKHyosRc/Oyrk6VzTpLuVWzFn+amSqOtwLnYxsbKC7qYCOmDO41AfsJhtcyq
 OGtg==
X-Gm-Message-State: APjAAAXm5Q+oPnfSZGTPShSYoM/xfdUTRDf/GQC+4pQo2kK9MA6KXHJf
 Z/+wyqDknx/7sxBZe6lCnLH0vA==
X-Google-Smtp-Source: APXvYqzDRLDSHj2OlAUHZIgIJf/k5sESJfcYKG8s2rG095NgMn8FASjRwcMMKE+8s9buDEYcprqkBA==
X-Received: by 2002:ac8:764f:: with SMTP id i15mr55663891qtr.194.1563961169431; 
 Wed, 24 Jul 2019 02:39:29 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 d20sm18770059qto.59.2019.07.24.02.39.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 02:39:28 -0700 (PDT)
Date: Wed, 24 Jul 2019 05:39:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <zhexu@redhat.com>
Message-ID: <20190724040837-mutt-send-email-mst@kernel.org>
References: <155364082689.15803.7062874513041742278.stgit@gimli.home>
 <20190329104904.450fefef@x1.home>
 <dbe614f5-47c8-b05d-dd73-2fbcd1579ae3@amd.com>
 <20190723112618.0efafa8d@x1.home> <20190724071439.GB18771@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724071439.GB18771@xz-x1>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.193
Subject: Re: [Qemu-devel] [RFC PATCH] pci: Use PCI aliases when determining
 device IOMMU address space
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
Cc: "Singh, Brijesh" <brijesh.singh@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 24, 2019 at 03:14:39PM +0800, Peter Xu wrote:
> On Tue, Jul 23, 2019 at 11:26:18AM -0600, Alex Williamson wrote:
> > > On 3/29/19 11:49 AM, Alex Williamson wrote:
> > > > [Cc +Brijesh]
> > > > 
> > > > Hi Brijesh, will the change below require the IVRS to be updated to
> > > > include aliases for all BDF ranges behind a conventional bridge?  I
> > > > think the Linux code handles this regardless of the firmware provided
> > > > aliases, but is it required per spec for the ACPI tables to include
> > > > bridge aliases?  Thanks,
> > > >   
> > > 
> > > We do need to includes aliases in ACPI table. We need to populate the
> > > IVHD type 0x43 and 0x4 for alias range start and end. I believe host
> > > IVRS would contain similar information.
> > > 
> > > Suravee, please correct me if I am missing something?
> > 
> > I finally found some time to investigate this a little further, yes the
> > types mentioned are correct for defining start and end of an alias
> > range.  The challenge here is that these entries require a DeviceID,
> > which is defined as a BDF, AIUI.  The IVRS is created in QEMU, but bus
> > numbers are defined by the guest firmware, and potentially redefined by
> > the guest OS.  This makes it non-trivial to insert a few IVHDs into the
> > IVRS to describe alias ranges.  I'm wondering if the solution here is
> > to define a new linker-loader command that would instruct the guest to
> > write a bus number byte to a given offset for a described device.
> > These commands would be inserted before the checksum command, such that
> > these bus number updates are calculated as part of the checksum.
> > 
> > I'm imagining the command format would need to be able to distinguish
> > between the actual bus number of a described device, the secondary bus
> > number of the device, and the subordinate bus number of the device.
> > For describing the device, I'm envisioning stealing from the DMAR
> > definition, which already includes a bus number invariant mechanism to
> > describe a device, starting with a segment and root bus, follow a chain
> > of devfns to get to the target device.  Therefore the guest firmware
> > would follow the path to the described device, pick the desired bus
> > number, and write it to the indicated table offset.
> > 
> > Does this seem like a reasonable approach?  Better ideas?  I'm not
> > thrilled with the increased scope demanded by IVRS support, but so long
> > as we have an AMD IOMMU model, I don't see how to avoid it.  Thanks,
> 
> I don't have a better idea yet, but just want to say that accidentally
> I was trying to look into this as well starting from this week and I'd
> say that's mostly what I thought about too (I was still reading a bit
> seabios when I saw this email)... so at least this idea makes sense to
> me.
> 
> Would the guest OS still change the PCI bus number even after the
> firmware (BIOS/UEFI)?  Could I ask in what case would that happen?
> 
> Thanks,

Guest OSes can in theory rebalance resources. Changing bus numbers
would be useful if new bridges are added by hotplug.
In practice at least Linux doesn't do the rebalancing.
I think that if we start reporting PNP OS support in BIOS then windows
might start doing that more aggressively.


> -- 
> Peter Xu

