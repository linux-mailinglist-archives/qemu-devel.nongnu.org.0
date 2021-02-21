Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA208320B21
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:51:45 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq5I-0001O7-RT
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr6-0007yA-AD
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqx-0003Gp-5c
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:03 -0500
Received: by mail-wm1-x332.google.com with SMTP id x16so11168481wmk.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YyNKszL48OLaM4ZNQExWphMxCaJDhi1vd5fOtm2espU=;
 b=HC/RGTL+hsGWRRRcmn7cw8NAOegAzgLc/H9Z1JZOHrFRseVuWEBaHwkJtkdP21+0OF
 V4osk0HcroAeDatkFqUG3IAYsxIBV2fwmG0qV177w5opVisCSUAil/4O3zBP6EKQ/XN3
 /HgvVFcnoOdoElpRyGXPPBhw2YYIiiM/Wdp7+Y7r+s4Ajv2eL2Pacjlw9TMtvuLsqGPJ
 m8dHcCpN+xTTChgDlC2IJFXuTMV0Umt0w37H0m8yzBem6z1nZDH9D5YQ8wMDGYN6tKfC
 HKGnwD4c3473P86We+vaDfZqYdTLekQDvPWbJFrcai02MzZNsjXT1BeuHyNz0KTo+QRw
 5glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YyNKszL48OLaM4ZNQExWphMxCaJDhi1vd5fOtm2espU=;
 b=bbP+MblDw/MQUKy+Y2eRiFYAWg/q1RRe4tohzYoZNGS3MuS44RYB2hiQQeCoBnlRfp
 bkrhpzncxxieIf238ro4UiM9HR5YTGTOol3d6aqSj6RPDzcHUggigHwYBwFpnu8rJoaf
 0OU4sSxvzEjuglFBmiMb4BlAoPXrOcTw41LOhte7Kz//40eUKn/lTh5KUjPaEXi+jmmF
 bYq6lgpsUe5xbKZHpkL7Y8s3bd3zY1mM8ptn645TGgNCF7E2dETb+fPs2Vlka7HM/Hm3
 Sk65KImkfBVuH5JC9tVnJD1AxX3lZOtaO+OtEmKyL5aBEgzF2wnb+QJeR7iFGH3wQ1Wj
 uBqg==
X-Gm-Message-State: AOAM533ZlDbWy/H3mfVJvrRqqa4Distb8P+IHpRppWTmH8vunVv94xLy
 sHDvwhv9XAXYlFmUWSGk0JiFUyvV10k=
X-Google-Smtp-Source: ABdhPJxirevuMfZpwLgMNzgagX+TnOifS3lzTsN8Z8knXpQzBXraeIZ8RKPEZsWYV/SSKQ6+qtsxPg==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr16346008wmq.35.1613918213689; 
 Sun, 21 Feb 2021 06:36:53 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm27300383wro.15.2021.02.21.06.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/43] vt82c686: Move superio memory region to SuperIOConfig
 struct
Date: Sun, 21 Feb 2021 15:34:17 +0100
Message-Id: <20210221143432.2468220-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The superio memory region holds the io space index/data registers used
to access the superio config registers that are implemented in struct
SuperIOConfig. To keep these related things together move the memory
region to SuperIOConfig and rename it accordingly.
Also remove the unused "data" member of SuperIOConfig which is not
needed as we store actual data values in the regs array.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a6f5a0843d0..30fe02f4c60 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -29,12 +29,11 @@
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
     uint8_t index;
-    uint8_t data;
+    MemoryRegion io;
 } SuperIOConfig;
 
 struct VT82C686BISAState {
     PCIDevice dev;
-    MemoryRegion superio;
     SuperIOConfig superio_cfg;
 };
 
@@ -128,8 +127,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
-    if (addr == 0x85) {  /* enable or disable super IO configure */
-        memory_region_set_enabled(&s->superio, val & 0x2);
+    if (addr == 0x85) {
+        /* BIT(1): enable or disable superio config io ports */
+        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
     }
 }
 
@@ -311,15 +311,15 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->superio, OBJECT(d), &superio_cfg_ops,
-                          &s->superio_cfg, "superio", 2);
-    memory_region_set_enabled(&s->superio, false);
+    memory_region_init_io(&s->superio_cfg.io, OBJECT(d), &superio_cfg_ops,
+                          &s->superio_cfg, "superio_cfg", 2);
+    memory_region_set_enabled(&s->superio_cfg.io, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
      * But we do not emulate a floppy, so just set it here.
      */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
-                                &s->superio);
+                                &s->superio_cfg.io);
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
-- 
2.26.2


