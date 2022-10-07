Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98B5F7A24
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 16:57:16 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogomj-0002JD-GK
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 10:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogngu-00023W-A9
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogngp-0007CC-C6
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665150418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilb2JPsibZ+zvm/uEH6Tp1DFX456jaROwFwJhRuleik=;
 b=TpNIzT31uY0zrTtyRvlq63awChGc1QZJAUURcXgfOWEXdbJePuHFJiG31c+C86WShrBt7S
 8SI014izAZvPd9g7XZwsbPHooCUFLkQYgLgYCwp2rRA9R5SPBQCDZ1Ol4SjqOiUV3O7nTH
 7KppgN9YR6oDPdeStpckKLBpnT1RBso=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-nP-smA_6NfiVCDpkmVl1dg-1; Fri, 07 Oct 2022 09:46:57 -0400
X-MC-Unique: nP-smA_6NfiVCDpkmVl1dg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so4375747wme.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilb2JPsibZ+zvm/uEH6Tp1DFX456jaROwFwJhRuleik=;
 b=CwqULqfclO6XS5TuelpkH81ci+oql+yGx8hTIJNqJanfzIa1BWckRDQbKc20ECaNX1
 mDBKQanWrwypoQezj36DkkkJMuzs7c+YYxbEjL9ewtScM+be1gvskjgMNaYCyjHV3JaY
 aV354SzPVmfkVaOT7lJtEtwLOlXJnlUeYzbxbMhajZEaf7CdYWWDABkl+SAktU4F0i8z
 qn+vFOdo1T0vCBRrlF1VdCz+OdLc6udFlm9FbsYiW2Uqa9MNdUS99Lg2qvJuusBxduOm
 U8+piGV8rkRP5zB4ySTYO/FZhc6JL/SVKIy5hAE9i+g/1guh1M6x9oL93dUoMrXrDTGE
 Ssjw==
X-Gm-Message-State: ACrzQf1OUWgP6+Sys6sDaVPKVJ74nmq8PBcMvWhDpfEXzUK68XbsoXnI
 UMtyElKZ/dIdMJ0XlRZA8KYaAGtj865mJQlhtAxYCKE5H8mGXPVHqfP59Kt7GRXwKujp9ZVLVF8
 a60aYqjJuLLiV1NU=
X-Received: by 2002:a05:6000:611:b0:22e:c347:2943 with SMTP id
 bn17-20020a056000061100b0022ec3472943mr1745155wrb.603.1665150416423; 
 Fri, 07 Oct 2022 06:46:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65AEx2R8QkuZ8qHqc/pxfDSEFufyGi8cIThD9gnaHz32CCUQnAX528+qpSl3S/58ZwR9Tu6A==
X-Received: by 2002:a05:6000:611:b0:22e:c347:2943 with SMTP id
 bn17-20020a056000061100b0022ec3472943mr1745143wrb.603.1665150416173; 
 Fri, 07 Oct 2022 06:46:56 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g1-20020adff3c1000000b0021e43b4edf0sm2141884wrp.20.2022.10.07.06.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:46:55 -0700 (PDT)
Date: Fri, 7 Oct 2022 09:46:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com,
 prime.zeng@huawei.com, hesham.almatary@huawei.com,
 ionela.voinescu@arm.com, darren@os.amperecomputing.com
Subject: Re: [PATCH 0/4] Only generate cluster node in PPTT when specified
Message-ID: <20221007094614-mutt-send-email-mst@kernel.org>
References: <20220922131143.58003-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 09:11:39PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This series mainly change the policy for building a cluster topology node
> in PPTT. Previously we'll always build a cluster node in PPTT without
> asking the user, after this set the cluster node will be built only the
> the user specify through "-smp clusters=X".
> 
> Update the tests and test tables accordingly.

Given it's virt machine only, I'd like an ack from relevant maintainers.


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


