Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7B41BD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 05:12:41 +0200 (CEST)
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVQ1Q-0005Qj-W7
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 23:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPoB-0005oc-2B; Tue, 28 Sep 2021 22:58:59 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo8-00068L-O0; Tue, 28 Sep 2021 22:58:58 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HK1Dr1nV7zbmsX;
 Wed, 29 Sep 2021 10:54:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:53 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:52 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 16/16] machine: Make smp_parse return a boolean
Date: Wed, 29 Sep 2021 10:58:16 +0800
Message-ID: <20210929025816.21076-17-wangyanan55@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting one of the Rules described in include/qapi/error.h:
"
Whenever practical, also return a value that indicates success /
failure.  This can make the error checking more concise, and can
avoid useless error object creation and destruction.  Note that
we still have many functions returning void.  We recommend
• bool-valued functions return true on success / false on failure,
• pointer-valued functions return non-null / null pointer, and
• integer-valued functions return non-negative / negative.
"

So make smp_parse() return true on success and false on failure,
so that we can more laconically check whether the parsing has
succeeded without touching the errp.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4dc936732e..3e3a2707af 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -788,7 +788,7 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
  * introduced topology members which are likely to be target specific should
  * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
  */
-static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+static bool smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
@@ -818,7 +818,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
      */
     if (!mc->smp_props.dies_supported && dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
-        return;
+        return false;
     }
 
     dies = dies > 0 ? dies : 1;
@@ -876,7 +876,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "product of the hierarchy must match maxcpus: "
                    "%s != maxcpus (%u)",
                    topo_msg, maxcpus);
-        return;
+        return false;
     }
 
     if (maxcpus < cpus) {
@@ -885,7 +885,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "maxcpus must be equal to or greater than smp: "
                    "%s == maxcpus (%u) < smp_cpus (%u)",
                    topo_msg, maxcpus, cpus);
-        return;
+        return false;
     }
 
     if (ms->smp.cpus < mc->min_cpus) {
@@ -893,7 +893,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "supported by machine '%s' is %d",
                    ms->smp.cpus,
                    mc->name, mc->min_cpus);
-        return;
+        return false;
     }
 
     if (ms->smp.max_cpus > mc->max_cpus) {
@@ -901,8 +901,10 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    "supported by machine '%s' is %d",
                    ms->smp.max_cpus,
                    mc->name, mc->max_cpus);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
@@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    smp_parse(ms, config, errp);
-    if (*errp) {
+    if (!smp_parse(ms, config, errp)) {
         qapi_free_SMPConfiguration(config);
     }
 }
-- 
2.19.1


