Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF73170B6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:55:30 +0100 (CET)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9vaD-0004N4-Af
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vYE-00030d-RC; Wed, 10 Feb 2021 14:53:26 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vYD-0006fl-0h; Wed, 10 Feb 2021 14:53:26 -0500
Received: by mail-pj1-x102c.google.com with SMTP id nm1so1732168pjb.3;
 Wed, 10 Feb 2021 11:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qWyO5oU2O33u8vG+uU5qxpqj3X52/CYYlbOsr1K53FU=;
 b=qnX3MP5LCOre7LqAEL7tiVXKwm4iRxX6NDv9UHLQWJZA2tNNw+xLFeplkmjiJgvHvD
 DvyLzngsmC2Y/0kIeVw/+Ui2CgTi5fMRRGePAvuvjhziDnh+/bPs9I8GoLom9hdtIPDb
 dW5u0t4MwpzK64KqA9Q0mHV357JZbamcPvnXuCTsLOb5b/IMNYJcJuEdWCjv0NyWz/AS
 zg+iysObpP2Awn6yDrABHDx/nLPMM6jp/G8DGvxo7nBwQp7jM6l0iqiAhvx38vQkNUm/
 KAFMY29FlRUdASsw6HYzWwJGubFIbOYukOLT/eZjEhpiJ6D8WCeuEUul6/t8Jdk8OMpP
 mwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qWyO5oU2O33u8vG+uU5qxpqj3X52/CYYlbOsr1K53FU=;
 b=Gr0cC8xtxAZ2/2/ezZXrUqU5ASXBKghlGj0u2cTrZ5BWtBuCmVFD8tKp2Hac5lyEvl
 byWNpt4xLjzvcxXzhGL95AisYsL782uEFFGvoLsOIT1IKGkzsn5/8qbv47eh9vDHlR89
 1pnCG3weCra10NLCDqRoym5WOp+e6pfXtQ8upxxPmFABr92T+Wh+VL9ta8oMPIB8uHUg
 1f3GMOdTE37eljgUAfE8SFcQypgtmaQOT5q713j2KPEPMdKS68ATe0F/1xE0mxh6kVzj
 EvP/5+F8gPDQZ8HnDiXCj/4LACmY5SEvXTnk7jDIOlQ9kXxrXU3QIK1llVRtIX+dQOyz
 N3mw==
X-Gm-Message-State: AOAM530VY+D4hpeL2pG/RxXo5PH+x+hFFUiW7Uks8hUW3bz8fsBMU/lT
 KQMlBGT/811Ca2F+URgo7rNE0bY8VS7+tg==
X-Google-Smtp-Source: ABdhPJyWd2NwZV59QqZzyMuWbxlCIy0/lIlL+cJaXAXnCEF+D+qysnGGhd/w1c5rghHHRlF/fnPM3g==
X-Received: by 2002:a17:90b:885:: with SMTP id
 bj5mr485091pjb.195.1612986803002; 
 Wed, 10 Feb 2021 11:53:23 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id e26sm3221773pfm.87.2021.02.10.11.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 11:53:22 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Date: Thu, 11 Feb 2021 04:52:52 +0900
Message-Id: <20210210195252.19339-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_inject_state command is to give a controller state to be.
Human Monitor Interface(HMP) supports users to make controller to a
specified state of:

	normal:			Normal state (no injection)
	cmd-interrupted:	Commands will be interrupted internally

This patch is just a start to give dynamic command from the HMP to the
QEMU NVMe device model.  If "cmd-interrupted" state is given, then the
controller will return all the CQ entries with Command Interrupts status
code.

Usage:
	-device nvme,id=nvme0,....

	(qemu) nvme_inject_state nvme0 cmd-interrupted

	<All the commands will be interrupted internally>

	(qemu) nvme_inject_state nvme0 normal

This feature is required to test Linux kernel NVMe driver for the
command retry feature.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hmp-commands.hx       | 13 ++++++++++++
 hw/block/nvme.c       | 49 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h       |  8 +++++++
 include/monitor/hmp.h |  1 +
 4 files changed, 71 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5dc6..ef288c567b46 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1307,6 +1307,19 @@ SRST
   Inject PCIe AER error
 ERST
 
+    {
+        .name       = "nvme_inject_state",
+        .args_type  = "id:s,state:s",
+        .params     = "id [normal|cmd-interrupted]",
+        .help       = "inject controller/namespace state",
+        .cmd        = hmp_nvme_inject_state,
+    },
+
+SRST
+``nvme_inject_state``
+  Inject NVMe controller/namespace state
+ERST
+
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6d3c554a0e99..42cf5bd113e6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -123,6 +123,7 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "qapi/qmp/qdict.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/block-backend.h"
 #include "exec/memory.h"
@@ -132,6 +133,7 @@
 #include "trace.h"
 #include "nvme.h"
 #include "nvme-ns.h"
+#include "monitor/monitor.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
@@ -966,6 +968,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 {
     assert(cq->cqid == req->sq->cqid);
 
+    /*
+     * Override request status field if controller state has been injected by
+     * the QMP.
+     */
+    if (cq->ctrl->state == NVME_STATE_CMD_INTERRUPTED) {
+        req->status = NVME_COMMAND_INTERRUPTED;
+    }
+
     if (req->status != NVME_SUCCESS) {
         if (cq->ctrl->features.acre && nvme_should_retry(req)) {
             if (cq->ctrl->params.cmd_retry_delay > 0) {
@@ -5025,4 +5035,43 @@ static void nvme_register_types(void)
     type_register_static(&nvme_bus_info);
 }
 
+static void nvme_inject_state(NvmeCtrl *n, NvmeState state)
+{
+    n->state = state;
+}
+
+static const char *nvme_states[] = {
+    [NVME_STATE_NORMAL]             = "normal",
+    [NVME_STATE_CMD_INTERRUPTED]    = "cmd-interrupted",
+};
+
+void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    const char *state = qdict_get_str(qdict, "state");
+    PCIDevice *dev;
+    NvmeCtrl *n;
+    int ret, i;
+
+    ret = pci_qdev_find_device(id, &dev);
+    if (ret < 0) {
+        monitor_printf(mon, "invalid device id %s\n", id);
+        return;
+    }
+
+    n = NVME(dev);
+
+    for (i = 0; i < ARRAY_SIZE(nvme_states); i++) {
+        if (!strcmp(nvme_states[i], state)) {
+            nvme_inject_state(n, i);
+            monitor_printf(mon,
+                           "-device nvme,id=%s: state %s injected\n",
+                           id, state);
+            return;
+        }
+    }
+
+    monitor_printf(mon, "invalid state %s\n", state);
+}
+
 type_init(nvme_register_types)
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 37940b3ac2d2..1af1e0380d9b 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -128,6 +128,11 @@ typedef struct NvmeFeatureVal {
     uint8_t     acre;
 } NvmeFeatureVal;
 
+typedef enum NvmeState {
+    NVME_STATE_NORMAL,
+    NVME_STATE_CMD_INTERRUPTED,
+} NvmeState;
+
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
@@ -185,6 +190,8 @@ typedef struct NvmeCtrl {
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
     NvmeFeatureVal  features;
+
+    NvmeState       state;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
@@ -212,4 +219,5 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
 
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 
+void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
 #endif /* HW_NVME_H */
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18e8..668384ea2e34 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -79,6 +79,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict);
 void hmp_device_add(Monitor *mon, const QDict *qdict);
 void hmp_device_del(Monitor *mon, const QDict *qdict);
 void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
+void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
 void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
-- 
2.17.1


