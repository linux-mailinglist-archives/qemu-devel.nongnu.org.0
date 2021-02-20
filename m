Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AE320483
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 09:59:47 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDO78-0004Yo-D5
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 03:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDO5u-00043e-Mz; Sat, 20 Feb 2021 03:58:30 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDO5r-0007GO-HB; Sat, 20 Feb 2021 03:58:30 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d2so14619641edq.10;
 Sat, 20 Feb 2021 00:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=10SQjvq05st27/nX5N7/KLZqTBX2ZldzzJuVKpUXvYU=;
 b=Z6VUHhzmL/6Wv/XrSEjVPy18cPEP+p/z0ISdWPcOQIC/f6nLxlo2fhBxhDjF16lAf7
 QfvITk8hyG8fWBeqko/ui8nYWGetdpUfeEVO3zKCTZWCs/8Qw/FqAcufhgNrTpKBHBSw
 9svPtAR+vB65KKgMr9fS+/fT3zbFMVKGHFb9yvnbK0GCzVgIegmzrFrgl6DF7anVhNRt
 opTGQrEzKZ+ZZh8U4LGaEIEhz7i0TO5m+MnK0iqOoOoEMHErwe5ERtMxCRXC2tNLDBMT
 TuLu6LI8XTYp54ckhkEKOzWSZvWDiM8vm7ByS5NIWkUWpsS2iA5yCf2o/68+rJekzz1y
 m7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=10SQjvq05st27/nX5N7/KLZqTBX2ZldzzJuVKpUXvYU=;
 b=kml10FMsJH9gubWm66nyVgDidzFzuU8jFYn/uSi4uggvOJQnZq2XJ7aboqBytEiwjX
 OuVgvsrdZA5Aiu3R3UN0mGhQCGizupshCRhE4xI7+KcnKP4ev4B+bdf01E0GhsGYpcdq
 /SOsLi9Z2+lsleB42CEQrRkRGWS8XE42nzTi4YxVtQvuKQyH0Jb7MdRD0mDn9+8kfQHw
 h1sb0qwhj7pbXtIhK06WAwtgPlBHfkWWP98ekCyjfxbgP7GgRanskqa31CZcGDTVGJ5r
 iXSORjdthceHtxAP0uIK4PaWxkL5OPRWZf1ZXHU0RqL5ysu1SFuMN9mfRqhUCBaNDIE+
 Y7OQ==
X-Gm-Message-State: AOAM531vY6CwVLeaByVlfpeDeOHps8A2cWNHTalTAW6LlMRWgijnb0nL
 Pb7Li8RR84dT2heXhFov4/A=
X-Google-Smtp-Source: ABdhPJwyFtN9Ycwonx6ASIToNl2XaPTuATaxSpeqhZRrE5gaoAqEh6RjoBObcrbTc5daAv/SO5fg0A==
X-Received: by 2002:a05:6402:617:: with SMTP id
 n23mr13375560edv.257.1613811505778; 
 Sat, 20 Feb 2021 00:58:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id cd8sm843857ejb.0.2021.02.20.00.58.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Feb 2021 00:58:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] hw/sd: sd: Actually perform the erase operation
Date: Sat, 20 Feb 2021 16:58:13 +0800
Message-Id: <1613811493-58815-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
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

Changes in v3:
- fix the skip erase logic for SDSC cards

Changes in v2:
- honor the write protection bits for SDSC cards

 hw/sd/sd.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8b397ef..f52028c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -762,10 +762,12 @@ static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 
 static void sd_erase(SDState *sd)
 {
-    int i;
     uint64_t erase_start = sd->erase_start;
     uint64_t erase_end = sd->erase_end;
     bool sdsc = true;
+    uint64_t wpnum;
+    uint64_t erase_addr;
+    int erase_len = 1 << HWBLOCK_SHIFT;
 
     trace_sdcard_erase(sd->erase_start, sd->erase_end);
     if (sd->erase_start == INVALID_ADDRESS
@@ -794,17 +796,19 @@ static void sd_erase(SDState *sd)
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
+    for (erase_addr = erase_start; erase_addr <= erase_end;
+         erase_addr += erase_len) {
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
     }
 }
 
-- 
2.7.4


