Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F7616837
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJ2-0003Uz-Hv; Wed, 02 Nov 2022 12:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIs-0003T0-B2
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIq-0002Qc-Ug
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=foBBWyik9EJ08uC3i5KsSLnG/HvYMwHptE+k72ulos4mzqW4P5vwl7VTPzhlu5gTM29eCU
 KOD3apTTtpc4jLZ2NUCYrd/bdjzQOubP+iFwTnAfsfSvbgXkjuAR5Tpw6GGWStyUshBWE5
 yzWX2beYxW5Wm40cNZ6h2r5wlG9Lx/E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-uAiv8ofUPHete6Fk8Wmu-w-1; Wed, 02 Nov 2022 12:09:17 -0400
X-MC-Unique: uAiv8ofUPHete6Fk8Wmu-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso1259197wmh.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owrr89MfJhRkFKdG0BWvvHnNNotD1TbvhM1y5znIgb4=;
 b=LiZERj0Ee4aSkDTS/F18rGNfQwXVX+Z1mizjTirf3ZV5qc3MU4qYr6ySxms2jOsXkD
 Lal7VfdldahKXgEhpdi64HIf4cFZ6gc9Jda4KNdp1+e3Y21mPssnK1DdbrrlKg0o0vxO
 JSWPLs8OokYK8s4NI9wCe3Lo5JXmmaGC6O2q2sdBPPgfJh4ahQw5kk6MpuPg/i3X84XP
 82sG9h1VBtN1w8ARp2bvjaB0jslqIJLFOn5IiNbnkk31QV6wIpjmQS/glTzsssdsuhJR
 b0nPiSTeMTKQJlKzaHiS357RhcL1dKkhiJFKXkVD+Kr7jwKYOI0w3rMH3Q3j1mTjsxom
 YvHQ==
X-Gm-Message-State: ACrzQf2jHlowVuvc4xBshmePwk2JpCmHHQ6whN+8hi026MM0g54fjK0A
 yvLrBREIoRglkj871Wv24qoUdtv8SWEaGhlG/Q1ptfJB6psitZqTQlw+Djg9nWSrjfpuy7gMYJc
 +LA4l3+jm+fLR2CwVXWzJ11FrWZi5hhvZfXLXbYzjVhOIlk00B2fDEzevjYQS
X-Received: by 2002:a1c:7405:0:b0:3cf:5d41:be8b with SMTP id
 p5-20020a1c7405000000b003cf5d41be8bmr19533703wmc.1.1667405355220; 
 Wed, 02 Nov 2022 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79pZ972tcdefVy5oFYbURtdIO05O/r9ipDSvWH4Iaw01+vzm1BuAgecyWcheymwBDJCftB/A==
X-Received: by 2002:a1c:7405:0:b0:3cf:5d41:be8b with SMTP id
 p5-20020a1c7405000000b003cf5d41be8bmr19533669wmc.1.1667405354892; 
 Wed, 02 Nov 2022 09:09:14 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0022cce7689d3sm16041564wrb.36.2022.11.02.09.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:14 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 19/82] tests/acpi: allow changes for core_count2 test
Message-ID: <20221102160336.616599-20-mst@redhat.com>
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

From: Julia Suvorova <jusual@redhat.com>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-4-jusual@redhat.com>
Message-Id: <20221011111731.101412-4-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/q35/APIC.core-count2        | 0
 tests/data/acpi/q35/DSDT.core-count2        | 0
 tests/data/acpi/q35/FACP.core-count2        | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e81dc67a2e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.core-count2",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/FACP.core-count2",
diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


