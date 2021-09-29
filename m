Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A341BD19
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 05:09:35 +0200 (CEST)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVPyP-0007YG-SA
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 23:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPoA-0005mm-I1; Tue, 28 Sep 2021 22:58:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo8-00067X-1e; Tue, 28 Sep 2021 22:58:58 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HK1JF1YkBz1DHFx;
 Wed, 29 Sep 2021 10:57:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:51 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:50 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 15/16] machine: Put all sanity-check in the generic SMP
 parser
Date: Wed, 29 Sep 2021 10:58:15 +0800
Message-ID: <20210929025816.21076-16-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put both sanity-check of the input SMP configuration and sanity-check
of the output SMP configuration uniformly in the generic parser. Then
machine_set_smp() will become cleaner, also all the invalid scenarios
can be tested only by calling the parser.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54f04a5ac6..4dc936732e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -798,6 +798,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Deprecated CPU topology (considered invalid): "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     /*
      * If not supported by the machine, a topology parameter must be
      * omitted or specified equal to 1.
@@ -873,6 +887,22 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    topo_msg, maxcpus, cpus);
         return;
     }
+
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+        return;
+    }
+
+    if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+        return;
+    }
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
@@ -895,7 +925,6 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(obj);
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config;
     ERRP_GUARD();
@@ -904,40 +933,10 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    /*
-     * Specified CPU topology parameters must be greater than zero,
-     * explicit configuration like "cpus=0" is not allowed.
-     */
-    if ((config->has_cpus && config->cpus == 0) ||
-        (config->has_sockets && config->sockets == 0) ||
-        (config->has_dies && config->dies == 0) ||
-        (config->has_cores && config->cores == 0) ||
-        (config->has_threads && config->threads == 0) ||
-        (config->has_maxcpus && config->maxcpus == 0)) {
-        warn_report("Deprecated CPU topology (considered invalid): "
-                    "CPU topology parameters must be greater than zero");
-    }
-
     smp_parse(ms, config, errp);
     if (*errp) {
-        goto out_free;
-    }
-
-    /* sanity-check smp_cpus and max_cpus against mc */
-    if (ms->smp.cpus < mc->min_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.cpus,
-                   mc->name, mc->min_cpus);
-    } else if (ms->smp.max_cpus > mc->max_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.max_cpus,
-                   mc->name, mc->max_cpus);
+        qapi_free_SMPConfiguration(config);
     }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.19.1


