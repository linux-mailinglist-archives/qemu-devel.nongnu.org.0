Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9676A7CCC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:35:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHg-00076Z-SE; Thu, 02 Mar 2023 03:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHH-0005hb-0F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHE-0002cw-Hj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7sh8dSfop4p9UJ3T0MvZ2cmCfp1xzBPVgRTzyaj5hc4=;
 b=cfAYkMAdgPDfp2GBapxtPWQVA6nBAlHaSKC3OzV9dv/wafdRA5mYlDlsP5E+zyuIVnGdh8
 Gi/Su+xk2Jv0SU1pGIbsSyx/iWvkn5dbbWM2n+YrKqGvaWk0SkTPaE3TEEtCtPsA0CUOBr
 7KLx+QYLwyXqdD1UkK0DMC5xoHCSFvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-TY3Z7dYiMm6AaWErYNf2qA-1; Thu, 02 Mar 2023 03:26:58 -0500
X-MC-Unique: TY3Z7dYiMm6AaWErYNf2qA-1
Received: by mail-wm1-f71.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so924753wmj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sh8dSfop4p9UJ3T0MvZ2cmCfp1xzBPVgRTzyaj5hc4=;
 b=zK3ebiudUGBJ92SPJex9BkGWauK+pHSn7hNaJp4tDUt22H424s69zd8r+HiAKYH8if
 W6AgyCVKN7pLKwz0bxfki4geVcFTzHt0IUBDlffDBZdraFsEDS6w1cmoiWlHl09nSRAu
 2C836ukjXti7k0haXW1R2EAw5eqou8hdc39rk8dZVqnFJjbxHfSoJXtD21lpM47JdxFY
 zC/fb3jK602JTSUc1FNeFrfa73GKY6vsrWsIdyN26iwkXyxjKGnbsuhbRHI1k0dZiYBA
 8YLcLbQItJ3xZqib3FQJd7Y6DozwNCQDLrp5KZNyQYS7nqbX0ZI00KXeIKpQ+y52yU0l
 qLgg==
X-Gm-Message-State: AO0yUKWozctvgKmYptGJof5w75yY9INwE7u4GTh4vw8s8/n7jnhTWzrU
 +HbxX2KvTdpYAotWukoQkV/9E4ngubuQtsuV3TwTUj0buzMz5VTwLSBrAqozg0gUy/V7+5fFvRz
 s9WgaM6x16KUUYwyz6Boe8AvEKrO16BtishjxtZS91mm9bVEuk2gWli56zUTRJAfqpw==
X-Received: by 2002:a05:600c:4a9f:b0:3eb:3908:8541 with SMTP id
 b31-20020a05600c4a9f00b003eb39088541mr6588281wmp.2.1677745617139; 
 Thu, 02 Mar 2023 00:26:57 -0800 (PST)
X-Google-Smtp-Source: AK7set80Ovf/bCv5bvVqVYbewAS/emBOgZ1D3xldmH6cE5Nl4BcD8Z1i7NmXxt/fKLvWtFQDmMwazw==
X-Received: by 2002:a05:600c:4a9f:b0:3eb:3908:8541 with SMTP id
 b31-20020a05600c4a9f00b003eb39088541mr6588260wmp.2.1677745616805; 
 Thu, 02 Mar 2023 00:26:56 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c440800b003eb3933ef10sm2073958wmn.46.2023.03.02.00.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:56 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gregory Price <gourry.memverge@gmail.com>,
 Gregory Price <gregory.price@memverge.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 46/53] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Message-ID: <20230302082343.560446-47-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Gregory Price <gourry.memverge@gmail.com>

Remove usage of magic numbers when accessing capacity fields and replace
with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Message-Id: <20230206172816.8201-5-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index bc1bb18844..3f67b665f5 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -12,8 +12,11 @@
 #include "hw/pci/pci.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "qemu/units.h"
 #include "qemu/uuid.h"
 
+#define CXL_CAPACITY_MULTIPLIER   (256 * MiB)
+
 /*
  * How to add a new command, example. The command set FOO, with cmd BAR.
  *  1. Add the command set and cmd to the enum.
@@ -138,7 +141,7 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
     } QEMU_PACKED *fw_info;
     QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
 
-    if (cxl_dstate->pmem_size < (256 << 20)) {
+    if (cxl_dstate->pmem_size < CXL_CAPACITY_MULTIPLIER) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -283,7 +286,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
     uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -293,8 +296,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     /* PMEM only */
     snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
 
-    id->total_capacity = size / (256 << 20);
-    id->persistent_capacity = size / (256 << 20);
+    id->total_capacity = size / CXL_CAPACITY_MULTIPLIER;
+    id->persistent_capacity = size / CXL_CAPACITY_MULTIPLIER;
     id->lsa_size = cvc->get_lsa_size(ct3d);
 
     *len = sizeof(*id);
@@ -314,14 +317,14 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
     QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
     uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
     /* PMEM only */
     part_info->active_vmem = 0;
     part_info->next_vmem = 0;
-    part_info->active_pmem = size / (256 << 20);
+    part_info->active_pmem = size / CXL_CAPACITY_MULTIPLIER;
     part_info->next_pmem = 0;
 
     *len = sizeof(*part_info);
-- 
MST


