Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92622596175
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:51:56 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0jL-0007IC-JB
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sp-0004oe-TR; Tue, 16 Aug 2022 13:34:52 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sm-0002No-Ot; Tue, 16 Aug 2022 13:34:51 -0400
Received: by mail-ua1-x933.google.com with SMTP id t21so4289683uaq.3;
 Tue, 16 Aug 2022 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zGRC8t5xyo1fW95WY3WlgHuvRK6Iwk7AWvSowUXHy2c=;
 b=UP0IgouCDZ242Q5pHTdL7GG+zPTI/zm43SlNxxWP272Ouee7VKw0HWfE+yAxLtVIPa
 AXfQ7hugfnYCAkp9ojsKNw2wjiBRJvopRqzULmOsqzgllk1IbDV07rqzEyr3EfgBrm8a
 R0W+d2ehLYrXP/4BiDUQABogA+chBMyCHsc2Sfw436iDZxjnNUga7PL6y/cE/MONnwKQ
 SdS9wugvxNZcWyHokqWV+bKGCLQREXTkZELEyPJfJzZINN2BWNIRi6YCgrvQvBsn9TfH
 7sGvvsnQsoKwu+EzKp6KzZ7ERnYo2h5l4jFxOLg4IeMmtXvn0v3K7QjCj2UHSBk866RK
 N0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zGRC8t5xyo1fW95WY3WlgHuvRK6Iwk7AWvSowUXHy2c=;
 b=RemMLaVoNirDWiFcDQd9Qk1nrlx8TNph3JD+h3Lvayw4Gz+f99KYmkthHLXVoxSfcR
 oF9sECFSrTQyGQLu2w/5/xqsPxEpxMVFLJVXULE1bi+QZaYYHWamkSV526wKsUJuJVwY
 9+YxzN55DkC4lnDKqUZHYUyGCdAeyRqSvN+f6DUDFME2Itfjki3hYo8TCDEdlmFGZMeD
 RLZnnt9nvbeqcNDMhTWbhxxsB1CKk8ppLl+tJDpzRf4Y2qih5KhgpZAk0EWRXlUEsS4m
 BsQmHsQRVH4QnodiMG2o9PGWnzFk74GuN/BMeITswQfN9jr1/p72GYxNpny5kdVXOosW
 +lpg==
X-Gm-Message-State: ACgBeo18yXEyejy34+/JobyFEsMTh/Y4vLj5y/Noaqy63k+iqlAZTb9w
 apcXX17sQ2/TOCkL5HySs8DHqx94kOI27w==
X-Google-Smtp-Source: AA6agR7bLjUuEIdMnPSNKjeWFfHzUWuk6H7/Pb5MGO/mWr+647cg114KJNd+dkZmmISAJttitsXY+A==
X-Received: by 2002:ab0:2259:0:b0:384:e172:e16 with SMTP id
 z25-20020ab02259000000b00384e1720e16mr9278739uan.61.1660671287257; 
 Tue, 16 Aug 2022 10:34:47 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 05/20] hw/ppc: set machine->fdt in
 bamboo_load_device_tree()
Date: Tue, 16 Aug 2022 14:34:13 -0300
Message-Id: <20220816173428.157304-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the bamboo machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 873f930c77..9c89b23c08 100644
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
@@ -116,7 +119,13 @@ static int bamboo_load_device_tree(hwaddr addr,
                           tb_freq);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     return 0;
 }
 
-- 
2.37.2


