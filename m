Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358558161C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:09:35 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMBi-0000sv-Ej
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM7J-0005K7-LC
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM7G-0002zf-Ci
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvUq+4+UZEdCZNghObbzTIsHwGzQaP0cbPTa0Ik0SXE=;
 b=PAwWT/xNaz7WBeF5GrtZQ/+SiigF2fVSN4x/tekcux3wZ5jW/bh6tTZMXhG4Zko76L3api
 +Zo02gkNp6Y8STYOM23KR76bcJwCNWaRhj63Jo+6e+aFaBPSN5o7nEBKpbA74grq39Cv2c
 FssqFM69zojs+xpWfNRiJFn2PZPcQWg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-5HQpkvnCNNOQyvnM5Xscaw-1; Tue, 26 Jul 2022 11:04:55 -0400
X-MC-Unique: 5HQpkvnCNNOQyvnM5Xscaw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020a056402280f00b0043bd8412fe0so6122008ede.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WvUq+4+UZEdCZNghObbzTIsHwGzQaP0cbPTa0Ik0SXE=;
 b=K3MT6LDWxs6lWH+ulZtxANBBHbu7bYVGOad+Yw88TP30KRhVj69qwTAOYqBbzf1dop
 Mxfqy2DEWnmU/4029jj2srbVUVhne1+Ec2zyUI483MA5VBqqCm1LVFalckpsQa8L12ud
 FSVozxST69AFxd2oeNz+5mqAH1oS2DLZirPTR6MRexjWZvMhpX7ACKKxH+HNl6o4kP0Y
 aqPN+nGcX/9rVZA46Ju3rGG2muxT5u41GSvLf1Hfzsxbj+PqjHjHYpnY46BKUNDEmMxu
 iqS0euHfAZgIJ/GdxXK60V8O2fexj9wVNYUac4jLJzrIRgyonDD7RyHRLdCe0A1QluOD
 ax8Q==
X-Gm-Message-State: AJIora+AqNxQgdjb3f6DDdRdysJzq6mixxIPAwjIjqn0G3PoY/2O458p
 KWeIRKjwvpLkICvZS6BKPPZU2/37YjB+idfx0GTz4xjxpDodUlNWzHFxGdAX9oAqys21crQcw0D
 zR1IO9Z33L2WwYJo=
X-Received: by 2002:a05:6402:278c:b0:43a:91cb:c43a with SMTP id
 b12-20020a056402278c00b0043a91cbc43amr18768247ede.188.1658847894025; 
 Tue, 26 Jul 2022 08:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqnO1ZxA1HPUE0mQa592YZpsryBqmJkWl9M6sKEw11PyCro64ucYN7574tltA9dBF8Y+ODyw==
X-Received: by 2002:a05:6402:278c:b0:43a:91cb:c43a with SMTP id
 b12-20020a056402278c00b0043a91cbc43amr18768213ede.188.1658847893371; 
 Tue, 26 Jul 2022 08:04:53 -0700 (PDT)
Received: from redhat.com ([2.55.43.166]) by smtp.gmail.com with ESMTPSA id
 b7-20020aa7c6c7000000b0043a78236cd2sm8784603eds.89.2022.07.26.08.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:04:52 -0700 (PDT)
Date: Tue, 26 Jul 2022 11:04:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Cc: jonathan.cameron@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, chenxiang66@hisilicon.com,
 linuxarm@huawei.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, jingqi.liu@intel.com
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
Message-ID: <20220726110406-mutt-send-email-mst@kernel.org>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 19, 2022 at 10:49:42AM +0100, Hesham Almatary wrote:
> This patchset adds support for AArch64/HMAT including a test.
> It relies on other two patch sets from:
> 
> Brice Goglin: to support -numa without initiators on q35/x86.
>   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> Xiang Chen: to enable/support HMAT on AArch64.
>   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/

Thanks!
I think it's best to merge this all after the release.
I've tagged this but please ping me after the release
just to make sure. Thanks everyone!

> I further add a test with ACPI/HMAT tables that uses the two
> patch sets.
> 
> Changes from v1:
> - Generate APIC and PPTT ACPI tables for AArch64/virt
> - Avoid using legacy syntax in numa/bios tests
> - Delete unchanged FACP tables
> 
> Brice Goglin (4):
>   hmat acpi: Don't require initiator value in -numa
>   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>   tests: acpi: q35: add test for hmat nodes without initiators
>   tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
>     HMAT:
> 
> Hesham Almatary (3):
>   tests: Add HMAT AArch64/virt empty table files
>   tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
>   tests: virt: Update expected *.acpihmatvirt tables
> 
> Xiang Chen (1):
>   hw/arm/virt: Enable HMAT on arm virt machine
> 
>  hw/arm/Kconfig                                |   1 +
>  hw/arm/virt-acpi-build.c                      |   7 ++
>  hw/core/machine.c                             |   4 +-
>  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>  tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
>  tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
>  tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
>  tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
>  tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
>  tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
>  13 files changed, 118 insertions(+), 3 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt
> 
> -- 
> 2.25.1


