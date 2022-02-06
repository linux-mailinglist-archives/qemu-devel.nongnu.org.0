Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868154AAE9F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:42:02 +0100 (CET)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe3V-0003kA-M4
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:42:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzq-00009C-Vu
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003fA-78
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pdwtg4YsnAYbmN/x8hq/7VP0oKua1VQsoEaxNXs2NSc=;
 b=C6+9OvKfdumKW2zFevEz5UtK4Y+3Msqc3KD78h+AhRWN3ql2IbY6j2MmKCGhjAIpQGas/3
 CYUQZXogBinDV/2DyXY+tnj+Ih5JQhTPEzrg56FFHuS7x7ElzWLkoqsZiNdAiNcRQ6TZEC
 BgG9mT6CsSDMyAA1CMI4YfZBgd4Tn94=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-5sJEmhkUM0a2jYEtgbOcBg-1; Sun, 06 Feb 2022 04:38:08 -0500
X-MC-Unique: 5sJEmhkUM0a2jYEtgbOcBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so10258132wms.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pdwtg4YsnAYbmN/x8hq/7VP0oKua1VQsoEaxNXs2NSc=;
 b=cw9HLPW+vQusxdisTBWpThb+bnWdz3fkvuxq07Cm4A0SFg2OmXYdn9sMP8+gn8MP0b
 rF8+Txmtv3MZSbGKH1IG6NYHBJ3JA6O9lxehw9gQXkVUXm/u4dAH9nDmD8qe7xkaB0i7
 n8vOPVUr5U+zNfJoETWp+++/ejgypuFjWLMBbVE89QkBvGxD8uKRCoXfLO/28FKOvLPc
 pDQrA0qgm3T2Fsgh+481ctxRLRRbh/SuSU8CLjHgSWN9DgWWztKwHIciRyDJtWncVuIU
 NVAVKS+JJos3GpeSDTNGAYtuI3/p2RGKccY23yDsw4zFSWh/HZgv90vlRBn6SIf+EPIa
 Ed+g==
X-Gm-Message-State: AOAM53296Qtcjld4FHamEY/gm4uOEgNomi0UEDajRrgPZ6ut7CqJeNSL
 5wgDTvIoOsTrvyukEnZtimSjcHlOdE5Z2s7AGao3Jtm+Ehdd6LHboYwJTbgMjvTTbW+medmqfiy
 YHAcL5ke+ZbJbL0zFikkpkSG3/QyJQUguEZnL6s2A3yMr43UIQnhQHQAxmp6X
X-Received: by 2002:adf:dc08:: with SMTP id t8mr5850324wri.40.1644140286692;
 Sun, 06 Feb 2022 01:38:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLKGnb4GW93mb2cBOhhx4yvb0tEiA+yN3BY2I5YoKlD1fmpgrdNRv01LvzIpI88aQ0mqtDyg==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr5850306wri.40.1644140286521;
 Sun, 06 Feb 2022 01:38:06 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id l28sm3839152wrz.90.2022.02.06.01.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:06 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/24] tests: acpi: test short OEM_ID/OEM_TABLE_ID values
 in test_oem_fields()
Message-ID: <20220206093702.1282676-8-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


