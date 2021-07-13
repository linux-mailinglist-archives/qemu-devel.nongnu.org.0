Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371E3C71F6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:17:18 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JDp-0005Xj-DO
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1m3IkR-00012x-GM; Tue, 13 Jul 2021 09:46:55 -0400
Received: from ozlabs.ru ([107.174.27.60]:44198)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1m3IkO-0000Tz-NC; Tue, 13 Jul 2021 09:46:54 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id E141DAE80042;
 Tue, 13 Jul 2021 09:46:43 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] ppc/vof: Fix Coverity issues
Date: Tue, 13 Jul 2021 23:46:38 +1000
Message-Id: <20210713134638.1803316-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes NEGATIVE_RETURNS, OVERRUN issues reported by the Coverity.

This adds a comment about the return parameters number in the VOF hcall.
The reason for such counting is to keep the numbers look the same in
vof_client_handle() and the Linux (an OF client).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Will this make COverity happy? What is the canonical way of fixing these
uint32_t vs. int? Thanks,

---
 hw/ppc/vof.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 81f65962156c..872f671babbe 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -517,7 +517,7 @@ static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
 static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
                                     uint32_t buf, uint32_t len)
 {
-    uint32_t ret = -1;
+    int ret = -1;
     char tmp[VOF_MAX_PATH] = "";
 
     ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
@@ -529,13 +529,13 @@ static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
 
     trace_vof_package_to_path(phandle, tmp, ret);
 
-    return ret;
+    return (uint32_t) ret;
 }
 
 static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
                                      uint32_t buf, uint32_t len)
 {
-    uint32_t ret = -1;
+    int ret = -1;
     uint32_t phandle = vof_instance_to_package(vof, ihandle);
     char tmp[VOF_MAX_PATH] = "";
 
@@ -549,7 +549,7 @@ static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
     }
     trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
 
-    return ret;
+    return (uint32_t) ret;
 }
 
 static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
@@ -965,11 +965,15 @@ int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
     }
 
     nret = be32_to_cpu(args_be.nret);
+    if (nret > ARRAY_SIZE(args_be.args) - nargs) {
+        return -EINVAL;
+    }
     ret = vof_client_handle(ms, fdt, vof, service, args, nargs, rets, nret);
     if (!nret) {
         return 0;
     }
 
+    /* @nrets includes the value which this function returns */
     args_be.args[nargs] = cpu_to_be32(ret);
     for (i = 1; i < nret; ++i) {
         args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
-- 
2.30.2


