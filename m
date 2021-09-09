Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184E40456C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:08:46 +0200 (CEST)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODEr-0007pQ-Ij
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCh-00046c-2I
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:31 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-000653-Md
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:30 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H4pLg3zdbzbmNx;
 Thu,  9 Sep 2021 14:02:19 +0800 (CST)
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
Subject: [PATCH v2 5/9] msix: reset poll_notifier to NULL if fail to set
 notifiers
Date: Thu, 9 Sep 2021 14:06:09 +0800
Message-ID: <20210909060613.2815-6-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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

'msix_vector_poll_notifier' should be reset to NULL in the error
path in msix_set_vector_notifiers().

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/pci/msix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 6768228..8057709 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -611,6 +611,7 @@ undo:
     }
     dev->msix_vector_use_notifier = NULL;
     dev->msix_vector_release_notifier = NULL;
+    dev->msix_vector_poll_notifier = NULL;
     return ret;
 }
 
-- 
1.8.3.1


