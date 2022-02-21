Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB94BD9AF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:36:07 +0100 (CET)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7vC-00088M-4B
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Ny-0003vw-Ut
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Nw-0000rz-6G
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9C6/1n2umGTiA3cXh0le8Wir29yp3vfsyg12uLeQvpE=;
 b=iQjXy7ZStZ5Hro70ml/rYIGf27Xtp8frdxh/oOMfJkGzCJelNOJi4jyhrbGDw9i/lPS+tx
 WJg5ulMHlKzZq1jh8XLvMgZjZDJAXyLMJnF7gjR+K3+toEHdFEop72KXqm73QbfrwYPwu0
 V/AQ78H0/3vV7lDm2LeVTlfcdJB1g5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-TQE4dWN4NAipBmDJlvuD6w-1; Mon, 21 Feb 2022 07:01:40 -0500
X-MC-Unique: TQE4dWN4NAipBmDJlvuD6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B91311853026;
 Mon, 21 Feb 2022 12:01:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B881973162;
 Mon, 21 Feb 2022 12:01:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] tests/qtest: failover: check missing guest feature
Date: Mon, 21 Feb 2022 12:59:52 +0100
Message-Id: <20220221120008.600114-10-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If QEMU provides the VIRTIO_NET_F_STANDBY feature but the guest doesn't
the primary device must be kept hidden

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220203141537.972317-5-lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 4236796368..cbd8585fa8 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -404,6 +404,38 @@ static void test_enabled(void)
     machine_stop(qts);
 }
 
+static void test_guest_off(void)
+{
+    QTestState *qts;
+    QVirtioPCIDevice *vdev;
+    uint64_t features;
+
+    qts = machine_start(BASE_MACHINE
+                     "-netdev user,id=hs0 "
+                     "-device virtio-net,bus=root0,id=standby0,"
+                     "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
+                     "-netdev user,id=hs1 "
+                     "-device virtio-net,bus=root1,id=primary0,"
+                     "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0" ",
+                     2);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    features = ~(QVIRTIO_F_BAD_FEATURE |
+                 (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
+                 (1ull << VIRTIO_RING_F_EVENT_IDX) |
+                 (1ull << VIRTIO_NET_F_STANDBY));
+
+    vdev = start_virtio_net_internal(qts, 1, 0, &features);
+
+    check_one_card(qts, true, "standby0", MAC_STANDBY0);
+    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
+
+    qos_object_destroy((QOSGraphObject *)vdev);
+    machine_stop(qts);
+}
+
 static void test_hotplug_1(void)
 {
     QTestState *qts;
@@ -1351,6 +1383,7 @@ int main(int argc, char **argv)
                    test_on_mismatch);
     qtest_add_func("failover-virtio-net/params/off", test_off);
     qtest_add_func("failover-virtio-net/params/enabled", test_enabled);
+    qtest_add_func("failover-virtio-net/params/guest_off", test_guest_off);
 
     /* hotplug tests */
     qtest_add_func("failover-virtio-net/hotplug/1", test_hotplug_1);
-- 
2.27.0


