Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68631F59E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:06:00 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD0nX-0002rB-A5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0fy-0003kj-GT
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0fu-0002h0-BJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613721485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sF4OvBRaCKyZiZNQtHF0fcavVVosMolQKp8hmq1eOIE=;
 b=ZEiE44KM7ExQGrb6WJlZNlDpjQ7uhI3dHCA+NUksYlbj3sRTUoYjZLlP8ffDY1qELo+1RP
 ftfnaqiJJt3GwedkqNWAchhKOCDGsQ++cqWxdD+vMxCMv3jVr8aUMBrCcf9I2O5x1e7Y+W
 yGy/EH5PlHJFBgNdxVOqU72uJNzBAP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-1McItZAHOqS8aDw1Wci8dQ-1; Fri, 19 Feb 2021 02:58:03 -0500
X-MC-Unique: 1McItZAHOqS8aDw1Wci8dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 198ED1005501;
 Fri, 19 Feb 2021 07:58:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 116BA5D9C2;
 Fri, 19 Feb 2021 07:58:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/10] tests/qtest/boot-sector: Check that the guest did not
 panic
Date: Fri, 19 Feb 2021 08:57:36 +0100
Message-Id: <20210219075738.2261103-9-thuth@redhat.com>
In-Reply-To: <20210219075738.2261103-1-thuth@redhat.com>
References: <20210219075738.2261103-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The s390-ccw bios code panics if it can not boot successfully. In
this case, it does not make sense that we wait the full 600 seconds
for the boot sector test to finish and can signal the failure
immediately, thus let's check the status of the guest with the
"query-status" QMP command here, too.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210212113141.854871-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-sector.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 24df5c4734..ea8f264661 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -138,6 +138,7 @@ void boot_sector_test(QTestState *qts)
     uint8_t signature_low;
     uint8_t signature_high;
     uint16_t signature;
+    QDict *qrsp, *qret;
     int i;
 
     /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
@@ -155,6 +156,14 @@ void boot_sector_test(QTestState *qts)
         if (signature == SIGNATURE) {
             break;
         }
+
+        /* check that guest is still in "running" state and did not panic */
+        qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
+        qret = qdict_get_qdict(qrsp, "return");
+        g_assert_nonnull(qret);
+        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        qobject_unref(qrsp);
+
         g_usleep(TEST_DELAY);
     }
 
-- 
2.27.0


