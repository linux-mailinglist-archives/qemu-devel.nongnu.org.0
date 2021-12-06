Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570646AB5E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:23:10 +0100 (CET)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMO5-0004nn-3y
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muMMO-0002Kt-Kf
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muMMN-0002lv-2g
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638829282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSeCTbwK+D85Uq+xeJ8vNwrLhxJEZWa0YgT6vxVNuQ8=;
 b=hVYXZj9/6lI82lkeXbulsBYEbjxH6EatVEPVIITDPaLcCOSp2w+DVOrQmY4xSeeQy5/zlb
 ffKDDo38OYDSWQkBLEhc4oonnd8hvTN04zIYqSxNA3vlaNopqy3fFAaFY7k/OZ5/iDQCeZ
 1gAUx4auG7XyeBx79LqOAsqP7jI36C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-2GcRU9GfMv-8NXe0sjH_qA-1; Mon, 06 Dec 2021 17:21:19 -0500
X-MC-Unique: 2GcRU9GfMv-8NXe0sjH_qA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A331801B01
 for <qemu-devel@nongnu.org>; Mon,  6 Dec 2021 22:21:18 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0E167842;
 Mon,  6 Dec 2021 22:21:15 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/6] tests/libqtest: update virtio-net failover test
Date: Mon,  6 Dec 2021 23:20:38 +0100
Message-Id: <20211206222040.3872253-5-lvivier@redhat.com>
In-Reply-To: <20211206222040.3872253-1-lvivier@redhat.com>
References: <20211206222040.3872253-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the migration test to check we correctly wait the end
of the card unplug before doing the migration.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index f8f5fbb3c7fe..c88f8ddec39a 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -560,6 +560,40 @@ static void test_migrate_out(gconstpointer opaque)
 
     qobject_unref(resp);
 
+    /* wait the end of the migration setup phase */
+    while (true) {
+        ret = migrate_status(qts);
+
+        status = qdict_get_str(ret, "status");
+        if (strcmp(status, "wait-unplug") == 0) {
+            break;
+        }
+
+        /* The migration must not start if the card is not ejected */
+        g_assert_cmpstr(status, !=, "active");
+        g_assert_cmpstr(status, !=, "completed");
+        g_assert_cmpstr(status, !=, "failed");
+        g_assert_cmpstr(status, !=, "cancelling");
+        g_assert_cmpstr(status, !=, "cancelled");
+
+        qobject_unref(ret);
+    }
+    qobject_unref(ret);
+
+    if (g_test_slow()) {
+        /* check we stay in wait-unplug while the card is not ejected */
+        int i;
+
+        for (i = 0; i < 10; i++) {
+            sleep(1);
+            ret = migrate_status(qts);
+            status = qdict_get_str(ret, "status");
+            g_assert_cmpstr(status, ==, "wait-unplug");
+            qobject_unref(ret);
+        }
+    }
+
+    /* OS unplugs the cards, QEMU can move from wait-unplug state */
     qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
 
     while (true) {
-- 
2.33.1


