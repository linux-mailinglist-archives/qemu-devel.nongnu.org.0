Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C9637D69
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdJ-0002f5-Ly; Thu, 24 Nov 2022 10:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd5-0002Ns-Qq; Thu, 24 Nov 2022 10:59:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd3-0005Ip-Le; Thu, 24 Nov 2022 10:59:11 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 35D4140311;
 Thu, 24 Nov 2022 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1669305542; x=1671119943; bh=TyDsjRjeQub7YIZdTGQR9xxCB
 bJwRxPEqnZOuMpHouQ=; b=JP5GyAyP/aqpRpQMTudINdRjfsfDVLX0fseNp/gBh
 XGekNELD4Q0BS1qCGQCMyUAK15tZjsywOnA5qZJVyycXmulzsULht3QQcRbAFJnb
 WlOgzw6YX61ZsqZ6qouZG2k/hWBrhYusYoFX5gTIhzeIH1xQ0APcv6USLKEIuyxy
 ZE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSVwTlhnNwLv; Thu, 24 Nov 2022 18:59:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E51DE4014D;
 Thu, 24 Nov 2022 18:59:02 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:59:02 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:59:01 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 3/5] hw/nvme: add protection information pass parameter
Date: Thu, 24 Nov 2022 18:58:19 +0300
Message-ID: <20221124155821.1501969-4-d.tihov@yadro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124155821.1501969-1-d.tihov@yadro.com>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Allow namespace to enable pass-through of protection information
between guest and integrity capable BlockBackend.

Signed-off-by: Dmitry Tihov <d.tihov@yadro.com>
---
 hw/nvme/ns.c   | 59 +++++++++++++++++++++++++++++++++++++++++++++-----
 hw/nvme/nvme.h |  2 ++
 2 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..da0cff71f8 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -35,7 +35,11 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     ns->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
     ns->lbasz = 1 << ns->lbaf.ds;
 
-    nlbas = ns->size / (ns->lbasz + ns->lbaf.ms);
+    if (ns->pip) {
+        nlbas = ns->size / (ns->lbasz);
+    } else {
+        nlbas = ns->size / (ns->lbasz + ns->lbaf.ms);
+    }
 
     id_ns->nsze = cpu_to_le64(nlbas);
 
@@ -60,17 +64,22 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     static uint64_t ns_count;
     NvmeIdNs *id_ns = &ns->id_ns;
     NvmeIdNsNvm *id_ns_nvm = &ns->id_ns_nvm;
+    BlockDriverInfo bdi;
     uint8_t ds;
     uint16_t ms;
-    int i;
+    int i, ret;
+
+    ns->pip = ns->params.pip;
 
     ns->csi = NVME_CSI_NVM;
     ns->status = 0x0;
 
     ns->id_ns.dlfeat = 0x1;
 
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
+    if (!ns->pip) {
+        /* support DULBE and I/O optimization fields */
+        id_ns->nsfeat |= (0x4 | 0x10);
+    }
 
     if (ns->params.shared) {
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
@@ -89,7 +98,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->eui64 = cpu_to_be64(ns->params.eui64);
 
     ds = 31 - clz32(ns->blkconf.logical_block_size);
-    ms = ns->params.ms;
+    if (ns->pip) {
+        ms = 8;
+    } else {
+        ms = ns->params.ms;
+    }
 
     id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
@@ -105,6 +118,14 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     ns->pif = ns->params.pif;
 
+    if (ns->pip) {
+        ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
+        if (ret >= 0) {
+            id_ns->dps = bdi.protection_type;
+            ns->pif = NVME_PI_GUARD_16;
+        }
+    }
+
     static const NvmeLBAF lbaf[16] = {
         [0] = { .ds =  9           },
         [1] = { .ds =  9, .ms =  8 },
@@ -380,13 +401,38 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
 {
     unsigned int pi_size;
+    BlockDriverInfo bdi;
+    int ret;
 
     if (!ns->blkconf.blk) {
         error_setg(errp, "block backend not configured");
         return -1;
     }
 
-    if (ns->params.pi) {
+    if (ns->params.pip) {
+        if (ns->params.mset) {
+            error_setg(errp, "invalid mset parameter, metadata must be "
+                "stored in a separate buffer to use integrity passthrough");
+            return -1;
+        }
+        ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
+        if (ret < 0) {
+            error_setg(errp, "could not determine host block device"
+                       " integrity information");
+            return -1;
+        }
+        if (!bdi.protection_type) {
+            error_setg(errp, "nvme-ns backend block device does not"
+                       " support integrity passthrough");
+            return -1;
+        }
+        if (bdi.protection_interval != ns->blkconf.logical_block_size) {
+            error_setg(errp, "logical block size parameter (%u bytes) must be"
+                " equal to protection information interval (%u bytes)",
+                ns->blkconf.logical_block_size, bdi.protection_interval);
+            return -1;
+        }
+    } else if (ns->params.pi) {
         if (ns->params.pi > NVME_ID_NS_DPS_TYPE_3) {
             error_setg(errp, "invalid 'pi' value");
             return -1;
@@ -623,6 +669,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
     DEFINE_PROP_UINT8("pil", NvmeNamespace, params.pil, 0),
     DEFINE_PROP_UINT8("pif", NvmeNamespace, params.pif, 0),
+    DEFINE_PROP_BOOL("pip", NvmeNamespace, params.pip, false),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..4876670d26 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -109,6 +109,7 @@ typedef struct NvmeNamespaceParams {
     uint8_t  pi;
     uint8_t  pil;
     uint8_t  pif;
+    bool     pip;
 
     uint16_t mssrl;
     uint32_t mcl;
@@ -143,6 +144,7 @@ typedef struct NvmeNamespace {
     uint16_t     status;
     int          attached;
     uint8_t      pif;
+    bool         pip;
 
     struct {
         uint16_t zrwas;
-- 
2.38.1


