Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFB6728F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 17:37:38 +0200 (CEST)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlxcA-00027i-1v
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 11:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hlxb5-00067u-Qz
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:36:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hlxb4-0003hj-Id
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:36:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hlxb4-0003hT-D4
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 11:36:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 982773082A49;
 Fri, 12 Jul 2019 15:36:29 +0000 (UTC)
Received: from redhat.com (ovpn-116-209.ams2.redhat.com [10.36.116.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1BA560C70;
 Fri, 12 Jul 2019 15:36:19 +0000 (UTC)
Date: Fri, 12 Jul 2019 11:36:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190708092410.11167-2-imammedo@redhat.com>
References: <20190712153504.14937-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190712153504.14937-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 12 Jul 2019 15:36:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/8] tests: acpi: do not require IASL for
 dumping AML blobs
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

IASL isn't needed when dumping ACPI tables from guest for
rebuild purposes. So move this part out from IASL branch.

Makes rebuild-expected-aml.sh work without IASL installed
on host.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20190708092410.11167-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/bios-tables-test.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index d863233fe9..13bd166b81 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -597,12 +597,10 @@ static void test_acpi_one(const char *params, test_=
data *data)
     test_acpi_rxsdt_table(data);
     test_acpi_fadt_table(data);
=20
-    if (iasl) {
-        if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
-            dump_aml_files(data, true);
-        } else {
-            test_acpi_asl(data);
-        }
+    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
+        dump_aml_files(data, true);
+    } else if (iasl) {
+        test_acpi_asl(data);
     }
=20
     /*
--=20
MST


