Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F45FCA8E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:24:42 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigPJ-0006B7-B6
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigML-00025p-M5
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:37 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMJ-0001xl-1l
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:36 -0400
Received: by mail-qk1-x731.google.com with SMTP id j21so8801539qkk.9
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1SK3FmyWNNpw6G4y43Kwb7gIJPzDAfBnVuIve7TjDc=;
 b=YCbfvvumKlZ3foogMftBxTqiz4dPxgz30svC9SU0NS8mga4dYKAfJTb+RuVmV7x9l5
 EMnzDTHQLU3is/d0Nh1I4e9twSKKTKtcOg2vEGCnVYivy4MMLN30QkDx4CaU6j2VeNv1
 jEm6Kc125d1gpgdBqpb3T7S9iJd38mjBJ5weV5G7WoE7Hixwv3wy9zyA0vdikrB+lfZQ
 aIon6dWDR21EPs7cEQsHFMQuL1YpE9wQEtBL2VQd9y+DMp74uQHg73coBv9Brbq1EFDZ
 VWQS/lw5h9EepMFt2A2oGLYZUfoCVhapE11JDbKC+IXUiv6TzXFk+o9FoDk6MYn05ZFI
 1yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1SK3FmyWNNpw6G4y43Kwb7gIJPzDAfBnVuIve7TjDc=;
 b=3pm1+CiOJ6Ko/DHEnl5FBYnMRwHzfm5eh9fZOX+psoSqbNr6pryVghGb3p7tnFjHR9
 o2knXkcMc4Ws4jiQ6M8+/mqxCW3cNbROO1qGDrfK05v6P3hbk0tcFvIBr+znLwc475Ps
 yY6739nDn7efJVEQmdx76a00dFZIb/xUZfJZ5ZX/an5A41ALyo31lETL+lG/2ACiTxNS
 5SHl4IgvzoJ/WRP2e2xHA3h2rKP+ieezprStnnKJL1HuvMfueYJ9vYmKSAHV5R19dF6H
 98l8VFueFEkeORgqkalsCGzLYig6kIQqegtxzy8pmkgrOapAD1gpOiBlA1+pvVvxBHvH
 Pelw==
X-Gm-Message-State: ACrzQf0oh2X3yk9HmZFJY/PHGqJNeSVTqAs2EgbDy/gRURNfMbV9X/JC
 GCOyQtNIrUsc+bp2ry8KfA==
X-Google-Smtp-Source: AMsMyM4YgSMLUbbpvKx+iRy1VddHfrj7AbV9No4p/XrQY1dXhetAOW5p0z+bSKc/w0picxbfmeZkJg==
X-Received: by 2002:a05:620a:460c:b0:6ce:43e4:4e57 with SMTP id
 br12-20020a05620a460c00b006ce43e44e57mr21474633qkb.778.1665598894116; 
 Wed, 12 Oct 2022 11:21:34 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:33 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 1/5] hw/mem/cxl_type3: fix checkpatch errors
Date: Wed, 12 Oct 2022 14:21:16 -0400
Message-Id: <20221012182120.174142-2-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012182120.174142-1-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x731.google.com
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

This fixes checkpatch errors in the prior commit.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3fa5d70662..94bc439d89 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -56,9 +56,11 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         len++;
 
         /* For now, no memory side cache, plausiblish numbers */
-        dslbis_nonvolatile = g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
-        if (!dslbis_nonvolatile)
+        dslbis_nonvolatile =
+            g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
+        if (!dslbis_nonvolatile) {
             return -ENOMEM;
+        }
 
         dslbis_nonvolatile[0] = (CDATDslbis) {
             .header = {
@@ -85,7 +87,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
             .entry[0] = 25, /* 250ns */
         };
         len++;
-       
+
         dslbis_nonvolatile[2] = (CDATDslbis) {
             .header = {
                 .type = CDAT_TYPE_DSLBIS,
@@ -123,7 +125,8 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
                 .length = sizeof(*dsemts_nonvolatile),
             },
             .DSMAS_handle = nonvolatile_dsmad,
-            .EFI_memory_type_attr = 2, /* Reserved - the non volatile from DSMAS matters */
+            /* Reserved - the non volatile from DSMAS matters */
+            .EFI_memory_type_attr = 2,
             .DPA_offset = 0,
             .DPA_length = int128_get64(mr->size),
         };
@@ -136,7 +139,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
     }
     if (dslbis_nonvolatile) {
-        CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);        
+        CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
         int j;
 
         for (j = 0; j < dslbis_nonvolatile_num; j++) {
@@ -146,7 +149,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     if (dsemts_nonvolatile) {
         (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
     }
-    
+
     return len;
 }
 
-- 
2.37.3


