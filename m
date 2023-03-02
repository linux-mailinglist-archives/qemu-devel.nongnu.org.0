Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EA6A860A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbe-0006m8-Gw; Thu, 02 Mar 2023 11:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbR-0006Rr-JV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbF-0000RJ-DC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrQo5EDeXdHKNgzkF+DXcdRQBxeixj+TICT4G9alb2g=;
 b=GASDbE91QUXcZgvVQle8x+e/oRbpP6FjdeX/8DbBIduEVp7cHGNbI14m+RC4Q4MlR0dvqf
 7J9dTvwX4/djkfPvb61GwOCUmjzJl2KVa5QFoyR/ykHm62L7+4ORyHF8rn5au/msENuA5E
 GbfihpOvs952tx2AsBj2tHqPhlM4mec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-xbxtpTrRO2GPLQ7Ro8s2fA-1; Thu, 02 Mar 2023 11:16:07 -0500
X-MC-Unique: xbxtpTrRO2GPLQ7Ro8s2fA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA2DB1C3D383
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:16:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242AF140EBF6;
 Thu,  2 Mar 2023 16:16:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 27/34] tests: acpi: add non zero function device with
 acpi-index on non-hotpluggble bus
Date: Thu,  2 Mar 2023 17:15:36 +0100
Message-Id: <20230302161543.286002-28-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d7c34ba504..76d5100911 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1028,10 +1028,11 @@ static void test_acpi_q35_tcg_no_acpi_hotplug(void)
                                  "addr=7.0"
         " -device pci-testdev,bus=nohprp,acpi-index=501"
         " -device pcie-root-port,id=nohprpint,port=0x0,chassis=3,hotplug=off,"
-                                 "addr=8.0"
+                                 "multifunction=on,addr=8.0"
+        " -device pci-testdev,bus=nohprpint,acpi-index=601,addr=8.1"
         " -device pcie-root-port,id=hprp2,port=0x0,chassis=4,bus=nohprpint,"
                                  "addr=9.0"
-        " -device pci-testdev,bus=hprp2,acpi-index=601"
+        " -device pci-testdev,bus=hprp2,acpi-index=602"
         , &data);
     free_test_data(&data);
 }
@@ -1053,6 +1054,7 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
         " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3"
         " -device pci-testdev,bus=pcie.0,addr=2.4"
+        " -device pci-testdev,bus=pcie.0,addr=2.5,acpi-index=102"
         " -device pci-testdev,bus=pcie.0,addr=5.0"
         " -device pci-testdev,bus=pcie.0,addr=0xf.0,acpi-index=101"
         " -device pci-testdev,bus=rp0,addr=0.0"
-- 
2.39.1


