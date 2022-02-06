Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD34AAEA2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:44:17 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe5g-0008VJ-Ip
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:44:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzs-00009R-K0
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003dR-7J
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cys7fA3V9JqsHSWEFuxYME8lo9Xx2jeY6AGCu56+bB4=;
 b=Z5de8+naCJV+36fnlJRmxk+jqARjF3UQwB6wvywR5L59rzKEdiLVF2tHqp2Ui8lUjjb+vC
 ffHHUfkkP4s/sv5c2mY+wC4qRLHyCWBVDwK1TTxzAMtCmPMdL4s2YYLPWV7zXc6/45N3UW
 e9GJKwmzj2mpSoE966akjrnkcKn37a8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-7E-Xi93BOpm2H9fvr9TvGw-1; Sun, 06 Feb 2022 04:37:57 -0500
X-MC-Unique: 7E-Xi93BOpm2H9fvr9TvGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so10235109wmb.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cys7fA3V9JqsHSWEFuxYME8lo9Xx2jeY6AGCu56+bB4=;
 b=fiaeCQfjEpgXugGvjWlpW8JMQw+WXFn4rWBIeVMOpITK8gS1SjKMjdhqMmPTcSkUK/
 bMIDpzNpcBFNNZlLjHo8L4I8oEG0YPKzVxmfFACmZgowDbAfaEpq8Qq3t52p8scdDySc
 p4gpRxlYq1yLeWb9+XBDghdh6nZx89taRytDA7K2gZJT8towZNscn/DxYW5nGP6kBYuZ
 MKqzteod1jY8yvTWi/t627tkrXGj2BxB1l2D/IraGdeDex7E+fUGgZgNnpUv1c0+DaCL
 L03YjZLNm0dJzxg28CSSmEymKkN7an7rN5EMLJq4KIG6/cEw8hLdRgNyxJsIAUM48bo3
 TrYw==
X-Gm-Message-State: AOAM530y9tR/Q9CefIqlD3vUhj2G43t2pb79/T6OhZoHRDrV4As3wKSe
 lz0E02Bw7A5TD6JMkAKS28LbVIIl7BAqFNYhRV3uMPblQhcJkVYgEKC1y21t92wQDh7J0+dWZxu
 EXkXblez8x6DUlhYKhLP/lISSS3dh+OPnQzi/KReMmLiAzfZndsv7TxN8ziFc
X-Received: by 2002:a5d:584a:: with SMTP id i10mr5867060wrf.75.1644140275483; 
 Sun, 06 Feb 2022 01:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR/IS8ZNdu1u4MY1tit4KaMPXEprd6Xxq6l+5UlooXIZhOakQ9sCQonHYOzYKFVNZfio3UPQ==
X-Received: by 2002:a5d:584a:: with SMTP id i10mr5867038wrf.75.1644140275239; 
 Sun, 06 Feb 2022 01:37:55 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id o10sm339582wrq.63.2022.02.06.01.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:37:54 -0800 (PST)
Date: Sun, 6 Feb 2022 04:37:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/24] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Message-ID: <20220206093702.1282676-4-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

The next commit will revert OEM fields padding with whitespace to
padding with '\0' as it was before [1]. As result test_oem_fields() will
fail due to unexpectedly smaller ID sizes read from QEMU ACPI tables.

Pad OEM_ID/OEM_TABLE_ID manually with spaces so that values the test
puts on QEMU CLI and expected values match.

1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220112130332.1648664-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6b72d9026..90c9f6a0a2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -71,9 +71,10 @@
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
-#define OEM_ID             "TEST"
-#define OEM_TABLE_ID       "OEM"
-#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
+#define OEM_ID             "TEST  "
+#define OEM_TABLE_ID       "OEM     "
+#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
+                           OEM_TABLE_ID "'"
 
 typedef struct {
     bool tcg_only;
@@ -1519,11 +1520,7 @@ static void test_acpi_q35_slic(void)
 static void test_oem_fields(test_data *data)
 {
     int i;
-    char oem_id[6];
-    char oem_table_id[8];
 
-    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
-    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
     for (i = 0; i < data->tables->len; ++i) {
         AcpiSdtTable *sdt;
 
@@ -1533,8 +1530,8 @@ static void test_oem_fields(test_data *data)
             continue;
         }
 
-        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
-        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
+        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
+        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
     }
 }
 
-- 
MST


