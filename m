Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9AF65C431
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 17:49:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCkSn-0005Eu-MD; Tue, 03 Jan 2023 11:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCkSk-00059s-Er
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:48:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCkSi-0006pv-Rn
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:48:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso21633914wmb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1+/2U4c2jz7FuN+HYbjdpm7LXcWK38fV7wkmohQlrig=;
 b=U8/A/WiBNcwAMmtUYN/tbaPrqiXOjmIuT7aOtXT/d37m4hbUvw6xcbbc1ew+BUosI8
 yQ02Wpmlo7ALxaLKstUprg2iAQKazPUBKkhT3QI0ZTwwOaFakvzhM5Ve2Nx6g2kgFIZN
 vA/A9TSWhy7y7AQfP2aIAOcAIAM7wlU23Rq86OBdFObv6NnwoUD6Y1HeepFfkO5p/LE5
 RVR+8QxsCwbzh9il4VMUt5vliJTpFh4vcDy45Y+cZ7TbC7fiitKSv3HGmG/KYdbOLEi8
 kPBotmR6U7+8Z+J00WHQCFE0hAL8Gix+0g2ukUjbYJYLx+CpuKNkivkwkeB1fxlNGSJY
 D22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+/2U4c2jz7FuN+HYbjdpm7LXcWK38fV7wkmohQlrig=;
 b=TwQ40RFG3HDryTOC1sAxdP1Fk2Fr9Drrs6WheQojJOalUd3PRFz/HyehNpAse2DysY
 k6Keq9fhMC3iRXavu1mobgiq3tB201kmCYsXtIc9Y0BauCVBGZ3rdNUVO3PqFXK6NOem
 gJO4JakeT6jTN8cCNVrzCDDzyipe53IZe2TL3tELFZpFgO3IyiIghzE6QB0OQOYHfC4n
 r/iy4jXqT+qP/GHNcWmP4dQm0XGPYpJBG7Oyndn7m3cLDE/z+Z3xBDGVabYoNIOoJrJU
 sdtmA2WJW7i38R+6W3LmYnArfU+twH9BzTvy6wlno0J7HuKf4sUo16hNAG2H7Nl2J9Kh
 j2jA==
X-Gm-Message-State: AFqh2koufI1TtdNNkPkdC0F7w4wx6MPln1wwlH3VekXdaT3w81FHcg7b
 CDVzEkfiOSPXQxo7rLqt2dqWwt9v/aPKV4wF
X-Google-Smtp-Source: AMrXdXsfzdkL8oxI2MZoiByoRKnANf2el7Any3cbVPB0dbLxzMzNFqfrD4yigJgijhJ09AsAHdzvuw==
X-Received: by 2002:a05:600c:2112:b0:3d3:396e:5e36 with SMTP id
 u18-20020a05600c211200b003d3396e5e36mr31119224wml.0.1672764506851; 
 Tue, 03 Jan 2023 08:48:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm31924742wmg.16.2023.01.03.08.48.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Jan 2023 08:48:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/pci: Display correct size for unmapped BARs in HMP 'info
 pci'
Date: Tue,  3 Jan 2023 17:48:25 +0100
Message-Id: <20230103164825.95329-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

When a BAR is not mapped, the displayed size is shifted by 1 byte:

  (qemu) info pci
    ...
    Bus  0, device  11, function 0:
      Ethernet controller: PCI device 1022:2000
        PCI subsystem 0000:0000
        IRQ 10, pin A
        BAR0: I/O at 0xffffffffffffffff [0x001e].
        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001e].   <===
        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].   <===
        id ""
    Bus  0, device  18, function 0:
      VGA controller: PCI device 1013:00b8
        PCI subsystem 1af4:1100
        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].   <===
        id ""

Only substract this byte when the BAR is mapped to display
the correct size:

  (qemu) info pci
    ...
    Bus  0, device  11, function 0:
      Ethernet controller: PCI device 1022:2000
        PCI subsystem 0000:0000
        IRQ 10, pin A
        BAR0: I/O at 0xffffffffffffffff [0x001f].
        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001f].   <===
        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003ffff].   <===
        id ""
    Bus  0, device  18, function 0:
      VGA controller: PCI device 1013:00b8
        PCI subsystem 1af4:1100
        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000ffff].   <===
        id ""

Fixes: 0ac32c8375 ("PCI interrupt support - 'info pci' monitor command")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci-hmp-cmds.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index fb7591d6ab..8cfa5f9cd1 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -75,22 +75,24 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
 
     for (region = dev->regions; region; region = region->next) {
         uint64_t addr, size;
+        bool mapped;
 
         addr = region->value->address;
         size = region->value->size;
+        mapped = addr != -1;
 
         monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
 
         if (!strcmp(region->value->type, "io")) {
             monitor_printf(mon, "I/O at 0x%04" PRIx64
                                 " [0x%04" PRIx64 "].\n",
-                           addr, addr + size - 1);
+                           addr, addr + size + (mapped ? -1 : 0));
         } else {
             monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
                                " [0x%08" PRIx64 "].\n",
                            region->value->mem_type_64 ? 64 : 32,
                            region->value->prefetch ? " prefetchable" : "",
-                           addr, addr + size - 1);
+                           addr, addr + size + (mapped ? -1 : 0));
         }
     }
 
-- 
2.38.1


