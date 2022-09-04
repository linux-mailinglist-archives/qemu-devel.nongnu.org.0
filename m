Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD45AC828
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:44:09 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzHc-00027U-RL
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz91-0006m3-1A; Sun, 04 Sep 2022 19:35:16 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8x-0004zP-F0; Sun, 04 Sep 2022 19:35:13 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1225219ee46so18119857fac.2; 
 Sun, 04 Sep 2022 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=ePp3QHGaMyOVmX7CNb68sPWM3hPrUL712DTQdBgSr1mKBxf4JsgXzB/7XW1TBqVVPl
 u4WPaINUVeaiRChIH4xYQ7nLgwg96Z3pmvKT1kmeCn+HOBHvSltET+2jNgXBba4OE/WU
 94TSwJA9K3sCf8dFN+Fkg++8OqeUzrKKDR/eCsv1l1CSBeohg0hNWhsjHrtY/BH5Jmyd
 vSds43dQrxBfX+YqW1a0quw73v/ahof5QHffcHUHAej8yoanPnCkrX7Lp5pzXKrEkjBs
 SANhv34F7xfAKxlzpNgz+f9eWcf/3W2n35kRAxFoVp/lSltwndHgNdtgdXFTFvkp6fq/
 iJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=myioW/86fUF0dTHb6HHKzfVJ8vdXO7HwtlqF06wBJ+Gfu28F10JbLjKPbkolui+t0S
 OC4uEQjOncG5UfRmgkYGI8dzLW/xD94jd2dlDvu+tGTKoWWGhYJnCm5g1FPFN3veM5vb
 uAqltxvHcgCkHj2h3vLHAuWAHJnQ3ZeokP9HmIKOBXDhxJrx9dX0csqLzU+jOAmB+cLR
 cwaurrlaKt8Vc4e1dWOVEwn5DaTTVHJO9mlmk0fPeEhe71N4JGkU06MAj0Ysw+RExmFg
 Oj3piGKPeEEe6HJt+00VXx/0obrjrn2km9vVB8pDw+lf/nwLRz3VVe8ivWVuGWb6pFMx
 NopQ==
X-Gm-Message-State: ACgBeo18LP4/PICUuQiGbxuAUhyFEAIPSHu90Jv+Yd3E4YvN6aR2DWKN
 I57GJcSgjqziANxLkZpiZqNKgp593dGKfA==
X-Google-Smtp-Source: AA6agR6XVALs+N7zwpMQa+MHoDvRKp5aeWVgYEpwuaAjbX4wx227gxK7DKZvf0On15dtaGW5jaIW0Q==
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id
 em4-20020a0568705b8400b0010cd1fa2f52mr7615920oab.92.1662334509580; 
 Sun, 04 Sep 2022 16:35:09 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v6 03/14] hw/nios2: set machine->fdt in nios2_load_dtb()
Date: Sun,  4 Sep 2022 20:34:45 -0300
Message-Id: <20220904233456.209027-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for all nios2
machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 8 +++++++-
 hw/nios2/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..b30a7b1efb 100644
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
@@ -113,7 +116,10 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
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
2.37.2


