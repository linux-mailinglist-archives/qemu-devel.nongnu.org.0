Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3750F28FA66
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 23:07:40 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTATL-0006ns-9l
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 17:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ccab9ba783b738793b7d3c67d84fb6e6ce28757c@lizzy.crudebyte.com>)
 id 1kTARl-00058b-T1
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:06:02 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ccab9ba783b738793b7d3c67d84fb6e6ce28757c@lizzy.crudebyte.com>)
 id 1kTARj-0007rE-RG
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=LBqY2tnnZKXgYG95EKIKRIwOqV1lV4Ng2MCnhZpaEnQ=; b=mzht/
 7bN8+mSd4MyjHqsOIoue5i97zGsFOJA+fHRphP3wPN6ICI9gzrHG6DVx/JRgwQuAi7kvOEFHcvXng
 t1NEcMI4x9l1LyBHAVSAWoFZ11Oen1lNNbgy6tcYwx46XdSY0VBWHU436vzvPP12os0UZkG/15ne3
 VUIhiYZNba2N9JZmn+FAanqJUaFKgJmJ4wcs2pkulGXtsQhLO0i+40mXosKFZo2WlcnRnIq/YD3g8
 wEb+SnGE3ZTF5YjOK1zABlCTlocycaNU3SejmD0FBtg9gTrr/c/qdzwL+uZiffxRTh9DCxFjbOji7
 TVS9gtSkb4iNKW1MVyki9uYQRpmbw==;
Message-Id: <ccab9ba783b738793b7d3c67d84fb6e6ce28757c.1602771296.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602771296.git.qemu_oss@crudebyte.com>
References: <cover.1602771296.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PULL 4/5] tests/9pfs: add virtio_9p_test_path()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ccab9ba783b738793b7d3c67d84fb6e6ce28757c@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 17:04:25
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
index bd53498041..1524982634 100644
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


