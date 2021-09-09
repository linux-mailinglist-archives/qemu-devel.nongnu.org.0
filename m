Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A73404579
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:12:18 +0200 (CEST)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODIH-0005bJ-MQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCj-0004Ax-53
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:33 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-000652-Qm
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:32 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H4pQk1KMSz8t0m;
 Thu,  9 Sep 2021 14:05:50 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:20 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:19 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2 4/9] msix: simplify the conditional in
 msix_set/unset_vector_notifiers
Date: Thu, 9 Sep 2021 14:06:08 +0800
Message-ID: <20210909060613.2815-5-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210909060613.2815-1-longpeng2@huawei.com>
References: <20210909060613.2815-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'msix_function_masked' is synchronized with the device's config,
we can use it to replace the complex conditional statementis in
msix_set/unset_vector_notifiers.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/pci/msix.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..6768228 100644
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
@@ -622,8 +621,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
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


