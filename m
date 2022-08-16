Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F285F5961AA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:57:19 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0oZ-0002GL-2e
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TA-0005Fg-89; Tue, 16 Aug 2022 13:35:13 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:44941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T7-0002aR-Mk; Tue, 16 Aug 2022 13:35:11 -0400
Received: by mail-ua1-x92d.google.com with SMTP id b4so4276314uaw.11;
 Tue, 16 Aug 2022 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VjEUJrauZWG7jLw/LnT3q5WD0y/yipGHIYjGqvGy4S4=;
 b=mMCJYxf0ZCLpuTkk87jq68lMf4KWVSGnaBO376GZKm7iX7UvnFk4JZi0U8Vg6XuLEM
 V2fyzsm1QzPqd5isKtSiiYx1es9ejMlMWoVF9jG6bv3Qexql9pg5oslSiHd5/uonVy+P
 R8yFnl08IePo7cqOZiXemA32vmsFJi/KVdpjFs9QxdWVSkhmXV/mxnF+WaSRGZ867gGx
 GkRBwqkJDRv7GkNtxh6ikG9SKSE77CuNMfPEHA8mdXZl8OkFIRahG1BC8K8BJA8nCN65
 tzZcngC9sBcYMcsC+srRq4C/rMkkGXuK5e0Q7cgwKN3XApV6odBdrMOUFHoT1xc2o7+F
 40Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VjEUJrauZWG7jLw/LnT3q5WD0y/yipGHIYjGqvGy4S4=;
 b=sNbESssK163EmsxqFO/yyhipzWtS73pegYLmFDIlJpOdeTMe7+E9qBewZfWgoQMZQf
 lMQlDhkoW6hlSblqXFOdq6IwyprFLpycG+k8cgIWGq4gmfUrVpoYoDS134+L46U6E2F1
 FGV/V29KffcuIk6OdefV2UQljq43uxKfFC/ZYsla4vbk/XCasBG7NkfjRMKMsm78OI32
 GzV6+hin1a+zQsfPOBoMIVUNvy5OGgCaQv1cA385OgcIQoR0FjSnNArk6eIT/nKFjsKb
 q87LJ3GrOy4wKLB5S7+n2NtkNDJgv2V2Je0smghZg9IRjUntXpF7u/Zwb+EZezpNiG7u
 wb3w==
X-Gm-Message-State: ACgBeo3cNCoxFS2w9AUfNulJy3HOJJ7iWi/cjFXHy5JVTVSpurJfSxE3
 hQ6vslhIqHVpVzneqvMBNrCapOce7MLz6A==
X-Google-Smtp-Source: AA6agR6bPSA27VWPEIkHyDpSUtqa2fLYkfND1aFKVBCOtV0i1y+CzlR/U5kQRfOpvwTZ15AfcSjJKg==
X-Received: by 2002:ab0:71d1:0:b0:392:c8bb:991b with SMTP id
 n17-20020ab071d1000000b00392c8bb991bmr1252491uao.71.1660671308285; 
 Tue, 16 Aug 2022 10:35:08 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 13/20] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Tue, 16 Aug 2022 14:34:21 -0300
Message-Id: <20220816173428.157304-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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
all xtensa machines that uses a FDT.

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
index 2a5556a35f..9e2f911caa 100644
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
+             * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+             */
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.37.2


