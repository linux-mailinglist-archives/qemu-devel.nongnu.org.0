Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E064706BA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:09:53 +0100 (CET)
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjP6-0002Ui-4p
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLI-0005ic-UR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:05:56 -0500
Received: from [2a00:1450:4864:20::534] (port=46613
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLG-0006O5-37
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:05:56 -0500
Received: by mail-ed1-x534.google.com with SMTP id y13so31510728edd.13
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31SBXr+ll2DgZVzLxTnqIHA7xmVY0g06H2BnonCZLfk=;
 b=NTlmLAaYIxA4ezOLa7mKC01IaImOnCB6gzP4zos8KW7+guHIBJvLLjkjS/CB8uSjIL
 Z5vjQyHYdO5T/vN3IEmbH0EM7tb5RsLOaDxC30+U+07lr0zp8qXwe60OdrZmX19nPxRq
 /oU2PZbgUYQMwPVvlAJ5V2XgFcO/lOJxYN0poHkZ8Pe876G6kbDvJU0qk+M+ynV3h1H9
 oZjjIqVdlpsAn7NCJ4Ji47SE4i5X1J2QH4lWNkKCLP9H9gep22kay0Qi9LGTGxZv292o
 XUuuaTyulROMsWObppyruAo3c6ROrF5kaRNlpCpCetfTb7JwrWwaZSXvLx/cYauZNmA6
 vrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31SBXr+ll2DgZVzLxTnqIHA7xmVY0g06H2BnonCZLfk=;
 b=TmNdJEG9UQvJn/fUGbsxXEcNiV2BK+5cuj4i6zQKoBK5a46r/4SwXImCbglndAqLTi
 7bUM8G1cFQmKSPbwdmY3RuGGmzWhrlWsLvSWlqKjftunyEdK/AHu2q7VEkMiafU9rn4i
 iCPu9JO8c81xJXWj52dv7c6zHVxi8fDqO892gQ2BmJJHZSc+thvfAJo0boZ6gcPlJNVj
 dESAVu7Ng4jhHrYFV0jiSOg5XKtgvfZyej+nxdj5GLUvX3NWKd4OBEVsgEIiQ9V3ToMv
 OYbWzfd89mxyD4vEH87kLTgiRMtp3yELMJ6/x+MKRKD9VhFT0HqqanoPKOceboGSZ+ul
 jk9g==
X-Gm-Message-State: AOAM53254+Br8aDr/DtzRsLaYwMAWKhDosOB3B6rM3QvirqUufUN9P5e
 uFeEaYeMntHXyal9/vCBLrojyw==
X-Google-Smtp-Source: ABdhPJy7E3NnHLiMtMIhN55Yhiaaw30DLBSsnuICmq6y2cYjGLNHjHlCrjOtgWDH1ICwryxcuA213A==
X-Received: by 2002:a17:907:8a1b:: with SMTP id
 sc27mr25574073ejc.572.1639155951758; 
 Fri, 10 Dec 2021 09:05:51 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:51 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Date: Fri, 10 Dec 2021 17:04:08 +0000
Message-Id: <20211210170415.583179-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ACPI support for virtio-iommu on the virt machine, by instantiating
a VIOT table. Also add the tests for the ACPI table.

Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
series [2] only contained the table and x86 support, which have been
merged. Everything has now been reviewed and should be good to go.

* Patches 1-2 add the VIOT table for the virt machine
* Patches 3-4 are minor fixes
* Patches 5-8 add tests for the VIOT table. They contain the tests for
  q35 as well, which didn't make it last time because they depended on
  another fix that has now been merged.

[1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20211026182024.2642038-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (8):
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  hw/arm/virt: Use object_property_set instead of qdev_prop_set
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test case for VIOT
  tests/acpi: add expected blobs for VIOT test on q35 machine
  tests/acpi: add expected blob for VIOT test on virt machine

 hw/arm/virt-acpi-build.c       |   7 ++++++
 hw/arm/virt.c                  |  20 ++++++++---------
 hw/virtio/virtio-iommu-pci.c   |  12 ++---------
 tests/qtest/bios-tables-test.c |  38 +++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                 |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 8 files changed, 58 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.34.1


