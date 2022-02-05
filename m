Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E810D4AA577
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:55:49 +0100 (CET)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAIm-00057T-Ns
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003km-Ka
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6N-0003J4-Cf
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pdwtg4YsnAYbmN/x8hq/7VP0oKua1VQsoEaxNXs2NSc=;
 b=XxtDmbpfS9KDyNJzhyX/na1pGzmelKT00PWJ6d39EFjzSUNhnwlMtGPCIr29c0za8fW+Qd
 mcfWMbVvveqU68ZlH4B59m/kQEShzWjDk5hrMVbuPXaluZducsppmbTWPGjNKps+NQh5Se
 3JLyraGoYt9HzWe49AtilVo3Xfv4R60=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-iBWZW0DvOMCabgFJPtvH5A-1; Fri, 04 Feb 2022 20:42:57 -0500
X-MC-Unique: iBWZW0DvOMCabgFJPtvH5A-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso2804183wrg.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pdwtg4YsnAYbmN/x8hq/7VP0oKua1VQsoEaxNXs2NSc=;
 b=DADEb35W6JlhadqumeKEPJH5dUonI1DQrzmNnNPJsXR20YEBQgg1U82IjxpEO8ssUE
 1ERNjTQsQUjobpRS/7DsFk/zaW/Z94aDnqC/3pTxNVeXzQn45nIDs7ZOqrggzPNFYFyP
 8d9QX5+Ow/XDljaSsEzzY15+R3NCYhQ1XHZs2pOOANrV+i4I4TaF1WqEut9tdUxRu/hc
 SAJV9xug3jXB7saaH3wyIqU4/wL9MNLjLsjlcmGxkWlwDmR8s92Yy4LJol5SBzQkBTWZ
 2Co7JRblyTgixqJsJ8Vta07rUzk+64vupARilpf9x2039m4345Snl1KdnN0K9KGFUL9b
 4dyQ==
X-Gm-Message-State: AOAM532s7jtv9TeKchEZoUWe1xHynO1W3ojvbgtz1cHPaj26qtJUNPPR
 Tkfo6isNkIhF17osGHUM1xvWiGwenJAOTmWsW8rCleZFnTrCZ/MyTbF3mqVBzonMrIqw/q0I3BM
 crZB+5GtjYlT/5F1ZudrbWqrk8scoI+bB7gnjb8GdAIrGCaa+G+jYqzsIW6fS
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr1214263wrz.514.1644025376085; 
 Fri, 04 Feb 2022 17:42:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPPcx0oYITpHdK/gPYZzROn48FrA+v6vG8Aay7KWXBK5/ERq2oW65bzny0AhKLfjnRnQd9yg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr1214251wrz.514.1644025375780; 
 Fri, 04 Feb 2022 17:42:55 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id 5sm3673309wrb.113.2022.02.04.17.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:55 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/32] tests: acpi: test short OEM_ID/OEM_TABLE_ID values in
 test_oem_fields()
Message-ID: <20220205014149.1189026-8-mst@redhat.com>
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

Previous patch [1] added explicit whitespace padding to OEM_ID/OEM_TABLE_ID
values used in test_oem_fields() testcase to avoid false positive and
bisection issues when QEMU is switched to \0' padding. As result
testcase ceased to test values that were shorter than max possible
length values.

Update testcase to make sure that it's testing shorter IDs like it
used to before [2].

1) "tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for  test_oem_fields() test"
2) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220114142641.1727679-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 90c9f6a0a2..ad536fd7b1 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -71,10 +71,10 @@
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
-#define OEM_ID             "TEST  "
-#define OEM_TABLE_ID       "OEM     "
-#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
-                           OEM_TABLE_ID "'"
+#define OEM_ID             "TEST"
+#define OEM_TABLE_ID       "OEM"
+#define OEM_TEST_ARGS      "-machine x-oem-id=" OEM_ID ",x-oem-table-id=" \
+                           OEM_TABLE_ID
 
 typedef struct {
     bool tcg_only;
@@ -1530,8 +1530,8 @@ static void test_oem_fields(test_data *data)
             continue;
         }
 
-        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
-        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
+        g_assert(strncmp((char *)sdt->aml + 10, OEM_ID, 6) == 0);
+        g_assert(strncmp((char *)sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
     }
 }
 
-- 
MST


