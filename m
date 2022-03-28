Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20A4EA249
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:18:09 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwkZ-0004NT-Ue
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:18:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiL-0001XP-3V
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:49 -0400
Received: from [2a00:1450:4864:20::22f] (port=40893
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiJ-0003p5-94
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:48 -0400
Received: by mail-lj1-x22f.google.com with SMTP id g24so20947069lja.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/qWJafsiGLISrirR9TpiO6oI2wNp5jh8NKPrpO9D6Y=;
 b=RqN4tQztKbFzCIC6ZO3yl9XrwK4leQvHMyNb4Ie1wQp1MrIXdWkEqOKB1fTQTKNZkI
 DYkohGvtXLOD5pX8wqVJW9ksbP1PpA/aIdVFdLh0maSaoP2p7QWWb5R9f26C7/zNnGt9
 eAY6TBuTEOQvVj9S9sJCDiTneHlSyZZwj8ojGQsliPqqeIXEXGCTYN6w2SOZxHlJ8IXr
 X1H46Pv2yegFhWHEUVoAck0uCuwS2UkJ5tBWCbxOeCeFrrpmtVCrapexFIWiUB+s3evj
 HMsmVc4UTu95ZAo6LvukO10JFupuqm6o5aX0BO0rIa/P3bbMyTKy1ChnadYJSt7ePUi1
 PmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/qWJafsiGLISrirR9TpiO6oI2wNp5jh8NKPrpO9D6Y=;
 b=mtukv5BsmqNCCnGtAX7cyO/4aNkycum8r/AlHuTYD5uBSEH/bu7Bk5Lw+ICU0aA2Rq
 b+eOpVFY/HbnLq5VK6d5Ph0NOQ5xGBswYf1bOmed4Qtj26Exjy9KlyIRivxrZmTwgwWf
 2J8PvaUXZdC6oxM0HdRTzwUvNHDBlWBczvEwPjJG6IbyD8b27M2ebgLK4HxmdEIAez74
 MXOTbnhEdM77BgpQ3MlvF5uTT8U7zcUi82EtIVIMH7ZNIsfQma1VBMVHtV5rnfIL20jK
 znyQcLKhLExCOOph4nq9nVomCcF05Ua9hAxXGvR80DoGXL74whEzerdCWUK+U4F1VPQq
 zfgg==
X-Gm-Message-State: AOAM531P8jwOD/I3Mwm+j4waGytw+SJ2xdsn2FK7Ubepd2UNaaREr2mw
 mBF2bPNFJWxEMFWLyOy+g+kZI3Liqn76uA==
X-Google-Smtp-Source: ABdhPJzUmT+E149adL/v7Zw6fNhchFirVLbFB51wklkrN3MRtV3N0kWH3U0r35lvAtFfPd92YuKxcQ==
X-Received: by 2002:a05:651c:1699:b0:24a:d5a0:bfb2 with SMTP id
 bd25-20020a05651c169900b0024ad5a0bfb2mr1931657ljb.30.1648502145826; 
 Mon, 28 Mar 2022 14:15:45 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:45 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/9] mem: appropriate handling getting mem region
Date: Tue, 29 Mar 2022 00:15:33 +0300
Message-Id: <20220328211539.90170-4-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempt to get memory region if the device doesn't have hostmem may not be
an error. This can be happen immediately after initialization (getting
value without default one).

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 hw/i386/sgx-epc.c | 5 ++++-
 hw/mem/nvdimm.c   | 6 ++++++
 hw/mem/pc-dimm.c  | 5 +++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index d664829d35..1a4c8acdcc 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -121,9 +121,12 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
 {
     SGXEPCDevice *epc = SGX_EPC(md);
     HostMemoryBackend *hostmem;
+    DeviceState *dev = DEVICE(epc);
 
     if (!epc->hostmem) {
-        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
+        if (dev->realized) {
+            error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
+        }
         return NULL;
     }
 
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7c7d777781..61e77e5476 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -166,9 +166,15 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
                                                  Error **errp)
 {
     NVDIMMDevice *nvdimm = NVDIMM(md);
+    PCDIMMDevice *dimm = PC_DIMM(nvdimm);
     Error *local_err = NULL;
 
     if (!nvdimm->nvdimm_mr) {
+        /* Not error if we try get memory region after init */
+        if (!dimm->hostmem) {
+            return NULL;
+        }
+
         nvdimm_prepare_memory_region(nvdimm, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index f27e1a11ba..6fd74de97f 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -240,6 +240,11 @@ static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
 static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
                                                   Error **errp)
 {
+    PCDIMMDevice *dimm = PC_DIMM(md);
+    /* Not error if we try get memory region after init */
+    if (!dimm->hostmem) {
+        return NULL;
+    }
     return pc_dimm_get_memory_region(PC_DIMM(md), errp);
 }
 
-- 
2.31.1


