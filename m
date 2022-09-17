Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251885BB8B1
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 16:10:02 +0200 (CEST)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZYW8-0005qu-TN
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 10:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYTl-000429-Jj
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:07:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYTj-0007TZ-Nd
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:07:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id cc5so30459061wrb.6
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=vaQrz9cZqDB8fxEcDGeUPFHRDoY72XX8FUOaq54n0zA=;
 b=oX7o3n2hlQa+7Rcj3BFSsGKHlz6pmK/O97LGV4ic4QNVUxZGlGwCJxrq+VRHJJgJss
 Zz1hNvP1uyTMLIhBSve+s/rq9vRNTyoVSyfAypLbYDmbt8DmgzDp4Kie5808sVUsyAoo
 oQG828vwOPHTFMpi6yt5T2sDuRRIOed5j9jLhvuqh1EVbSuLdS/erUlYsNf9urlOykpf
 8XO2UF9hfyKzXyzJsfoRi4uR2jGzRR0tsiHk/PY5uZSClGgqZm3I/zKH52KZxb+xUmI+
 WcP1FU3/PftFXkqG+cu3XMVnNF1/3BdbiTWaV3Wap6ph5eWnA29GIkGHdq/hMe8+Bd0w
 WiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vaQrz9cZqDB8fxEcDGeUPFHRDoY72XX8FUOaq54n0zA=;
 b=eU6/sI9N78lk4Y5VUA5cQ/q0k+gmzv3aAKGltDswpmBOTxOnyqY7Q4gehtelHyEt69
 iqZvbhUcn4pIvNdWcbrJLf2KOeBkWmONZdLJXHx3odh5Jzi/0kUePB9P4dIq+8q9UnxF
 kBB0xQJEnYXBEKMbd75QBJ8YQFBCRERcc3Jl0viv17MgGq+E45YSYqClVqRgqsIR4nf3
 ZcNRhhcOPusc4XJOqzbw8mt2ybbh8H0nN/s2bEtql/InKxOuhHhwKPI1Dlg3u6Y59b81
 Bp1GG1fEcU1gVuS1nSLomv0It/C+zDYRTSRWoMVBgwrKdnAWIHu1XLFE5d0asTX0r5/P
 9Suw==
X-Gm-Message-State: ACrzQf2U5nh7IFcPwkRWGBnve9CmC+BCjOzHFOkc+rlrQ0FFUdZR/jGN
 owQU1gkdhqo0KDZcN6Ck1Xo=
X-Google-Smtp-Source: AMsMyM6D6cKF3QdsEFSusYEsZHkFuKdtfwpz1YMG7Jq8fKgzGnSx8vkDIDf9Vhhm99MyMUjEGs9Gag==
X-Received: by 2002:adf:eb02:0:b0:225:2b94:d14c with SMTP id
 s2-20020adfeb02000000b002252b94d14cmr6059220wrn.291.1663423649720; 
 Sat, 17 Sep 2022 07:07:29 -0700 (PDT)
Received: from liavpc.localdomain ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b00228a6ce17b4sm7898861wru.37.2022.09.17.07.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 07:07:29 -0700 (PDT)
From: Liav Albani <liavalb@gmail.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org,
	Liav Albani <liavalb@gmail.com>
Subject: [PATCH] hw/display: load the correct ROM file for isa-vga device
Date: Sat, 17 Sep 2022 17:06:50 +0300
Message-Id: <20220917140650.105033-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apparently we didn't load the correct ROM file when using the isa-vga
device, which resulted in a display waiting to be initialized by a guest
OS kernel. With this fix, SeaBIOS is able to print vital data to a text
mode console during boot, which is useful in case of failing to continue
booting.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/display/vga-isa.c | 2 +-
 hw/display/vga_int.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 46abbc5653..bcf646d012 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -84,7 +84,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
                                 VBE_DISPI_LFB_PHYSICAL_ADDRESS,
                                 &s->vram);
     /* ROM BIOS */
-    rom_add_vga(VGABIOS_FILENAME);
+    rom_add_vga(VGABIOS_ISAVGA_FILENAME);
 }
 
 static Property vga_isa_properties[] = {
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 305e700014..b5e803ac51 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -183,7 +183,7 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val);
 extern const uint8_t sr_mask[8];
 extern const uint8_t gr_mask[16];
 
-#define VGABIOS_FILENAME "vgabios.bin"
+#define VGABIOS_ISAVGA_FILENAME "vgabios-isa.bin"
 #define VGABIOS_CIRRUS_FILENAME "vgabios-cirrus.bin"
 
 extern const MemoryRegionOps vga_mem_ops;
-- 
2.37.3


