Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927361398D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWFu-0003aX-Vx; Mon, 31 Oct 2022 10:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWFs-0003Zx-AL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWFh-0006MP-Ee
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667228340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhCtG3JD2F4enAXnCHNZ3+cysXr2BmwWx8WFDVqPfBU=;
 b=B7VVg8YwaWPLkb+ZsvD3Ip+vRyBsQkCLpIRzbphn6d6z/+DFCdvhi+hMcD7M0658XMMgpq
 JyDhBQ1zL8mevGQhIajyYmH8HCPtDNtmIBMHrI+cH8taUS/9lJQG+bhxkizwCnFgfwhW4H
 BLueJJUzJ5q1+5vTBdrlB0th1sDF8+4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-niGezA3yNb-0hhzWKqG-Vg-1; Mon, 31 Oct 2022 10:58:59 -0400
X-MC-Unique: niGezA3yNb-0hhzWKqG-Vg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so3146287wrb.20
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 07:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhCtG3JD2F4enAXnCHNZ3+cysXr2BmwWx8WFDVqPfBU=;
 b=GRQ83zm9fYJXnLhXqJ/LeQ750ukZmc8eMIarjqTD1do2hQDqv8UhQToibJjRQQacoS
 NjR3U7W7sa+9A351Nj2yiHfOdwj+bCrZIGnobGzIhwgMjTelPtMbxc5G3B4YLf/Eg+5G
 mUoP9dfEBV34B6ejsCKaBt3lkLp5x/HsswdFCSJhmxt+gfEFBN9zL4RnxEJXEC/uheQW
 /f0UAhxAu0fKwLn9vXPTmPLZxOBJRjwj/04suCo9sKwGOCtFcORJsrPJw2rW5kqvA4R1
 3yaImWxg8bHDZevV4Ywc5Vkm+Xfn16b2QPM7ghAq9hkTZ1+/72FVe1kNn2E77bqs/qg3
 jAHg==
X-Gm-Message-State: ACrzQf0mcm6CfV90ugPEI2WgBJvp7knrzshwX/TRWS6pLZURHZs69Dmi
 xTWzv0e731c2P/elJnC97EFvGml+hXUiHC4QJYhUAoudeR8vEZUDk2506V/R0wK5cjwxS8/hlH9
 xJTN+zY9YUfVapKs=
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8462431wmq.84.1667228336780; 
 Mon, 31 Oct 2022 07:58:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CTdjf4ueyS91dJxugWlTCY+iesjd+pj02Lp1/ICXjO5FKSMOK/AGnNjREdixmQ9ZQIb452g==
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8462406wmq.84.1667228336469; 
 Mon, 31 Oct 2022 07:58:56 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bn26-20020a056000061a00b0022cd0c8c696sm7323308wrb.103.2022.10.31.07.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 07:58:55 -0700 (PDT)
Date: Mon, 31 Oct 2022 10:58:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
 Hesham Almatary <hesham.almatary@huawei.com>, qemu-devel@nongnu.org,
 yangyicong@hisilicon.com, chenxiang66@hisilicon.com,
 linuxarm@huawei.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, eduardo@habkost.net, Brice.Goglin@inria.fr
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
Message-ID: <20221031105832-mutt-send-email-mst@kernel.org>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
 <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
 <20221031131717.00003cc4@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031131717.00003cc4@Huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 01:17:17PM +0000, Jonathan Cameron wrote:
> On Fri, 28 Oct 2022 17:53:40 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
> > Hi Hesham,
> > 
> > On 2022/10/27 18:00, Hesham Almatary wrote:
> > > This patchset adds support for AArch64/HMAT including a test.
> > > It relies on other two patch sets from:
> > > 
> > > Brice Goglin: to support -numa without initiators on q35/x86.
> > >   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> > > Xiang Chen: to enable/support HMAT on AArch64.
> > >   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> > > 
> > > I further add a test with ACPI/HMAT tables that uses the two
> > > patch sets.
> > >   
> > 
> > You seems to forget my tag :)
> > 
> > Anyway tested again for this series on master of commit 052924548886,
> > still works well and all tests passed for qemu-system-aarch64.
> > 
> > Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Hi,
> 
> Michael, I think you said you'd pick this one up? (it hit during last freeze)
> Just want to confirm in case everyone was assuming this was someone else's problem ;)
> I want to add a bunch of stuff on top of this next cycle (Generic Ports in particular)
> so good to get this in place if we can.
> 
> Jonathan

Yes it's in my pull req isn't it?


> > 
> > > Changes from v2:
> > > - Rebased and fixed a merge conflict
> > > 
> > > Changes from v1:
> > > - Generate APIC and PPTT ACPI tables for AArch64/virt
> > > - Avoid using legacy syntax in numa/bios tests
> > > - Delete unchanged FACP tables
> > > 
> > > Brice Goglin (4):
> > >   hmat acpi: Don't require initiator value in -numa
> > >   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
> > >   tests: acpi: q35: add test for hmat nodes without initiators
> > >   tests: acpi: q35: update expected blobs *.hmat-noinitiators
> > > expected HMAT:
> > > 
> > > Hesham Almatary (3):
> > >   tests: Add HMAT AArch64/virt empty table files
> > >   tests: acpi: aarch64/virt: add a test for hmat nodes with no
> > >     initiators
> > >   tests: virt: Update expected *.acpihmatvirt tables
> > > 
> > > Xiang Chen (1):
> > >   hw/arm/virt: Enable HMAT on arm virt machine
> > > 
> > >  hw/arm/Kconfig                                |   1 +
> > >  hw/arm/virt-acpi-build.c                      |   7 ++
> > >  hw/core/machine.c                             |   4 +-
> > >  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
> > >  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
> > >  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
> > >  tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
> > >  tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
> > >  tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
> > >  tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
> > >  tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
> > >  tests/qtest/bios-tables-test.c                | 109
> > > ++++++++++++++++++ 13 files changed, 118 insertions(+), 3
> > > deletions(-) create mode 100644
> > > tests/data/acpi/q35/APIC.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/DSDT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/HMAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/SRAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/virt/APIC.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/DSDT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/HMAT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/PPTT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/SRAT.acpihmatvirt 


