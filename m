Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482402813D2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 15:15:19 +0200 (CEST)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOKu6-0001J9-D3
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 09:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7e9d9494ddabbed819301398b434510088f4eb6d@lizzy.crudebyte.com>)
 id 1kOKsm-0000tv-81
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 09:13:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7e9d9494ddabbed819301398b434510088f4eb6d@lizzy.crudebyte.com>)
 id 1kOKsk-0002hD-B6
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 09:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=9m93UYLD/NDIZCFxgSGIgUg0vmHl3SG20Z+QrKQmnlQ=; b=lewvi
 jjOAq58syeN858IUUcfFCMtq7VETdvR1Ba8tloS8xirpdV99P64MnxHlFf53kJ5HMP1gebx+Sgq+k
 ZG2NLV+LLaW93j5QLwysk1EVdmE5k21CmfrSYmHismPSDYBTGnwDSNiEEqbjE5baY+k9Sm+UgGvaX
 k7c0r+6m4b+39LAIi1JaM0q+9yXDJWfT1LmrRnmGzHBftrImyCkD+4+fTr1XHxJFUzXS9KbV1UYhr
 TTIrGq30TC8VcX4YZIffhpPZrr96Heo0Bg1BFjUwSg2JOdE0lOVvp2aV9V1UlvIkGgSZpwg1m3dKc
 lEsROMVaNAd2rZhTRoiHzohmJfEZQ==;
Message-Id: <7e9d9494ddabbed819301398b434510088f4eb6d.1601639563.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1601639563.git.qemu_oss@crudebyte.com>
References: <cover.1601639563.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 2 Oct 2020 13:51:54 +0200
Subject: [PATCH v2 10/11] tests/9pfs: add virtio_9p_test_path()
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7e9d9494ddabbed819301398b434510088f4eb6d@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new public function virtio_9p_test_path() allows 9pfs
'local' tests to translate a path from guest scope to host
scope. For instance by passing an empty string it would
return the root path on host of the exported 9pfs tree.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 6 ++++++
 tests/qtest/libqos/virtio-9p.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 6cd8c8964b..ccab889a2b 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -94,6 +94,12 @@ static void remove_local_test_dir(void)
     g_free(cmd);
 }
 
+char *virtio_9p_test_path(const char *path)
+{
+    g_assert(local_test_path);
+    return concat_path(local_test_path, path);
+}
+
 static void virtio_9p_cleanup(QVirtio9P *interface)
 {
     qvirtqueue_cleanup(interface->vdev->bus, interface->vq, alloc);
diff --git a/tests/qtest/libqos/virtio-9p.h b/tests/qtest/libqos/virtio-9p.h
index 326a603f72..19a4d97454 100644
--- a/tests/qtest/libqos/virtio-9p.h
+++ b/tests/qtest/libqos/virtio-9p.h
@@ -49,4 +49,9 @@ struct QVirtio9PDevice {
  */
 void virtio_9p_assign_local_driver(GString *cmd_line, const char *args);
 
+/**
+ * Returns path on host to the passed guest path. Result must be freed.
+ */
+char *virtio_9p_test_path(const char *path);
+
 #endif
-- 
2.20.1


