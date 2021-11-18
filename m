Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFBE455D75
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:07:52 +0100 (CET)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni4t-0000kt-Bi
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhan-0000Mm-R4
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhal-0002xI-41
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/eVZJnBVIUvyH3r5un5vIjp7TpJsxQpMLa8nQ9v+LA=;
 b=IJXsMZeuEIQgQNB5iS+PEU/uW9k0ModUSj1NVDsMHAeWor+lsJnRiVc2kkI0U7iaRJ1IHw
 bKrNsho9BHXSwP3o4sWElVyBx1yHTbS1QzPjRfyzx402sVwr7UIjhOkjoKUW00wB4KiXHP
 AriToIYi9BVfBHmg8cImjzoR0jDJ6wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-NmH__Cp2PhyyWQQFqzh3Uw-1; Thu, 18 Nov 2021 08:36:40 -0500
X-MC-Unique: NmH__Cp2PhyyWQQFqzh3Uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74ACC1B18BCB;
 Thu, 18 Nov 2021 13:36:39 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A85CB3AEA;
 Thu, 18 Nov 2021 13:36:09 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/libqtest: update virtio-net failover test
Date: Thu, 18 Nov 2021 14:32:25 +0100
Message-Id: <20211118133225.324937-6-lvivier@redhat.com>
In-Reply-To: <20211118133225.324937-1-lvivier@redhat.com>
References: <20211118133225.324937-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the migration test to check we correctly wait the end
of the card unplug before doing the migration.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 576d4454c3c3..7cc276e6ffc1 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -478,6 +478,7 @@ static void test_outmigrate(gconstpointer opaque)
     QTestState *qts;
     QDict *resp, *args, *data;
     g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
+    struct timeval timeout;
 
     qts = machine_start(BASE_MACHINE
                      "-netdev user,id=hs0 "
@@ -525,11 +526,19 @@ static void test_outmigrate(gconstpointer opaque)
 
     qobject_unref(resp);
 
-    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
+    /*
+     * The migration cannot start if the card is not ejected,
+     * so we check it cannot end ("STOP") before the card is ejected
+     */
+    /* 10s is enough for ACPI, PCIe native would need at least 30s */
+    timeout.tv_sec = 10;
+    timeout.tv_usec = 0;
+    resp = qtest_qmp_eventwait_timeout(qts, &timeout, "STOP");
+    g_assert_null(resp);
 
-    resp = qtest_qmp_eventwait_ref(qts, "STOP");
-    qobject_unref(resp);
+    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
 
+    qtest_qmp_eventwait(qts, "STOP");
     /*
      * in fact, the card is ejected from the point of view of kernel
      * but not really from QEMU to be able to hotplug it back if
-- 
2.33.1


