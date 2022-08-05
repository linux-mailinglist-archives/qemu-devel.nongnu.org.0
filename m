Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8458A925
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:59:51 +0200 (CEST)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu7S-00071g-U5
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoo-0007bP-IP
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:36 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoe-0001gG-Py
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:28 -0400
Received: by mail-vs1-xe32.google.com with SMTP id s129so1908328vsb.11
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WJuc94Oic3QdxMYiy7FSuuXF2yzCIlzKqZVe0k2s5z8=;
 b=j2u63MLXtHhrxpttTY+odumW/mCD4MR0J2cN9sh2KLiDg/HaumLsI67lbhF6CLgkGE
 7AtvffaLodQWC+1Teo3jr8e3SiNy4kYq7pycKLNQVdpK1AsOrqJGIkVftqbSH6x61fBe
 a8MT4x38eRDrGS3ytS24VlbqDem/0nqdX9PIjiCdtY0rd9v6TgvWR3YphuWUmPqNLnaJ
 LUsP9AYwmU9u1+0OmLKh4ErFC9I51Sk7wDtaoiIRs9/Ls7c8iypngrQQ2rThn5txGhUI
 Lv+FbN3g/F1XP2HEUE0ldC9k/IEtbGFxgPZ6+xwKB5sSnPvg6xHjCuelvJKcm3i1hjmk
 gM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WJuc94Oic3QdxMYiy7FSuuXF2yzCIlzKqZVe0k2s5z8=;
 b=tQ99giyW9rnbns05arwSY4EZwaYtt7rrPFFGMy69K44/F4c2avmQVTtoxH0V/u+NQy
 KlDRSJLI9Zpurvp0bCk0HIgeJs0Nf+yBvxHdOGyC+7vrew5JC+Da25AFGEJs4Z3p812Z
 aIfxhv1DkScjGutyDYvi/hP9wYk43xzFqoyzQfw9NtTPuQUrgsRPY8+YWKIG/18Nyi/f
 UbWsfm5Bxk4bequijhpGf2v9NGzR/0oCJWNZgLVtQgKc+TqC4zJnuCBmxaTjx56Tx24I
 TBuIPgdQY1f6C2ZXz8q8lsYuIRS54pYRFhLr1lbthMwx5a3olJWYs477cVliG/FpEnaD
 ev0g==
X-Gm-Message-State: ACgBeo1qTln75KQwWVT7egOfL81ApeXk4fa4QdeVTB+GzZta0bFKD8ax
 3s3oFOSVVtY8V/N1frcUrY1fZoK70MI=
X-Google-Smtp-Source: AA6agR7eNW50qKzDTSRGwOCNS4i8Pk8oev8Q1+blrgLPrQE1IaHfJTdCx2lK2aq42yOW4Ki9l6WbTA==
X-Received: by 2002:a67:d717:0:b0:385:273b:a208 with SMTP id
 p23-20020a67d717000000b00385273ba208mr2648010vsj.9.1659692421512; 
 Fri, 05 Aug 2022 02:40:21 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 13/20] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Fri,  5 Aug 2022 06:39:41 -0300
Message-Id: <20220805093948.82561-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
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
 hw/xtensa/meson.build |  2 +-
 hw/xtensa/xtfpga.c    | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

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
index 2a5556a35f..212f5f3dc7 100644
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
@@ -377,7 +379,14 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
-            g_free(fdt);
+
+            /*
+             * Update the machine->fdt pointer to enable support for
+             * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+             * shrink the blob size we're going to store.
+             */
+            fdt_pack(fdt);
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.36.1


