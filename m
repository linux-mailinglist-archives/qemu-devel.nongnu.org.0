Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21906DDD2D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEZp-00034S-Ca; Tue, 11 Apr 2023 10:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmEZn-00034A-PU
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmEZk-0005f7-PZ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681221743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGdBupXPt6I3rDVFYUcNYveCJphN4VMLHIdxkfP/VRc=;
 b=A0DGkNQA+4qp7GfSQi13OD7QpP/b4YUHKdE9R6ddFKlBohbel/0iZlN1JQJ6EtCbqY7QyJ
 8b2bdzz7B9J3+x6KwTIvM3WrPgNQdpG/cVMTzqOU1v4raT7BA8dumNzQoTFMDy7u2MIKKb
 0F8ZVNV8M72j5T5HbSgrCjuzH2d6MwY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-fPFJG0cNMTC-lGFLjOhDoA-1; Tue, 11 Apr 2023 10:02:22 -0400
X-MC-Unique: fPFJG0cNMTC-lGFLjOhDoA-1
Received: by mail-ej1-f71.google.com with SMTP id
 fy17-20020a1709069f1100b00948fd62a55cso4626619ejc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681221741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGdBupXPt6I3rDVFYUcNYveCJphN4VMLHIdxkfP/VRc=;
 b=n5JAq2PJNi/cC9NITw0X67ybSfZsAhbortsK9zXp3aaxM2WtsBxVfbyiGadZMSQRYz
 d9W6SAUFmxTKBeyf6y0NhrqwH8WKe5xhAUQgNcfgl9XNdORFiDlmH9SrMLqGI6keJXAd
 NavD1qy/HpKOqEyLvC5fGMwhA2BaSgxMnVXa4ApBVpmmbfspOLme0etZNJuH2gWnf2gJ
 uwcESc4TR/1jMlRWi7KAQl8HLvsOGDPwFiEHn4aL1suxMpeaqOBRq7obtm8Mp3i5tuVf
 DuxfaN3Wne1ddUdPCbZIIczaFcXT63Z+ID8EcMw14juuGZOh9Rh5VkSFGrFsR9y0/ROR
 PXag==
X-Gm-Message-State: AAQBX9f9J25qb0nn4PQIg/aQ5ldTerDPae7CqFuAs6tsm6yCg6Y6Sth9
 CmGCwDRnx6vl3MzdYsIf/FAPwFNVsPkzrSY3kgmzh7vexQVK9/fSIe5S6i5cCSaREuzGsTuo85e
 peU9qNlekDtE9Lbk=
X-Received: by 2002:a17:907:7ba9:b0:94a:8f3a:1a77 with SMTP id
 ne41-20020a1709077ba900b0094a8f3a1a77mr6933888ejc.8.1681221741095; 
 Tue, 11 Apr 2023 07:02:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350YMEzWnRzYVxrmYVtM5nHfaSLDutGKQDQxEPA2zrSfyc8LGO3cF8tTNRFICJaZcz9wWZ3z2KA==
X-Received: by 2002:a17:907:7ba9:b0:94a:8f3a:1a77 with SMTP id
 ne41-20020a1709077ba900b0094a8f3a1a77mr6933835ejc.8.1681221740516; 
 Tue, 11 Apr 2023 07:02:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p7-20020a170906838700b009484e17e7f5sm6196169ejx.100.2023.04.11.07.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:02:19 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:02:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan Cameron via
 <qemu-devel@nongnu.org>, ani@anisinha.ca, berrange@redhat.com, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [RFC PATCH 0/4] hw/i386: Factor out PXB parts of DSDT into an
 SSDT table
Message-ID: <20230411160219.64f0aa2f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230407033509-mutt-send-email-mst@kernel.org>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
 <20230406112529.00006533@huawei.com>
 <20230407033509-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 7 Apr 2023 03:37:00 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Apr 06, 2023 at 11:25:47AM +0100, Jonathan Cameron wrote:
