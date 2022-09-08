Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D45B2730
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:54:12 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNbH-0008Sy-GH
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOt-0005ky-Uh; Thu, 08 Sep 2022 15:41:23 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:43560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOr-0007Ey-88; Thu, 08 Sep 2022 15:41:22 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so13019782oth.10; 
 Thu, 08 Sep 2022 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=16WddNSZhqtrCV5F9Z1jI9UMmcItES0z/obJPMI510U=;
 b=kDrN744wwjwBN4bezDzjhVVAxakuq3L+cgsyy5u7UGuodZlRqcB3vZt5h8H+zD1H29
 keAhytwqvRTuK4aTJR1ZItYbOwc3dhePyujhXeLcPyniGM90dTOTttQ/fx3q1V+2sxc+
 k0LuEfUh1AItOtyjFbjUvsg8VoaapQVG4TZVS+ABaw52KZLlr30gav2iNl+Rz+bMprj1
 kQelbDAon1agMg5JeF1Xgy2oI+J22U0VQ+UZS1pEQeTeirvCQiDOy96grO6uxBMgH24z
 gPkZfAtk6zRaYTzauEp9KFa8d5V4pC6fiw3dADOpLVJ4IKhsyZ01WMrxwUKEeCkUmzMT
 dozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=16WddNSZhqtrCV5F9Z1jI9UMmcItES0z/obJPMI510U=;
 b=vLDI+W/8GAuA2glXsOw5f+3Avg0kR0YUjFHEhVyOy7GTSheffdVdESzdt8CmRkWAW7
 fQaTDBYwr3q/SY/DNBl8vjSL5rRbjoB4fRieQyjm8VUTcWBWTu5lBtIxxLPQmq0lpZL0
 ggd0pwrFeolPShOyrMvybICvd3eiPLr0AT+gShEFvdBrc39whoQ1GL4YwvbWPXbx+Do2
 tRmC8R3NcNa9e1EBwDz/xE+7WkddtPJGjn3QJYvzCevH9gUu+13PofsA8+5dapBzEgdR
 NEEeGIvrfV60/c9lzINzbriFmFrsWXdt+N6D6nog516rfgdyHENjkQe5fYchNJqhJfIu
 zWQA==
X-Gm-Message-State: ACgBeo3WOPx0Y5eJDFc3jGXmEYdGGeVlUG/rWaAc7WcEdf0TWRWpf8Va
 7JTDchHKko6pFr3MJLuhY87+A3/3YmWObg==
X-Google-Smtp-Source: AA6agR4OsG+HQrgvXeyo5wreCx90XUNeLqOwhjXQnm9B3Sc9pJo+izED8H+s5zx8SktdHZkJOVXW8A==
X-Received: by 2002:a05:6830:25c4:b0:637:2a66:1dfd with SMTP id
 d4-20020a05683025c400b006372a661dfdmr3945043otu.383.1662666079294; 
 Thu, 08 Sep 2022 12:41:19 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v7 13/14] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Thu,  8 Sep 2022 16:40:39 -0300
Message-Id: <20220908194040.518400-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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
 hw/xtensa/xtfpga.c    | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

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
index 2a5556a35f..867427c3d9 100644
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
@@ -377,7 +379,9 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
-            g_free(fdt);
+
+            /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.37.2


