Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1F60E3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 16:53:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onhlT-0000JC-NM; Wed, 26 Oct 2022 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onhlR-00009c-5k
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onhlO-0006hq-U7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666795933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mLNMErJTGEfSHR3mflHUcPYOK5n09aMmWg060KqPBbM=;
 b=AVvaHeLvBtxtRh7RSHW1zIw7glRt/1zBchKd8QglyCq5iug3Zp1fcFnp5huwOeH45luEFt
 bNmJ1TnEgZ+0d++z3jVVRksSjY1FSTA2955GQ0EU6NhsLz7QblTDRnTgyCM/54EVf4lbPg
 tygydv1oOiivADpo7Lk+lCR/BIomX7g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-5rRr692zPtOb6ceGdcrdZQ-1; Wed, 26 Oct 2022 10:52:12 -0400
X-MC-Unique: 5rRr692zPtOb6ceGdcrdZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b003cf4d3b6644so295741wmc.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 07:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLNMErJTGEfSHR3mflHUcPYOK5n09aMmWg060KqPBbM=;
 b=w5UnTo10+O1Woo9OQlzmYoGtxHWSHdKEHG2A4Vnm+7Yw4SV49kGVEvxIV67c1AjHCN
 BJSHSHXWmofD124ApJoTcAeenakWxFR44+ZRrpbzCzGhRyms6mUjujxBX9VsHPKFxRJs
 4TKkMjH2rAhDINq2y5zyQ/gU5jWHcYf68vy+P1Smaecrks8WR/F2U81uPB6tiZDXVpdh
 id2eWpKkZumbMCRHzC7GrII4V0MN5c4z/XTdMu/OX4V3wDw28ZfO9kKna2OEfG0B4Pak
 UGelEQOaLEMzixrnNINW6j8Er8JAUBar39S5bnvOCcqsUDvcdyLNzP49qhUdnFNSw4ME
 Ezfw==
X-Gm-Message-State: ACrzQf3RKsm/fIivkap70Oi4CAc1n0DbOfpUS3xHHj/q6G1CpHgIxYsg
 vfJ9TdkXuibtp8nIxUiCXV07YqBNwfZhjKd+lGt+/VomdOtjQmyvFzros2sNfjb1iQyR7N+tEuZ
 vjnHHKDYTNbc+sUU=
X-Received: by 2002:a05:600c:4f94:b0:3c8:34b2:94bf with SMTP id
 n20-20020a05600c4f9400b003c834b294bfmr2803949wmq.39.1666795931131; 
 Wed, 26 Oct 2022 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5x+6EKUiDdIaHN+VxjZvu/YhleCTfSCpTcmtJdFT/dcyNXd7Kq2BPIIxV4SOXY8mBeiqW9wQ==
X-Received: by 2002:a05:600c:4f94:b0:3c8:34b2:94bf with SMTP id
 n20-20020a05600c4f9400b003c834b294bfmr2803931wmq.39.1666795930898; 
 Wed, 26 Oct 2022 07:52:10 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 bl21-20020adfe255000000b002365b759b65sm1175524wrb.86.2022.10.26.07.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 07:52:10 -0700 (PDT)
Date: Wed, 26 Oct 2022 10:52:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com,
 prime.zeng@huawei.com, hesham.almatary@huawei.com,
 ionela.voinescu@arm.com, darren@os.amperecomputing.com
Subject: Re: [PATCH 0/4] Only generate cluster node in PPTT when specified
Message-ID: <20221026105012-mutt-send-email-mst@kernel.org>
References: <20220922131143.58003-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Sep 22, 2022 at 09:11:39PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This series mainly change the policy for building a cluster topology node
> in PPTT. Previously we'll always build a cluster node in PPTT without
> asking the user, after this set the cluster node will be built only the
> the user specify through "-smp clusters=X".
> 
> Update the tests and test tables accordingly.


This will need an ack from virt maintainers.

And I think what people are asking is about the impact
of this patch on guests.

> Yicong Yang (4):
>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>   tests: virt: update expected ACPI tables for virt test
>   tests: acpi: aarch64: add topology test for aarch64
>   tests: acpi: aarch64: add *.topology tables
> 
>  hw/acpi/aml-build.c                |   2 +-
>  hw/core/machine-smp.c              |   3 +++
>  include/hw/boards.h                |   2 ++
>  tests/data/acpi/virt/APIC.pxb      | Bin 0 -> 168 bytes
>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>  tests/data/acpi/virt/DBG2.memhp    | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.numamem  | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.pxb      | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DBG2.topology | Bin 0 -> 87 bytes
>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>  tests/data/acpi/virt/FACP.pxb      | Bin 0 -> 268 bytes
>  tests/data/acpi/virt/FACP.topology | Bin 0 -> 268 bytes
>  tests/data/acpi/virt/GTDT.pxb      | Bin 0 -> 96 bytes
>  tests/data/acpi/virt/GTDT.topology | Bin 0 -> 96 bytes
>  tests/data/acpi/virt/IORT.topology | Bin 0 -> 128 bytes
>  tests/data/acpi/virt/MCFG.pxb      | Bin 0 -> 60 bytes
>  tests/data/acpi/virt/MCFG.topology | Bin 0 -> 60 bytes
>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>  tests/data/acpi/virt/PPTT.memhp    | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.numamem  | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.pxb      | Bin 0 -> 76 bytes
>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>  tests/data/acpi/virt/SPCR.pxb      | Bin 0 -> 80 bytes
>  tests/data/acpi/virt/SPCR.topology | Bin 0 -> 80 bytes
>  tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
>  25 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/APIC.pxb
>  create mode 100644 tests/data/acpi/virt/APIC.topology
>  create mode 100644 tests/data/acpi/virt/DBG2.memhp
>  create mode 100644 tests/data/acpi/virt/DBG2.numamem
>  create mode 100644 tests/data/acpi/virt/DBG2.pxb
>  create mode 100644 tests/data/acpi/virt/DBG2.topology
>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>  create mode 100644 tests/data/acpi/virt/FACP.pxb
>  create mode 100644 tests/data/acpi/virt/FACP.topology
>  create mode 100644 tests/data/acpi/virt/GTDT.pxb
>  create mode 100644 tests/data/acpi/virt/GTDT.topology
>  create mode 100644 tests/data/acpi/virt/IORT.topology
>  create mode 100644 tests/data/acpi/virt/MCFG.pxb
>  create mode 100644 tests/data/acpi/virt/MCFG.topology
>  create mode 100644 tests/data/acpi/virt/PPTT.memhp
>  create mode 100644 tests/data/acpi/virt/PPTT.numamem
>  create mode 100644 tests/data/acpi/virt/PPTT.pxb
>  create mode 100644 tests/data/acpi/virt/PPTT.topology
>  create mode 100644 tests/data/acpi/virt/SPCR.pxb
>  create mode 100644 tests/data/acpi/virt/SPCR.topology
> 
> -- 
> 2.24.0


