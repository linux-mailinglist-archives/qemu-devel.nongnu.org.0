Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55459615E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:43:55 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0ba-0006Yg-Gz
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sf-0004jM-UL; Tue, 16 Aug 2022 13:34:42 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Se-0002NF-BV; Tue, 16 Aug 2022 13:34:41 -0400
Received: by mail-vk1-xa30.google.com with SMTP id w129so5508240vkg.10;
 Tue, 16 Aug 2022 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=j1RYsPISHcQmqkfg0bCXBflgdHOzA77Z6HtOczxpsOA=;
 b=HNwCPRT0ioQk2418GrDYhoXj+eZwj4ZY/oH+mMVdIWWS2DZ/QsCqxyYlc5DSKlag+c
 P8mRe/sHp/9SKC6N8EuPOf4uacsgCs2LtrNphUlcMYE/tBJXuvkxavYaLCgT0IF+1wnz
 h75uEDvYKsT0jTkHm34659CjsBKNBpiDEf59BAajEKorgF0RFEoMNmT5v6EQTmaHJ0SH
 4Bp0K0V+E8yXKC9vv39l9CEpNuH/JB0lkXQ1JRUdM/CHrVSWr0qnpAff2Vg20jo0FNYi
 zGg7E4hEkirmT7Tbf8ROu9WcKEkDyHGs4pZlY1mALn0cku6KgLXb3mqoZDp1kAKpknac
 b8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=j1RYsPISHcQmqkfg0bCXBflgdHOzA77Z6HtOczxpsOA=;
 b=a6HRdYAe8DfV4QHudUfFOMZtHoWRFLTtG+Eb7dT0KIuhNJuj+PQYMm7/KBAUJa14Rf
 VGXu8RYH+CtnAVX00ZBBCN5vP89OFghXSnoBG+oeExHqjwSvz/Bz3Y9gG6pyk4Nq6l5f
 VQyYECKd0pPihudTNjnA0IqETxsW2vgw9YbFlt7RIWJ4x9lqfv+HiQEf1pyJ/WUkPb4z
 kzXjqK6RiZuragcbZupBg//9CyfHsY9PBq4G4xHDXuAKekghNpfUI8MR+nCBmpV4f3AF
 XZ+qu5p7N1GuHDiTsZOdH32iFpfxrqzWsxpsiyrTDa0SnvBeT24RYvW5wVyW96ehjhCq
 D03Q==
X-Gm-Message-State: ACgBeo1C2tpOM9MsoVNYrSDGjYYDYAhgYISQMRLMkg1G1EKCyWQobrKI
 QyzHl060eVscyoE8HMg+anBxqmOSWUFMVQ==
X-Google-Smtp-Source: AA6agR7k9cKLB8kIcViCK2/5pBfmY6lEk8lgzx52E4Mp5maqoGBN0DZhqD8ngM76a2XPpj+8gZqeKQ==
X-Received: by 2002:a05:6122:817:b0:377:59fa:3193 with SMTP id
 23-20020a056122081700b0037759fa3193mr9556091vkj.4.1660671279069; 
 Tue, 16 Aug 2022 10:34:39 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH for-7.2 v3 02/20] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Tue, 16 Aug 2022 14:34:10 -0300
Message-Id: <20220816173428.157304-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
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
all microblaze machines that uses microblaze_load_dtb().

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/microblaze/boot.c      | 11 ++++++++++-
 hw/microblaze/meson.build |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..e9ebc04381 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -39,6 +39,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 static struct
 {
     void (*machine_cpu_reset)(MicroBlazeCPU *);
@@ -72,6 +74,7 @@ static int microblaze_load_dtb(hwaddr addr,
                                const char *kernel_cmdline,
                                const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -100,7 +103,13 @@ static int microblaze_load_dtb(hwaddr addr,
     }
 
     cpu_physical_memory_write(addr, fdt, fdt_size);
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
 
diff --git a/hw/microblaze/meson.build b/hw/microblaze/meson.build
index bb9e4eb8f4..a38a397872 100644
--- a/hw/microblaze/meson.build
+++ b/hw/microblaze/meson.build
@@ -1,5 +1,5 @@
 microblaze_ss = ss.source_set()
-microblaze_ss.add(files('boot.c'))
+microblaze_ss.add(files('boot.c'), fdt)
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_S3ADSP1800', if_true: files('petalogix_s3adsp1800_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_ML605', if_true: files('petalogix_ml605_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-zynqmp-pmu.c'))
-- 
2.37.2


