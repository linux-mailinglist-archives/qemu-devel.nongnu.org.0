Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E5A614F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 08:23:43 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i52EB-0003GG-0Y
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 02:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57043)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i529j-0007FF-Gx
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i529i-0003al-E6
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:19:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34116)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i529i-0003aN-9I
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:19:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A269E8AC6E1
 for <qemu-devel@nongnu.org>; Tue,  3 Sep 2019 06:19:05 +0000 (UTC)
Received: from thuth.com (ovpn-116-80.ams2.redhat.com [10.36.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 311A5600C6;
 Tue,  3 Sep 2019 06:19:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 08:18:47 +0200
Message-Id: <20190903061849.21493-5-thuth@redhat.com>
In-Reply-To: <20190903061849.21493-1-thuth@redhat.com>
References: <20190903061849.21493-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 03 Sep 2019 06:19:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/6] tests: Remove unnecessary global_qtest
 references
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to remove global_qtest from the main libqtest library
soon, so tests that do not urgently need global_qtest anymore
should be cleaned from the unnecessary references.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/ahci-test.c        | 1 -
 tests/bios-tables-test.c | 1 -
 tests/ivshmem-test.c     | 3 ---
 tests/rtas-test.c        | 1 -
 4 files changed, 6 deletions(-)

diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index 086811e602..c8d42ceea0 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -200,7 +200,6 @@ static void ahci_shutdown(AHCIQState *ahci)
 {
     QOSState *qs = ahci->parent;
 
-    assert(!global_qtest);
     ahci_clean_mem(ahci);
     free_ahci_device(ahci->dev);
     g_free(ahci);
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index a356ac3489..9b3d8b0d1b 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -626,7 +626,6 @@ static void test_acpi_one(const char *params, test_data *data)
         test_smbios_structs(data);
     }
 
-    assert(!global_qtest);
     qtest_quit(data->qts);
     g_free(args);
 }
diff --git a/tests/ivshmem-test.c b/tests/ivshmem-test.c
index b76457948b..be9aa92a61 100644
--- a/tests/ivshmem-test.c
+++ b/tests/ivshmem-test.c
@@ -100,7 +100,6 @@ static inline void write_mem(IVState *s, uint64_t off,
 
 static void cleanup_vm(IVState *s)
 {
-    assert(!global_qtest);
     g_free(s->dev);
     qtest_shutdown(s->qs);
 }
@@ -388,7 +387,6 @@ static void test_ivshmem_hotplug(void)
 
     qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
 
-    global_qtest = qts;  /* TODO: Get rid of global_qtest here */
     qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
                          "{'addr': %s, 'memdev': 'mb1'}",
                          stringify(PCI_SLOT_HP));
@@ -397,7 +395,6 @@ static void test_ivshmem_hotplug(void)
     }
 
     qtest_quit(qts);
-    global_qtest = NULL;
 }
 
 static void test_ivshmem_memdev(void)
diff --git a/tests/rtas-test.c b/tests/rtas-test.c
index ee888676ed..167b42db38 100644
--- a/tests/rtas-test.c
+++ b/tests/rtas-test.c
@@ -14,7 +14,6 @@ static void test_rtas_get_time_of_day(void)
     time_t t1, t2;
 
     qs = qtest_spapr_boot("-machine pseries");
-    global_qtest = qs->qts;
 
     t1 = time(NULL);
     ret = qrtas_get_time_of_day(qs->qts, &qs->alloc, &tm, &ns);
-- 
2.18.1


