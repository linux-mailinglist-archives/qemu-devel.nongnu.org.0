Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0142063ABE3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfeU-00074s-Jk; Mon, 28 Nov 2022 10:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfeI-00071B-R0
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:28 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfeC-0005XA-Or
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:19 -0500
Received: by mail-pl1-x644.google.com with SMTP id 4so10427067pli.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vq3NRy72X3AFgsMApkdPvqc33L5sCjSJV7Eox6k+7XI=;
 b=M0SpkFsK0rWgiTfLWrl2MlQpUs5qqZtXuJL4yW6ErK8B59Qql93jQwnrSuH2PHluj7
 gISkW3242hrnVrHa/B4MhOBiN5Q/Z27xjvyJ2zF/cLj/BTWATi+T4nxma4IIe5KxuOkA
 7cAVficGxiM/HUGTC3OLt5+PTjNf2QaFImTkJpWG17U/4UdjkbhrhAE+VQctQwHz1IFo
 4j9qTt0/3/tpyS767fzCuAQ2sUEBNF2WoTWKnzrV4owGA7fP1p+OL5yFBNz9D8JMn/9n
 QZxe5hbdiymY7ZYk3VhwKWiYlkmF6mNNVvKWBzF5jsiaCsj0I/AIq9XSOIMZudWqzRso
 xKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vq3NRy72X3AFgsMApkdPvqc33L5sCjSJV7Eox6k+7XI=;
 b=vrgWVuscLWMnrW0BhB3THhRbmMqMTo/X4UgNwLWe7XzSegRiEbK8YpMdedajgm5JJu
 5webgTYpYsLE37CwZ8p8kSmfYRt9EZTgiD6UVU+6knDz39q6f9Pp7962q7VeHKN85HX4
 Q7XHokbrnLDmMLXQn0PCzRzBhZihu04ppzanXEzTsLiPiPpllYVHvJ/SF8AGGst21gA6
 wxUFSHRur+oZ8cAUl7/V7kCgIB7p8pb16gCFfoL2Q8xJ/g0t5c+L0LF/1C2J+eVHlP5K
 F1RCXPFiuptazkOlA1FkJGeM6HebpiJM+4K1TgPcrFG014nTQWb3J/Ygb1skaExXmiBp
 75+A==
X-Gm-Message-State: ANoB5pkKEtSaklQV5B3m9VhaVtzMTPsVgAB9TX+Eb1yJ1s2Oqp5gOvbA
 1U8wVZSGPofHPWeIAXnayzNce28PKyLd
X-Google-Smtp-Source: AA0mqf5Asg0rv13Ipcqg9rT+Nug0on7Ts8fbocO1TgaO81M/DAPYKe31YKDNw3zpbZKo1raYCLWGCQ==
X-Received: by 2002:a17:902:f10c:b0:187:2721:68e1 with SMTP id
 e12-20020a170902f10c00b00187272168e1mr32523501plb.21.1669647734378; 
 Mon, 28 Nov 2022 07:02:14 -0800 (PST)
Received: from fedora.mshome.net ([104.184.156.161])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ecc900b001886ff82680sm8997928plh.127.2022.11.28.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:02:13 -0800 (PST)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com,
 Gregory Price <gourry.memverge@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [RFC v4 1/3] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Date: Mon, 28 Nov 2022 10:01:55 -0500
Message-Id: <20221128150157.97724-2-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221128150157.97724-1-gregory.price@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=gourry.memverge@gmail.com; helo=mail-pl1-x644.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gregory Price <gourry.memverge@gmail.com>

Remove usage of magic numbers when accessing capacity fields and replace
with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/cxl/cxl-mailbox-utils.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3e23d29e2d..d7543fd5b4 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -15,6 +15,8 @@
 #include "qemu/log.h"
 #include "qemu/uuid.h"
 
+#define CXL_CAPACITY_MULTIPLIER   0x10000000 /* SZ_256M */
+
 /*
  * How to add a new command, example. The command set FOO, with cmd BAR.
  *  1. Add the command set and cmd to the enum.
@@ -267,7 +269,7 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
     } QEMU_PACKED *fw_info;
     QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
 
-    if (cxl_dstate->pmem_size < (256 << 20)) {
+    if (cxl_dstate->pmem_size < CXL_CAPACITY_MULTIPLIER) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -412,7 +414,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
     uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -422,8 +424,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     /* PMEM only */
     snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
 
-    id->total_capacity = size / (256 << 20);
-    id->persistent_capacity = size / (256 << 20);
+    id->total_capacity = size / CXL_CAPACITY_MULTIPLIER;
+    id->persistent_capacity = size / CXL_CAPACITY_MULTIPLIER;
     id->lsa_size = cvc->get_lsa_size(ct3d);
     id->poison_list_max_mer[1] = 0x1; /* 256 poison records */
 
@@ -444,14 +446,14 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
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
2.37.3


