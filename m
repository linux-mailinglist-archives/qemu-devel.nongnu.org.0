Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD0531B034
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:27:11 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFYU-0007zf-Mr
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVk-0006Wt-Ji; Sun, 14 Feb 2021 06:24:20 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVi-0005cZ-Pw; Sun, 14 Feb 2021 06:24:20 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d26so2482797pfn.5;
 Sun, 14 Feb 2021 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T9xIGMkMxOQn26svr/31sCQ2NHYdkUTZA+Sw54VsOoU=;
 b=k5dX/zekec08/hxlgGGl0PyyZasVm7krxyNHXHWSVR1yWRyGswRd0Z8fP1Wi85JJKH
 e23VHXsuAZ5TH/LnV8Je96UwR0ZftgrQJF21yw83eObyHpS09Tn+lbDxyBdU102kpzwS
 2pGrbVGN2QDyAwy0O4I17tTBYinE4tICCiWDN1p+ziaZwmA0RX1TLycWT07D11lPrLhK
 mg/EqNVPUZAGM3kCL3jj3t8CvKHrAdcGGpW4ZSGm736CkjGQfdtu/588jJP9qlz66Qlf
 2slMd4SG2MF/Hwd2tk/YDwloD/U5iYROoYTjjiKV8pAEHIvXyxwicZkn+mOQwHH4imqe
 gpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T9xIGMkMxOQn26svr/31sCQ2NHYdkUTZA+Sw54VsOoU=;
 b=cQr2PZ3bOehfHh87wEiEqZU+sn+5vhZ42YMhKK7epUtW6TY/d2skcalGyS2Tpyiv2C
 1Qww6Z7MG2zSq6CRj1vFOXcOG02EM6uIy7iKLcFJpZNZyeHQpIaHcwUzzStkGeq42WYt
 r6UarqIxnr5RNgIPgjVWQb9DtcVb49EHeLzhxuftc8c09F4eG1yZcVjvatC7q74w13i1
 RfaqNjKrH9HH5oHh4irScqDvZGZJWHFYFgdQe8aYgNx2XuadVQBsa4riyB/byQ2MUQav
 D1NNdDZSttn4/hIZ21cvKFtBmXrIizC31lZ3aN5OrHMmnSbzDSDQN63pZ/JLUstP7K/K
 tGiQ==
X-Gm-Message-State: AOAM530nttvNNvQoEAs/7fq+UxBbeN22Vn/95fdyYF0iK6EOrHyS3C3u
 kcpY+RJEXumjbDxNxFsBtj6icLyhBw40yA==
X-Google-Smtp-Source: ABdhPJzqz3A606CokbEcjSHpwDiUGi27jCkutZkljDfdxY9bPdGPnF+0lBn9bQltUSLL/BgoUoyLvw==
X-Received: by 2002:aa7:96cc:0:b029:1e7:c46b:2954 with SMTP id
 h12-20020aa796cc0000b02901e7c46b2954mr11019389pfq.68.1613301856826; 
 Sun, 14 Feb 2021 03:24:16 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k24sm14802181pfg.40.2021.02.14.03.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:24:16 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: add 'nvme_ana_inject_state' HMP command
Date: Sun, 14 Feb 2021 20:24:00 +0900
Message-Id: <20210214112400.26956-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
References: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42c.google.com
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

Human Monitor Interface(HMP) is there for easy human debugging.  This
patch added a HMP command 'nvme_ana_inject_state'.  This can be executed
from the QEMU monitor.  This command will have the following syntax:

	# nvme_ana_inject_state <nvme-id> <anagrpid> <state>
	(qemu) nvme_ana_inject_state nvme0 1 inaccessible

The example above will make ANA group #1 transitioned to
ANA_INACCESSIBLE state for `nvme0` controller device.  Additionally,
device will notify to the host that ANA has been changed via
Asynchronous Event Notifier(AEN).  Then the host will figure out another
path to I/O for the namespace by reading the log page for ANA
information again, and this is what we call the multipath I/O.

This feature is good to debug the host multipath I/O by controlling the
device ANA group state transition.  The path-related errors can be
tested and debugged by this feature.  Also, the HMP command interafce
will make us not to build QEMU itself again to control things in device.

This interface supports Persistent Loss state transition, but it's not
going to be persistent: volatile of qemu perspective.

Cc: Dr . David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hmp-commands.hx       | 13 ++++++
 hw/block/nvme.c       | 93 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h       |  1 +
 include/block/nvme.h  |  1 +
 include/monitor/hmp.h |  1 +
 5 files changed, 109 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5dc6..5a099191429d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1307,6 +1307,19 @@ SRST
   Inject PCIe AER error
 ERST
 
