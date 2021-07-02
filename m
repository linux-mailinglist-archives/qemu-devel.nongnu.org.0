Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2D3B9EE3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:12:30 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzG9t-0004Rc-E0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5Y-00058i-P7
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:00 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5Q-0003ML-SZ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:08:00 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GGW054GpYzZnlq;
 Fri,  2 Jul 2021 18:04:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:45 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:45 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/6] machine: Perform zero-check for the computed value of
 sockets
Date: Fri, 2 Jul 2021 18:07:35 +0800
Message-ID: <20210702100739.13672-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210702100739.13672-1-wangyanan55@huawei.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Yanan Wang <wangyanan55@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently perform zero-check (default the value to 1 if zeroed)
for the computed values of cores/threads, to make sure they are at
least 1. For consistency, we probably should also default sockets
to 1 if the computed value is zero. Note that this won't affect
any existing working cmdlines but will improve the error reporting
of the invalid ones such as "-smp 8,maxcpus=9,cores=10,threads=1".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 1 +
 hw/i386/pc.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f17bbe3275..1e194677cd 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -761,6 +761,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         } else {
             maxcpus = maxcpus > 0 ? maxcpus : cpus;
             sockets = maxcpus / (cores * threads);
+            sockets = sockets > 0 ? sockets : 1;
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a9b22fdc01..a44511c937 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -729,6 +729,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         } else {
             maxcpus = maxcpus > 0 ? maxcpus : cpus;
             sockets = maxcpus / (dies * cores * threads);
+            sockets = sockets > 0 ? sockets : 1;
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-- 
2.19.1


