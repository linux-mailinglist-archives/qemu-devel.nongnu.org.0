Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00F31B033
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:27:06 +0100 (CET)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFYP-0007mV-LN
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVh-0006Qa-8a; Sun, 14 Feb 2021 06:24:17 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBFVe-0005aq-M4; Sun, 14 Feb 2021 06:24:17 -0500
Received: by mail-pl1-x633.google.com with SMTP id r2so2152841plr.10;
 Sun, 14 Feb 2021 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zS5rj1KURitINLUNFiuJdEMGvQFlbQRrmz82b+u1y0w=;
 b=HB0nU8t0vAdg5OVF4yms5eK2RfBkwnC1pB39RXyIvbnZ8P55hW6r7YbnAsvXVtuWwC
 gj1D3REYGBg3m4yJigsdZvgBEBPgoPG2tFiKJaRJ0jroBipkPZ5imX+p+wURTjqZWKVA
 FRS9wPm2WX1zlhm0QeeFSj02wrxlTut4taUn0mg0XHl/C8+2dBmZ4rhIv++k3wJLO4gi
 5lxBkFT1pBDVtQGUfCukxst6CJ2gye5g17QQG9XVVmQi17Cc9UPKRzeF/PDQVDjm/PnK
 b61gBsQoVzJVMfP7iOFM8WhuUtj3Okm6ewWW9Ns6OprYmJzLh53fU30d3fKBM19ZSoLV
 wOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zS5rj1KURitINLUNFiuJdEMGvQFlbQRrmz82b+u1y0w=;
 b=c7+rehbzLqm+Vj52L6OsdVa9PiCe8awfNZhc7NOedoc/KY3qOQA5sWCl2pPdRdnUOq
 AIxPjIqh7oOP5j2g3l0x0ZqD/J+5a4kpMuvZ/CkeatvRFEJ+dmA1SpyXCoIAZkItT+Gs
 MBHcNTR+4NaEkV9AWZ7khqVvXeoYsMnSVNq6VmP+4l3s6XNOifa1RY5yLxFKKCLe4gu4
 jhaWIzgPZxOLO3C/y0jZW5D3OgkyIrMoHwTKjMgR6/LXOfGoDEfV7gpTmnC7OfFVA7tB
 6l1333tpR+ezIPw2LrON1R7xeN/KJazUESVUFGxgY/q3wFbey2jJwyWIIohAR3AzD2VX
 xwcw==
X-Gm-Message-State: AOAM530F6tgpvH8yKurEdIgYfjp9gKVFIDLsbcUsgyQ4/+t/t8Fva15I
 1RxfbAxP2e0Yen3MVk3R83K5aCbG8ZFc3Q==
X-Google-Smtp-Source: ABdhPJxykTNJgYlGCkxYCB+GcMBVhufLhLOJS+s4josb3ZVmixBHaovqDtCOO4jDLtj/LJhRHjxWfw==
X-Received: by 2002:a17:902:d30d:b029:e3:3c2a:3460 with SMTP id
 b13-20020a170902d30db02900e33c2a3460mr5194929plc.0.1613301852618; 
 Sun, 14 Feb 2021 03:24:12 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k24sm14802181pfg.40.2021.02.14.03.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:24:12 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: support Asymmetric Namespace Access(ANA)
Date: Sun, 14 Feb 2021 20:23:59 +0900
Message-Id: <20210214112400.26956-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
References: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently we have been able to introduce multipath I/O with namespace
sharing with a single host.  One of the major feature for the multipath
I/O is Asymmetric Namespace Access: so-called ANA.

Also, the multipath I/O is one of the most major path for the host
system where this feature addition might be helpful to debug for.

This patch introduced ANA scheme to the nvme-subsys, nvme and nvme-ns
device.  `ana` device parameter should be given to true if want want to
support ANA feature for all controllers in the subsystem:

  -device nvme-subsys,id=subsys0,ana=true