> > On Fri, 17 Mar 2023 16:54:36 +0000
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> >   
> > > Michael Tsirkin raised that we have recently had churn in the bios-tables-test
> > > and perhaps it was worth factoring some parts of DSDT out as SSDT files.
> > > This is an attempt to do that for the entries from pxb-pcie and pxb-cxl
> > > PCI root bridges.
> > > 
> > > The main PCI root bridge and related elements are left in DSDT as they
> > > are present in many more tests than PXB.  However things brings some
> > > complexity as some of the DSDT parts are then dependent on building up
> > > information whilst creating the PXB entries.  The ordering constraints
> > > of RSDT entries prevent easily generating the new SSDT table first
> > > (see patch 3)
> > > 
> > > This series works around that by separating that build up of information from
> > > the build up of the PXB parts of the SSDT.  That allows the tables to be
> > > build in the standard order, based on knowledge that the SSDT parts will
> > > definitely be built later.
> > > 
> > > Personally, having tried this, I'm not convinced that the advantages of
> > > simplifying updates to the test data justify the complexity increase needed.
> > > However I will add that I have a series adding CXL QTG DSM support form Dave
> > > Jiang in my tree that will only result in updates to SSDT.cxl after this patch
> > > rather than DSDT.cxl reducing chance of a clash with other changes
> > > in flight. Hence this is an RFC to find out if people think this is
> > > a good direction to go in.
> > > 
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > https://lore.kernel.org/qemu-devel/20230302055544-mutt-send-email-mst@kernel.  
> > 
> > Michael / all, at first glance at least, is sensible to take forwards?
> > 
> > Whilst I'm not in a rush on this, I'm carrying a bunch of patches
> > for next cycle that are on top of this at the moment, so I'm just wondering
> > whether it makes sense reorder things based on what might land first
> > / not land at all.
> > 
> > Thanks,
> > 
> > Jonathan  
> 
> Yes, I like this. Igor had some reservations about the split-up. Igor
> can you comment please?

Well, as Jonathan said, I'm also not convinced that it does more good
than getting code worse condition.
In this case my preference is to keep code simpler vs occasional merge
conflict/rebasing.

In virt world SSDTs don't make much sense as tables are build dynamically,
they just introducing more complexity (incl. less blobs to deal with in tests).
(that was one of the reasons we got rid of them practically as soon as
we had switched from patching prebuilt AML blobs to aml_foo() API).

PS:
wrt nvdimm ssdt, it was fairly isolated feature with lot of updates,
so it made some sense to have a dedicated table just to simplify
review/reduce merge conflicts.
(probably it was me who suggested to use separate table).
But in retrospective it wouldn't make much difference if it were in DSDT.
Perhaps we should merge nvdimm's SSDT back into DSDT as it is
more or less stable nowadays.

PS2:
Also, I'm working on expanding PCI slots descriptors to PXBs,
and more or less that will negate this tables split. 

> > > 
> > > 
> > > Jonathan Cameron (4):
> > >   hw/acpi: Make Aml and / or crs_range_set optional in build_crs
> > >   tests/acpi: Allow changes to DSDT.cxl/viot and SSDT.cxl/viot
> > >   hw/i386/acpi: Separate PXB related parts of DSDT into an SSDT table.
> > >   tests/acpi: Updated DSDT and SSDT due to move of PXB info to SSDT
> > > 
> > >  hw/acpi/aml-build.c           |  75 +++++-----
> > >  hw/i386/acpi-build.c          | 249 ++++++++++++++++++++++------------
> > >  hw/pci-host/gpex-acpi.c       |   5 +-
> > >  include/hw/acpi/aml-build.h   |   4 +-
> > >  tests/data/acpi/q35/DSDT.cxl  | Bin 9673 -> 8474 bytes
> > >  tests/data/acpi/q35/DSDT.viot | Bin 9470 -> 8429 bytes
> > >  tests/data/acpi/q35/SSDT.cxl  | Bin 0 -> 1235 bytes
> > >  tests/data/acpi/q35/SSDT.viot | Bin 0 -> 1077 bytes
> > >  8 files changed, 208 insertions(+), 125 deletions(-)
> > >  create mode 100644 tests/data/acpi/q35/SSDT.cxl
> > >  create mode 100644 tests/data/acpi/q35/SSDT.viot
> > >   
> 


