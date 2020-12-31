Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BB2E7E63
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 07:13:21 +0100 (CET)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kurD6-0004lV-D5
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 01:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kurAx-0003Vr-3j; Thu, 31 Dec 2020 01:11:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kurAr-0005cV-J8; Thu, 31 Dec 2020 01:11:06 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D5yRX5wL0zkycB;
 Thu, 31 Dec 2020 14:09:44 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 14:10:40 +0800
From: Jinhao Gao <gaojinhao@huawei.com>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/3] spapr_pci: Fix memory leak of vmstate_spapr_pci
Date: Thu, 31 Dec 2020 14:10:18 +0800
Message-ID: <20201231061020.828-2-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
In-Reply-To: <20201231061020.828-1-gaojinhao@huawei.com>
References: <20201231061020.828-1-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=gaojinhao@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan
 Berger <stefanb@linux.vnet.ibm.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci
having a flag of VMS_ALLOC need to allocate memory. If the src doesn't free
memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile save
VMState of spapr_pci, it may result in memory leak of msi_devs. We add the
post_save func to free memory, which prevents memory leak.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr_pci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 76d7c91e9c..1b2b940606 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
     return 0;
 }
 
+static int spapr_pci_post_save(void *opaque)
+{
+    SpaprPhbState *sphb = opaque;
+
+    g_free(sphb->msi_devs);
+    sphb->msi_devs = NULL;
+    sphb->msi_devs_num = 0;
+    return 0;
+}
+
 static int spapr_pci_post_load(void *opaque, int version_id)
 {
     SpaprPhbState *sphb = opaque;
@@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci = {
     .version_id = 2,
     .minimum_version_id = 2,
     .pre_save = spapr_pci_pre_save,
+    .post_save = spapr_pci_post_save,
     .post_load = spapr_pci_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),
-- 
2.23.0


