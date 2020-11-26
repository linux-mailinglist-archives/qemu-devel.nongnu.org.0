Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857C2C4FDE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 08:57:10 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiC9N-0001dT-4i
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 02:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC7X-0000TT-0l; Thu, 26 Nov 2020 02:55:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC7T-0005Ui-36; Thu, 26 Nov 2020 02:55:14 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ71JM5147890; Thu, 26 Nov 2020 02:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vmynOO0OC8i6baSfxu+2Y4bdfbLG58xZnKltpDHGDf0=;
 b=Y8vNha1f8uBll12MyA8P3H/GRLnHdWFennkkvJ47hjE9aDowVpfRbr7SrGNqrFgsOXP+
 bxaeR4yrGsvCdwF6o1CuULeACmcebZ1avFaSYwRNCYFdIRloCltYCmhtjDY+15RRhyMg
 QCHejjRVO6cF8xh1x3+IfiBNbEMmGVY+U6NB9rHC1WR/OXOfm5PUsxgxMrgxBfBsFn+8
 YIn71Ptif010c/8h52+CL2niO/Zey16DVELNWZ6gmFBak1SXnqVFVIoEWGjdet3nTOKg
 y3C5vec4E9gRMN/rmVuTQt+jztN/RLBdfeN2X/XTSMVivr+A5TRCit1MBdpnO0JvYVbc pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3523k1ebhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:55:05 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AQ7ChY0192222;
 Thu, 26 Nov 2020 02:55:05 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3523k1ebgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:55:05 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ7mpui018630;
 Thu, 26 Nov 2020 07:55:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 34xth8asgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 07:55:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ7t1ih8651386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 07:55:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D3A11C05B;
 Thu, 26 Nov 2020 07:55:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE12111C050;
 Thu, 26 Nov 2020 07:54:59 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 07:54:59 +0000 (GMT)
Subject: [RFC PATCH 1/2] spapr: drc: Add support for async hcalls at the drc
 level
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Thu, 26 Nov 2020 01:54:55 -0600
Message-ID: <160637728389.1977658.13576068142432992889.stgit@lep8c.aus.stglabs.ibm.com>
In-Reply-To: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
References: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_01:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=2
 malwarescore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260037
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: shivaprasadbhat@gmail.com, bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds support for async hcalls at the DRC level for the
spapr devices. To be used by spapr-scm devices in the patch/es to follow.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/ppc/spapr_drc.c         |  146 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_drc.h |   25 ++++++++
 2 files changed, 171 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 77718cde1f..2cecccf701 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -15,6 +15,7 @@
 #include "qapi/qmp/qnull.h"
 #include "cpu.h"
 #include "qemu/cutils.h"
+#include "qemu/guest-random.h"
 #include "hw/ppc/spapr_drc.h"
 #include "qom/object.h"
 #include "migration/vmstate.h"
@@ -421,6 +422,145 @@ void spapr_drc_detach(SpaprDrc *drc)
     spapr_drc_release(drc);
 }
 