This patch also introduced ANA Group which is defined in 8.20.2 ANA
Groups in NVMe 1.4b spec.  ANA Group can be specified by the user with
`ana.grpid` parameter (non-zero value) to nvme-ns device:

  -device nvme-ns,id=ns1,drv=drv1,subsys=subsys0,ana.grpid=1

These relationships are communicated with the host by Get Log Page
command for the ANA information.  The ANA log information is retrieved
based on the relationship between controller and namespace with ANA
group.

This patch does not contain the ANA state transition by the device
itself.  The following patch will support the ANA state transition from
the device side.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c     |  26 ++++++++
 hw/block/nvme-ns.h     |   3 +
 hw/block/nvme-subsys.c |   6 ++
 hw/block/nvme-subsys.h |   6 ++
 hw/block/nvme.c        | 147 ++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h        |  25 +++++++
 include/block/nvme.h   |  50 +++++++++++++-
 7 files changed, 260 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 0e8760020483..1bfc50eb1035 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -75,6 +75,31 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
+int nvme_ns_post_init(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+{
+    NvmeIdNs *id_ns = &ns->id_ns;
+
+    if (n->subsys && !n->subsys->params.ana && ns->params.anagrpid) {
+        error_setg(errp, "anagrpid needs 'ana=true' in nvme subsystem");
+        return -1;
+    }
+
+    if (ns->params.anagrpid && !nvme_ns_shared(ns)) {
+        error_setg(errp, "anagrpid needs nvme-ns device shared");
+        return -1;
+    }
+
+    if (ns->params.anagrpid > n->id_ctrl.anagrpmax) {
+        error_setg(errp,
+                   "anagrpid should be less than %u", n->id_ctrl.anagrpmax);
+        return -1;
+    }
+
+    id_ns->anagrpid = ns->params.anagrpid;
+
+    return 0;
+}
+
 static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 {
     bool read_only;
@@ -417,6 +442,7 @@ static Property nvme_ns_props[] = {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_UINT32("ana.grpid", NvmeNamespace, params.anagrpid, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7af6884862b5..b3ca6176f4ce 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -40,8 +40,10 @@ typedef struct NvmeNamespaceParams {
     uint32_t max_active_zones;
     uint32_t max_open_zones;
     uint32_t zd_extension_size;
+    uint32_t anagrpid;
 } NvmeNamespaceParams;
 
+typedef struct NvmeAna NvmeAna;
 typedef struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
@@ -185,6 +187,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
+int nvme_ns_post_init(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index 641de33e99fc..72fcf4cc6966 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -81,6 +81,11 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
     nvme_subsys_setup(subsys);
 }
 
+static Property nvme_subsys_props[] = {
+    DEFINE_PROP_BOOL("ana", NvmeSubsystem, params.ana, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -89,6 +94,7 @@ static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 
     dc->realize = nvme_subsys_realize;
     dc->desc = "Virtual NVMe subsystem";
+    device_class_set_props(dc, nvme_subsys_props);
 }
 
 static const TypeInfo nvme_subsys_info = {
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index ccf6a71398d3..7d177312e554 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -16,6 +16,10 @@
 #define NVME_SUBSYS_MAX_CTRLS   32
 #define NVME_SUBSYS_MAX_NAMESPACES  32
 
+typedef struct NvmeSubsystemParams {
+    bool     ana;
+} NvmeSubsystemParams;
+
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 typedef struct NvmeSubsystem {
@@ -24,6 +28,8 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+
+    NvmeSubsystemParams params;
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1cd82fa3c9fe..8f5c2c1ab7f7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -27,7 +27,8 @@
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
  *              subsys=<subsys_id>
- *      -device nvme-subsys,id=<subsys_id>
+ *      -device nvme-subsys,id=<subsys_id> \
+ *              ana=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
@@ -102,6 +103,15 @@
  *
  *     zoned.cross_read=<enable RAZB, default: false>
  *         Setting this property to true enables Read Across Zone Boundaries.
+ *
+ * nvme subsystem device parameters
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * - `ana`
+ *   Asymmetric Namesapce Accessing(ANA) feature support.  If true, controller
+ *   will support not only ANA log information by Get Log Page and ANA change,
+ *   but event notification to the host.  It requires `nvme-ns` device have
+ *   `anagrpid` parameter specified with a non-zero value.
+ *
  */
 
 #include "qemu/osdep.h"
@@ -219,6 +229,20 @@ static uint16_t nvme_sqid(NvmeRequest *req)
     return le16_to_cpu(req->sq->sqid);
 }
 
+static inline uint16_t nvme_ana_check_state(uint8_t state)
+{
+    switch (state) {
+    case NVME_ANA_STATE_INACCESSIBLE:
+        return NVME_ANA_INACCESSIBLE;
+    case NVME_ANA_STATE_PERSISTENT_LOSS:
+        return NVME_ANA_PERSISTENT_LOSS;
+    case NVME_ANA_STATE_CHANGE:
+        return NVME_ANA_CHANGE;
+    default:
+        return NVME_SUCCESS;
+    }
+}
+
 static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
                                    NvmeZoneState state)
 {
@@ -2672,6 +2696,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -2713,6 +2738,13 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
+    if (req->ns->params.anagrpid) {
+        status = nvme_ana_check_state(n->ana[req->ns->params.anagrpid].state);
+        if (status) {
+            return status;
+        }
+    }
+
     switch (req->cmd.opcode) {
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
@@ -3013,6 +3045,88 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static void nvme_ana_setup_desc(NvmeCtrl *n, NvmeAna *ana,
+                                NvmeAnagrpDesc *desc, bool rgo)
+{
+    uint32_t *nsids = (uint32_t *)(((uint8_t *)desc) + 32);
+    uint32_t nsid;
+    int i = 0;
+
+    desc->grpid = ana->grpid;
+    desc->nr_nsid = nvme_ana_nr_ns(ana);
+    desc->change_count = n->ana_change_count;
+    desc->state = ana->state;
+
+    if (rgo) {
+        return;
+    }
+
+    for (nsid = 1; nsid < NVME_ANA_NSID_BITMAP_SIZE; nsid++) {
+        if (nvme_ana_has_ns(ana, nsid)) {
+            nsids[i++] = nsid;
+        }
+    }
+}
+
+static uint16_t nvme_ana_info(NvmeCtrl *n, uint8_t rae, uint8_t lsp,
+                              uint32_t buf_len, uint64_t off, NvmeRequest *req)
+{
+    NvmeAnaLog *log;
+    NvmeAnagrpDesc *desc;
+    uint8_t rgo = lsp & 1;
+    uint32_t grpid;
+    NvmeAna *ana;
+    uint16_t nr_descs = 0;
+    size_t size, offset;
+    uint16_t status;
+
+    if (!n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    size = sizeof(NvmeAnaLog) +
+            sizeof(NvmeAnagrpDesc) * ARRAY_SIZE(n->ana) +
+            4 * NVME_ANA_NSID_BITMAP_SIZE * ARRAY_SIZE(n->ana);
+    offset = sizeof(NvmeAnaLog);
+
+    log = g_malloc(size);
+
+    for (grpid = 0; grpid < ARRAY_SIZE(n->ana); grpid++) {
+        uint32_t nsid;
+
+        ana = &n->ana[grpid];
+
+        for (nsid = 1; nsid < NVME_ANA_NSID_BITMAP_SIZE; nsid++) {
+            if (nvme_ana_has_ns(ana, nsid) && nvme_ns(n, nsid)) {
+                desc = (NvmeAnagrpDesc *)((void *)log + offset);
+
+                offset += sizeof(NvmeAnagrpDesc);
+                if (!rgo) {
+                    offset += 4 * nvme_ana_nr_ns(ana);
+                }
+
+                nvme_ana_setup_desc(n, ana, desc, rgo);
+                nr_descs++;
+                break;
+            }
+        }
+    }
+
+    log->change_count = n->ana_change_count;
+    log->nr_anagrp_desc = nr_descs;
+
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
+    }
+
+    status = nvme_dma(n, ((uint8_t *)log) + off, MIN(size - off, buf_len),
+                      DMA_DIRECTION_FROM_DEVICE, req);
+
+    g_free(log);
+
+    return status;
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -3059,6 +3173,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_fw_log_info(n, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_ANA:
+        return nvme_ana_info(n, rae, lsp, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4623,6 +4739,8 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
+    uint32_t anagrpid;
+
     n->num_namespaces = NVME_MAX_NAMESPACES;
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
@@ -4633,11 +4751,17 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    for (anagrpid = 1; anagrpid < ARRAY_SIZE(n->ana); anagrpid++) {
+        n->ana[anagrpid].grpid = anagrpid;
+        n->ana[anagrpid].state = NVME_ANA_STATE_OPTIMIZED;
+    }
 }
 
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     uint32_t nsid = nvme_nsid(ns);
+    NvmeAna *ana;
 
     if (nsid > NVME_MAX_NAMESPACES) {
         error_setg(errp, "invalid namespace id (must be between 0 and %d)",
@@ -4664,10 +4788,20 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         }
     }
 
+    if (nvme_ns_post_init(n, ns, errp)) {
+        return -1;
+    }
+
     trace_pci_nvme_register_namespace(nsid);
 
     n->namespaces[nsid - 1] = ns;
 
+    if (ns->params.anagrpid) {
+        ana = &n->ana[ns->params.anagrpid];
+
+        nvme_ana_register_ns(ana, nvme_nsid(ns));
+    }
+
     return 0;
 }
 
@@ -4866,6 +5000,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         id->cmic |= NVME_CMIC_MULTI_CTRL;
     }
 
+    if (n->subsys && n->subsys->params.ana) {
+        id->oaes |= NVME_OAES_ANA;
+        id->cmic |= NVME_CMIC_ANA;
+
+        id->anacap = NVME_ANACAP_ANA_OPTIMIZED |
+            NVME_ANACAP_ANA_INACCESSIBLE |
+            NVME_ANACAP_ANA_CHANGE;
+        id->anagrpmax = NVME_MAX_ANA_GROUP;
+        id->nanagrpid = NVME_MAX_ANA_GROUP;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cb2b5175f1a1..842245d0a845 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -126,6 +126,24 @@ typedef struct NvmeFeatureVal {
     uint32_t    async_config;
 } NvmeFeatureVal;
 
+typedef struct NvmeAna {
+    uint32_t        grpid;
+    uint8_t         state;
+#define NVME_MAX_ANA_GROUP          (NVME_MAX_NAMESPACES)
+#define NVME_ANA_NSID_BITMAP_SIZE   (NVME_MAX_ANA_GROUP + 1)
+    DECLARE_BITMAP(nsids, NVME_ANA_NSID_BITMAP_SIZE);
+} NvmeAna;
+
+static inline void nvme_ana_register_ns(NvmeAna *ana, uint32_t nsid)
+{
+    set_bit(nsid, ana->nsids);
+}
+
+static inline bool nvme_ana_has_ns(NvmeAna *ana, uint32_t nsid)
+{
+    return test_bit(nsid, ana->nsids);
+}
+
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
@@ -174,6 +192,8 @@ typedef struct NvmeCtrl {
     uint8_t     zasl;
 
     NvmeSubsystem   *subsys;
+    NvmeAna         ana[NVME_MAX_NAMESPACES + 1];
+    uint64_t        ana_change_count;
 
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
@@ -208,6 +228,11 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
     return sq->ctrl;
 }
 
+static inline long nvme_ana_nr_ns(NvmeAna *ana)
+{
+    return bitmap_count_one(ana->nsids, NVME_ANA_NSID_BITMAP_SIZE);
+}
+
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 
 #endif /* HW_NVME_H */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b23f3ae2279f..c51fbf845f5a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -759,6 +759,7 @@ typedef struct QEMU_PACKED NvmeCopySourceRange {
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
     NVME_AER_TYPE_SMART                     = 1,
+    NVME_AER_TYPE_NOTICE                    = 2,
     NVME_AER_TYPE_IO_SPECIFIC               = 6,
     NVME_AER_TYPE_VENDOR_SPECIFIC           = 7,
     NVME_AER_INFO_ERR_INVALID_DB_REGISTER   = 0,
@@ -856,6 +857,9 @@ enum NvmeStatusCodes {
     NVME_CMP_FAILURE            = 0x0285,
     NVME_ACCESS_DENIED          = 0x0286,
     NVME_DULB                   = 0x0287,
+    NVME_ANA_PERSISTENT_LOSS    = 0x0301,
+    NVME_ANA_INACCESSIBLE       = 0x0302,
+    NVME_ANA_CHANGE             = 0x0303,
     NVME_MORE                   = 0x2000,
     NVME_DNR                    = 0x4000,
     NVME_NO_COMPLETE            = 0xffff,
@@ -922,6 +926,28 @@ typedef struct NvmeEffectsLog {
     uint8_t     resv[2048];
 } NvmeEffectsLog;
 
+enum NvmeAnaState {
+    NVME_ANA_STATE_OPTIMIZED        = 0x1,
+    NVME_ANA_STATE_NON_OPTIMIZED    = 0x2,
+    NVME_ANA_STATE_INACCESSIBLE     = 0x3,
+    NVME_ANA_STATE_PERSISTENT_LOSS  = 0x4,
+    NVME_ANA_STATE_CHANGE           = 0xf,
+};
+
+typedef struct NvmeAnagrpDesc {
+    uint32_t    grpid;
+    uint32_t    nr_nsid;
+    uint64_t    change_count;
+    uint8_t     state;
+    uint8_t     rsvd17[15];
+} NvmeAnagrpDesc;
+
+typedef struct NvmeAnaLog {
+    uint64_t    change_count;
+    uint16_t    nr_anagrp_desc;
+    uint8_t     rsvd10[6];
+} NvmeAnaLog;
+
 enum {
     NVME_CMD_EFF_CSUPP      = 1 << 0,
     NVME_CMD_EFF_LBCC       = 1 << 1,
@@ -937,6 +963,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_ANA            = 0x0C,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1013,7 +1040,11 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint16_t    mntmt;
     uint16_t    mxtmt;
     uint32_t    sanicap;
-    uint8_t     rsvd332[180];
+    uint8_t     rsvd332[11];
+    uint8_t     anacap;
+    uint32_t    anagrpmax;
+    uint32_t    nanagrpid;
+    uint8_t     rsvd352[160];
     uint8_t     sqes;
     uint8_t     cqes;
     uint16_t    maxcmd;
@@ -1047,6 +1078,10 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_FW        = 1 << 2,
 };
 
+enum NvmeIdCtrlOaes {
+    NVME_OAES_ANA       = 1 << 11,
+};
+
 enum NvmeIdCtrlOncs {
     NVME_ONCS_COMPARE       = 1 << 0,
     NVME_ONCS_WRITE_UNCORR  = 1 << 1,
@@ -1082,6 +1117,15 @@ enum NvmeIdCtrlLpa {
 
 enum NvmeIdCtrlCmic {
     NVME_CMIC_MULTI_CTRL    = 1 << 1,
+    NVME_CMIC_ANA           = 1 << 3,
+};
+
+enum NvmeIdCtrlAnacap {
+    NVME_ANACAP_ANA_OPTIMIZED       = 1 << 0,
+    NVME_ANACAP_ANA_NON_OPTIMIZED   = 1 << 1,
+    NVME_ANACAP_ANA_INACCESSIBLE    = 1 << 2,
+    NVME_ANACAP_ANA_PERSISTENT_LOSS = 1 << 3,
+    NVME_ANACAP_ANA_CHANGE          = 1 << 4,
 };
 
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
@@ -1224,7 +1268,9 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    mssrl;
     uint32_t    mcl;
     uint8_t     msrc;
-    uint8_t     rsvd81[23];
+    uint8_t     rsvd81[11];
+    uint32_t    anagrpid;
+    uint8_t     rsvd96[8];
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
-- 
2.17.1


