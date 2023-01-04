Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5365DFED
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:23:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBvG-0002BJ-3F; Wed, 04 Jan 2023 17:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuJ-0001sN-IE
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:58 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuG-0005Bu-VX
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:47 -0500
Received: by mail-ej1-x636.google.com with SMTP id x22so85918321ejs.11
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zslv5ettm0BZ6lahZKOwlTaXvhF8s2DyuA1mWPRzCMs=;
 b=NxbffoqprVv6NlWkQCdargfgN3AeDlp6F+mpEaeWmQJ9ILjz/zFWD5ly8WRoPmkc71
 4O6RFG8PVjxFBO+xcP/suLGBeAD8GRcijOfILkqzCTB7E6cA3TER+4DbOPaj3sWoPSbv
 cqWMRBmc4KN/9N54hPVhfJIbrWzAK3Rblemr4+XOAAPZn1po/drvH/LapmVhbEzcCDAc
 b/P6/+JMraod5BtNeBlYPXkLA0/atgTBPKFmzXC6BPYlBIIJLNWlIboPQ3bMaQ2Q4SpW
 R2IVQuu6WQAqZ8wkuTlLgqQFpMHS6GZ72Vce4/VGxWWf1Sl3j+Be2wV4njDWwcJxRfI+
 8Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zslv5ettm0BZ6lahZKOwlTaXvhF8s2DyuA1mWPRzCMs=;
 b=crHycJMZikKXy9eHXjigJadL5iQDM8FUxe1BxnfmdMfzWVVylwpmef0h/wjf+Qz+OG
 L2YPugOlxJ0f1jBaFrbJndJjKWRNQFEcNjjyRC++oQgki9yyFzEgyi5WO9gJtyFdAr7K
 2PRWZlp6eLUlnkbIMxf60U0Y7/mX3k5ZT8qtev43zG/GXfDqMiQOdqC8Ld+5pxi3ku6w
 HG0K/nVyooc1YxEUS+gAgVE/1zC87ZOo8K576UQGsheWxsrUTu1ZIBNCPegwIhRbbfRB
 mU/vFELsJykJn2Snh/jId/pssgHzEdsj8SlAQlKDezCCYDSR5mvZvnv4EyT1qh2Zyzt5
 HZzA==
X-Gm-Message-State: AFqh2krj/qF0aiyBdBIfJKfLNOYzYGoUKl55BXlCZToHzm8DaKxsm8gt
 WpEjUIq9pAaanMvcYIyZML5GniVxESK7fwno
X-Google-Smtp-Source: AMrXdXtnKaw3mdJpb/NCzwKmXotk21jsO6EmRs6LLpgJgj2NT5YQutKoFUcGi80d2lpWO8uBFYeyJg==
X-Received: by 2002:a17:906:700f:b0:7c0:b79c:7d5f with SMTP id
 n15-20020a170906700f00b007c0b79c7d5fmr55349078ejj.68.1672870004011; 
 Wed, 04 Jan 2023 14:06:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hz8-20020a1709072ce800b007b839689adesm15807413ejc.166.2023.01.04.14.06.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 13/20] hw/ppc: Open-code pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:42 +0100
Message-Id: <20230104220449.41337-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi01_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c     | 12 ++++++++----
 hw/ppc/virtex_ml507.c |  7 ++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..a82c9e0642 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -82,6 +82,8 @@ struct boot_info {
 
 static int sam460ex_load_uboot(void)
 {
+    DeviceState *dev;
+
     /*
      * This first creates 1MiB of flash memory mapped at the end of
      * the 32-bit address space (0xFFF00000..0xFFFFFFFF).
@@ -103,14 +105,16 @@ static int sam460ex_load_uboot(void)
     DriveInfo *dinfo;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                               "sam460ex.flash", FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
+    dev = pflash_cfi01_create("sam460ex.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    if (!dev) {
         error_report("Error registering flash memory");
         /* XXX: return an error instead? */
         exit(1);
     }
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                    FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32));
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index f2f81bd425..ee211664a8 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -233,9 +233,10 @@ static void virtex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    dev = pflash_cfi01_create("virtex.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PFLASH_BASEADDR);
 
     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
-- 
2.38.1


