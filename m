Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1F423FCD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:07:13 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7Zf-0000Sb-Tk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7YF-000879-Av
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7YA-0001nQ-2p
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633529137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tRDY+gYfQYTtQawo9d+vOp1IJNjLBNNpQdTyRUPng4=;
 b=Vsmi9uc2l9nbkz/c3fheWbToNE/X93T0GaERGJzHhkEG552p8IF3geOCIhnp4D+BMD/RRT
 SZRsDeFq6naQJfe2CeV7YOvvPpUpgx6nt0deY3f6+6O5doJ284TULjtzhsdkG16ruXNIbc
 QIibXdG3RG2pFpsbnRVTUdQ+QTu9XQY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-rFYZ8IGVNyqnsPTsck9ZTg-1; Wed, 06 Oct 2021 10:05:34 -0400
X-MC-Unique: rFYZ8IGVNyqnsPTsck9ZTg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso2131640wrr.15
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+tRDY+gYfQYTtQawo9d+vOp1IJNjLBNNpQdTyRUPng4=;
 b=j6iWrbWQNBtTSQGOz/SRtr6L4o7bi3H78sVqzkRX43GQYMKnnLcGMe4I4d00gGSU6l
 adFjyPAnHjCqH8xoxA+Y545ic8+sdbRq46+eaxLeMki8uay8xdLORCDkVTqTIo/nb2P+
 /fP85iUad88z0ky7F8kgNA4KKfet0vuezEwSIWS1Sy3KfTl4SsbMQhaCuzdP6qRR5Zoe
 kKf16gQmr8LvwnElOSGwGyQHPOkJEsYh2C7HFjyLfo/j1188M218peJjBRBk1KsihJzg
 t5hiRs7BijrVWSlsqHhpES3LdQw0gP7BcPJxuBNJjR/JI4QkClNjqaHUnggdJlT72LTG
 iXjA==
X-Gm-Message-State: AOAM53278ziZm3kstTWEqgSmqET7ciNI2kh/fD3PA0LJdLefkrF2pD+5
 WjjW8EBmWTOiaB/paODsI97I28X8DYellwEAsKNIjjE+6bupKZj90Fg8d2YFL7NFR7x0VvX9/Cd
 tsCsJ3puc8tLP8+EFoNG3O+DCqyjuLbGYFJMe4kaPNlq0K/6zI69uYi61v8icgTIGSj0=
X-Received: by 2002:adf:a152:: with SMTP id r18mr29454218wrr.317.1633529131363; 
 Wed, 06 Oct 2021 07:05:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHWUE9iN2S2lD0U4kCO1Y/EGNANsaDsKPsCOMpOqN1ovMrqu6fHaIFmaXgeXrpOPZ4OSInng==
X-Received: by 2002:adf:a152:: with SMTP id r18mr29453733wrr.317.1633529127163; 
 Wed, 06 Oct 2021 07:05:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l11sm7558188wms.45.2021.10.06.07.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 07:05:26 -0700 (PDT)
Date: Wed, 6 Oct 2021 16:05:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/15] tests: acpi: add x2apic and various iommu tests
Message-ID: <20211006160525.3f4e55db@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  2 Sep 2021 07:35:36 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

ping

> Changelog:
>   v2:
>      * rebase and update expected blobs on top of 6.1
>      * drop ARM/IORT test case, whihc with current master
>        requires KVM, but we can't run ACPI tests since
>        virt machine on KVM changes irqchip to match host
>        and so ACPI tables chage as well. There is a series
>        on list that add TCG SMMUv3 support and IORT ACPI
>        test along with it, so it will be take care of IORT
>        table when merged.
> 
> In preparation to ACPI refactoring, the series adds test-cases and
> expected ACPI table blobs for:
>   * configuration where x2APIC is used (i.e more than 255 cpus)
>   * Intel/AMD IOMMUs ACPI tables
> 
> Also x2APIC test requires KVM to run, so series adds qtest_has_accel()
> API and cleanups tests that used adhoc ways to check for KVM presence.
> 
> Series is split from a larger refactoring series:
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg818845.html
> 
> gitlab repo for testing:
>    https://gitlab.com/imammedo/qemu acpi-tests-v2 
> 
> CC: mst@redhat.com
> 
> Igor Mammedov (15):
>   tests: acpi: dump table with failed checksum
>   tests: qtest: add qtest_has_accel() to check if tested binary supports
>     accelerator
>   tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
>   tests: acpi: q35: test for x2APIC entries in SRAT
>   tests: acpi: update expected tables blobs
>   tests: acpi: whitelist new expected table
>     tests/data/acpi/q35/DMAR.dmar
>   tests: acpi: add testcase for intel_iommu (DMAR table)
>   tests: acpi: add expected blob for DMAR table
>   tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>   tests: acpi: add testcase for amd-iommu (IVRS table)
>   tests: acpi: update expected blobs
>   tests: acpi: arm/virt: drop redundant test_acpi_one() in
>     test_acpi_virt_tcg()
>   tests: arm-cpu-features: use qtest_has_kvm() API
>   tests: migration-test: use qtest_has_accel() API
>   tests: bios-tables-test: use qtest_has_accel() API to register TCG
>     only tests
> 
>  tests/qtest/libqos/libqtest.h  |   8 ++++
>  meson.build                    |   6 +++
>  tests/data/acpi/q35/APIC.xapic | Bin 0 -> 2686 bytes
>  tests/data/acpi/q35/DMAR.dmar  | Bin 0 -> 120 bytes
>  tests/data/acpi/q35/DSDT.ivrs  | Bin 0 -> 8306 bytes
>  tests/data/acpi/q35/DSDT.xapic | Bin 0 -> 35652 bytes
>  tests/data/acpi/q35/FACP.xapic | Bin 0 -> 244 bytes
>  tests/data/acpi/q35/IVRS.ivrs  | Bin 0 -> 104 bytes
>  tests/data/acpi/q35/SRAT.xapic | Bin 0 -> 5080 bytes
>  tests/qtest/acpi-utils.c       |  14 +++++++
>  tests/qtest/arm-cpu-features.c |  29 +++----------
>  tests/qtest/bios-tables-test.c |  72 +++++++++++++++++++++++++--------
>  tests/qtest/libqtest.c         |  27 +++++++++++++
>  tests/qtest/migration-test.c   |  15 ++-----
>  14 files changed, 119 insertions(+), 52 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.xapic
>  create mode 100644 tests/data/acpi/q35/DMAR.dmar
>  create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>  create mode 100644 tests/data/acpi/q35/DSDT.xapic
>  create mode 100644 tests/data/acpi/q35/FACP.xapic
>  create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>  create mode 100644 tests/data/acpi/q35/SRAT.xapic
> 


