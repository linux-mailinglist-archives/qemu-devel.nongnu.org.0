Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5DD5B2705
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:44:02 +0200 (CEST)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNRR-0003eW-Jz
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOU-0004Xv-BO; Thu, 08 Sep 2022 15:40:58 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOS-0007Bj-O3; Thu, 08 Sep 2022 15:40:58 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11eab59db71so47096641fac.11; 
 Thu, 08 Sep 2022 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=Y/gV47VR42Nc3ZoUGaU+cBzeyOgc5HzjALdFBWdaaJbJ21+j09e6OZ/MPavxTzkyMz
 8sgHt1lQ6jp6JX5Oin7p6C9cjVy74JgPdCFkpvaWXDbpWEIyXEQtEp6scc/Pmw0IHWFq
 IiWTGb67vGd3tMbqlgTWRvGAcwC+vhytoabATkGRY82rtQWpTKjm+4pWcqhzZKBWpK8c
 Cx5O2Hn73unp3zm5CoXh5sG7ILLY/BWy4A508WuxgXFhwUYc13V0QULjwxI+/zueIKKv
 AdPEtFAIOgykLUzIejvPi4FDPKMhC2HoEX/bUpxDzMItpkRYSJbWwe6bFmh5HvP3ddFy
 uqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YOFZ9NdiFBAa9F2Aq+WCsRHWWt7d567/X2aplHJ6aKE=;
 b=AuV3FLdfN6dt6C1FV0MXPzy4eipI0Z4zF2iSiCLdBAuCzhwWfZgLVy/EQpbatSG60S
 FpIvonra6oMlVm+TjrhhWLhB+6ih3ysr70SLzs1vg2t8bx71acQELTlMwXN7V/ukUnJe
 qyV5b1mT50Y3ObJ0OyZwnMutwGE6un/lGPCS6n42F3dAtci5FOQBy7MPuH4za4Rxtlcp
 TCdTA8ppeC3Oda07SEDStQYwlSS/9CGrWrwwBdTwEpOSKdBSNBte1apanwSB02r8QrFT
 mHU/ab8S2+hoSf+QlLFGraBnJ1SdAhxEiZeuPZuh3OVLieJZ09mVCS8dmM8Nr9wBTW56
 Uvxg==
X-Gm-Message-State: ACgBeo0PXfSLZlUzISHBh9dZroXa26xLBJsav6e9cfX90WoMd95bZEEn
 +K1rFmX9sS2x7yXxYh8odmffDdsLDwDn7A==
X-Google-Smtp-Source: AA6agR5ZkMpAjmDC260tBAD8KUYaXe55JLHwneuNOpcDbBeMchpx5bA/ALgWSQ28tQXsuhSqqoVIPg==
X-Received: by 2002:a05:6870:9729:b0:127:529c:a04 with SMTP id
 n41-20020a056870972900b00127529c0a04mr2775408oaq.250.1662666053924; 
 Thu, 08 Sep 2022 12:40:53 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v7 03/14] hw/nios2: set machine->fdt in nios2_load_dtb()
Date: Thu,  8 Sep 2022 16:40:29 -0300
Message-Id: <20220908194040.518400-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
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


