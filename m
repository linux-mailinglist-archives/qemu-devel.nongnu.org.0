Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E0399C9A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:30:36 +0200 (CEST)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loikN-0007Eq-6r
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid1-0006HY-CF; Thu, 03 Jun 2021 04:22:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41225 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicx-0008Th-Rq; Thu, 03 Jun 2021 04:22:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l5R7Wz9sXN; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=qSqThnA6qWmGtCDIOnPS/P5u6HYvRVsnuAh98ZijRw0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oIBfOa7zevAyUyP1ZlEYUwEoJ1EE0AFApHdrPtEQ0IkRaKjcHpb6dfj/LcLX+UHZi
 AKI7A5rSk79eF572Bb2xhGr2v0QY/lufk0YTulXkU5Cx8QKS1tzhvhwGYAK29Z1W0D
 5bTRJag+2Jw5pkKHE9cBHJ2IB8gOIWaMNLvqxevI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/42] spapr: nvdimm: Fix the persistent-memory root node name
 in device tree
Date: Thu,  3 Jun 2021 18:21:57 +1000
Message-Id: <20210603082231.601214-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

The FDT code is adding the pmem root node by name "persistent-memory"
which should have been "ibm,persistent-memory".

The linux fetches the device tree nodes by type and it has been working
correctly as the type is correct. If someone searches by its intended
name it would fail, so fix that.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-Id: <162204278956.219.9061511386011411578.stgit@cc493db1e665>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_nvdimm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 3f57a8b6fa..91de1052f2 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -175,11 +175,11 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 
 void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt)
 {
-    int offset = fdt_subnode_offset(fdt, 0, "persistent-memory");
+    int offset = fdt_subnode_offset(fdt, 0, "ibm,persistent-memory");
     GSList *iter, *nvdimms = nvdimm_get_device_list();
 
     if (offset < 0) {
-        offset = fdt_add_subnode(fdt, 0, "persistent-memory");
+        offset = fdt_add_subnode(fdt, 0, "ibm,persistent-memory");
         _FDT(offset);
         _FDT((fdt_setprop_cell(fdt, offset, "#address-cells", 0x1)));
         _FDT((fdt_setprop_cell(fdt, offset, "#size-cells", 0x0)));
-- 
2.31.1


