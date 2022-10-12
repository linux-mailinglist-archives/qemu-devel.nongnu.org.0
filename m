Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC25FCAA5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:29:17 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigTk-00042v-MV
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMR-0002Iy-09
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:43 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigML-0001yJ-Jq
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:42 -0400
Received: by mail-qt1-x841.google.com with SMTP id a24so3163919qto.10
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/OIjGnZ8Z2MlKUjHTeqka/I/IZvDfiB0NY+oyfcc4s=;
 b=jKIGYrw9yB2dtHKLpXQrIULA63v2EbPdg4/UeDYYJM4iD3Gveqcqjp23FRmJWV2kqg
 t2GCMtaj8F6cbrdKMyYV7Ppszlob1SJw0HPbZ5IzfaGW0KnV5teIc5lH8BsrXNrRlEwq
 qAaJAvULCZAdI0alRR08sii1LGbUv6z6yEHbgiGQPhJ3XjTSNjC021EJW/AKbR1Q0kTh
 tH1c/OiDND6rGM8cqwEq7uyIX/vZZygIGFDLLcjwZS9mNFrvw17Zt36kUxvb55sz+rHK
 rGqOwZt5zbCVdjlvao3LpCQZ6NNO1n3ECYK1x7fWzoEOpqiiE0K2vVqEq+DdbDioO4g5
 fxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/OIjGnZ8Z2MlKUjHTeqka/I/IZvDfiB0NY+oyfcc4s=;
 b=6ZeEuKjJ3RaBOtxJ4qQ20o1wbUNlFUuvaQ6XsRPGa31PD48RL6eLAAD8KLGDusOM67
 822NzDAFbGUpomGnqyCopO4a59KzwFr5euu1AjCM0NztDyCpsReGHscA07heNorLZ6i0
 KV77EFCGuj9DMicDiimzkGQSIEdeFhKZU17LRGlvzXpaVtY8InWUZAM+rCEePQl/U1J9
 eoeOAFic/ovS0Xb3yNW3tQQRhGXhwDiySWNtr6En7IoH4yZc28HQKjZP2rnRJuUoC8zo
 madw757B4s7i8apyPW94QyNUsfgZ9NHDT+abvBB6OR9HT5upqIAb6C3gcK7n4/4xc95t
 /AZw==
X-Gm-Message-State: ACrzQf3WDyBdktf2ZnrRBQCZiPqKTf9dKkr1HgaJyR5A84WZeB1op8f+
 uu3zMqBaWpUIeyeImq8M/Q==
X-Google-Smtp-Source: AMsMyM70tX7LUk3Ti1w2k4JsuhkpWUrgqefoViSwtPtKQUHP1tZJA7Us4c8XwVj7uBL0qfIauHtgEg==
X-Received: by 2002:a05:622a:1754:b0:39c:c5ab:9bdf with SMTP id
 l20-20020a05622a175400b0039cc5ab9bdfmr2549651qtk.618.1665598896712; 
 Wed, 12 Oct 2022 11:21:36 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:36 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 3/5] hw/mem/cxl_type3: CDAT pre-allocate and check resources
 prior to work
Date: Wed, 12 Oct 2022 14:21:18 -0400
Message-Id: <20221012182120.174142-4-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012182120.174142-1-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qt1-x841.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Makes the size of the allocated cdat table static (6 entries),
flattens the code, and reduces the number of exit conditions

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 52 ++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 43b2b9e041..0e0ea70387 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -17,6 +17,7 @@
 #include "hw/pci/msix.h"
 
 #define DWORD_BYTE 4
+#define CT3_CDAT_SUBTABLE_SIZE 6
 
 static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
                                 void *priv)
@@ -25,7 +26,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     g_autofree CDATDslbis *dslbis_nonvolatile = NULL;
     g_autofree CDATDsemts *dsemts_nonvolatile = NULL;
     CXLType3Dev *ct3d = priv;
-    int len = 0;
     int i = 0;
     int next_dsmad_handle = 0;
     int nonvolatile_dsmad = -1;
@@ -33,7 +33,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     MemoryRegion *mr;
 
     if (!ct3d->hostmem) {
-        return len;
+        return 0;
     }
 
     mr = host_memory_backend_get_memory(ct3d->hostmem);
@@ -41,11 +41,22 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         return -EINVAL;
     }
 
+    *cdat_table = g_malloc0(CT3_CDAT_SUBTABLE_SIZE * sizeof(*cdat_table));
+    if (!*cdat_table) {
+        return -ENOMEM;
+    }
+
     /* Non volatile aspects */
     dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
-    if (!dsmas_nonvolatile) {
+    dslbis_nonvolatile =
+        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
+    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
+    if (!dsmas_nonvolatile || !dslbis_nonvolatile || !dsemts_nonvolatile) {
+        g_free(*cdat_table);
+        *cdat_table = NULL;
         return -ENOMEM;
     }
+
     nonvolatile_dsmad = next_dsmad_handle++;
     *dsmas_nonvolatile = (CDATDsmas) {
         .header = {
@@ -57,15 +68,8 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .DPA_base = 0,
         .DPA_length = int128_get64(mr->size),
     };
-    len++;
 
     /* For now, no memory side cache, plausiblish numbers */
-    dslbis_nonvolatile =
-        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
-    if (!dslbis_nonvolatile) {
-        return -ENOMEM;
-    }
-
     dslbis_nonvolatile[0] = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
@@ -77,7 +81,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry_base_unit = 10000, /* 10ns base */
         .entry[0] = 15, /* 150ns */
     };
-    len++;
 
     dslbis_nonvolatile[1] = (CDATDslbis) {
         .header = {
@@ -90,7 +93,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry_base_unit = 10000,
         .entry[0] = 25, /* 250ns */
     };
-    len++;
 
     dslbis_nonvolatile[2] = (CDATDslbis) {
         .header = {
@@ -103,7 +105,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry_base_unit = 1000, /* GB/s */
         .entry[0] = 16,
     };
-    len++;
 
     dslbis_nonvolatile[3] = (CDATDslbis) {
         .header = {
@@ -116,9 +117,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry_base_unit = 1000, /* GB/s */
         .entry[0] = 16,
     };
-    len++;
 
-    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
     *dsemts_nonvolatile = (CDATDsemts) {
         .header = {
             .type = CDAT_TYPE_DSEMTS,
@@ -130,26 +129,19 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .DPA_offset = 0,
         .DPA_length = int128_get64(mr->size),
     };
-    len++;
 
-    *cdat_table = g_malloc0(len * sizeof(*cdat_table));
     /* Header always at start of structure */
-    if (dsmas_nonvolatile) {
-        (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
-    }
-    if (dslbis_nonvolatile) {
-        CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
-        int j;
+    (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
 
-        for (j = 0; j < dslbis_nonvolatile_num; j++) {
-            (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
-        }
-    }
-    if (dsemts_nonvolatile) {
-        (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
+    CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
+    int j;
+    for (j = 0; j < dslbis_nonvolatile_num; j++) {
+        (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
     }
 
-    return len;
+    (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
+
+    return CT3_CDAT_SUBTABLE_SIZE;
 }
 
 static void ct3_free_cdat_table(CDATSubHeader **cdat_table, int num, void *priv)
-- 
2.37.3


