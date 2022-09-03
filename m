Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE55AC12A
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:38:08 +0200 (CEST)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUYxz-0004eY-LN
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuj-0006nA-1H; Sat, 03 Sep 2022 15:34:45 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:33632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuh-0005NA-Go; Sat, 03 Sep 2022 15:34:44 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11eb8b133fbso13022141fac.0; 
 Sat, 03 Sep 2022 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jd3wQPysMcgs0ZoMNBn7tHzgPrtVMg9YzAzU5clTyec=;
 b=O5ZJgM6SpQCFnwDgZNxQnHAXL2b2QXu44gaXpkUrq4IcDAHRbyG52uUbNJyMr/ZikE
 e/841tU6+iFtBFoqMKTGGOrSeSmF6Hid1dprwPuxRPPdXl1bk0ajWLhRPacHfe/OoOQQ
 tH++Va/nSyy8gmqnhZw4Ml+BKor1LXJbDlmStaMaWv3oYOKSpAczQ2wE5BsFzImABAGn
 9oNnb8mgvX5CNNOh8PQ80KeJ8NpoQWLgfVIuvLD6AnAAjXWEPAeBaq5XQpdXyO2f4s5d
 hHwjrj8Wogas3Jr3TolGjmXif/Eu6T7oDi6PfSODLQxLvts4BOTiWuIkIpQZD4q8NUaE
 C0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jd3wQPysMcgs0ZoMNBn7tHzgPrtVMg9YzAzU5clTyec=;
 b=tAv/WjmOBwASl63vzUDQbDThgEXpaM3iNQRCmv04ZCAQSvBDEsy52BKhaCp4Xl4HYT
 o4m2HjXrMs6pB/VIXdGGmJXwQGzwUFIuLJdcniTXY9KFlTnYkLma131s3wiOm8wut6Dq
 u9TrbWxoGss8MIlmt9pJKM4MHPoXekU2JiHa6z2F6QeyMSoQfiV54RvbzcMw/COQLhvP
 uw2xCFiKSkDngiBO1i3ZGXs6RFL6G9hk2IETYk5RMs97Fgc3GSpeIMgBWtlZ+JQhbgZy
 JhClSorwMngZIqWDEx5zMeqRftLbkTOqG2LyhyavzApMJVeYVDJqZ98kRAF1n1R83AjF
 7mEg==
X-Gm-Message-State: ACgBeo1RYiFm3fzXtQYWD4B+9ZuhoafHSdhObuwLhvWJHrfxCqu9EvIy
 ueVHaRwIbyFjR9a0kbzTdFQzmcY1hJHMOA==
X-Google-Smtp-Source: AA6agR6kbgXsODO3iMDqCrztxnvTO2SoYInFElFY3khzuRw7HKVXRcSs5B/U/gCpTBecPuSCdi9V9Q==
X-Received: by 2002:a05:6808:11c3:b0:345:da0d:82a9 with SMTP id
 p3-20020a05680811c300b00345da0d82a9mr4320433oiv.244.1662233681198; 
 Sat, 03 Sep 2022 12:34:41 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 05/14] hw/ppc: set machine->fdt in bamboo_load_device_tree()
Date: Sat,  3 Sep 2022 16:34:11 -0300
Message-Id: <20220903193420.115986-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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


