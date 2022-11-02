Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED161686F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGM5-0004wG-Mt; Wed, 02 Nov 2022 12:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLU-0003T8-FG
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLS-0003tl-Uo
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=ElYoHkCctOkzAFsbiJjtxjEou11kIt66WstdvhxSgIT443dtjeq5rskvR9tvZXtKrOxZdr
 IDZWa976QLDgL6lPiRCH3n5eHf1DFezrM0By4AbCCz3KNxt0fkliAdpkLmiCHv6cJbauWe
 PraLoaBYO1KzsZ4ab2i9mxsXwEDJD4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-bP67mgNwNUKT70up44LqwA-1; Wed, 02 Nov 2022 12:12:00 -0400
X-MC-Unique: bP67mgNwNUKT70up44LqwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso8100485wme.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQnLVqea2wFTICHVFiJPOa9KHgVlieN3khJktynKO5U=;
 b=DqA+dTdao+cCFrSvLe+H/+7moKuxdK9N/mfzBHyU/Qw83MqMleM51CPqk7p55pLCVI
 RjwG1jlcSEL0bNWFsU1Ya+SMwU2OIhOVCNXM+FC2+jpBuqifE2o/BXYp0kKnjRaGd1/B
 MavCyk1IMVzO7wJ0HacVS4WwSpVRCtf4ymNgFNv9b6LFXXDDrbj8VuxDH0KYLcK7KB29
 Q7xcbcJ6uUTcCKpXtdKLbfPdzktQg3lDdC7R4Vjml+23Dtj6CpdugMFyBUnCX082ubaC
 iJrl1n1mueB1KsnmUjfphU6PXiw2hwdWxZBa9fcdMflH/R6uXS8shKwhFwQWQwI3T2xL
 QoVg==
X-Gm-Message-State: ACrzQf1qz0/z20+MPSqUeIIAfGf/UqF6GO/gMfDDynNofrAhpAWmnTn2
 9GgXdR+eFZusympY/2qLuYXX7VLKPfEH0X8pcmZ48VeOnpqiZYeQJiwCWr6GJ4r3vfTzr6dxBaL
 bDgiNe18Df+jzSDkxS3yNK2KJPdQYgV3qEQHWBVyRIurn0gUmUi5ZEy6BTUZ6
X-Received: by 2002:a7b:cc13:0:b0:3cf:8297:d61 with SMTP id
 f19-20020a7bcc13000000b003cf82970d61mr4867008wmh.160.1667405518470; 
 Wed, 02 Nov 2022 09:11:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DAkTdTKTlACSxMfPu2+oJ45JJ/duO58T3vZoXV+inCDxV6l6CW/tF1nvAtxToKNHj5mKH0g==
X-Received: by 2002:a7b:cc13:0:b0:3cf:8297:d61 with SMTP id
 f19-20020a7bcc13000000b003cf82970d61mr4866978wmh.160.1667405518209; 
 Wed, 02 Nov 2022 09:11:58 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c434700b003c5571c27a1sm2354455wme.32.2022.11.02.09.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:57 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 74/82] tests: Add HMAT AArch64/virt empty table files
Message-ID: <20221102160336.616599-75-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
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


