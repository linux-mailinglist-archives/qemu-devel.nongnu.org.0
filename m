Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBF6202E4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyC-0003qU-GJ; Mon, 07 Nov 2022 17:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAy9-0003nu-CG
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAy7-0004bc-Pf
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=Al35Uwm30aBU2kNkVqZaWjMYx8tWRYVjJQYdDistMO/48QVO5iEuKqV9NCJjUH2EKMUeeO
 2gCDH4oqslakgzsOkMSYNoAZLhbi2QT6ODMeysg70RLBJ5grthCAfD7/lF1DkzqB63sprA
 hqFPzexzT1YM+JfLzLHh305MkFQsAME=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-YMcdNcpNNm-hxwPZGhcuZw-1; Mon, 07 Nov 2022 17:51:50 -0500
X-MC-Unique: YMcdNcpNNm-hxwPZGhcuZw-1
Received: by mail-qk1-f200.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so11323623qko.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=zR8cCVJsh3u7foe1EmL/Xe9WLYuhKR6LBTqhr+4clBuZblxPrVEjhV4x4f36Zwk4ue
 jPgy9KDHWuPCDAZWM47HZmnPrPJTWX+eXhKamsRWjCv3uY4uL8YQqX8/zHN/9n2SbB0q
 MTWftElCkyF4SJCo5075PcYbvbBR2ldvtTkFKW1rcda8lCMDW8gLQkBG471XvaqKx75H
 j2QhxOe+Qd3khnpqk01cBojj9BHE5EI9qDYg1PrardBfdnkf+qbvhS8/W5v/9vJpRs6N
 ZooVcpYG0kHRzZ3z2r2k19/OxnqCv5bYAfJPgvRjOMz0jxzcmenBme424/x0f0n4EjVE
 mBmw==
X-Gm-Message-State: ACrzQf23KjHKsO+dkV8BczJiBSHyCLqkUyD5nSNMvnznyetlLwbdBga/
 XtzbZ2Orlc0+mv41C2s3u51C4G02qPW0+z3mavqT9RiR8msCNaTrLkMMWUznuYDSqHbA2OErEOF
 dI7dX+DlX+eONlX1u0LaH3eX4VUec85js5506mIm3RBcDGbPlrN4Fkf8x7Iro
X-Received: by 2002:a05:6214:5291:b0:4bb:6927:d81c with SMTP id
 kj17-20020a056214529100b004bb6927d81cmr47941539qvb.131.1667861509584; 
 Mon, 07 Nov 2022 14:51:49 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5/lWpKQ73zU9NrRNXTABKXy9VQTuPMf5vDRvVu25z52rlIIfWK+JnjULaJSrZyKcDbMPNoYg==
X-Received: by 2002:a05:6214:5291:b0:4bb:6927:d81c with SMTP id
 kj17-20020a056214529100b004bb6927d81cmr47941521qvb.131.1667861509321; 
 Mon, 07 Nov 2022 14:51:49 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 fa13-20020a05622a4ccd00b0039cc22a2c49sm6946690qtb.47.2022.11.07.14.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:49 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 52/83] tests: acpi: pc/q35 whitelist DSDT before \_GPE
 cleanup
Message-ID: <20221107224600.934080-53-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..725a1dc798 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,35 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


