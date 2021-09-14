Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90440A5AE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:58:35 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0Wg-0006RI-63
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sr-0000i3-Ui
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sp-0006dG-OW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g14so11014798pfm.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 21:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6VbdlsttjIaO8LyvNx8lh2Zo+EJzWxGGdnLBJypLb4=;
 b=ZKAvFTzVsmXIlWRI8ZwFBL9+ADapLdwKq/K+iV1HtkMw8AsoWvHngcUSwIHpKkqjp+
 wGBfumn0CkOH2BevjchvC12Z4TH5Rux5WNxHL3is+Kf/vpdjajsbUWvyItV9EnuMUmMN
 QloZftOTQtEWpWwwHGqldtQ7EXfNImhSEKRDdgwLYcZx5ScMPdEErwI35gii/CWP0bcA
 Wi3lPiSma7bjVu8V2Ruj0/Idt8xQMTX3EY+luDCXvkdvJWTx+gzKsk1YW6hsIXve11Vw
 3Ew2XwCKC69cBVS2w7B1xqzhKkghpNdiTTQA6MEUo78wxbJO64wAv7TTQceI65zMUydr
 fyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6VbdlsttjIaO8LyvNx8lh2Zo+EJzWxGGdnLBJypLb4=;
 b=EDI5E8YN5jYWpJ1CPn9vKUu3wDfH97nTj8xqmp+hnzQ+pRqxASkVBOL0wPUbpq6FuR
 lu16L1qFlDWXq5K14uKXaNBrXKs5Ipu546CNf8Zd8G5dm361RTJsYA7jzHB8BhuIkVkw
 EtyGEx0PuvJ/cdOSRMpejgJdKn8S+6qufjmRdujLAm0E8XqiaWofGeEmCf2vtHYMjBBV
 BPcmPe4NZ598z3+WV5uWHzC4thfpW8R3V7JKuwPEmtUAvYey75tmNVL/C1DwZICf9xXK
 xPMlyCWHM5v5ARQkG3bUKSa8WkOpIM/7WC31zBubMJhcNgA+4VYoBcrF3qUydhylqogw
 PLeQ==
X-Gm-Message-State: AOAM533J3nSVcYKYnEGc/bNPQpbuoUkOjRuX6gNXzwRYKR414sfY1e95
 5Ec9w8SyEwKxNgdIXuwrTWfeHQVQb8NKqQ==
X-Google-Smtp-Source: ABdhPJyX71xAmQVsp9TZoifBbZP6QwqLkTpkNjfNRhthbGH5foFgkwtAOZGTScqQAg52SGXirEfzPQ==
X-Received: by 2002:a63:5c63:: with SMTP id n35mr14083488pgm.311.1631595274172; 
 Mon, 13 Sep 2021 21:54:34 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.215])
 by smtp.googlemail.com with ESMTPSA id u24sm9262522pfm.27.2021.09.13.21.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 21:54:33 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/i386/acpi: fix conflicting IO address range for acpi
 pci hotplug in q35
Date: Tue, 14 Sep 2021 10:24:09 +0530
Message-Id: <20210914045410.3380946-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914045410.3380946-1-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
starts at address 0x0cc4 and ends at 0x0cdb. At the time when the patch was
written but the final version of the patch was not yet pushed upstream, this
address range was free and did not conflict with any other IO address ranges.
However, with the following change, this address range was no
longer conflict free as in this change, the IO address range
(value of ACPI_PCIHP_SIZE) was incremented by four bytes:

b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

This can be seen from the output of QMP command 'info mtree' :

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

It shows that there is a region of conflict between IO regions of acpi
pci hotplug and acpi cpu hotplug.

Unfortunately, the change caf108bc58790 did not update the IO address range
appropriately before it was pushed upstream to accomodate the increased
length of the IO address space introduced in change b32bd763a1ca92.

Due to this bug, windows guests complain 'This device cannot find
enough free resources it can use' in the device manager panel for extended
IO buses. This issue also breaks the correct functioning of pci hotplug as the
following shows that the IO space for pci hotplug has been truncated:

(qemu) info mtree -f
FlatView #0
 AS "I/O", root: io
 Root memory region: io
  0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
  0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

Therefore, in this fix, we adjust the IO address range for the acpi pci
hotplug so that it does not conflict with cpu hotplug and there is no
truncation of IO spaces. The starting IO address of PCI hotplug region
has been decremented by four bytes in order to accomodate four byte
increment in the IO address space introduced by change
b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

After fixing, the following are the corrected IO ranges:

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

This change has been tested using a Windows Server 2019 guest VM. Windows
no longer complains after this change.

Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/ich9.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index a329ce43ab..f04f1791bd 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -29,7 +29,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
-#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc0
 
 typedef struct ICH9LPCPMRegs {
     /*
-- 
2.25.1


