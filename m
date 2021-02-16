Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF031CC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:07:57 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1xE-0000kH-KP
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sT-00042A-5k; Tue, 16 Feb 2021 10:03:01 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sO-0006Hr-Qr; Tue, 16 Feb 2021 10:03:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fa16so5833068pjb.1;
 Tue, 16 Feb 2021 07:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVLoeOVJp9q7DsPltr9A/wo49yKr2mue6D7BSzcsiEA=;
 b=Jy452m6ggg5d+NG6FtyXs1w8N63yJDZVjA8c+7t50Cjxhm2XVpPwQowtzCgYZmwTMQ
 7RlHY5KY4VrPkZfu8hyqo+ZiHedlmgB0LXDeH8W73vymsSdWdjdWZQnjva+WAlwUizSq
 0zYFUHfD93ebc4pF5v6+z0t628muaS1Tn6lpyOKZDliblnsZv5O8j8x1WsFZQMtn7hHZ
 eLtHa8xlSCyFcVtKxvSatGRjca9gALARyCSgJd0zbvgti9Ky0vMKYkNrklgcu7LZhgTo
 dEnpx/cvJmni1hl3enGPCSkFSvFKCv0AwWs3qsvf7tiikGcJk6y6C0ARY6UPvAkPZUix
 ryQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVLoeOVJp9q7DsPltr9A/wo49yKr2mue6D7BSzcsiEA=;
 b=OQDJy6G5Lu/E7Eodg9kguGWWYIPMGZ1jd0zrE5dyL6uD0YOFbvYpJxhxpZpxRHiUd7
 RjpgvoUxrfyuWHnRLxHjMNLLkYFzt0H5zTaOugbIX0PnIasm3+EjPPqm8hnVbtdM1ass
 0WZJr9xN4B4U4ULDDsTrCmF6dpskRvzaI0SdYJn5nHDOemdsmpepbdATORohBSJYTinH
 DTK+pk5HLjQ/IFGazpHYvqv2DW3roxHuDR9f7Z7l156VOLAaVWjRgm0CiGB1ePAjzu93
 tDU68MU6ZLKbCTRGgSuD4AIx2dR8dd5W4btxyACe9A6w85YQl54ruI977QiTAwRkoHZh
 +fNw==
X-Gm-Message-State: AOAM532VMIWvi5h/h08d2dlJVZLBNy6KtHyDZqEYVU1qWXHI43P1RlSz
 BmvmjsJxmlBeoKcEEKz4vqhRRb2cd1w=
X-Google-Smtp-Source: ABdhPJxc/CSQ/WftuQMu0MyS5kT0k3URNpJ/tsAbt46imlIKJkHBN8Par20DYvmYqklAROq+IOt1bA==
X-Received: by 2002:a17:90a:7f8a:: with SMTP id
 m10mr4697346pjl.102.1613487774511; 
 Tue, 16 Feb 2021 07:02:54 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:52 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/sd: sd: Skip write protect groups check in
 sd_erase() for high capacity cards
Date: Tue, 16 Feb 2021 23:02:22 +0800
Message-Id: <20210216150225.27996-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

High capacity cards don't support write protection hence we should
not preform the write protect groups check in sd_erase() for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: sd: Skip write protect groups check in sd_erase() for high capacity card

 hw/sd/sd.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 5bd95304f1..f1f98bdec3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -765,6 +765,7 @@ static void sd_erase(SDState *sd)
     int i;
     uint64_t erase_start = sd->erase_start;
     uint64_t erase_end = sd->erase_end;
+    bool sdsc = true;
 
     trace_sdcard_erase(sd->erase_start, sd->erase_end);
     if (sd->erase_start == INVALID_ADDRESS
@@ -779,6 +780,7 @@ static void sd_erase(SDState *sd)
         /* High capacity memory card: erase units are 512 byte blocks */
         erase_start *= 512;
         erase_end *= 512;
+        sdsc = false;
     }
 
     if (erase_start > sd->size || erase_end > sd->size) {
@@ -788,16 +790,20 @@ static void sd_erase(SDState *sd)
         return;
     }
 
-    erase_start = sd_addr_to_wpnum(erase_start);
-    erase_end = sd_addr_to_wpnum(erase_end);
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
     sd->csd[14] |= 0x40;
 
-    for (i = erase_start; i <= erase_end; i++) {
-        assert(i < sd->wpgrps_size);
-        if (test_bit(i, sd->wp_groups)) {
-            sd->card_status |= WP_ERASE_SKIP;
+    /* Only SDSC cards support write protect groups */
+    if (sdsc) {
+        erase_start = sd_addr_to_wpnum(erase_start);
+        erase_end = sd_addr_to_wpnum(erase_end);
+
+        for (i = erase_start; i <= erase_end; i++) {
+            assert(i < sd->wpgrps_size);
+            if (test_bit(i, sd->wp_groups)) {
+                sd->card_status |= WP_ERASE_SKIP;
+            }
         }
     }
 }
-- 
2.25.1


