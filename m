Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776D338B6A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:24:13 +0100 (CET)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfts-00080r-60
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lKfsK-0006vk-3L; Fri, 12 Mar 2021 06:22:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lKfsG-0002u0-S2; Fri, 12 Mar 2021 06:22:35 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dxjyq2P01zNlsR;
 Fri, 12 Mar 2021 19:20:03 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 12 Mar 2021 19:22:11 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <elena.ufimtseva@oracle.com>, <jag.raman@oracle.com>,
 <john.g.johnson@oracle.com>
Subject: [PATCH v3] multi-process: Initialize variables declared with g_auto*
Date: Fri, 12 Mar 2021 19:21:43 +0800
Message-ID: <20210312112143.1369-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: berrange@redhat.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 qemu-devel@nongnu.org, laurent@vivier.eu, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quote docs/devel/style.rst (section "Automatic memory deallocation"):

* Variables declared with g_auto* MUST always be initialized,
  otherwise the cleanup function will use uninitialized stack memory

Initialize @name properly to get rid of the compilation error (using
gcc-7.3.0 on CentOS):

../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../hw/remote/proxy.c:350:30: note: 'name' was declared here
             g_autofree char *name;
                              ^~~~

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
* From v2:
  - Add OS distro and compiler version into commit message
  - Add Philippe's R-b
  - Cc: qemu-trivial@nongnu.org

 hw/remote/memory.c | 5 ++---
 hw/remote/proxy.c  | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 32085b1e05..d97947d4b8 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -42,10 +42,9 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
 
     remote_sysmem_reset();
 
-    for (region = 0; region < msg->num_fds; region++) {
-        g_autofree char *name;
+    for (region = 0; region < msg->num_fds; region++, suffix++) {
+        g_autofree char *name = g_strdup_printf("remote-mem-%u", suffix);
         subregion = g_new(MemoryRegion, 1);
-        name = g_strdup_printf("remote-mem-%u", suffix++);
         memory_region_init_ram_from_fd(subregion, NULL,
                                        name, sysmem_info->sizes[region],
                                        true, msg->fds[region],
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 4fa4be079d..6dda705fc2 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -347,13 +347,12 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
                    PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
 
         if (size) {
-            g_autofree char *name;
+            g_autofree char *name = g_strdup_printf("bar-region-%d", i);
             pdev->region[i].dev = pdev;
             pdev->region[i].present = true;
             if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
                 pdev->region[i].memory = true;
             }
-            name = g_strdup_printf("bar-region-%d", i);
             memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
                                   &proxy_mr_ops, &pdev->region[i],
                                   name, size);
-- 
2.19.1


