Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C16202C7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:56:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzJ-0004ye-N2; Mon, 07 Nov 2022 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAz8-0004ve-N8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAz6-0000EF-4i
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=YH/N6XcD/aggynVyPYZnJJFlLqEcGMqLRrczv/Nq2LDCvWTLnT47Ci9zy5nG/djOry69MH
 szo7Gx2WX5A5V99pHtQdSi8orDA7frzcBrzxfLxo0aXXDHE1ChQFWLw7VeIXHOrVVIhbmM
 2X2eKLUzkqBeS4n9TgGQtaMqwAZcCV0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-V9f2CPsCN1O2iWfIcIf-XQ-1; Mon, 07 Nov 2022 17:52:50 -0500
X-MC-Unique: V9f2CPsCN1O2iWfIcIf-XQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 w13-20020a05620a424d00b006e833c4fb0dso11282593qko.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=P0V9CSckxB0gRuhQ2dcjioEJI5H0jClhcVUOyKMfZJry68igSG9jAoVOiUOG2KhbcK
 5imPVWpCh8VNrBJW0XZbmD/kPYZIrToXL7LfOyAOvD2cj1cWYWtjWYPuKRVVrCdGNzjG
 lPjVZlKWUHaokTnNpOv07mVmJQVaQ3Df6+TqEgrnHFK7nNNMy9ypCHNttsRVuXtmuuub
 gj5mnaJTfD5Cr6GfhPZpyALG8zqfnWxCTCJJsoBk6SQz5gjVXFSnd2kyD6+UZ8E1DoxM
 e/2kh+qtd7CoRXbVk27bV4/1emnoCIfeIGzwS0naJLuXmg65dYOu2FyWj62qONnh7ylS
 AhBw==
X-Gm-Message-State: ANoB5pn7MzUmiVdl5TPtLf4MA1zex+AwdPVeiLHobt9UYIsofwmQmCRa
 htc3mLPAftL/7aFTXe0rlYMgPtPFo7KRLCabOJRuFlGN8Ixf8gwVTdxbY+K01VSgV1y5KrYQolf
 SSBtgTXBxXlujFmhYSWj4UdyBumIVM+CmgJtCLi1wLaXethDwNCcy6b9U/PH6
X-Received: by 2002:a05:6214:1ccd:b0:4c5:5ab0:193d with SMTP id
 g13-20020a0562141ccd00b004c55ab0193dmr11652616qvd.44.1667861569908; 
 Mon, 07 Nov 2022 14:52:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf636fWORrDcyqi20SSsVea1kX1eMp0DS8yhuds9I2J37rsN9OZ6bnuuRQiJ92r2Qs1nC0RB0w==
X-Received: by 2002:a05:6214:1ccd:b0:4c5:5ab0:193d with SMTP id
 g13-20020a0562141ccd00b004c55ab0193dmr11652585qvd.44.1667861569603; 
 Mon, 07 Nov 2022 14:52:49 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05620a29cf00b006fa1dc83a36sm8174709qkp.64.2022.11.07.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:49 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 63/83] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Message-ID: <20221107224600.934080-64-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brice Goglin <Brice.Goglin@inria.fr>

.. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-3-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   | 4 ++++
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..245fa66bcc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


