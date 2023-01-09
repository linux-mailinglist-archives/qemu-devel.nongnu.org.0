Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F86625D1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqz4-0000YR-92; Mon, 09 Jan 2023 07:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyd-0000P9-Vp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyY-0006qD-3S
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id d17so7940579wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrtKRjVCEXmnX65xOqafU/4NBjLWdOq8NqX2Mi8y/bQ=;
 b=vWiqiUgel9gqgFUMk2dMTHnaIgThkHBREXtOZXsU6EXQs3kSu9VWAgILixHYtfSUFx
 s+FyoYULt2UIF7k67DNcJGSK8Iq+xnQ+wNsAJvNF06dtWj7E3F1KXEYUEhJXP6zaB2Ch
 9M7Vcl2Y7fTvS17Ym5/wTa0f8iUg+lk+zN6GJd9je9Usgm2HErr6D7Bh74rawr4dZlp4
 1gHuTNi7CI0ZSCoeWiHhGQ1UKHmSUgaod7FHLAUrHadVazkKJdUascBxV4p0NULNHrCC
 KibeLmJuLPvD4Q6jxiQBr7W0suh0hkRw+/Vx24GvgQFs5rQ72WPYXeTtACBZ2IVwf9OU
 D/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrtKRjVCEXmnX65xOqafU/4NBjLWdOq8NqX2Mi8y/bQ=;
 b=gT0IhO8HrRULK38dXjVoC3bqeNPAhzah6jTdFXrcQgLDv4d6t3uyrSdbey2/pxoRhX
 71U9Pr/eDtIEvb10BGiKJTcjEzhQm0j/mfAgkQVjeAkWdUo5H5pcWkMHO/rwSQ+GadDr
 ihm7CoPcq9NaWWNwkefTHHroXq+DESK0OMdQXOXmPp7gtXrWJL7X2ALdCFmkICQ8FQss
 eM5Nk/hiTW3S+Ghuc5tQHM8+PMXi975Az+o2ZDR9Vt2amqcfkOQXNL/qkKYbQdrP9y38
 vbPUP3Rj9hpvBInbb61RYILpY8SmBu1wBGxLweIipjLuRJef5XFiVmqybFjqUNMUmJ34
 Cv/A==
X-Gm-Message-State: AFqh2kop2/UNulnFoCEUPBBdjqmTUadtS1xjYlpVGa63VJVbt/Jt4ygi
 cOoMlFu3OFZ3KgLefqnR+Yx2sIl4aODNsuaO
X-Google-Smtp-Source: AMrXdXtckS4++YXSnQVK7ch+7xurwfRNC0EhhzMAHoN3/7dlML4vKEvpQbxsAcg+qyKJZWj2dxq9cQ==
X-Received: by 2002:adf:d084:0:b0:278:29ac:f894 with SMTP id
 y4-20020adfd084000000b0027829acf894mr31387214wrh.64.1673266200602; 
 Mon, 09 Jan 2023 04:10:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b0025e86026866sm9874017wrs.0.2023.01.09.04.09.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:10:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 18/21] hw/mips: Open-code pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:08:30 +0100
Message-Id: <20230109120833.3330-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
remove pflash_cfi01_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9657f7f6da..4605b06b3b 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1223,7 +1223,6 @@ void mips_malta_init(MachineState *machine)
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
-    PFlashCFI01 *fl;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *ram_low_preio = g_new(MemoryRegion, 1);
     MemoryRegion *ram_low_postio;
@@ -1287,12 +1286,16 @@ void mips_malta_init(MachineState *machine)
 
     /* Load firmware in flash / BIOS. */
     dinfo = drive_get(IF_PFLASH, 0, fl_idx);
-    fl = pflash_cfi01_register(FLASH_ADDRESS, "mips_malta.bios",
-                               FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE,
-                               4, 0x0000, 0x0000, 0x0000, 0x0000, be);
-    dev = DEVICE(fl);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "mips_malta.bios");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_bit(dev, "big-endian", be);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_ADDRESS);
     bios = pflash_cfi01_get_memory(dev);
     fl_idx++;
     if (kernel_filename) {
-- 
2.38.1


