Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C661DCA1
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqw-000121-K4; Sat, 05 Nov 2022 13:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoy-0007eq-I4
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMow-0007nQ-Lx
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=Jnas271+XIfeOv/L1l5PVKhEdSSUz964ClvqteMUtfbZxnOrOHcrIEuh+qtow9HwHMPgl2
 2zAgrXFUSeooKt5MyrgNkUy9mIlF5mjNr7Vqx6z46cbTuUmVlFwrL4cgSpN+/Zu5KuRjHp
 4tJajMKp7XroTEXacFTU/FnCe1d1fOg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-SRK75DxlO22ytuNcojToxQ-1; Sat, 05 Nov 2022 13:18:58 -0400
X-MC-Unique: SRK75DxlO22ytuNcojToxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6010495wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=ZVc24ynHZvXJWkCH4A+cbGBoJT8mUEDTZZpiTbD9AR27wa7wmkal3ro04MqTEEJVEn
 NwO2hznhvxiZucTcgbAB/qEnV5cGT6pUCFPzY4fstwieBi28vD+XEjcIzj5KTehOui/f
 NPpRdcNnChbFF1B4l3F/3HD9oRNzoJLGCjR/um7ItLY04Lw9SVJac9G5KStnfMvoomUc
 nVFlc58piUHHWWFk3avQHeikWXIAZoN36fa08FN+zEuIBxdhygKd+L73LMZQMwWwgW3Z
 FG5Zs3NDl6Glv5qBjJMwTS+OYGV0Ee1WHmr6AypX9pQyAjqm0rqznJ8JMP9OqFugVuW5
 ZAQQ==
X-Gm-Message-State: ACrzQf2sR29oCMkbf1LGYLB9u2pYEOKqBGpsOuAYjumG4LND0tgLMHyx
 OVAl8tk0gOg8u1KBmcXDEpiIM6VPnJaFXpFHK0K7/TBq/i2pygzPigwmuYUzUL6lxMmSbO6fYCr
 uUrNbFXJtOhXLhTMZgmcMqAg1TAkL1RoHKi7CL5YZh9HnMVvQ6lj2bCsDl6Y9
X-Received: by 2002:a5d:65c9:0:b0:235:7110:bff2 with SMTP id
 e9-20020a5d65c9000000b002357110bff2mr25821756wrw.46.1667668737119; 
 Sat, 05 Nov 2022 10:18:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gJ6GWBbz9ZZT9Cb6PtmQLjGlU5fIMY/twrLWQZFeM6GGKpYz/oVyTRy0XwNsi8CVQU6StEA==
X-Received: by 2002:a5d:65c9:0:b0:235:7110:bff2 with SMTP id
 e9-20020a5d65c9000000b002357110bff2mr25821745wrw.46.1667668736802; 
 Sat, 05 Nov 2022 10:18:56 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003cf9bf5208esm4749813wmq.19.2022.11.05.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:56 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 71/81] tests: Add HMAT AArch64/virt empty table files
Message-ID: <20221105171116.432921-72-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


