Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5961378D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJk-0007Es-0e; Mon, 31 Oct 2022 08:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJG-0005H0-LF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJF-0003TS-1v
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=c1vWXzZtRaztsxweSpHvEy9z5KOISdeLixOnha5THQg0NIcu8CN7KjUiqQphzS6+XgbhDt
 lNJEM1gdZ/rHuJVE6oQjWzjIB6EW1rzA3KqE2PAkkNCQVb1C9+TiHQy/BxA5sV8mbdWWK6
 7zNd+e5vX7Ba1j++IEgKRl5WMd6CHRY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-gtIzxxzMNDmbusXVgzjosw-1; Mon, 31 Oct 2022 08:54:30 -0400
X-MC-Unique: gtIzxxzMNDmbusXVgzjosw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h18-20020adfa4d2000000b00236584fc8c7so2984703wrb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=SYRRSpi+7YDWh1FB0J5IiRfRVXjIHVKWwOc8yirmaQz7jFWoK6JE2sLwOzNDmrzspE
 8M/G+nvDPThZUBf3azvMZuE+/5+VtUpnVtFVsVl6kkuciwusigN6iN6Kcgz1zSUdBX9u
 Mcv6VabNU+jsQpIemBP7cS3XDJCuOSfSB/YrHvNffFhiUwlwZtLuTlQyoQ1NX+YBqTkX
 OktPgJlIc4tAvs4q8AZxIzrkbmDMML0C/hhGB4i0hAkyuqALhEdczphxJ5Mg+mZNGrGx
 mfPFHqWPqdbpW5sw+NJhXGr0q+Gyk79zyVlIa9EM6X3BVLn9z/GtfWRvqQvu/VLZ+WzB
 6Ivg==
X-Gm-Message-State: ACrzQf3kNmWbY/kqLZF2wyocyzuwNTjXAn6iTyaV4khxim6ADT8hVsts
 d4g6Z9oaA8vh8PqUXXJY55X590lAe9LModG181ktLHCVze9V9UsEP209Wi53Jepfb76wKstkjGe
 Su2ejzTZJACih/IzZ/3FdauOXsmZyQ7grH5M6aW0w51cYW9SzgBLnhdJujk/c
X-Received: by 2002:a05:600c:1e89:b0:3c7:1e:acc2 with SMTP id
 be9-20020a05600c1e8900b003c7001eacc2mr7933112wmb.44.1667220869194; 
 Mon, 31 Oct 2022 05:54:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6itAvYrilSsflMO0R8j2VdjtBoGBSwJmnPWM/oOphsqk1zxVDAaQ0ozQCqGNRGvmfDo+ZOmQ==
X-Received: by 2002:a05:600c:1e89:b0:3c7:1e:acc2 with SMTP id
 be9-20020a05600c1e8900b003c7001eacc2mr7933088wmb.44.1667220868846; 
 Mon, 31 Oct 2022 05:54:28 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k25-20020a7bc419000000b003cf4eac8e80sm7724764wmi.23.2022.10.31.05.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 78/86] tests: Add HMAT AArch64/virt empty table files
Message-ID: <20221031124928.128475-79-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hesham Almatary <hesham.almatary@huawei.com>

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-6-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 tests/data/acpi/virt/APIC.acpihmatvirt      | 0
 tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
 tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
 tests/data/acpi/virt/PPTT.acpihmatvirt      | 0
 tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4f849715bd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC.acpihmatvirt",
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/HMAT.acpihmatvirt",
+"tests/data/acpi/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/virt/SRAT.acpihmatvirt",
diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


