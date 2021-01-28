Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D3306DE1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:51:40 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l519X-0006X8-Bs
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511h-0000ua-49; Thu, 28 Jan 2021 01:43:33 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511b-00055i-Ac; Thu, 28 Jan 2021 01:43:32 -0500
Received: by mail-pj1-x102d.google.com with SMTP id jx18so3698095pjb.5;
 Wed, 27 Jan 2021 22:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKMbU3gPPNZSIwtgqoe1TvcR5/JaVl30LFswMNv0fOY=;
 b=kQljydyJZhf3j5gp6PYjCqXoXxtk2YvIK0WIvBfMbLw5A7XS4ty+SQIEsCDUT8ePU7
 lv84LRq6X6pYyvdaxbjDqyzH4Lf7ndjY54Sh+95r9veEPV7rHZK61kzEDOjFHcCo8yTY
 7qfBym3Zl80+ZUAA/4s+Z3BKdlL7WwcGAMZV5XUlDPYwFZpZJY+JDxN2pZIZ/qhLBKwE
 TfGktyE7Ft2LK0LaKQxlwZmR6fSeDfXUj7udSrncIiHPEfjqh0yyRPwKGNHbbU93SQ55
 S79zC1a7W0dKmXbNNsnoLNmL8phvA+YA54pQpgn/DhD9W4QKNbJ2iQ1zZkqn/sCMTr7R
 Tzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKMbU3gPPNZSIwtgqoe1TvcR5/JaVl30LFswMNv0fOY=;
 b=ljJrE5kcPPLJ4e2DKGOjfl7Hs14mcON4D+XgbyBMOPojexHXjhMhMEHOZPH4Gf8Wiw
 vau/AMa2SZdrGfaZNqNJuhkDYFTLUqxQdH8KgcajE5nzZpQYowBGdVngHBIjLBrEb5IJ
 MFahvs5YtSaTCgplRujesu9c2jL6hQkp/KjDEYaLTxkGxTYEHD0PheSnX4jCyBGnudb1
 y0DkFlNwEmCTBIIHWIbGWfvOG+uPBmCS0D3FtlNhadWizsC7AJkX7wGisdzmL9ILfn3l
 0+sYU69/k077OLp9sbGDrpNLZz+JaiZuLBjwluFTO1yW9vFaQade8IowbAI8joCEVH+n
 dXWA==
X-Gm-Message-State: AOAM5319v7inyZ93FhDkTdzxqe+JsJW6CqFRjhMXMVrMR4IsBU+3JOZD
 qMGLqcmyhrI+cLQ3ERSce5Y=
X-Google-Smtp-Source: ABdhPJxQ0b+QrHxEBKFP5x6VI/a0KZjjGOJ4EXvpjLznUG+1jqH+bV0xF3FO6PYmPvXC3DrWd5c7Pg==
X-Received: by 2002:a17:903:248e:b029:de:b329:ffaa with SMTP id
 p14-20020a170903248eb02900deb329ffaamr15085852plw.71.1611816205204; 
 Wed, 27 Jan 2021 22:43:25 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm3800609pjh.37.2021.01.27.22.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:43:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/sd: sd: Move the sd_block_{read,
 write} and macros ahead
Date: Thu, 28 Jan 2021 14:43:11 +0800
Message-Id: <20210128064312.16085-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128064312.16085-1-bmeng.cn@gmail.com>
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
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

These APIs and macros may be referenced by functions that are
currently before them. Move them ahead a little bit.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a6a0b3dcc6..1886d4b30b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -739,6 +739,27 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
     qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
 }
 
+static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
+{
+    trace_sdcard_read_block(addr, len);
+    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
+        fprintf(stderr, "sd_blk_read: read error on host side\n");
+    }
+}
+
+static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
+{
+    trace_sdcard_write_block(addr, len);
+    if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
+        fprintf(stderr, "sd_blk_write: write error on host side\n");
+    }
+}
+
+#define BLK_READ_BLOCK(a, len)  sd_blk_read(sd, a, len)
+#define BLK_WRITE_BLOCK(a, len) sd_blk_write(sd, a, len)
+#define APP_READ_BLOCK(a, len)  memset(sd->data, 0xec, len)
+#define APP_WRITE_BLOCK(a, len)
+
 static void sd_erase(SDState *sd)
 {
     int i;
@@ -1742,27 +1763,6 @@ send_response:
     return rsplen;
 }
 
-static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
-{
-    trace_sdcard_read_block(addr, len);
-    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
-        fprintf(stderr, "sd_blk_read: read error on host side\n");
-    }
-}
-
-static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
-{
-    trace_sdcard_write_block(addr, len);
-    if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
-        fprintf(stderr, "sd_blk_write: write error on host side\n");
-    }
-}
-
-#define BLK_READ_BLOCK(a, len)	sd_blk_read(sd, a, len)
-#define BLK_WRITE_BLOCK(a, len)	sd_blk_write(sd, a, len)
-#define APP_READ_BLOCK(a, len)	memset(sd->data, 0xec, len)
-#define APP_WRITE_BLOCK(a, len)
-
 void sd_write_byte(SDState *sd, uint8_t value)
 {
     int i;
-- 
2.25.1


