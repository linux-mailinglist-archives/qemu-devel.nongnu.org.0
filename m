Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087948EB28
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:59:38 +0100 (CET)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8N7B-0004DN-BK
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0U-000307-Ew
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0S-0000Jx-L8
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzZXTLmmLA7YlJEboW2drBQ+s+ZG+F2OELE7QTNMOwU=;
 b=i7n3lfZbNX+/Ixq5cv2ImW6+CXKnaabLK99+bz0M0CtusPhvKKjDiu9kDKGLLl0+hAe5/H
 EAL5KrHGwysRpZ6MZkX2r/XroX0Rw+hZvqeVhX9fT+N4iOYgvTf/oaoVzvhhGcZPZSvu7h
 el17alkJ5lDEKdIyDF5UkMd03w6zAks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-DnaFf6FgOz2iYbgFn8-_PQ-1; Fri, 14 Jan 2022 08:52:37 -0500
X-MC-Unique: DnaFf6FgOz2iYbgFn8-_PQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0065F83DD21;
 Fri, 14 Jan 2022 13:52:36 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF41D105B20E;
 Fri, 14 Jan 2022 13:52:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/16] softmmu: fix device deletion events with -device JSON
 syntax
Date: Fri, 14 Jan 2022 14:52:14 +0100
Message-Id: <20220114135226.185407-5-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The -device JSON syntax impl leaks a reference on the created
DeviceState instance. As a result when you hot-unplug the
device, the device_finalize method won't be called and thus
it will fail to emit the required DEVICE_DELETED event.

A 'json-cli' feature was previously added against the
'device_add' QMP command QAPI schema to indicated to mgmt
apps that -device supported JSON syntax. Given the hotplug
bug that feature flag is not usable for its purpose, so
we add a new 'json-cli-hotplug' feature to indicate the
-device supports JSON without breaking hotplug.

Fixes: 5dacda5167560b3af8eadbce5814f60ba44b467e
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/802
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220105123847.4047954-2-berrange@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Ján Tomko <jtomko@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qdev.json                 |  5 ++++-
 softmmu/vl.c                   |  4 +++-
 tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 69656b14df..26cd10106b 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -44,6 +44,9 @@
 # @json-cli: If present, the "-device" command line option supports JSON
 #            syntax with a structure identical to the arguments of this
 #            command.
+# @json-cli-hotplug: If present, the "-device" command line option supports JSON
+#                    syntax without the reference counting leak that broke
+#                    hot-unplug
 #
 # Notes:
 #
@@ -74,7 +77,7 @@
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
   'gen': false, # so we can get the additional arguments
-  'features': ['json-cli'] }
+  'features': ['json-cli', 'json-cli-hotplug'] }
 
 ##
 # @device_del:
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 207a9eb8be..5e1b35ba48 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2684,6 +2684,7 @@ static void qemu_create_cli_devices(void)
     qemu_opts_foreach(qemu_find_opts("device"),
                       device_init_func, NULL, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
+        DeviceState *dev;
         loc_push_restore(&opt->loc);
         /*
          * TODO Eventually we should call qmp_device_add() here to make sure it
@@ -2692,7 +2693,8 @@ static void qemu_create_cli_devices(void)
          * from the start, so call qdev_device_add_from_qdict() directly for
          * now.
          */
-        qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
+        dev = qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
+        object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
     rom_reset_order_override();
diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 559d47727a..ad79bd4c14 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -77,6 +77,23 @@ static void test_pci_unplug_request(void)
     qtest_quit(qtest);
 }
 
+static void test_pci_unplug_json_request(void)
+{
+    QTestState *qtest = qtest_initf(
+        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
+
+    /*
+     * Request device removal. As the guest is not running, the request won't
+     * be processed. However during system reset, the removal will be
+     * handled, removing the device.
+     */
+    device_del(qtest, "dev0");
+    system_reset(qtest);
+    wait_device_deleted_event(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 static void test_ccw_unplug(void)
 {
     QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
@@ -145,6 +162,8 @@ int main(int argc, char **argv)
      */
     qtest_add_func("/device-plug/pci-unplug-request",
                    test_pci_unplug_request);
+    qtest_add_func("/device-plug/pci-unplug-json-request",
+                   test_pci_unplug_json_request);
 
     if (!strcmp(arch, "s390x")) {
         qtest_add_func("/device-plug/ccw-unplug",
-- 
2.31.1


