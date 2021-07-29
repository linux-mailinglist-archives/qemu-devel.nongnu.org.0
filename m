Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42A3D9E11
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:09:18 +0200 (CEST)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90AO-0003aD-AF
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903B-00044F-9Z; Thu, 29 Jul 2021 03:01:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m9037-0002iL-KD; Thu, 29 Jul 2021 03:01:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fY0fzBz9sXh; Thu, 29 Jul 2021 17:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542101;
 bh=dXpiJ9pGCTw0ZuzVdmgjpi2b30u6aXi4yOzPh4dkoBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bno1tL5WorobS3S2oj5Ssv1DGXy3Zj0d96veCAglpkDuHSiu1yBNfIkSyNUgEvVM4
 9tqxF+uSbYDQqQEz/vh8w6rh4uaFCerTwVl9RukpVxYxHwB5JhSAy5Z9DRtncOQudW
 P2CMmnW9qDtsiMV7ZGI+4bV88HDghlW3mT0w3TQ4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 4/5] ppc/vof: Fix Coverity issues
Date: Thu, 29 Jul 2021 17:01:34 +1000
Message-Id: <20210729070135.422262-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Coverity reported issues which are caused by mixing of signed return codes
from DTC and unsigned return codes of the client interface.

This introduces PROM_ERROR and makes distinction between the error types.

This fixes NEGATIVE_RETURNS, OVERRUN issues reported by Coverity.

This adds a comment about the return parameters number in the VOF hcall.
The reason for such counting is to keep the numbers look the same in
vof_client_handle() and the Linux (an OF client).

vmc->client_architecture_support() returns target_ulong and we want to
propagate this to the client (for example H_MULTI_THREADS_ACTIVE).
The VOF path to do_client_architecture_support() needs chopping off
the top 32bit but SLOF's H_CAS does not; and either way the return values
are either 0 or 32bit negative error code. For now this chops
the top 32bits.

This makes "claim" fail if the allocated address is above 4GB as
the client interface is 32bit. This still allows claiming memory above
4GB as potentially initrd can be put there and the client can read
the address from the FDT's "available" property.

Fixes: CID 1458139, 1458138, 1458137, 1458133, 1458132
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20210720050726.2737405-1-aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/trace-events  |   4 +-
 hw/ppc/vof.c         | 139 +++++++++++++++++++++++--------------------
 include/hw/ppc/vof.h |   2 +
 3 files changed, 78 insertions(+), 67 deletions(-)

diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 6e90a01072..da6e74b80d 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -88,8 +88,8 @@ vof_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => l
 vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t vallen, uint32_t ret) "ph=0x%x \"%s\" [%s] len=%d => ret=%d"
 vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
 vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
-vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
-vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
+vof_package_to_path(uint32_t ph, const char *tmp, int ret) "ph=0x%x => %s len=%d"
+vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, int ret) "ih=0x%x ph=0x%x => %s len=%d"
 vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
 vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=0x%x [%u] \"%s\""
 vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 81f6596215..73adc44ec2 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -160,7 +160,7 @@ static int path_offset(const void *fdt, const char *path)
 static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
 {
     char fullnode[VOF_MAX_PATH];
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
     int offset;
 
     if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
@@ -172,7 +172,7 @@ static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
         ret = fdt_get_phandle(fdt, offset);
     }
     trace_vof_finddevice(fullnode, ret);
