Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424D2D3911
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 03:58:45 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmpgh-0001BC-P6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 21:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kmpfH-0000bw-JV; Tue, 08 Dec 2020 21:57:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kmpfF-0002ka-2U; Tue, 08 Dec 2020 21:57:15 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrMBg6Wc6zhpdK;
 Wed,  9 Dec 2020 10:56:27 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 10:56:50 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] bugfix: hostmem: Free host_nodes list right after visited
Date: Wed, 9 Dec 2020 10:56:48 +0800
Message-ID: <20201209025648.23068-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
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
Cc: qemu-devel@nongnu.org, alex.chen@huawei.com, qemu-arm@nongnu.org,
 kuhn.chenqun@huawei.com, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In host_memory_backend_get_host_nodes, we build host_nodes
list and output it to v (a StringOutputVisitor) but forget
to free the list. This fixes the memory leak.

The memory leak stack:

==qemu-kvm==209357==ERROR: LeakSanitizer: detected memory leaks
Direct leak of 32 byte(s) in 2 object(s) allocated from:
  #0 0xfffe430e3393 in __interceptor_calloc (/lib64/libasan.so.4+0xd3393)  ??:?
  #1 0xfffe41d58b9b in g_malloc0 (/lib64/libglib-2.0.so.0+0x58b9b)  ??:?
  #2 0xaaac0cdb6e43 (/usr/libexec/qemu-kvm+0xe16e43)  backends/hostmem.c:94
  #3 0xaaac0d2edf83 (/usr/libexec/qemu-kvm+0x134df83) qom/object.c:1478
  #4 0xaaac0c976513 (/usr/libexec/qemu-kvm+0x9d6513)  hw/core/machine-qmp-cmds.c:312
  #5 0xaaac0d2e980b (/usr/libexec/qemu-kvm+0x134980b) qom/object.c:1001
  #6 0xaaac0c97779b (/usr/libexec/qemu-kvm+0x9d779b)  hw/core/machine-qmp-cmds.c:328 (discriminator 1)
  #7 0xaaac0d26ed3f (/usr/libexec/qemu-kvm+0x12ced3f) qapi/qapi-commands-machine.c:327
  #8 0xaaac0d43d647 (/usr/libexec/qemu-kvm+0x149d647) qapi/qmp-dispatch.c:147
  #9 0xaaac0d21f74b (/usr/libexec/qemu-kvm+0x127f74b) monitor/qmp.c:120
  #10 0xaaac0d22074b (/usr/libexec/qemu-kvm+0x128074b) monitor/qmp.c:209 (discriminator 4)
  #11 0xaaac0d4daefb (/usr/libexec/qemu-kvm+0x153aefb) util/async.c:117
  #12 0xaaac0d4e30fb (/usr/libexec/qemu-kvm+0x15430fb) util/aio-posix.c:459
  #13 0xaaac0d4dac8f (/usr/libexec/qemu-kvm+0x153ac8f) util/async.c:268
  #14 0xfffe41d52a6b in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x52a6b)  ??:?
  #15 0xaaac0d4e0e97 (/usr/libexec/qemu-kvm+0x1540e97)  util/main-loop.c:218
  #16 0xaaac0cd9bfa7 (/usr/libexec/qemu-kvm+0xdfbfa7)  vl.c:1791
  #17 0xaaac0c823bc3 (/usr/libexec/qemu-kvm+0x883bc3)  vl.c:4473
  #18 0xfffe40ab3ebf in __libc_start_main (/lib64/libc.so.6+0x23ebf)  ??:?
  #19 0xaaac0c82ed5f (/usr/libexec/qemu-kvm+0x88ed5f)  ??:?
SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).

Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 backends/hostmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e7..9f9ac95edd 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -105,6 +105,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
 
 ret:
     visit_type_uint16List(v, name, &host_nodes, errp);
+    qapi_free_uint16List(host_nodes);
 }
 
 static void
-- 
2.23.0


