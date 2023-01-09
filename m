Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5266256D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxz-0000Ce-Jh; Mon, 09 Jan 2023 07:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxx-0000Br-DM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxv-0005wv-Re
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id bn26so7957833wrb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFd+wtyzXvHOeirlkajEST4RkXpF4SUSar3CLCCFjSo=;
 b=B/VBGUBBgglIotjkVDDiVq/pTTeQ4vKdc5vNNlPZFt10XpkNQ5aN5fs0Z3+z3gHjxe
 UAscrZY/sf8P79IteY6WQu8+jnior4hy2rKRA3EYJC2jd+rU8msU+XbmOh79aMYJX/2j
 DXsTF+UiIxwucttqKFF991WBWmGkJT3Axnss0IlDav6rB89Kpnf97HRVBw4c1ReOzX34
 dSAsqkbYoy51zYKFy70w80LU9CrQJkg+Y13IY7Xuw77GOqidWkGNaNB0toFUklrBpxDB
 sLogBHah89EVH78t5m8hH9uhpSrdJNdabqTv1XP2vW8VQGFORFMtqgZyELIs3siAauib
 JStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFd+wtyzXvHOeirlkajEST4RkXpF4SUSar3CLCCFjSo=;
 b=j0fbc63BlMW6OkEQKDLdu/H3KKYFenA7lg8zE0kcaMBHjjHsYXjcX+vaWimJdavAg4
 g+37MLdhMASjQxKeMPeFHc7ReBnkzQDEfNLNRrFK2Mt1ll78/DcBVpLaygKTIBCY/OOK
 lDQ4Z80RlyNbHS7p63myARqmYPaX8AaqKETxVK/N+tfo+xzUNrYSS7glxj/gU4ea38ES
 2sUcsKM538YSf4gvUMLXtWTwmU+0AhfeR6s0Bo3eF10IrtvbAndS5EKvSReyt2KFSbks
 PWmrTuaLXhEDHXNBJpBbP2vWAIfv9aftEm7P3TC+NgEPpcznIQ5NjpHLF8dpAi/7LJca
 xqVw==
X-Gm-Message-State: AFqh2kofhK+tVfC7K5jVZlXLFGI+13/OewmRfTYPNAu5kyrUZU8iXr/Z
 5ZJ374X0wTyxEz1JSqsYnfW8J14pxRKUqJKd
X-Google-Smtp-Source: AMrXdXuexm45dS3KnylkRD52DINNJLJRDT1E5uPf62YUxSqaxRCXNLw1winnbPLuGfJlKeBFPmTkEg==
X-Received: by 2002:a5d:5045:0:b0:27b:b974:2c01 with SMTP id
 h5-20020a5d5045000000b0027bb9742c01mr34284586wrt.71.1673266162926; 
 Mon, 09 Jan 2023 04:09:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b00281b594c725sm8310518wrv.38.2023.01.09.04.09.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/21] hw/sh4: Open-code pflash_cfi02_register()
Date: Mon,  9 Jan 2023 13:08:22 +0100
Message-Id: <20230109120833.3330-11-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi02_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 6e0c65124a..9d31fad807 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -303,10 +303,23 @@ static void r2d_init(MachineState *machine)
      * addressable in words of 16bit.
      */
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 1, 2,
-                          0x0001, 0x227e, 0x2220, 0x2200, 0x555, 0x2aa, 0);
+    dev = qdev_new(TYPE_PFLASH_CFI02);
+    qdev_prop_set_string(dev, "name", "r2d.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_uint8(dev, "mappings", 1);
+    qdev_prop_set_uint8(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x0001);
+    qdev_prop_set_uint16(dev, "id1", 0x227e);
+    qdev_prop_set_uint16(dev, "id2", 0x2220);
+    qdev_prop_set_uint16(dev, "id3", 0x2200);
+    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
+    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
-- 
2.38.1


