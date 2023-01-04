Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E465E01E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:39:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBu6-0001J5-Pk; Wed, 04 Jan 2023 17:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBu4-0001FL-AR
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:32 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtz-0005cY-Du
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:29 -0500
Received: by mail-ej1-x62d.google.com with SMTP id tz12so85983103ejc.9
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRH2/Q6+taaY1C0mf1jUv5OrxulMB7iM/Sfo6HL2IVQ=;
 b=nEDbMFtYiuO1tEPpkdBXhy5oQT831LiUY2iJK+y3FXzANhPxIRXugZteugbGJtczIU
 wxk9hW2bT12/v8IrT5Z65Xkhd+ABeve3HRZ6aQeaw++II7ljORjep1OVHv6bURhYyF6U
 2ljIr4BXQitZtVzV2B6tgLnF+lIAB1yCgrbobDTMZRoWQhDu1muauHwZg3ZVnMr78rAd
 t+GJa9IMINib8sQFgtLZBscBE/cKQxRSq5/+pueGDxdF8P8qIDcq3NZtYGgMJeqUzQbr
 QrThF7plmTpACKFaVtYnIhTP06J/IbOkPLPzOkG35qCT27eMLrHgoadrp6Vm0jFjKFx+
 2CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRH2/Q6+taaY1C0mf1jUv5OrxulMB7iM/Sfo6HL2IVQ=;
 b=GW5CrhhkN3SzxhP/jppvc7+B71VAdTXvkOKIY2BpC7tr2yLtZBW5FKH/PwKpPRog5E
 psSH0jsVThOJGoU11g3nvnQ+9T5a0Q6rd+CYm8MioSRWs9K/4Ju+2lQNh6A7EJQga8du
 m+a57j3kOQUB9bOPr2bpTTu4Qj/TjwV6AphFMeyNZJJNddFq6cQigV6FncBRpe2K1F12
 kbRYYfXtBEFwiAdwOQpRFTwVgq8YxkA0/ngNBc0nWLt+C2Y1PWjjyV4VpAEssd0GwRt6
 6eeworWIRfNGngi414oMdQeggHL68Q+LqSwrWO1sN7N+Jr97kSpnAvPiJQU0/cUTAEMu
 Vylw==
X-Gm-Message-State: AFqh2ko5cirxU1cKvPEUYk1JulZYLc1u+caMvlAKXurXaun7iMMm6gVk
 ufUHo7yJd0unYCQ5ZEQys2pgzS/UD5Oss4HY
X-Google-Smtp-Source: AMrXdXvvA01RJqv8oimb3A41Jl9v5nfQM3M6y1vT9mQAXVPWc/Tif+z0vVOVkkealNwvS6JmLvFduQ==
X-Received: by 2002:a17:907:3f9d:b0:7c1:1c4:5eaf with SMTP id
 hr29-20020a1709073f9d00b007c101c45eafmr60776998ejc.49.1672869986450; 
 Wed, 04 Jan 2023 14:06:26 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b0073d796a1043sm15640103eju.123.2023.01.04.14.06.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:26 -0800 (PST)
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
Subject: [PATCH 11/20] hw/microblaze: Open-code pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:40 +0100
Message-Id: <20230104220449.41337-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
 hw/microblaze/petalogix_ml605_mmu.c      | 8 ++++----
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..d5ff71218d 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -105,10 +105,10 @@ petalogix_ml605_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     /* 5th parameter 2 means bank-width
      * 10th paremeter 0 means little-endian */
-    pflash_cfi01_register(FLASH_BASEADDR, "petalogix_ml605.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 0);
-
+    dev = pflash_cfi01_create("petalogix_ml605.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_BASEADDR);
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr", 1 << TIMER_IRQ);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad8..426ff1de93 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -84,10 +84,10 @@ petalogix_s3adsp1800_init(MachineState *machine)
     memory_region_add_subregion(sysmem, ddr_base, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(FLASH_BASEADDR,
-                          "petalogix_s3adsp1800.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    dev = pflash_cfi01_create("petalogix_s3adsp1800.flash", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_BASEADDR);
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr",
-- 
2.38.1


