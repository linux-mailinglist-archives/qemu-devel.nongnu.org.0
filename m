Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E227625582D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 12:01:33 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBbCO-0001Iz-Tq
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 06:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1kBbBN-0000GS-6z
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 06:00:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41174 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1kBbBC-0000Io-VN
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 06:00:28 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4D8D67CC6A9C9C0E95B8;
 Fri, 28 Aug 2020 18:00:06 +0800 (CST)
Received: from localhost (10.174.149.106) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 28 Aug 2020
 17:59:57 +0800
From: Wang Xin <wangxinxin.wang@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] misc/ivshmem: Mark shared memory regions as no vhost
Date: Fri, 28 Aug 2020 17:59:53 +0800
Message-ID: <20200828095953.2276-3-wangxinxin.wang@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200828095953.2276-1-wangxinxin.wang@huawei.com>
References: <20200828095953.2276-1-wangxinxin.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.106]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxinxin.wang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 06:00:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Wang Xin <wangxinxin.wang@huawei.com>, jianjay.zhou@huawei.com,
 weidong.huang@huawei.com, dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since ivshmem_bar2 not normal RAM in Guest, and it shouldn't have
vhost DMAing into them, exclude it from the vhost sections, mark the
shared memory regions as novhost.

Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
---
 hw/misc/ivshmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2b6882face..1f3a7a1dfc 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -499,6 +499,7 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     }
 
     s->ivshmem_bar2 = &s->server_bar2;
+    memory_region_set_no_vhost(s->ivshmem_bar2, true);
 }
 
 static void process_msg_disconnect(IVShmemState *s, uint16_t posn,
@@ -855,6 +856,7 @@ static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
 
         s->ivshmem_bar2 = host_memory_backend_get_memory(s->hostmem);
         host_memory_backend_set_mapped(s->hostmem, true);
+        memory_region_set_no_vhost(s->ivshmem_bar2, true);
     } else {
         Chardev *chr = qemu_chr_fe_get_driver(&s->server_chr);
         assert(chr);
-- 
2.26.0.windows.1