-    return (uint32_t) ret;
+    return ret;
 }
 
 static const void *getprop(const void *fdt, int nodeoff, const char *propname,
@@ -229,10 +229,10 @@ static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
     bool write0;
 
     if (nodeoff < 0) {
-        return -1;
+        return PROM_ERROR;
     }
     if (readstr(pname, propname, sizeof(propname))) {
-        return -1;
+        return PROM_ERROR;
     }
     prop = getprop(fdt, nodeoff, propname, &proplen, &write0);
     if (prop) {
@@ -244,7 +244,7 @@ static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
             (write0 &&
              cb == proplen &&
              VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) != MEMTX_OK)) {
-            ret = -1;
+            ret = PROM_ERROR;
         } else {
             /*
              * OF1275 says:
@@ -259,7 +259,7 @@ static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
             }
         }
     } else {
-        ret = -1;
+        ret = PROM_ERROR;
     }
     trace_vof_getprop(nodeph, propname, ret, trval);
 
@@ -275,16 +275,16 @@ static uint32_t vof_getproplen(const void *fdt, uint32_t nodeph, uint32_t pname)
     int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
 
     if (nodeoff < 0) {
-        return -1;
+        return PROM_ERROR;
     }
     if (readstr(pname, propname, sizeof(propname))) {
-        return -1;
+        return PROM_ERROR;
     }
     prop = getprop(fdt, nodeoff, propname, &proplen, NULL);
     if (prop) {
         ret = proplen;
     } else {
-        ret = -1;
+        ret = PROM_ERROR;
     }
     trace_vof_getproplen(nodeph, propname, ret);
 
@@ -296,8 +296,8 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
                             uint32_t valaddr, uint32_t vallen)
 {
     char propname[OF_PROPNAME_LEN_MAX + 1];
-    uint32_t ret = -1;
-    int offset;
+    uint32_t ret = PROM_ERROR;
+    int offset, rc;
     char trval[64] = "";
     char nodepath[VOF_MAX_PATH] = "";
     Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
@@ -314,8 +314,8 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
     if (offset < 0) {
         goto trace_exit;
     }
-    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
-    if (ret <= 0) {
+    rc = get_path(fdt, offset, nodepath, sizeof(nodepath));
+    if (rc <= 0) {
         goto trace_exit;
     }
 
@@ -333,8 +333,8 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
         goto trace_exit;
     }
 
-    ret = fdt_setprop(fdt, offset, propname, val, vallen);
-    if (ret) {
+    rc = fdt_setprop(fdt, offset, propname, val, vallen);
+    if (rc) {
         goto trace_exit;
     }
 
@@ -358,7 +358,7 @@ static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
     const char *tmp;
 
     if (readstr(prevaddr, prev, sizeof(prev))) {
-        return -1;
+        return PROM_ERROR;
     }
 
     fdt_for_each_property_offset(offset, fdt, nodeoff) {
@@ -377,7 +377,7 @@ static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
             }
 
             if (VOF_MEM_WRITE(nameaddr, tmp, strlen(tmp) + 1) != MEMTX_OK) {
-                return -1;
+                return PROM_ERROR;
             }
             return 1;
         }
@@ -388,18 +388,17 @@ static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
 
 static uint32_t vof_peer(const void *fdt, uint32_t phandle)
 {
-    int ret;
+    uint32_t ret = 0;
+    int rc;
 
     if (phandle == 0) {
-        ret = fdt_path_offset(fdt, "/");
+        rc = fdt_path_offset(fdt, "/");
     } else {
-        ret = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+        rc = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
     }
 
-    if (ret < 0) {
-        ret = 0;
-    } else {
-        ret = fdt_get_phandle(fdt, ret);
+    if (rc >= 0) {
+        ret = fdt_get_phandle(fdt, rc);
     }
 
     return ret;
@@ -407,12 +406,11 @@ static uint32_t vof_peer(const void *fdt, uint32_t phandle)
 
 static uint32_t vof_child(const void *fdt, uint32_t phandle)
 {
-    int ret = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+    uint32_t ret = 0;
+    int rc = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
 
-    if (ret < 0) {
-        ret = 0;
-    } else {
-        ret = fdt_get_phandle(fdt, ret);
+    if (rc >= 0) {
+        ret = fdt_get_phandle(fdt, rc);
     }
 
     return ret;
@@ -420,12 +418,11 @@ static uint32_t vof_child(const void *fdt, uint32_t phandle)
 
 static uint32_t vof_parent(const void *fdt, uint32_t phandle)
 {
-    int ret = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+    uint32_t ret = 0;
+    int rc = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, phandle));
 
-    if (ret < 0) {
-        ret = 0;
-    } else {
-        ret = fdt_get_phandle(fdt, ret);
+    if (rc >= 0) {
+        ret = fdt_get_phandle(fdt, rc);
     }
 
     return ret;
@@ -433,7 +430,7 @@ static uint32_t vof_parent(const void *fdt, uint32_t phandle)
 
 static uint32_t vof_do_open(void *fdt, Vof *vof, int offset, const char *path)
 {
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
     OfInstance *inst = NULL;
 
     if (vof->of_instance_last == 0xFFFFFFFF) {
@@ -461,18 +458,18 @@ trace_exit:
 uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
                                const char *prop, const char *path)
 {
-    int node = fdt_path_offset(fdt, nodename);
-    int inst, offset;
+    int offset, node = fdt_path_offset(fdt, nodename);
+    uint32_t inst;
 
     offset = fdt_path_offset(fdt, path);
     if (offset < 0) {
         trace_vof_error_unknown_path(path);
-        return offset;
+        return PROM_ERROR;
     }
 
     inst = vof_do_open(fdt, vof, offset, path);
 
-    return fdt_setprop_cell(fdt, node, prop, inst);
+    return fdt_setprop_cell(fdt, node, prop, inst) >= 0 ? 0 : PROM_ERROR;
 }
 
 static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
@@ -481,13 +478,13 @@ static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
     int offset;
 
     if (readstr(pathaddr, path, sizeof(path))) {
-        return -1;
+        return PROM_ERROR;
     }
 
     offset = path_offset(fdt, path);
     if (offset < 0) {
         trace_vof_error_unknown_path(path);
-        return offset;
+        return PROM_ERROR;
     }
 
     return vof_do_open(fdt, vof, offset, path);
@@ -504,7 +501,7 @@ static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
 {
     gpointer instp = g_hash_table_lookup(vof->of_instances,
                                          GINT_TO_POINTER(ihandle));
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
 
     if (instp) {
         ret = ((OfInstance *)instp)->phandle;
@@ -517,39 +514,39 @@ static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
 static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
                                     uint32_t buf, uint32_t len)
 {
-    uint32_t ret = -1;
+    int rc;
     char tmp[VOF_MAX_PATH] = "";
 
-    ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
-    if (ret > 0) {
-        if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
-            ret = -1;
+    rc = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
+    if (rc > 0) {
+        if (VOF_MEM_WRITE(buf, tmp, rc) != MEMTX_OK) {
+            rc = -1;
         }
     }
 
-    trace_vof_package_to_path(phandle, tmp, ret);
+    trace_vof_package_to_path(phandle, tmp, rc);
 
-    return ret;
+    return rc > 0 ? (uint32_t)rc : PROM_ERROR;
 }
 
 static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
                                      uint32_t buf, uint32_t len)
 {
-    uint32_t ret = -1;
+    int rc = -1;
     uint32_t phandle = vof_instance_to_package(vof, ihandle);
     char tmp[VOF_MAX_PATH] = "";
 
     if (phandle != -1) {
-        ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
-        if (ret > 0) {
-            if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
-                ret = -1;
+        rc = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
+        if (rc > 0) {
+            if (VOF_MEM_WRITE(buf, tmp, rc) != MEMTX_OK) {
+                rc = -1;
             }
         }
     }
-    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
+    trace_vof_instance_to_path(ihandle, phandle, tmp, rc);
 
-    return ret;
+    return rc > 0 ? (uint32_t)rc : PROM_ERROR;
 }
 
 static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
@@ -562,13 +559,13 @@ static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
 
     if (!inst) {
         trace_vof_error_write(ihandle);
-        return -1;
+        return PROM_ERROR;
     }
 
     for ( ; len > 0; len -= cb) {
         cb = MIN(len, sizeof(tmp) - 1);
         if (VOF_MEM_READ(buf, tmp, cb) != MEMTX_OK) {
-            return -1;
+            return PROM_ERROR;
         }
 
         /* FIXME: there is no backend(s) yet so just call a trace */
@@ -747,7 +744,7 @@ uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size,
 
 static uint32_t vof_release(Vof *vof, uint64_t virt, uint64_t size)
 {
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
     int i;
     GArray *claimed = vof->claimed;
     OfClaimed c;
@@ -776,7 +773,7 @@ static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
                                 uint32_t param2, uint32_t param3,
                                 uint32_t param4, uint32_t *ret2)
 {
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
     char method[VOF_MAX_METHODLEN] = "";
     OfInstance *inst;
 
@@ -802,7 +799,8 @@ static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
                 VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
 
                 g_assert(vmc->client_architecture_support);
-                ret = vmc->client_architecture_support(ms, first_cpu, param1);
+                ret = (uint32_t)vmc->client_architecture_support(ms, first_cpu,
+                                                                 param1);
             }
 
             *ret2 = 0;
@@ -826,7 +824,7 @@ trace_exit:
 static uint32_t vof_call_interpret(uint32_t cmdaddr, uint32_t param1,
                                    uint32_t param2, uint32_t *ret2)
 {
-    uint32_t ret = -1;
+    uint32_t ret = PROM_ERROR;
     char cmd[VOF_MAX_FORTHCODE] = "";
 
     /* No interpret implemented so just call a trace */
@@ -895,13 +893,20 @@ static uint32_t vof_client_handle(MachineState *ms, void *fdt, Vof *vof,
     } else if (cmpserv("write", 3, 1)) {
         ret = vof_write(vof, args[0], args[1], args[2]);
     } else if (cmpserv("claim", 3, 1)) {
-        ret = vof_claim(vof, args[0], args[1], args[2]);
-        if (ret != -1) {
+        uint64_t ret64 = vof_claim(vof, args[0], args[1], args[2]);
+
+        if (ret64 < 0x100000000UL) {
             vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+            ret = (uint32_t)ret64;
+        } else {
+            if (ret64 != -1) {
+                vof_release(vof, ret, args[1]);
+            }
+            ret = PROM_ERROR;
         }
     } else if (cmpserv("release", 2, 0)) {
         ret = vof_release(vof, args[0], args[1]);
-        if (ret != -1) {
+        if (ret != PROM_ERROR) {
             vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
         }
     } else if (cmpserv("call-method", 0, 0)) {
@@ -965,11 +970,15 @@ int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
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
diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index 640be46163..97fdef758b 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -55,4 +55,6 @@ struct VofMachineIfClass {
     address_space_write(&address_space_memory, \
     (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
 
+#define PROM_ERROR          (~0U)
+
 #endif /* HW_VOF_H */
-- 
2.31.1


