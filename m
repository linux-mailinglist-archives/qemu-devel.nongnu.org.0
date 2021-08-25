Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C03F70CB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:58:32 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInnm-0001kj-9t
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmJ-0007XL-Uk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:55 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmG-0005cq-1A
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:55 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GvdbD4mVFz89xc;
 Wed, 25 Aug 2021 15:56:24 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:39 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:36 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>
Subject: [PATCH 2/5] msix: simplfy the conditional in
 msix_set/unset_vector_notifiers
Date: Wed, 25 Aug 2021 15:56:17 +0800
Message-ID: <20210825075620.2607-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210825075620.2607-1-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'msix_function_masked' is kept pace with the device's config,
we can use it to replace the complex conditional in
msix_set/unset_vector_notifiers.

poll_notifier should be reset to NULL in the error path in
msix_set_vector_notifiers, fix it incidentally.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/pci/msix.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..8057709 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
     dev->msix_vector_release_notifier = release_notifier;
     dev->msix_vector_poll_notifier = poll_notifier;
 
-    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
-        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
+    if (!dev->msix_function_masked) {
         for (vector = 0; vector < dev->msix_entries_nr; vector++) {
             ret = msix_set_notifier_for_vector(dev, vector);
             if (ret < 0) {
@@ -612,6 +611,7 @@ undo:
     }
     dev->msix_vector_use_notifier = NULL;
     dev->msix_vector_release_notifier = NULL;
+    dev->msix_vector_poll_notifier = NULL;
     return ret;
 }
 
@@ -622,8 +622,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
     assert(dev->msix_vector_use_notifier &&
            dev->msix_vector_release_notifier);
 
-    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
-        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
+    if (!dev->msix_function_masked) {
         for (vector = 0; vector < dev->msix_entries_nr; vector++) {
             msix_unset_notifier_for_vector(dev, vector);
         }
-- 
1.8.3.1


