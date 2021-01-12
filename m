Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA182F2D28
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:49:04 +0100 (CET)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHET-0006Px-0J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzH3U-0002LD-FX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:37:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzH3S-0000hu-0s
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610447856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xfI1F9Bo+Dy2J52NpVC904akhvvvhqi/6WVSaQ8uEJU=;
 b=UEQ/JZiR8bqJEsWcOvaNWwhU7AsZny4XEZ0JKoZHRUEXNtKu4oDE7/zc9cpkjLdw9jSJIG
 6zwIk83wGMDyt2GK7qXmtaA03TK3Jz0TOCCVFboLmaUImdArrTHBxzl/kY+46T+wxxsw+F
 xsSrOQMaJsn1VPk8z31dKU5PGOCAvfo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-VlhEFma2Nu2YuFrc4et1bQ-1; Tue, 12 Jan 2021 05:37:34 -0500
X-MC-Unique: VlhEFma2Nu2YuFrc4et1bQ-1
Received: by mail-wr1-f72.google.com with SMTP id g16so958005wrv.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xfI1F9Bo+Dy2J52NpVC904akhvvvhqi/6WVSaQ8uEJU=;
 b=c68tw+FsgtLa+Ae4KSk2xk5oZ95/ayyrbCz2SRXo7Bk0hkytlZv8IDRGLXfQ7c3GFD
 +ZKKnX2rSjgMvFY56fbRkzgF4nSg6hrJUXZQmim7NpHDLcKNf6t1nQL/WVfNW5l+VxUx
 yPLYTcMQDupw15syWyWi1W8CMPbAwuqEEHGxTLT4hfZFaey7N6YSYT4WWb4Ey2pbD5g1
 lgGfaJaw894kciJFgNOwwU8PT3sr9oWtVGKAqb6+d8T3aTQkxFobmSx4mLsZKsDAk6xG
 QtTJ1fSou39TCC0Lo/6FBY3+U/TTG3e6XQ9yVXQ4f+X/s0ot5qWd5tKz4OQYJqmMOYSR
 wp8g==
X-Gm-Message-State: AOAM531PtyQRxThhHXUiw019NKKATOxelPfR/vllBbi0XVzSdNG7F5Wl
 3B+S8VjeOHKgNLLfaL4BUvYSZJSsdJMtCBKEmrEUsmU+1MPyep+W00vapaG9qwfP9222pVYrKBR
 JiceEqxthm6G4qwA=
X-Received: by 2002:adf:e710:: with SMTP id c16mr3597495wrm.295.1610447853560; 
 Tue, 12 Jan 2021 02:37:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTaRRYMe9HaG/AEqD87xo4N9VnQ1/8NFreQFZMGWnx6FWaMzBLFFcMQ1CZ0QLH8HvRhp1kmA==
X-Received: by 2002:adf:e710:: with SMTP id c16mr3597470wrm.295.1610447853401; 
 Tue, 12 Jan 2021 02:37:33 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id k18sm4567381wrd.45.2021.01.12.02.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 02:37:32 -0800 (PST)
Date: Tue, 12 Jan 2021 05:37:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v4 0/8] acpi: Some fixes for pxb support for ARM virt
 machine
Message-ID: <20210112053711-mutt-send-email-mst@kernel.org>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
 <18883fc1-5fc6-1c9e-b9d8-475809c9c1de@huawei.com>
MIME-Version: 1.0
In-Reply-To: <18883fc1-5fc6-1c9e-b9d8-475809c9c1de@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks good to me. Igor, want to ack before I apply this?

On Tue, Jan 12, 2021 at 06:19:03PM +0800, Jiahui Cen wrote:
> Kindly ping...
> 
> Thanks,
> Jiahui
> 
> On 2021/1/7 19:40, Jiahui Cen wrote:
> > This patch series adds some fixes for ARM virt machine pxb support.
> > 1. Pass addr offset for IO, MMIO and bus number when builing crs, because
> > the addr_trans is needed to describe an addr resource. [1]
> > 2. Inform guest os not to ignore the resource map generated by firmware as
> > the x86 default way. [2]
> > 3. Enable pxb for ARM virt machine by default.
> > 4. Update expected DSDT files with the above changes and enable the pxb
> > unit-test.
> > 
> > v3->v4:
> > * Separate the patch of ordering root buses for further discussion. [3]
> > 
> > v2->v3:
> > * Reorder the root bridges.
> > * Exclude resources of extra root bridges from main root bridge's _CRS.
> > 
> > v1->v2:
> > * Update expected DSDT files.
> > * Quote PCI Firmware spec as comments.
> > 
> > [1]: https://lore.kernel.org/qemu-devel/20201217132747.4744-1-cenjiahui@huawei.com/
> > [2]: https://lore.kernel.org/qemu-devel/20201217132926.4812-1-cenjiahui@huawei.com/
> > [3]: https://lore.kernel.org/qemu-devel/dca69f55-dfd1-3f97-dc3f-13eeedec5027@huawei.com/
> > 
> > Jiahui Cen (8):
> >   acpi: Allow DSDT acpi table changes
> >   acpi: Fix unmatched expected DSDT.pxb file
> >   acpi: Add addr offset in build_crs
> >   acpi/gpex: Inform os to keep firmware resource map
> >   acpi/gpex: Exclude pxb's resources from PCI0
> >   Kconfig: Compile PXB for ARM_VIRT
> >   acpi: Enable pxb unit-test for ARM virt machine
> >   acpi: Update _DSM method in expected files
> > 
> >  hw/acpi/aml-build.c               |  18 ++--
> >  hw/i386/acpi-build.c              |   3 +-
> >  hw/pci-bridge/Kconfig             |   2 +-
> >  hw/pci-host/gpex-acpi.c           |  87 ++++++++++++++------
> >  include/hw/acpi/aml-build.h       |   4 +-
> >  tests/data/acpi/microvm/DSDT.pcie | Bin 3023 -> 3031 bytes
> >  tests/data/acpi/virt/DSDT         | Bin 5196 -> 5204 bytes
> >  tests/data/acpi/virt/DSDT.memhp   | Bin 6557 -> 6565 bytes
> >  tests/data/acpi/virt/DSDT.numamem | Bin 5196 -> 5204 bytes
> >  tests/data/acpi/virt/DSDT.pxb     | Bin 7802 -> 7689 bytes
> >  tests/qtest/bios-tables-test.c    |   4 -
> >  11 files changed, 79 insertions(+), 39 deletions(-)
> > 


