Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0B2927E0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 15:06:37 +0200 (CEST)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUUs1-0001kB-1X
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 09:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e55b178b5e139fc1b951ac8f56e48db716909006@lizzy.crudebyte.com>)
 id 1kUUij-0001Qb-1R
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:57:01 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e55b178b5e139fc1b951ac8f56e48db716909006@lizzy.crudebyte.com>)
 id 1kUUig-0001EQ-PM
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=M1h+8JuW+VSud8WRZ5tHr7+ecRGCn44dlLdNtw0kNQU=; b=olYVL
 44tScUrBK9DElAsAGR4zIuCeAACI8WyVoyKL2pWn3K4lbwKWvTt4co5DGEq+YEvufQlnA73jbUrZD
 t7H/YhlnIgpgwpV2NR81YaS6xqwjy40mFxbDAQIK8XNCnmn46wnQ6GmvBC4LAIJmRX1kI0hYmNUIL
 NMGCEJtAMUaUs40P2sjoDIkJri6OMXtCd+NXjyh8srptqnWJ98Os23/15eqO8dJpannND3PgcEsNM
 QUExVwdc3Ne540up4ez0GioioCFllzQlM2XXn5wev0ocEDfpjaKrqG7SvA1c4ZTecl5YbUIisLHgW
 YXCTJ7AhhX6XV4i/wXJX+tF+05UVg==;
Message-Id: <e55b178b5e139fc1b951ac8f56e48db716909006.1603111175.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603111175.git.qemu_oss@crudebyte.com>
References: <cover.1603111175.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PULL v3 5/6] tests/9pfs: add virtio_9p_test_path()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e55b178b5e139fc1b951ac8f56e48db716909006@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 06:27:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Message-Id: <b563d3c73c6391ec927a2622c9f65c09ca56bd83.1602182956.git.qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 6 ++++++
 tests/qtest/libqos/virtio-9p.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 8ee2a134bc..d43647b3b7 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -65,6 +65,12 @@ static void remove_local_test_dir(void)
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


