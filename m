Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CC31CCA0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:09:50 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1z3-0003h1-8z
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sT-00043O-KC; Tue, 16 Feb 2021 10:03:01 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sO-0006HZ-Nk; Tue, 16 Feb 2021 10:03:01 -0500
Received: by mail-pl1-x631.google.com with SMTP id e9so5624724plh.3;
 Tue, 16 Feb 2021 07:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rcqRgqBLhMCXJ935hWc3GCd19LXLPeIz9E4wlYQMLM=;
 b=CkhKVX25ZYMg8Pw/emR2H/jhxzcVZgnZA5XUtOLNSlxbDkD50TQFHTdbsoLoOldzml
 QbJoOL10KofIFg1GbAtQl4Xlz+nD6xZVQZGBwlCPlIovQ5Oxj5dF58Ks3iPKsGfR8Mph
 QP5pryrejYOH9G664t+QGLRuEu9J8APXxHuvjp8y5C/tSmsFhoLoA+/Got4Ouxd0ALgv
 DlRCh69QewHJhY59lF7XHcvaVSgl0D/iE1n+GxllWQO6s/agNTfajhz9e+UNwkWs69UU
 DqXWjQIfdWsnldeiyZ4EqE5eYlGQhnJ3Hzk5w0SPZOw2NxIwouivs1vn2gMqmmoxnjpq
 Wjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rcqRgqBLhMCXJ935hWc3GCd19LXLPeIz9E4wlYQMLM=;
 b=pKnUB4iZac3Fhga02xGj7BaqHzkqZK6HOtJYWk75trWL0xYPpKr6iCEHz0AVSW6t9l
 MA9u0C/SNM9LFUXfbhnwQKYmoM7tv0YGuuGe5LriYCryfOWfejUVnZjAcVj5MlQK5wPQ
 bCyNdBdjFDv6Kg1i2pyOXiS4Ne56hxuwWJFvjsPDl6PbEyOwEQgwwgzapfinkrAZNKgq
 MbYJuBYsPhpjA/vn4REyI2WnM0IndkkbEDRONidJZFsrAx9kSIEOg7xRoXBp6kNJf1tR
 Fi2ZvqM7W1m8tZUqil+REbYZJkRRE4nw/wGJQGet+/0QTFSG/YgPYMiE726zIJPh+7av
 aEPA==
X-Gm-Message-State: AOAM531oTD5kxc1NiKiz8XC6ZrBjxif+IN7OJ1lDg9fbWLEaqLpBtH50
 i9RTwBn+kvxnzA6ymKLYz9s=
X-Google-Smtp-Source: ABdhPJz/9+2Tp++Gw20yZdXphcsNWZ3K4VSHU9CCHbYHxmEHVOZqWp8qJ6q5OQmHTnThdCs1etZKwQ==
X-Received: by 2002:a17:90a:9f94:: with SMTP id
 o20mr4797273pjp.209.1613487770278; 
 Tue, 16 Feb 2021 07:02:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:49 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/sd: sd: Move the sd_block_{read,
 write} and macros ahead
Date: Tue, 16 Feb 2021 23:02:21 +0800
Message-Id: <20210216150225.27996-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/sd.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 6af821b75b..5bd95304f1 100644
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
@@ -1754,27 +1775,6 @@ send_response:
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


