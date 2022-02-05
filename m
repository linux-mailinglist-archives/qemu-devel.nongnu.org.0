Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F254AA584
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:02:21 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAP6-0007yL-LL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6F-0003fc-TS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6D-0003I0-Tz
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cys7fA3V9JqsHSWEFuxYME8lo9Xx2jeY6AGCu56+bB4=;
 b=GwGW8z9OsgM2zPJf0c3SFfMk9g7FKvMypW3H+jW7MUaOZAniQBwlplZpbIp0k3mst0vsqk
 WfSRVkkbUNOPUr2924Tf5UeBaSXEYdSZNMTGAJslA0CCRa3ql9trgvi8Y2tESplM/YCm2U
 V2j6gMlPgL0OE8vqnRUUHpcFAQsLCSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-ZftfzC0RPqSzNfR1Jr8ACA-1; Fri, 04 Feb 2022 20:42:48 -0500
X-MC-Unique: ZftfzC0RPqSzNfR1Jr8ACA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso8367478wms.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cys7fA3V9JqsHSWEFuxYME8lo9Xx2jeY6AGCu56+bB4=;
 b=HW0h/huwRIeInuYkY4TBAFueLdprA4W/nrRWOjsN/kdX4F6IAiph6M9260smcMIk2O
 bnH5x7IGkd3IwgEne1bmUjHEuyHYG6MqGjXoN9WVLJc7i6T9CDAczFYGI6GolagufcDj
 C+HJBqbzgg6NvDd55ZK4OL9yHtyTC0geA6zl2vGv7nDMd3aQJ8l9kajQBUSPMLDZk8bp
 BJxKX8C/Zro074vReG0If/5VeoaPZ30kDl5RjI7W170vkFBa/JSWRCMvsgsfcB3z/vZo
 94CZNWBe1QKV0Xfls4OkY7L0ddtAlD4mLrQu6GMqWjF2SDQaSkxMgyq5kl9VdLwpeq2Z
 Knzw==
X-Gm-Message-State: AOAM5319cEonhvXpA1lFK1Z3hGlKXt0w8FfZMHXnksrdLrnpfO7uQ0H2
 yQvXnP1Ru/xP34Ou5YKbG5gcqAwBl9h9+TUSyISmvbtPq6sanGCo733PTK/DJUajXIb4V4mZYjj
 dfItX39g0O0i4uNba2fWlg7k1kRlhHGEMz22MakdP/ALDAvm6zImo+LGJGvIb
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr1230888wrz.34.1644025366987; 
 Fri, 04 Feb 2022 17:42:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBGrWSwytTAavn3QR2tRkM82rZ+Ufk7noks4l0l9GeZABOSc2O0HEM1EcbnOIPPkhQMh50tA==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr1230875wrz.34.1644025366755; 
 Fri, 04 Feb 2022 17:42:46 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id k1sm1195396wmh.27.2022.02.04.17.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:46 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/32] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Message-ID: <20220205014149.1189026-4-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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


