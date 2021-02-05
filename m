Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE7310D13
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:19:37 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82tU-0005DG-RB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82ex-0004eg-VY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82en-0003Ae-4R
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yxyfuz8MMuiJh5ZIA7haUGEMaSl9L5MbUaR0JCcPbko=;
 b=G9rguER00tXPmvaHRw30b1M77v2l9RB3R5inWdrH0DolxYVRrvT9RKK64cj9acriSs8Fz9
 SIbt55BR+zbKm83fFjMf2rsrGtBq7psJl+xhCh52OdaQgPuBig6/p4erIarZg37esY3Q/o
 A6YShhyht+uJb/sRBuuPYZ4sXFks7zQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-xC8FVqlQN8enGb1p_F8bIg-1; Fri, 05 Feb 2021 10:04:22 -0500
X-MC-Unique: xC8FVqlQN8enGb1p_F8bIg-1
Received: by mail-ej1-f71.google.com with SMTP id le12so6840615ejb.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yxyfuz8MMuiJh5ZIA7haUGEMaSl9L5MbUaR0JCcPbko=;
 b=kJiTZb5tb3b2P9rPDF0hbK7p8adXLvq7APTaaLt2KpQAeK6N5Tf4VUp0hPSeaDSFHC
 rIYmplCX5sH4qfJX5EDhvBr+SQEo7iI6g4jCZzfypv28rsZJi3wcRSOt1+pxwkNXqE6/
 yZW5XgVjJQT7Ho1+F5s3FFO1z3Y+uJtytJ8G6xGdkncndcaPcyiFMPgOjjS5JmsP3n77
 yi+WBRBPuomea4cXhED+i1P8C1sBkQ8mLugXt/Avy3wLw6NrkjEk815VCMZn9Ajbb1G0
 3lYqqtQJEqiudNI+Wl7oHF+4O8ngHl1VwgMDGJGodoHNk9XJkBsJwbu/5LoouGiqU6w5
 VKkg==
X-Gm-Message-State: AOAM531vuIMD14aCgIVoKBpHjDXbG0N1F8LbwoZrHVisCCyzxrIRIM+I
 SShJeGex+hNOJej2f3wdLURb+NmiVHRFgIV47XEPYCA6O0gQfHyOm8d57QLbHYol4i2SVPB4ZZM
 FQP+Cdubl6bMJkqamlSOg/IR9XW49wUd6NGJnOlbRHDjhtW4J8TsorfYkhPOq
X-Received: by 2002:a17:906:c1d8:: with SMTP id
 bw24mr284228ejb.232.1612537460267; 
 Fri, 05 Feb 2021 07:04:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPvrG2BGpZKb5TZI/t1+2tlqgbxXD7jFGwMBXlBfyysP34ZPWySoF5O/+PHAJyij+tic8cxg==
X-Received: by 2002:a17:906:c1d8:: with SMTP id
 bw24mr284181ejb.232.1612537459872; 
 Fri, 05 Feb 2021 07:04:19 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id s10sm4055997eja.26.2021.02.05.07.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:04:18 -0800 (PST)
Date: Fri, 5 Feb 2021 10:04:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/16] tests/acpi: disallow updates for expected data files
Message-ID: <20210205150135.94643-17-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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


