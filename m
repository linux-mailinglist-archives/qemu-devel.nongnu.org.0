Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4F5A2974
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:30:18 +0200 (CEST)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaLf-0001Bi-IB
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4a-0008E6-IT; Fri, 26 Aug 2022 10:12:36 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4Y-000421-Kr; Fri, 26 Aug 2022 10:12:35 -0400
Received: by mail-oi1-x236.google.com with SMTP id t140so2111833oie.8;
 Fri, 26 Aug 2022 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VjEUJrauZWG7jLw/LnT3q5WD0y/yipGHIYjGqvGy4S4=;
 b=Jloh7lAhPBNVGxQiLSrp3UNHVOhjMyS+OfkoQ7Ywi/+e39xMoUQ3saTD+2Sl9E17Im
 5F3BJj4vSth2Kuts5NyF+yclGkIEm1UX9684E92axjKs2uOuU5UeDoodpVnf9Jm4IXjX
 PbJq2Wjk/rxspFgTvGll2LFpctiUdI4hFTflptFYP7R3ExLArA1JojkwWSYaqXrW7wtd
 21Ku+KO/gc5xaL7lfBX7WGwbNArU7fzLX02QyVEgCnsJIQ1RxXQ4y1Mw9XfhSOkdgl3o
 SjDqs4l35Uq92CBuFvYAjPByuSlO5VQ1V83y2xuqmo4zj2hjM1ctA0aA4M7MRF803ZF+
 janQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VjEUJrauZWG7jLw/LnT3q5WD0y/yipGHIYjGqvGy4S4=;
 b=itjWzbeuisxgHkPgbnNoy40p8ei1BosZpcAGbMBNkkaU8vhjb5c8MqA7Al4RKl+Bly
 SYWj45XKZU11FyDI3RhLy0RuPY00ZnV0jotFineBO+xHEOqCrAxhnSAnnfvB4EkoSdk7
 Yk624/javVwgcZndrRvsV0Mvo0WZARs7+tVuSXxPou3Cm86lExbILGWULtzLWFGCcvzG
 R84rhePn3hJrq1oFMgG7upUnnhUoEZwDziBhdkc8k+dm+blqSqaDKCsaAn+g8BRaoZNl
 S2ZtfGNrO8+BzAhAGzRIbscK+X4lqnXZJDSyiUtaUYJEBOOGACqC5XuNTL5Gld3E1LoI
 yZOQ==
X-Gm-Message-State: ACgBeo18/tiCAULfVp6RsoEYAHgGGZZUhW0cJoDBFZWvL+oJMCFpoEPS
 pe4AJzU9wnGWru/XS19NRCklCRh9pFE=
X-Google-Smtp-Source: AA6agR4neHzCSMNbc8Gmv8zwNqN/G4CudBFpBqZ66He6OkZdOBQUn5u5P1UAYh5UIbfd8nEa+L75hQ==
X-Received: by 2002:a05:6808:bcd:b0:344:d614:c5e with SMTP id
 o13-20020a0568080bcd00b00344d6140c5emr1685585oik.78.1661523153044; 
 Fri, 26 Aug 2022 07:12:33 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 13/21] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Fri, 26 Aug 2022 11:11:42 -0300
Message-Id: <20220826141150.7201-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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


