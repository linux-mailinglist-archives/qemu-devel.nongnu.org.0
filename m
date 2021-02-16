Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3A31CCBA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:15:49 +0100 (CET)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC24q-00015A-JR
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sU-000462-ND; Tue, 16 Feb 2021 10:03:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sR-0006JB-Dt; Tue, 16 Feb 2021 10:03:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id kr16so1168458pjb.2;
 Tue, 16 Feb 2021 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mikx3g/Wkm4cF8mz7QyYzzqf/IjcSyCclPHpXfyoxA=;
 b=dfUc2ycrItnq7vUg8W6Nb1+51RWA9RIPvV+DBMp1GAv8mGY5Sk+L8okJhHo+/5JmRz
 NBYvA+JPTMN7nl+LnO1xg2ESDMkra/AW5NGJMCd9v5S/3yqUPyHs+QY4yEZGnOJwOAbM
 pZWdD2rgB2GXmNalypFZb7IfsuB+BUd7Spqt/Nuc5Q0hO8/iKuze1S96YBr/I2YXqcc1
 DvwMwQXTSUGC9yqHSgA+YFQVpG2eizGMkawjnQX1YkZNtk/d0+/VE10lc/RpjZxUbta1
 CN/6G097NpFdPwwJ0qdFTd7hAo+alJdXg7YXVxiN2YdExbjddojIthITG7gEr3TR+I20
 g8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mikx3g/Wkm4cF8mz7QyYzzqf/IjcSyCclPHpXfyoxA=;
 b=LLp8f/SMwcAUNVHiQX/qvTLWVK7kZXjO0o2yLmCW6CYUkGAXZF/MRidm20EuTYRrbV
 NIhjoqUMBss5ymtCT6W5AJP4IZ6uRd8SxKp5CBYor7ak9LWDuDzurE5pkz2IIDkYoyNk
 psC6Qz4NlAYMxotMCSHU6ZVJZspH1zopgHHdSGdU/zCvcuTMpfErFtur6Gd3/IDIPa1W
 I7nKVRoSOQ05bRKtMABLYiv5QDCH0bkl0FIOaXnlm3NpduCCVjEEWNAgPaGZEX+y4hUd
 kkJZn28HAuYpP/QKc9y5tMPxUrErR2+urA6lqJPGX6eJxzljcFnQuaEOLZjHVBofCeVH
 U4cA==
X-Gm-Message-State: AOAM532lPDYUd2I2gfsBAMHRGoH9wWSTfOOCR6NZ+XfPJcGpu1EQ0y2J
 tcTu8C6ckAocbP7zs00DmiONVEBKdjw=
X-Google-Smtp-Source: ABdhPJws+YnAe+rzXIc1zBwP/5fcOZH79SzW7360lpLyBwDAlawKtwtjgsmJgjtCBACS0SLOwoAn1Q==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id
 l10mr4789379pjq.86.1613487777380; 
 Tue, 16 Feb 2021 07:02:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/sd: sd: Actually perform the erase operation
Date: Tue, 16 Feb 2021 23:02:23 +0800
Message-Id: <20210216150225.27996-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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

At present the sd_erase() does not erase the requested range of card
data to 0xFFs. Let's make the erase operation actually happen.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- honor the write protection bits for SDSC cards

 hw/sd/sd.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index f1f98bdec3..b386f16fcb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -766,6 +766,9 @@ static void sd_erase(SDState *sd)
     uint64_t erase_start = sd->erase_start;
     uint64_t erase_end = sd->erase_end;
     bool sdsc = true;
+    uint64_t wpnum;
+    uint64_t erase_addr;
+    int erase_len = 1 << HWBLOCK_SHIFT;
 
     trace_sdcard_erase(sd->erase_start, sd->erase_end);
     if (sd->erase_start == INVALID_ADDRESS
@@ -794,17 +797,20 @@ static void sd_erase(SDState *sd)
     sd->erase_end = INVALID_ADDRESS;
     sd->csd[14] |= 0x40;
 
-    /* Only SDSC cards support write protect groups */
-    if (sdsc) {
-        erase_start = sd_addr_to_wpnum(erase_start);
-        erase_end = sd_addr_to_wpnum(erase_end);
-
-        for (i = erase_start; i <= erase_end; i++) {
-            assert(i < sd->wpgrps_size);
-            if (test_bit(i, sd->wp_groups)) {
+    memset(sd->data, 0xff, erase_len);
+    erase_addr = erase_start;
+    for (i = 0; i <= (erase_end - erase_start) / erase_len; i++) {
+        if (sdsc) {
+            /* Only SDSC cards support write protect groups */
+            wpnum = sd_addr_to_wpnum(erase_addr);
+            assert(wpnum < sd->wpgrps_size);
+            if (test_bit(wpnum, sd->wp_groups)) {
                 sd->card_status |= WP_ERASE_SKIP;
+                continue;
             }
         }
+        BLK_WRITE_BLOCK(erase_addr, erase_len);
+        erase_addr += erase_len;
     }
 }
 
-- 
2.25.1


