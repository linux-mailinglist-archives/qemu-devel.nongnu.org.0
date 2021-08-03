Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A73DE7E1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:07:06 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApS5-0003Z6-J0
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQq-0000ww-KP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mApQm-00049Z-7I
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:05:48 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gf6r1259yzYkbZ;
 Tue,  3 Aug 2021 16:05:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:39 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:05:38 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.2 v4 07/14] machine: Use ms instead of global
 current_machine in sanity-check
Date: Tue, 3 Aug 2021 16:05:20 +0800
Message-ID: <20210803080527.156556-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210803080527.156556-1-wangyanan55@huawei.com>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the sanity-check of smp_cpus and max_cpus against mc in function
machine_set_smp(), we are now using ms->smp.max_cpus for the check
but using current_machine->smp.max_cpus in the error message.
Tweak this by uniformly using the local ms.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a8173a0f45..e13a8f2f34 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -878,7 +878,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     } else if (ms->smp.max_cpus > mc->max_cpus) {
         error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
                    "supported by machine '%s' is %d",
-                   current_machine->smp.max_cpus,
+                   ms->smp.max_cpus,
                    mc->name, mc->max_cpus);
     }
 
-- 
2.19.1