+
+/*
+ * @drc : device DRC targetting which the async hcalls to be made.
+ *
+ * All subsequent requests to run/query the status should use the
+ * unique token returned here.
+ */
+uint64_t spapr_drc_get_new_async_hcall_token(SpaprDrc *drc)
+{
+    Error *err = NULL;
+    uint64_t token;
+    SpaprDrcDeviceAsyncHCallState *tmp, *next, *state;
+
+    state = g_malloc0(sizeof(*state));
+    state->pending = true;
+
+    qemu_mutex_lock(&drc->async_hcall_states_lock);
+retry:
+    if (qemu_guest_getrandom(&token, sizeof(token), &err) < 0) {
+        error_report_err(err);
+        g_free(state);
+        return 0;
+    }
+
+    if (!token) /* Token should be non-zero */
+        goto retry;
+
+    if (!QLIST_EMPTY(&drc->async_hcall_states)) {
+        QLIST_FOREACH_SAFE(tmp, &drc->async_hcall_states, node, next) {
+            if (tmp->continue_token == token) {
+                /* If the token already in use, get a new one */
+                goto retry;
+            }
+        }
+    }
+
+    state->continue_token = token;
+    QLIST_INSERT_HEAD(&drc->async_hcall_states, state, node);
+
+    qemu_mutex_unlock(&drc->async_hcall_states_lock);
+
+    return state->continue_token;
+}
+
+static void *spapr_drc_async_hcall_runner(void *opaque)
+{
+    int response = -1;
+    SpaprDrcDeviceAsyncHCallState *state = opaque;
+
+    /*
+     * state is freed only after this thread finishes(after pthread_join()),
+     * don't worry about it becoming NULL.
+     */
+
+    response = state->func(state->data);
+
+    state->hcall_ret = response;
+    state->pending = 0;
+
+    return NULL;
+}
+
+/*
+ * @drc  : device DRC targetting which the async hcalls to be made.
+ * token : The continue token to be used for tracking as recived from
+ *         spapr_drc_get_new_async_hcall_token
+ * @func() : the worker function which needs to be executed asynchronously
+ * @data : data to be passed to the asynchronous function. Worker is supposed
+ *         to free/cleanup the data that is passed here
+ */
+void spapr_drc_run_async_hcall(SpaprDrc *drc, uint64_t token,
+                               SpaprDrcAsyncHcallWorkerFunc *func, void *data)
+{
+    SpaprDrcDeviceAsyncHCallState *state, *next;
+
+    qemu_mutex_lock(&drc->async_hcall_states_lock);
+    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
+        if (state->continue_token == token) {
+            state->func = func;
+            state->data = data;
+            qemu_thread_create(&state->thread, "sPAPR Async HCALL",
+                               spapr_drc_async_hcall_runner, state,
+                               QEMU_THREAD_JOINABLE);
+            break;
+        }
+    }
+    qemu_mutex_unlock(&drc->async_hcall_states_lock);
+}
+
+/*
+ * spapr_drc_finish_async_hcalls
+ *      Waits for all pending async requests to complete
+ *      thier execution and free the states
+ */
+static void spapr_drc_finish_async_hcalls(SpaprDrc *drc)
+{
+    SpaprDrcDeviceAsyncHCallState *state, *next;
+
+    if (QLIST_EMPTY(&drc->async_hcall_states)) {
+        return;
+    }
+
+    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
+        qemu_thread_join(&state->thread);
+        QLIST_REMOVE(state, node);
+        g_free(state);
+    }
+}
+
+/*
+ * spapr_drc_get_async_hcall_status
+ *      Fetches the status of the hcall worker and returns H_BUSY
+ *      if the worker is still running.
+ */
+int spapr_drc_get_async_hcall_status(SpaprDrc *drc, uint64_t token)
+{
+    int ret = H_PARAMETER;
+    SpaprDrcDeviceAsyncHCallState *state, *node;
+
+    qemu_mutex_lock(&drc->async_hcall_states_lock);
+    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, node) {
+        if (state->continue_token == token) {
+            if (state->pending) {
+                ret = H_BUSY;
+                break;
+            } else {
+                ret = state->hcall_ret;
+                qemu_thread_join(&state->thread);
+                QLIST_REMOVE(state, node);
+                g_free(state);
+                break;
+            }
+        }
+    }
+    qemu_mutex_unlock(&drc->async_hcall_states_lock);
+
+    return ret;
+}
+
 void spapr_drc_reset(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
@@ -448,6 +588,7 @@ void spapr_drc_reset(SpaprDrc *drc)
         drc->ccs_offset = -1;
         drc->ccs_depth = -1;
     }
+    spapr_drc_finish_async_hcalls(drc);
 }
 
 static bool spapr_drc_unplug_requested_needed(void *opaque)
@@ -558,6 +699,7 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
     drc->owner = owner;
     prop_name = g_strdup_printf("dr-connector[%"PRIu32"]",
                                 spapr_drc_index(drc));
+
     object_property_add_child(owner, prop_name, OBJECT(drc));
     object_unref(OBJECT(drc));
     qdev_realize(DEVICE(drc), NULL, NULL);
@@ -577,6 +719,10 @@ static void spapr_dr_connector_instance_init(Object *obj)
     object_property_add(obj, "fdt", "struct", prop_get_fdt,
                         NULL, NULL, NULL);
     drc->state = drck->empty_state;
+
+    qemu_mutex_init(&drc->async_hcall_states_lock);
+    QLIST_INIT(&drc->async_hcall_states);
+
 }
 
 static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 165b281496..77f6e4386c 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -18,6 +18,7 @@
 #include "sysemu/runstate.h"
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
+#include "block/thread-pool.h"
 
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
 #define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
@@ -168,6 +169,21 @@ typedef enum {
     SPAPR_DRC_STATE_PHYSICAL_CONFIGURED = 8,
 } SpaprDrcState;
 
+typedef struct SpaprDrc SpaprDrc;
+
+typedef int SpaprDrcAsyncHcallWorkerFunc(void *opaque);
+typedef struct SpaprDrcDeviceAsyncHCallState {
+    uint64_t continue_token;
+    bool pending;
+
+    int hcall_ret;
+    SpaprDrcAsyncHcallWorkerFunc *func;
+    void *data;
+
+    QemuThread thread;
+
+    QLIST_ENTRY(SpaprDrcDeviceAsyncHCallState) node;
+} SpaprDrcDeviceAsyncHCallState;
 typedef struct SpaprDrc {
     /*< private >*/
     DeviceState parent;
@@ -182,6 +198,10 @@ typedef struct SpaprDrc {
     int ccs_offset;
     int ccs_depth;
 
+    /* async hcall states */
+    QemuMutex async_hcall_states_lock;
+    QLIST_HEAD(, SpaprDrcDeviceAsyncHCallState) async_hcall_states;
+
     /* device pointer, via link property */
     DeviceState *dev;
     bool unplug_requested;
@@ -241,6 +261,11 @@ void spapr_drc_detach(SpaprDrc *drc);
 /* Returns true if a hot plug/unplug request is pending */
 bool spapr_drc_transient(SpaprDrc *drc);
 
+uint64_t spapr_drc_get_new_async_hcall_token(SpaprDrc *drc);
+void spapr_drc_run_async_hcall(SpaprDrc *drc, uint64_t token,
+                               SpaprDrcAsyncHcallWorkerFunc, void *data);
+int spapr_drc_get_async_hcall_status(SpaprDrc *drc, uint64_t token);
+
 static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
 {
     return drc->unplug_requested;



