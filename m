Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D950C44E47B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:19:14 +0100 (CET)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTeM-0005AT-05
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlTcn-0003N2-Mn
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:17:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlTcl-0008TB-2s
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636712254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtzbWuBcHPFq7jIfqQgmr99pKQJpekFZKZYSjjp7XLU=;
 b=fy8xXe/WDILeNtEWOwETqBy31TPXCtxR4c3SPe9/xS9HTx8UxZHbxJ8BomPNgVcT+Lue/W
 Z7K6mdv8ikEF9MT25iDr+r9vipcwAJ28jKdy1JaN6irRsQG8rvonfiZ+YF43bbvIumwxVi
 S0Q/iY+g7MpBeXM995nKsRVvnUYASDk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-9ic5TXVQONKXi4bQX354fA-1; Fri, 12 Nov 2021 05:17:33 -0500
X-MC-Unique: 9ic5TXVQONKXi4bQX354fA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso7804699edj.20
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtzbWuBcHPFq7jIfqQgmr99pKQJpekFZKZYSjjp7XLU=;
 b=2x7MG32I5r5fqhiqjGugl/V0JkR/c/rw8KLGheCTTYcWLJucmyssq94fuLtPCrN3lO
 J9XsfIpIY2DTssX4qeJ9IWpbku1oE1CyoQXL+REuXaOmL6YAx6h3I7b86lIe9UW2CAJI
 9cH222+VEfY9f1gJ5v17HhOd4qmF7W+70bXWYglEoIyMfDwEHOjQxSRwqILqBq2UjjK5
 uHP5tmWtDX/c5ER/YpRr1NTxyRY0Duj80J5gT8r9mawrJA+2lfmvcYGtb3ghp/9T622n
 7W/FpEdXSI+i2wOTokPquHtSNRwOrRYL8GIKNSoe1PinfdJnXiZWo/Eg7JgshlTSMEpx
 lfMg==
X-Gm-Message-State: AOAM530YoOBrt6jiq0dXUzpYiqB0esvf+M6BLqZwQ0V9Yi3/4/602OmC
 sPxfgifyYFENNzM8sjV3VcI37MYXEdH4XYxGjaNgkQ1gAS2bH/mg8go7MXIBkDmK1oFpJCXV5c7
 N7X62ZqHG9Wn1alg=
X-Received: by 2002:a17:907:9802:: with SMTP id
 ji2mr17125938ejc.352.1636712252111; 
 Fri, 12 Nov 2021 02:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyS2824ICgukD2ln+lMTR29FQ7A43Qh5q7zkcJCR/D0XlnVOD2yHZn0OWZrNu8nc4rExNJwPA==
X-Received: by 2002:a17:907:9802:: with SMTP id
 ji2mr17125916ejc.352.1636712251937; 
 Fri, 12 Nov 2021 02:17:31 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id ig1sm2369508ejc.77.2021.11.12.02.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:17:31 -0800 (PST)
Date: Fri, 12 Nov 2021 11:17:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH for 6.2 v2 0/5] Fix Q35 ACPI PCI Hot-plug I/O issues
Message-ID: <20211112111730.0a773ae3@redhat.com>
In-Reply-To: <20211112034500-mutt-send-email-mst@kernel.org>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211112034500-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 04:47:05 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Nov 10, 2021 at 04:11:35PM -0500, Igor Mammedov wrote:
> > Changelog:
> >   v2:
> >     * simplify [1/5] and rename property to x-native-hotplug (CC stable)
> >     * [4/5]
> >        - rename function parameter to reflect actual action
> >        - drop local 'hotplug' variable and opencode statement 
> >     * test with SeaBIOS/OVMF and Linux guest,
> >       Windows also works with SeaBIOS, can't install it in EFI
> >       mode on current master (it's stuck when formatting disk/or
> >       copying files to hdd).
> > 
> > Attempt [1] to fix I/O allocation with the 'reserve-io' hint on each
> > pcie-root-port resulted in regression [2-3]. This patchset aims to fix
> > it by addressing the root cause of the problem - the disabled PCIe
> > Slot HPC bit.
> > 
> > [1] 'hw/pcie-root-port: Fix hotplug for PCI devices requiring IO'
> > [2] https://gitlab.com/qemu-project/qemu/-/issues/641
> > [3] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > 
> > CC: kraxel@redhat.com  
> 
> Igor are you going to post v3 with a fixup of the expected tables?
> Thanks!

I'll post in a short while,
it seems going ahead with this is less risky as it resolves remaining
issues (hotplug with edk2 and seabios boot loop) than just
reverting to native and bringing back old issues.

> > Igor Mammedov (1):
> >   pcie: rename 'native-hotplug' to 'x-native-hotplug'
> > 
> > Julia Suvorova (4):
> >   hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
> >   bios-tables-test: Allow changes in DSDT ACPI tables
> >   hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
> >   bios-tables-test: Update golden binaries
> > 
> >  include/hw/acpi/ich9.h                    |   1 +
> >  hw/acpi/ich9.c                            |  18 ++++++++++++++++++
> >  hw/i386/acpi-build.c                      |  12 ++++++++----
> >  hw/i386/pc.c                              |   2 ++
> >  hw/i386/pc_q35.c                          |   9 +++++++--
> >  hw/pci/pcie_port.c                        |   2 +-
> >  tests/data/acpi/q35/DSDT                  | Bin 8289 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat         | Bin 9614 -> 9614 bytes
> >  tests/data/acpi/q35/DSDT.bridge           | Bin 11003 -> 11003 bytes
> >  tests/data/acpi/q35/DSDT.cphp             | Bin 8753 -> 8753 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9943 -> 9943 bytes
> >  tests/data/acpi/q35/DSDT.dmar             | Bin 0 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt           | Bin 8364 -> 8364 bytes
> >  tests/data/acpi/q35/DSDT.ivrs             | Bin 8306 -> 8306 bytes
> >  tests/data/acpi/q35/DSDT.memhp            | Bin 9648 -> 9648 bytes
> >  tests/data/acpi/q35/DSDT.mmio64           | Bin 9419 -> 9419 bytes
> >  tests/data/acpi/q35/DSDT.multi-bridge     | Bin 8583 -> 8583 bytes
> >  tests/data/acpi/q35/DSDT.nohpet           | Bin 8147 -> 8147 bytes
> >  tests/data/acpi/q35/DSDT.nosmm            | Bin 0 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.numamem          | Bin 8295 -> 8295 bytes
> >  tests/data/acpi/q35/DSDT.smm-compat       | Bin 0 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.smm-compat-nosmm | Bin 0 -> 8289 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm12        | Bin 8894 -> 8894 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm2         | Bin 8894 -> 8894 bytes
> >  tests/data/acpi/q35/DSDT.xapic            | Bin 35652 -> 35652 bytes
> >  25 files changed, 37 insertions(+), 7 deletions(-)
> >  create mode 100644 tests/data/acpi/q35/DSDT.dmar
> >  create mode 100644 tests/data/acpi/q35/DSDT.nosmm
> >  create mode 100644 tests/data/acpi/q35/DSDT.smm-compat
> >  create mode 100644 tests/data/acpi/q35/DSDT.smm-compat-nosmm
> > 
> > -- 
> > 2.27.0  
> 