+    {
+        .name       = "nvme_ana_inject_state",
+        .args_type  = "id:s,grpid:i,state:s",
+        .params     = "id grpid [optimized|non-optimized|inaccessible|change]",
+        .help       = "inject ANA state",
+        .cmd        = hmp_nvme_ana_inject_state,
+    },
+
+SRST
+``nvme_ana_inject_state``
+  Inject ANA state to NVMe subsystem
+ERST
+
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8f5c2c1ab7f7..b40fd3230b8d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -131,6 +131,8 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qapi/qmp/qdict.h"
+#include "monitor/monitor.h"
 #include "trace.h"
 #include "nvme.h"
 #include "nvme-ns.h"
@@ -229,6 +231,46 @@ static uint16_t nvme_sqid(NvmeRequest *req)
     return le16_to_cpu(req->sq->sqid);
 }
 
+static void nvme_notice_event(NvmeCtrl *n, uint8_t event_info);
+static bool nvme_ana_state_change(NvmeCtrl *n, uint32_t grpid, uint8_t state)
+{
+    uint8_t old;
+
+    old = n->ana[grpid].state;
+
+    if (state == old) {
+        return false;
+    }
+
+    n->ana[grpid].state = state;
+    n->ana_change_count++;
+    nvme_notice_event(n, NVME_AER_INFO_ANA_CHANGE);
+
+    return true;
+}
+
+static const char *nvme_ana_states[] = {
+    [NVME_ANA_STATE_OPTIMIZED]          = "optimized",
+    [NVME_ANA_STATE_NON_OPTIMIZED]      = "non-optimized",
+    [NVME_ANA_STATE_INACCESSIBLE]       = "inaccessible",
+    [NVME_ANA_STATE_PERSISTENT_LOSS]    = "persistent-loss",
+    [NVME_ANA_STATE_CHANGE]             = "change",
+};
+
+static inline bool nvme_ana_state_valid(uint8_t state)
+{
+    switch (state) {
+    case NVME_ANA_STATE_OPTIMIZED:
+    case NVME_ANA_STATE_NON_OPTIMIZED:
+    case NVME_ANA_STATE_INACCESSIBLE:
+    case NVME_ANA_STATE_PERSISTENT_LOSS:
+    case NVME_ANA_STATE_CHANGE:
+        return true;
+    default:
+        return false;
+    }
+}
+
 static inline uint16_t nvme_ana_check_state(uint8_t state)
 {
     switch (state) {
@@ -243,6 +285,42 @@ static inline uint16_t nvme_ana_check_state(uint8_t state)
     }
 }
 
+void hmp_nvme_ana_inject_state(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    const uint32_t grpid = qdict_get_int(qdict, "grpid");
+    const char *state = qdict_get_str(qdict, "state");
+    NvmeCtrl *n;
+    DeviceState *dev;
+    int i;
+
+    dev = qdev_find_recursive(sysbus_get_default(), id);
+    if (!dev) {
+        monitor_printf(mon, "%s: invalid device id\n", id);
+        return;
+    }
+
+    if (!grpid) {
+        monitor_printf(mon, "%s: grpid should not be 0\n", id);
+        return;
+    }
+
+    n = NVME(dev);
+
+    for (i = 0; i < ARRAY_SIZE(nvme_ana_states); i++) {
+        if (nvme_ana_state_valid(i) &&
+                !strcmp(nvme_ana_states[i], state)) {
+            if (nvme_ana_state_change(n, grpid, i)) {
+                monitor_printf(mon, "%s: ANA state %s(%d) injected\n",
+                               id, state, i);
+            }
+            return;
+        }
+    }
+
+    monitor_printf(mon, "%s: invalid state %s\n", id, state);
+}
+
 static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
                                    NvmeZoneState state)
 {
@@ -1080,6 +1158,21 @@ static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
     nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
 }
 
+static void nvme_notice_event(NvmeCtrl *n, uint8_t event_info)
+{
+    uint8_t log_page;
+
+    switch (event_info) {
+    case NVME_AER_INFO_ANA_CHANGE:
+        log_page = NVME_LOG_ANA;
+        break;
+    default:
+        return;
+    }
+
+    nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE, event_info, log_page);
+}
+
 static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
 {
     n->aer_mask &= ~(1 << event_type);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 842245d0a845..1a1a022dad0a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -234,5 +234,6 @@ static inline long nvme_ana_nr_ns(NvmeAna *ana)
 }
 
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+void hmp_nvme_ana_inject_state(Monitor *mon, const QDict *qdict);
 
 #endif /* HW_NVME_H */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index c51fbf845f5a..b27dd8eab7e9 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -771,6 +771,7 @@ enum NvmeAsyncEventRequest {
     NVME_AER_INFO_SMART_RELIABILITY         = 0,
     NVME_AER_INFO_SMART_TEMP_THRESH         = 1,
     NVME_AER_INFO_SMART_SPARE_THRESH        = 2,
+    NVME_AER_INFO_ANA_CHANGE                = 3,
 };
 
 typedef struct QEMU_PACKED NvmeAerResult {
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18e8..cbeaf7935900 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_nvme_ana_inject_state(Monitor *mon, const QDict *qdict);
 
 #endif
-- 
2.17.1


