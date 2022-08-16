Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3B596153
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:41:58 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0Zi-00034s-24
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sj-0004ls-S1; Tue, 16 Aug 2022 13:34:46 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Si-0002NQ-B3; Tue, 16 Aug 2022 13:34:45 -0400
Received: by mail-vs1-xe31.google.com with SMTP id c3so10818521vsc.6;
 Tue, 16 Aug 2022 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4f24mixCYIhi0sIPdZyXjyavjHpNtJ1OrG02fjTafCg=;
 b=ZCbDpzzIwTMA67wU7jkNrFhX7LbpqYUFkh4TxlyEOr6htH9moEtCjTBc5iKuT3lvNp
 KQeA3Qsu5y/JfVzlZTJTkXj94Nqt4lAeunczytIOpBN1MSNWVC8Mn3hm/ABxLcMUa3Ci
 nfrtjwRrzMN3B1fbhMFDKD5c3+ScZUXcs0oB5qvUPBPWHYbuKh2c9nphHYcUKAifVokh
 s+AK+FiFLpC0/rOwu7La+VGHYR7cZ2UIVB1HJHKigZyi5b6iCxBMDBule7UxOg5ztAoJ
 mLXf90CS+oRO+XPfKktE5gD58QrvgMV4ljyrrm/UuyS7ZpKKNSnlaaItZGOjgQKv2+yd
 7keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4f24mixCYIhi0sIPdZyXjyavjHpNtJ1OrG02fjTafCg=;
 b=xdMUNPQz2IkvfZyOS/ygn4g6uY4oG14CtzQQ/7HOf+HcVhxeCcVkJWzv4xyibYkuyL
 qDzIn0uN4VqSfSLX+nCzb9JmSlNhbZuvrux6xHxnu8cLdDQG8ZBo+eAm5Ol0aHCjwm32
 eX4smDMCJspYOewJIhS4rMkfwKc03+/TUYXhH1MR7Bv86W7/g7tJ7CTutKMCHEzDP6w0
 h5ccS1AH/GEKb61cNDd6biPQmAVpHoJq4EvJHa9be38t5YsP4EntUg5umE29F72m+o2H
 3AaahqEQz5w63IVxTFbAl3OZIHRN0+6sWaDsHZQ/J9jGge6GUhasynNfu9JayHLXiC9Y
 4Dog==
X-Gm-Message-State: ACgBeo2rE8gXuS68o2FdeohrSDC/bN1hhdi3DPec15WaPwLzkvBCu9/y
 gznziBQgo/tfiVOmvmrXzc6gVRUqsBQYZQ==
X-Google-Smtp-Source: AA6agR5gzc0JQjCAPzb7F5I1K0eJ3Gx2YSdD/ZZNPRqWIemp6zwz70VuepV4JHWeP2GBLbdlAImOLw==
X-Received: by 2002:a05:6102:31bc:b0:388:454a:7961 with SMTP id
 d28-20020a05610231bc00b00388454a7961mr8755346vsh.16.1660671282147; 
 Tue, 16 Aug 2022 10:34:42 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH for-7.2 v3 03/20] hw/nios2: set machine->fdt in
 nios2_load_dtb()
Date: Tue, 16 Aug 2022 14:34:11 -0300
Message-Id: <20220816173428.157304-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
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
 hw/nios2/boot.c      | 11 ++++++++++-
 hw/nios2/meson.build |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..db3b21fea6 100644
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
@@ -113,7 +116,13 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
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


