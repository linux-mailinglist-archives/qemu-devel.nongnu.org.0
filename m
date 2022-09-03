Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF05AC135
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:44:03 +0200 (CEST)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ3i-0005Zf-Fe
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYvA-0007GR-8x; Sat, 03 Sep 2022 15:35:12 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYv5-0005cN-Ih; Sat, 03 Sep 2022 15:35:09 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso12882826fac.7; 
 Sat, 03 Sep 2022 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+yBKZUFA1uSsvFGRHUokL0uEYsI4texFhLK7k9Zdnjk=;
 b=Zvd9MM09iuiZDSGranT13IiYAklNb2gw42+NewRgrlwlSY/bsteEw2sVFNu1R86frc
 +mBdjjMJIrEmkIf5ZqOdtdIxBJXllr6m/I8Z1jgfhV1m3HF3FhDr1c93O2U0vEKv/jQc
 WIlP903cLavt/foY1dTLurkTpypl1qenNfN71iHnYmn7ojAxV0eVUNS0cyTsASf/AtWo
 rk55kLSU038y0rfu0lpzwbfoA26DSp/EBIWbGsGA78EzfH3pWoYdgyKC/2JzAbomdGVM
 aeWTxkNf7lQ8xMkg4QvbTRUpKBcEmMzVHcdMHcUCXYD2I6rthn7qRjcLtwZo1to0K9P8
 SiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+yBKZUFA1uSsvFGRHUokL0uEYsI4texFhLK7k9Zdnjk=;
 b=nwoa0QhlO/oYyxOapSohX529qBaoaY25xdIE58Oi88yZyDuK8Ku11GYwh2lvDgN6ju
 wVGzx16QFRYnSOlpQb/eqtypR2SyhnRlZEPbjE/u0z+bgCXOwtW1MUT/lE28nLCjdCGJ
 xLarLdwXAXTm2Hrd2wvW/HxaWvRsK/lQENbJ/G34oZd5rN6boDrpmeTciM6wNoBScU1l
 WA8qzivfFeG1vL9OnITLFb7F2lF6xkShgj/ykxN3Rz1py/2cSV7yH0qJYzwoW1YMcJhB
 k1oSSRC9OMmZ5QJ3yuRP6z46WRkWAPu+A/3KGxrMUordC531jJbEcU2+Ugt2VGSSZlR6
 lNqw==
X-Gm-Message-State: ACgBeo0p7BjCKSCOi4Tuv038QRjyu1qA59QGbs5BV104r1gYuJvAfpnf
 4Nb80yvqpum7GrLHluY6DoTObs6bv0XEJA==
X-Google-Smtp-Source: AA6agR4drTekjxloZjyQEA5wPU3R9KAI+EiDbO9ZBEd6psaIXC9DGXrHET4umfLMD/srwuZH29F5VQ==
X-Received: by 2002:a05:6870:240d:b0:11e:ff35:5ce8 with SMTP id
 n13-20020a056870240d00b0011eff355ce8mr5035198oap.232.1662233704161; 
 Sat, 03 Sep 2022 12:35:04 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:35:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 13/14] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Sat,  3 Sep 2022 16:34:19 -0300
Message-Id: <20220903193420.115986-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
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

This will enable support for the 'dumpdtb' QMP/HMP command for all
xtensa machines that uses a FDT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/xtensa/meson.build | 2 +-
 hw/xtensa/xtfpga.c    | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/meson.build b/hw/xtensa/meson.build
index 1d5835df4b..ebba51cc74 100644
--- a/hw/xtensa/meson.build
+++ b/hw/xtensa/meson.build
@@ -6,6 +6,6 @@ xtensa_ss.add(files(
 ))
 xtensa_ss.add(when: 'CONFIG_XTENSA_SIM', if_true: files('sim.c'))
 xtensa_ss.add(when: 'CONFIG_XTENSA_VIRT', if_true: files('virt.c'))
-xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: files('xtfpga.c'))
+xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: [files('xtfpga.c'), fdt])
 
 hw_arch += {'xtensa': xtensa_ss}
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f..138453628a 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,8 @@
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
 
+#include <libfdt.h>
+
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
     size_t size;
@@ -377,7 +379,12 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
-            g_free(fdt);
+
+            /*
+             * Update the machine->fdt pointer to enable support for
+             * the 'dumpdtb' QMP/HMP command.
+             */
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.37.2


