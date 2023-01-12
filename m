Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8F16674B0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBU-0002RX-NP; Thu, 12 Jan 2023 09:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBE-0002Cg-Ra
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005vi-MN
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsFI+zscfLJvCX02h4l8pIliGywTrfoZtd66SghtoTY=;
 b=B3nmSTJlKCkCaJOGu2fBTPjWO+1DaQTUUU7MbvbySTVq1hDk+2cbFYzj/vdHJQWY5WdDYH
 QLa3yuNUSBAN3grMaQf06Ujbq/Ek/L91LnLA9yhzkLaerEKUasORcLxEjI2BncDHQCxPfv
 qgkOMDofpYnPql6Y8HKWr26wIe6560c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-mVucXNBLOmOjDapxMJixig-1; Thu, 12 Jan 2023 09:03:31 -0500
X-MC-Unique: mVucXNBLOmOjDapxMJixig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E8F23804082;
 Thu, 12 Jan 2023 14:03:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B7764085720;
 Thu, 12 Jan 2023 14:03:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 13/40] tests: boot_sector_test: avoid crashing if status is
 not available yet
Date: Thu, 12 Jan 2023 15:02:45 +0100
Message-Id: <20230112140312.3096331-14-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

If test case was started in paused mode (-S CLI option) and then
allowed to continue via QMP, boot_sector_test could assert on
transient state with following error:

   assertion failed (qdict_get_try_str(qret, "status") == "running"): (NULL == "running")

Instead of crashing test if 'status' is not available yet, skip check
and repeat iteration again after TEST_DELAY has elapsed.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Thomas Huth <thuth@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/boot-sector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 44a109abd8..d3f68018e7 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -160,7 +160,9 @@ void boot_sector_test(QTestState *qts)
         qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
         qret = qdict_get_qdict(qrsp, "return");
         g_assert_nonnull(qret);
-        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        if (qdict_get_try_str(qret, "status")) {
+            g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        }
         qobject_unref(qrsp);
 
         g_usleep(TEST_DELAY);
-- 
2.31.1


