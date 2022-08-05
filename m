Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E158A91E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:58:30 +0200 (CEST)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu69-0003tr-Jw
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoI-0007Th-OM
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:02 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoG-0001Rl-Hn
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:02 -0400
Received: by mail-vs1-xe30.google.com with SMTP id c3so1928446vsc.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FTmhGl0YoPTG0BLmd7LkpyEVJmWkGywjd814ntxc28E=;
 b=qHiwChWu0iSGesvhoj8NPmTotrwXySP3JogjFoV9L2KqmRxrtUOBIJKhEQx7U1KpaU
 cOlm7fgTcOvZQF1YY7KW/8M/lCWrC67/DBiZgxnXL01uOwVm3Il61mCUxkTaVhGFInX7
 f2phDbnRx1bMGvuVjCi1pRvIh6VDJuvLKtTrNHqWUvR+we0eJ3IOj86bRSl0N8/8o30V
 u9/enn5VkwDjXDlK/jZhMZhu3+yfF6Ojg/NyRYzMZz9QJBHyV6qG9K8CzEhXzMt656eo
 3BoZ2qHBEtkVGevmivdwI6lz8kNNlSsgeJWkT37fIsjxX6yDbeYON1gzZwLAuqmU+ve+
 2uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FTmhGl0YoPTG0BLmd7LkpyEVJmWkGywjd814ntxc28E=;
 b=lECs+06k1I9f3tgk58HUK/Q39bhGLO0Cu14vC7k6LwsXLfM6KIwJ7Km+t8J1xSc2ut
 lz7qEVwE+xyhudxxe+ba1gWzCSnHFMmYy73CO8rJzqktPhvxgZtZlaa6hbQm4Nt2nj99
 45yASr/d5KDhr0vY1Ya4DeSG+J8+juaHorqPlBpFs8Yr501un1I2K13z8I2IPY5QwQgY
 H7Diqxy1yatAyyIueRK+SvbJViFSvrXzoz2TnFHk9okHMgD+JYghD3OCk85THaMWucy+
 wkU7Z6SnkVkTB9ykJapCuYuqOEeWMS32kWIsgLhES5Ekokln/p25Z83qDz8R0td0QOyW
 r30Q==
X-Gm-Message-State: ACgBeo2evRtBB5WFy5Qt0vMWwD7h5PCG5tCHXlG/1XgbMU6zVBmvioqF
 Q/bQqg4EEki2v/wUUUQglbCXSDMuT8E=
X-Google-Smtp-Source: AA6agR513cHLOSoOZHyMyb26BRK2WVuNsptC1td0x0EPeOGLQuGAcfdytpMwD19kB6lpTY1+0HP6sA==
X-Received: by 2002:a67:1d03:0:b0:357:283c:567d with SMTP id
 d3-20020a671d03000000b00357283c567dmr2504113vsd.76.1659692399383; 
 Fri, 05 Aug 2022 02:39:59 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:39:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH for-7.2 v2 03/20] hw/nios2: set machine->fdt in
 nios2_load_dtb()
Date: Fri,  5 Aug 2022 06:39:31 -0300
Message-Id: <20220805093948.82561-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
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
all nios2 machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 13 ++++++++++++-
 hw/nios2/meson.build |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..6c40565704 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -43,6 +43,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 #define NIOS2_MAGIC    0x534f494e
 
 static struct nios2_boot_info {
@@ -81,6 +83,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
 static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
                           const char *kernel_cmdline, const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -113,7 +116,15 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     */
+    fdt_pack(fdt);
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
index 6c58e8082b..22277bd6c5 100644
--- a/hw/nios2/meson.build
+++ b/hw/nios2/meson.build
@@ -1,5 +1,5 @@
 nios2_ss = ss.source_set()
-nios2_ss.add(files('boot.c'))
+nios2_ss.add(files('boot.c'), fdt)
 nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
 
-- 
2.36.1


