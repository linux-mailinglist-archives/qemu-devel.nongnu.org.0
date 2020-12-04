Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FC2CE971
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:22:58 +0100 (CET)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6Mj-0005f3-TK
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Dz-00072A-Am; Fri, 04 Dec 2020 03:13:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Dx-0007AE-1K; Fri, 04 Dec 2020 03:13:55 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnQSf2V64zhmJP;
 Fri,  4 Dec 2020 16:13:22 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 16:13:39 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 3/3] s390x/cpu: Use timer_free() in the finalize function to
 avoid memleaks
Date: Fri, 4 Dec 2020 16:12:09 +0800
Message-ID: <20201204081209.360524-4-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204081209.360524-1-ganqixin@huawei.com>
References: <20201204081209.360524-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>, Euler
 Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the s390_cpu_initfn
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 3552 byte(s) in 74 object(s) allocated from:
    #0 0xfffeb3d4e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffeb36e6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaad51a8f9c4 in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaad51a8f9c4 in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaad51a8f9c4 in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaad51a8f9c4 in s390_cpu_initfn qemu/target/s390x/cpu.c:304
    #6 0xaaad51e00f58 in object_init_with_type qemu/qom/object.c:371
    #7 0xaaad51e0406c in object_initialize_with_type qemu/qom/object.c:515
    #8 0xaaad51e042e0 in object_new_with_type qemu/qom/object.c:729
    #9 0xaaad51e3ff40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #10 0xaaad51910518 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
    #11 0xaaad51911918 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
    #12 0xaaad51911e48 in hmp_device_add qemu/softmmu/qdev-monitor.c:916

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b66718c44..8a734c2f8c 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -313,6 +313,11 @@ static void s390_cpu_finalize(Object *obj)
 #if !defined(CONFIG_USER_ONLY)
     S390CPU *cpu = S390_CPU(obj);
 
+    timer_del(cpu->env.tod_timer);
+    timer_free(cpu->env.tod_timer);
+    timer_del(cpu->env.cpu_timer);
+    timer_free(cpu->env.cpu_timer);
+
     qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
     g_free(cpu->irqstate);
 #endif
-- 
2.27.0


