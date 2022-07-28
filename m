Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB13584094
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:08:15 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4BS-0007l3-Sm
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3hY-0003sb-Rs
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3hX-0003x3-5A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N8wYTS+chP9rC50TizSTuwtsIc9clMkp1KvPGD29cno=;
 b=SxcsJ3DdMeKXndT4cXjXamQz8HXMqPN/gH2ZfgWEc1cGxylAm26gEdIv/fnf6y98ul2dz/
 N0MV/BxgS+uwRgRzoW+teLx0mfJHf+113uUtpn92ivv0pO60YHeZGuQL8Ha3wOtMDTI108
 +nH7cyIDTqDINy3vImcgrQXvpwnI2B8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-LMejsGJuOCC8T0fH0cG4eA-1; Thu, 28 Jul 2022 09:37:17 -0400
X-MC-Unique: LMejsGJuOCC8T0fH0cG4eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A671C08975;
 Thu, 28 Jul 2022 13:37:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BEA540CFD0A;
 Thu, 28 Jul 2022 13:37:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 berrange@redhat.com
Subject: [PATCH for-7.1] tests: acpi: silence applesmc warning about invalid
 key
Date: Thu, 28 Jul 2022 09:37:13 -0400
Message-Id: <20220728133713.1369596-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSK value is irrelevant for ACPI test case.
Supply fake OSK explicitly to prevent QEMU complaining about
invalid key when it fallbacks to default_osk.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 359916c228..7c5f736b51 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1632,7 +1632,9 @@ static void test_acpi_q35_applesmc(void)
         .variant = ".applesmc",
     };
 
-    test_acpi_one("-device isa-applesmc", &data);
+    /* supply fake 64-byte OSK to silence missing key warning */
+    test_acpi_one("-device isa-applesmc,osk=any64characterfakeoskisenough"
+                  "topreventinvalidkeywarningsonstderr", &data);
     free_test_data(&data);
 }
 
-- 
2.31.1


