Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED72F788D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:17:39 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0O2s-0007ou-LC
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0NsF-00082x-IT; Fri, 15 Jan 2021 07:06:39 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Ns5-0003c8-Au; Fri, 15 Jan 2021 07:06:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id cq1so4938673pjb.4;
 Fri, 15 Jan 2021 04:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2TVgfY2rY0wUNOpq9wxeGS8UtroQZj3M0PEyecec2c8=;
 b=qpQnegoqGAwaMot1ezEOcPl3ypc3yyPWyt9+0hnIKFszuUcjj3TRrv1hiYggNTjVl4
 mCvcOtTbhxfZYvilJ8zhtq/G/kwbpmVoKJ2XO/t3xThFW5HR4fs0So+5ywVRHm9/C0Bl
 VZrVH9OOcI9Zvfz5FEFa/rb8S4SyzCDQ3P4cFdprK9hgJX5o51742hWDoK39bQwHs7Rs
 MXkwtWwrihgtO03vZfk9N9gWbJvkq6ZQePFpjLnuFrRW2/JZ1MtZaBQJrBALAoihIzU5
 kNN0p3uqWVgIQatC7+1agum0MdMNDQjjH4w5EZhCzaT1Q825rvcu7s8UZ4w9o8bzCxlK
 zW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2TVgfY2rY0wUNOpq9wxeGS8UtroQZj3M0PEyecec2c8=;
 b=Tqv6/M6JGOqdcvu4LhZBgLA0Q3RgeLaqt1zKI9UzJMwwUUi78iQbQTuVEtF3WE46nv
 ygMn2tF98ko4qsKuLm2DstGoYiW+ucZ5iHYdw9kc5hp4YjpxsqycoxKzs8Dnk+sZ2pWs
 GMUBL2t/azqQOE8UD15xH0zTxgfcwx/oSHvKMzaLjZPtedQYyN5TVJmtZBBsbx7cnrva
 wXorX5qVUsEARQqdBoO5d/ZRPBbs1F4H82bptZNdYpWG6yUR5jXDbaSSdhiHPhWmFDrr
 CBkraGUP+/Y/qZ0PRNuvi2Dqwl+wfyOVcknPxXRj0KfBD7pAWx69WyNiPUUwBastAqKb
 nmhA==
X-Gm-Message-State: AOAM530v/Xfn//DK3wvcCKEh8E6pyWOAa2cxV/dRirGq1n0bZ29kE7vZ
 +vDKyfLZjxXeRDmOzVTphsJvL8e5fCXbqA==
X-Google-Smtp-Source: ABdhPJwQtD4JSpPDfP2g3pokv9pA+dygMvm6E89ZK5eFdljwVY+Ul1PI5zkpdHxvKbDOmgFfioeCSQ==
X-Received: by 2002:a17:902:a512:b029:db:cf4c:336b with SMTP id
 s18-20020a170902a512b02900dbcf4c336bmr12507220plq.17.1610712386929; 
 Fri, 15 Jan 2021 04:06:26 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:26 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 5/5] hw/block/nvme: add namespace sharing param for mpath
Date: Fri, 15 Jan 2021 21:05:58 +0900
Message-Id: <20210115120558.29313-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1034.google.com
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

Added mpath.ns parameter to set multi-namespace bit[0] in NMIC field in
Identify Namespace data structure.  It will indicate that the namespace
can be shared by two or more controllers.

Example:

  To share the namespace between two controllers in a NVM subsystem,
first multi-controllers should be prepared with the same serial:

  -device nvme,id=nvme0,ctrlid=0,serial=foo,...
  -device nvme,id=nvme1,ctrlid=1,serial=foo,...

Then, we can prepare namespace device with mpath.ns enabled.  Also, we
must give the same UUID for those two devices with the same Namespace
ID.

  -device nvme-ns,uuid=<uuid>,bus=nvme0,nsid=1,...
  -device nvme-ns,uuid=<uuid>,bus=nvme1,nsid=1,...

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 14 ++++++++++++--
 hw/block/nvme-ns.h |  2 ++
 hw/block/nvme.c    |  6 ++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 274eaf61b721..cedacda9ebab 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -32,13 +32,18 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
-static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
     NvmeIdNs *id_ns = &ns->id_ns;
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     int npdg;
 
+    if (!n->params.mpath_ctrl && ns->params.mpath_ns) {
+        error_setg(errp, "mpath.ctrl must be enabled for ns sharing");
+        return -1;
+    }
+
     ns->id_ns.dlfeat = 0x9;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
@@ -63,6 +68,10 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->npda = id_ns->npdg = npdg - 1;
 
+    if (ns->params.mpath_ns) {
+        id_ns->nmic |= NVME_NMIC_NS_SHARED;
+    }
+
     return 0;
 }
 
@@ -314,7 +323,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (nvme_ns_init(ns, errp)) {
+    if (nvme_ns_init(n, ns, errp)) {
         return -1;
     }
     if (ns->params.zoned) {
@@ -371,6 +380,7 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_BOOL("mpath.ns", NvmeNamespace, params.mpath_ns, false),
     DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
     DEFINE_PROP_SIZE("zoned.zone_size", NvmeNamespace, params.zone_size_bs,
                      NVME_DEFAULT_ZONE_SIZE),
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index f8f3c28c360b..d1f2518f7210 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -29,6 +29,8 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
 
+    bool     mpath_ns;
+
     bool     zoned;
     bool     cross_zone_read;
     uint64_t zone_size_bs;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 50b349cf9ea3..e4aa15345c12 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -62,6 +62,12 @@
  *   can hold two or more controllers.  This will be reflected to Identify
  *   Controller data structure CMIC[76] field.
  *
+ * Setting `mpath.ctrl` to true enables the following properties to configure
+ * multi-path for a namespace:
+ *     mpath.ns=<true|false, default: false>
+ *         If set to true, namespace sharing in a NVM subsystem is enabled.
+ *         This will be reflected to Identify Namespace data structure.
+ *
  * - `zoned.append_size_limit`
  *   The maximum I/O size in bytes that is allowed in Zone Append command.
  *   The default is 128KiB. Since internally this this value is maintained as
-- 
2.17.1


