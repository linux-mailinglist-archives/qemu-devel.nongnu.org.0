Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7D434977
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:56:12 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9GR-0003tM-PD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hP-0003lz-Ay
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hL-00031r-8Z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOZtE7xnygrqomoULUMXxJIooXP/byLxi3JGgtUneLc=;
 b=S9ds9ugxZoJirrHi6dDmsMe9BDmj6KJGeep0ZiHCFTaKoJEn3NRGe/lt7TRBhIl2ImkTZY
 efAzHdqSX2s9w0yugGpVPNMNK0WCdCAxRQAO11G3H5339sILhnpYHDl4/UyWmrNVUmmX52
 I7fkbfIBfUbx/hOz9reVCQPhqdBVOAY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-uEu1UaqTOxCtNURfkZ2FaQ-1; Wed, 20 Oct 2021 06:19:49 -0400
X-MC-Unique: uEu1UaqTOxCtNURfkZ2FaQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so20505395edl.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qOZtE7xnygrqomoULUMXxJIooXP/byLxi3JGgtUneLc=;
 b=ERyDUqQ2795wvmXvQX7XdsoPr26I3UxERgZBJAwW3Nw5/GAvUYN+UofL2JGohBuuw3
 t6efcvlAW9quj2ei3ib5lXmu1/CuehdCzYGo6FBKiKpxM7FRqJmTg96mG2Xtxxzy0rh9
 fjxupBjt8KaPaKp2igU2GmlgRA7/6tNEHeV2eot13BvwNW1cGbN/JGo9TUP6QvT9LOd5
 Cl7LW1D1lj+1apZQPqQn5DOiVBmq6hjdn/0Hh+PacTV9Zkb5BWVSJFUrExiUr444JNQs
 31MY/a74Tm0TXjhlM4NwfeeAo4pfHaq/lDX2AI2aZPgsq/S+7BS5zqKY1xZmrQrDUx7c
 micg==
X-Gm-Message-State: AOAM533jOUcTdmFyquIQARF3oNMkjdk7/U0BRItSthnnh2O6eBHkLaRB
 tShpxQMWzvFQfNd4zuiRNIN5ZI8lvMZn1BQwxdaAJFHisFz5FXuHPCHEC7BVIAxl0/jdcSHsxgb
 8l/+yNfr5rsrFK6bmlarZ7NlMaZNMFHWHAC4RhwZAJWf29SLre6wCt7u6poQz
X-Received: by 2002:a17:906:4895:: with SMTP id
 v21mr46367694ejq.299.1634725187839; 
 Wed, 20 Oct 2021 03:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaxNuXtxKPOoblZTM5Eq+klWYS4xA2nSVAPqJaAtcZr92FL8Tx0y2NMrVyABECWZpfkdOPxQ==
X-Received: by 2002:a17:906:4895:: with SMTP id
 v21mr46367671ejq.299.1634725187649; 
 Wed, 20 Oct 2021 03:19:47 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id q14sm809717eji.63.2021.10.20.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:47 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/44] tests: acpi: arm/virt: drop redundant
 test_acpi_one() in test_acpi_virt_tcg()
Message-ID: <20211020101844.988480-13-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

follow up call with smbios options generates the same ACPI tables,
so there is no need to run smbios-less variant at all.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ef28bb41f3..873eb9c037 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1430,9 +1430,6 @@ static void test_acpi_virt_tcg(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57", &data);
-    free_test_data(&data);
-
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
-- 
MST


