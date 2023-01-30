Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B627681B69
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadV-0003GM-MA; Mon, 30 Jan 2023 15:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacu-0002OO-6L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacs-0006sX-Fr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFv4HMpAKNy2b/DeuNoIEFMDSgeBw7AfH4tNqKztItM=;
 b=gDKA93/JzTIqHol90Hoo88b68Q2CT0QVnlvpntpOJZrq+kE7u6T2H+FbHqVXUManE9MCIU
 Y8/baud+O8kbKhUPiijb5gqf9OEMkyY7Xhh5usLdWGYbplw4/+t+0dG5JrHrmcQtcIqP+Q
 lxX/1DrvAASOX0zefVLKiGm7cq4NCys=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-9RpOkZeFMBSHscPSQ5y6xA-1; Mon, 30 Jan 2023 15:19:34 -0500
X-MC-Unique: 9RpOkZeFMBSHscPSQ5y6xA-1
Received: by mail-ej1-f69.google.com with SMTP id
 du14-20020a17090772ce00b0087108bbcfa6so8115337ejc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFv4HMpAKNy2b/DeuNoIEFMDSgeBw7AfH4tNqKztItM=;
 b=yK8SQ19CHldpTmbuBMvnvWgPMUD0xLkFmqP2w3DQFWj1k4to1pKLO7wqQsJgQwnCog
 UqSoyE16GhNQyXDUu+PAwa0NklYxRtuZFCSDjnJYyrZ7l2pBNAvF00dZEJscV9MAeb8x
 4DOjsd1B0os3twWWr3VMwpBDZo+wdVtX7CClevQ9XxLDiZMHPdenNjz1GHW5hxQWHTTB
 ekE06Ff1IQP57Pc8VZT0hkF2Dh1YJwFbL28qMnmEVM/dEipQ0hl580S/GZ7eES70FLz+
 gzPg16vrMbvyZ2naeimxYWvfOnFysUw/kb+g4TmTeQ1ER4AkiTZ+R8mFLnkRN25xuqE7
 66Pg==
X-Gm-Message-State: AO0yUKWH4qWg/GBkm3qEGrjFSfWLQG1Wh+ONejlc1OGpC5kN9Xx6Sdhy
 Ggkp5Ipzlb9TTI3IhRw8C8W+OXFgJRwyPteiRhj7d/rXuZ3NuXLAFkLaRTgDDp+zTo6WDC4qxOZ
 CySksxtFRkGLLWmyvKUL+dcsDbZfTlnf5zaog7e5Kof+euNzLEH6TLWpmvxpl
X-Received: by 2002:a17:907:6d8a:b0:87b:da70:974 with SMTP id
 sb10-20020a1709076d8a00b0087bda700974mr1005931ejc.58.1675109971510; 
 Mon, 30 Jan 2023 12:19:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+e9yRj58c6MjoGYf9L73LvHybeRsUdDIlHn1WHwZAhGSnXTXx+i84eWiA5Yl9+ujh8csHbew==
X-Received: by 2002:a17:907:6d8a:b0:87b:da70:974 with SMTP id
 sb10-20020a1709076d8a00b0087bda700974mr1005910ejc.58.1675109971295; 
 Mon, 30 Jan 2023 12:19:31 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 x25-20020a170906711900b00878b89075adsm6597579ejj.51.2023.01.30.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:30 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 14/56] tests: acpi: extend pcihp with nested bridges
Message-ID: <20230130201810.11518-15-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

add nested bridges/root-ports to pcihp tests, to make sure
follow up patches don't break nested enumeration of bridges
in DSDT.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 08b8aee76b..6a99b10384 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -863,7 +863,8 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -877,7 +878,8 @@ static void test_acpi_piix4_no_root_hotplug(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -891,7 +893,8 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -965,8 +968,14 @@ static void test_acpi_q35_multif_bridge(void)
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
                   "port=0x0,chassis=1,addr=0x2"
-        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1",
+        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1"
+        " -device pcie-root-port,id=rp2,port=0x0,chassis=3,bus=rp1,addr=0.0"
+        " -device pci-bridge,bus=rp2,chassis_nr=4,id=br1"
+        " -device pcie-root-port,id=rphptgt1,port=0x0,chassis=5,addr=2.1"
+        " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
+        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
         &data);
+
     free_test_data(&data);
 }
 
-- 
MST


