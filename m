Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DB5AC82B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:48:16 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzLb-0007PC-DD
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz93-0006nC-VY; Sun, 04 Sep 2022 19:35:19 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz91-0004zq-UX; Sun, 04 Sep 2022 19:35:17 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso18115326fac.1; 
 Sun, 04 Sep 2022 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jd3wQPysMcgs0ZoMNBn7tHzgPrtVMg9YzAzU5clTyec=;
 b=WX94BPoJm4suje18bXoBVnVCW7ziPu/DMm8XRVFjIhmCn9xbLfyyIdlULOFxZtVmE5
 KwVSfWOX6nxPXBdD/1msWH7GrbTTJCISsz22h/+dy39FuKX9iHgDg458g3T6BLNHi2yA
 ErozQT3SIi+wMyKdJo++iyLySV8aexQeSF/d34hV/eF4GA3nwFkk72DfaNOGdIrX8+gK
 a6EE4BWtkKEZ3XlqKeIXfDlYHFBFZVo2I+lZ4i4MbIngS6AnV994tRENQmMaSonZW+cf
 dgDY2HpPqPKdCqx2rAPHd7b1PacSOTqBQkDJNT0EbQdr6SQvlfLiVge0bHJr+QJ3BVCi
 wwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jd3wQPysMcgs0ZoMNBn7tHzgPrtVMg9YzAzU5clTyec=;
 b=YLlDDiuATQh72epo3alGvtRXXaIetbUIEuC9r6Y5tZyaUdKZRpqsgR+ikCh9u+M+wO
 9Yt9xNpR/tP4EsI07qXe5DeFJP4TWhf4oWcuWHtulhF0LsTx/KVvyuJ9QLCbrr2e7LgX
 JdkHKQzB8S2LxTvtNVSHM75P1hI4ufmmiaj7OBuiZifj+T//4T3A8JFcxbBBjlERJw5N
 XRkWM0dR13vf6/eutEJHkSMkkIf9lP9z4TNb0zRiv5min6v7y2lIaZYQiHGKLo74NYKf
 3Y+Y501Ua1PJ9Dzlo6c+piCbIWLdeq+DNUJJtNEsFM13pe3Vo7+23C7MIdsg/d5wsxB3
 +xXw==
X-Gm-Message-State: ACgBeo0yhy0JM7T89x5U27ZLXg9fDgZ/lN4pTIiwgYda04kgTRFxYQ/T
 D2jeNkJoKRtevPKxD1kSSbQKh6SnbZSupA==
X-Google-Smtp-Source: AA6agR7CmAxnD7/BkZ2sS+owkYujR6GPXnZd24CHsri7ScXmff+eOXibyxKv1bJxZq/rWS7U4mi3+A==
X-Received: by 2002:aca:f16:0:b0:344:9d67:f3ce with SMTP id
 22-20020aca0f16000000b003449d67f3cemr6435556oip.110.1662334513852; 
 Sun, 04 Sep 2022 16:35:13 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 05/14] hw/ppc: set machine->fdt in bamboo_load_device_tree()
Date: Sun,  4 Sep 2022 20:34:47 -0300
Message-Id: <20220904233456.209027-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for the bamboo
machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index ea945a1c99..aa5c901b09 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -34,6 +34,8 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
+#include <libfdt.h>
+
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
 /* from u-boot */
@@ -62,6 +64,7 @@ static int bamboo_load_device_tree(hwaddr addr,
                                      hwaddr initrd_size,
                                      const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int ret = -1;
     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
     char *filename;
@@ -119,7 +122,13 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' QMP/HMP command.
+     */
+    machine->fdt = fdt;
+
     return 0;
 }
 
-- 
2.37.2


