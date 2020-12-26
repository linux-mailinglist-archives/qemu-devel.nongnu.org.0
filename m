Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB22E2E5A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:13:10 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAJh-0008AT-9F
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6uC-0002Iv-D1; Sat, 26 Dec 2020 05:34:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6uA-0004oZ-Na; Sat, 26 Dec 2020 05:34:36 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D30X7476mzhySd;
 Sat, 26 Dec 2020 18:33:27 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:04 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Date: Sat, 26 Dec 2020 18:33:43 +0800
Message-ID: <20201226103347.868-5-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
In-Reply-To: <20201226103347.868-1-gaojinhao@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=gaojinhao@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Dec 2020 09:05:46 -0500
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci
having a flag of VMS_ALLOC need to allocate memory. If the src doesn't free
memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile save
VMState of spapr_pci, it may result in memory leak of msi_devs. We add the
post_save func to free memory, which prevents memory leak.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
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


