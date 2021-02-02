Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC1A30C430
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:45:25 +0100 (CET)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xro-0001Y8-7r
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMZ-0008SF-KV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:13:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMU-0006uH-F7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yxyfuz8MMuiJh5ZIA7haUGEMaSl9L5MbUaR0JCcPbko=;
 b=Q6f3gUEocv9WziEwbLplS1yA11vHKoQ/IeJlkwwVXwNZmSFFrUDs10XZK4iOnQq5sqIBjQ
 m1Omgxo92XFh+BNPk+NNHv4MRS+oVkKN6Lb0EjMgBFtvrpSl+awY+hRYMFM/Oik5uZF5Nl
 DEGIW7Cmm2ZAZ/4H0+13nKxN/cnolqQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-RgDGQ_NPNBuTjRymzyjILA-1; Tue, 02 Feb 2021 10:12:58 -0500
X-MC-Unique: RgDGQ_NPNBuTjRymzyjILA-1
Received: by mail-wr1-f70.google.com with SMTP id l10so12733336wry.16
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yxyfuz8MMuiJh5ZIA7haUGEMaSl9L5MbUaR0JCcPbko=;
 b=O5P3urhINKPmW8hVm++3OwQe+SfaLrppM3AQFdPD4aGpSATAUCWFMrcvLbYe+rNi7/
 Kj4dRuzLbv4HYYLabpGiA/f51bpFIl9ZrF2Wus5LmqbcsZW9jDFRt54/+D0UUGDFemR8
 hxw2iaFrSLnFkcnsFn+8Nuvb6Sfj9uib+I319b2fED8dp9izB7h2YyeLFwkjJWyfOyDS
 Uwede65FbcoRLRObdG6HESNylHWJyrt3vMaOskuA0Uyq9MMwUB8FVRKbOgPD3EBlr9B1
 nvJCHZrP+1XNsD3d4mRKxczA4NhYK10IprY3mPzYVzGHzzN/W9kyW2wvyA0lld2Wd8LN
 jCUg==
X-Gm-Message-State: AOAM533+yHzOk7TosIPpEFUJGwTHBtdpGZ5F5ztCpybFHvmDO9CEwvUu
 90tWiiBfvVbgymzuCI52lj6o+g+tuxfMTJJ/dnp0dV5N0XI3TNLVfDxvGQmWAgxZoibB89tdHww
 kxbMCZEjM91CzsbcUUljacqgWf9nmVFKgSFktEv/dslx6wRjM4ydaBcCaDhLi
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr3028895wmg.90.1612278776984; 
 Tue, 02 Feb 2021 07:12:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5fliTEafmHwIuSvSoolu8sOLBseA7v0vVp5v45KcGcXoWPb9JFDOph0h0kxiu/Q0kOfWFxw==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr3028882wmg.90.1612278776808; 
 Tue, 02 Feb 2021 07:12:56 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id d5sm32028300wrs.21.2021.02.02.07.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:56 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] tests/acpi: disallow updates for expected data files
Message-ID: <20210202151116.1573669-9-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Postevca <posteuca@mutex.one>

Signed-off-by: Marian Postevca <posteuca@mutex.one>
Message-Id: <20210119003216.17637-6-posteuca@mutex.one>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 94 ---------------------
 1 file changed, 94 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b20ae72949..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,95 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC",
-"tests/data/acpi/virt/FACP",
-"tests/data/acpi/virt/GTDT",
-"tests/data/acpi/virt/MCFG",
-"tests/data/acpi/virt/SPCR",
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/APIC.numamem",
-"tests/data/acpi/virt/FACP.numamem",
-"tests/data/acpi/virt/GTDT.numamem",
-"tests/data/acpi/virt/MCFG.numamem",
-"tests/data/acpi/virt/SPCR.numamem",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/SRAT.numamem",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/NFIT.memhp",
-"tests/data/acpi/virt/SSDT.memhp",
-"tests/data/acpi/virt/SLIT.memhp",
-"tests/data/acpi/virt/SRAT.memhp",
-"tests/data/acpi/virt/SPCR.memhp",
-"tests/data/acpi/virt/MCFG.memhp",
-"tests/data/acpi/virt/GTDT.memhp",
-"tests/data/acpi/virt/APIC.memhp",
-"tests/data/acpi/virt/FACP.memhp",
-"tests/data/acpi/virt/DSDT.pxb",
-
-"tests/data/acpi/pc/SRAT.acpihmat",
-"tests/data/acpi/pc/HPET",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/SRAT.numamem",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/FACP",
-"tests/data/acpi/pc/SRAT.cphp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/HMAT.acpihmat",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/APIC.dimmpxm",
-"tests/data/acpi/pc/SRAT.memhp",
-"tests/data/acpi/pc/SLIT.cphp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/NFIT.dimmpxm",
-"tests/data/acpi/pc/APIC.cphp",
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/pc/SRAT.dimmpxm",
-"tests/data/acpi/pc/APIC.acpihmat",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/SLIT.memhp",
-"tests/data/acpi/pc/WAET",
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/APIC",
-"tests/data/acpi/pc/DSDT.roothp",
-
-"tests/data/acpi/q35/SRAT.acpihmat",
-"tests/data/acpi/q35/HPET",
-"tests/data/acpi/q35/SRAT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/FACP",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/SRAT.cphp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/HMAT.acpihmat",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/APIC.dimmpxm",
-"tests/data/acpi/q35/SRAT.memhp",
-"tests/data/acpi/q35/SLIT.cphp",
-"tests/data/acpi/q35/NFIT.dimmpxm",
-"tests/data/acpi/q35/APIC.cphp",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-"tests/data/acpi/q35/SRAT.dimmpxm",
-"tests/data/acpi/q35/APIC.acpihmat",
-"tests/data/acpi/q35/MCFG",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/SLIT.memhp",
-"tests/data/acpi/q35/WAET",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/SRAT.mmio64",
-"tests/data/acpi/q35/TPM2.tis",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/APIC",
-
-"tests/data/acpi/microvm/APIC.pcie",
-"tests/data/acpi/microvm/DSDT.pcie",
-"tests/data/acpi/microvm/DSDT.usb",
-"tests/data/acpi/microvm/DSDT.rtc",
-"tests/data/acpi/microvm/FACP",
-"tests/data/acpi/microvm/APIC.ioapic2",
-"tests/data/acpi/microvm/DSDT.ioapic2",
-"tests/data/acpi/microvm/DSDT",
-"tests/data/acpi/microvm/APIC",
-- 
MST


