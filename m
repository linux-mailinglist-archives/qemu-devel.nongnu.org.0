Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D888320234
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:26:46 +0100 (CET)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG6f-0001qB-9E
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFul-0001p3-2K; Fri, 19 Feb 2021 19:14:27 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFug-0005mU-Dz; Fri, 19 Feb 2021 19:14:25 -0500
Received: by mail-ej1-x62f.google.com with SMTP id t11so16891546ejx.6;
 Fri, 19 Feb 2021 16:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJIy2EJfrINu02Sg+2eUk6Okwf2LkLc7DBM1ywf5Bzo=;
 b=TVvq9asvbgtAELHTheyMr63pRqdnve88MbaaRJRkQw0ijE1h2mzmgYpFSM4CXm7vKp
 wDok1vfj0ET9aEO+YATaSSzvA5yhwApMR0+rO1QAWaHKOicNmeYfQtaR4UWKYgvsnv/L
 i37Iff0MEJUGswTQQgZALhMqjD2WnrstdcJ/Wp3mACRi8XvQraypKsRMw68I04GsdXqS
 sKeuuxDTsZnjt7IChm3ghT8O8fjhMk+fUL+xIfQleEBKUhSG2Os+Opy7P7l2Tz9ylFPk
 kQoSyF6wPosPvxw7GXJQALvLcbEVpQ7OWgVcYkg3iwxz3lotT3impAQtES0R9ax/9OgW
 htVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NJIy2EJfrINu02Sg+2eUk6Okwf2LkLc7DBM1ywf5Bzo=;
 b=XcEyPjwJ8dNXjZnayKdLr5lmZF7rkhJPTLYsEE1ihbYMgH9m21REzHm//cpRxnv4/j
 kMHnSEvrGa2PgitiwA4hoOK+aPEj/j65pye9HwPRPZS2bE+tf9AKOuieo5LoGMWvdrE/
 NcR8sBskqP3mwJlA8EMJjjlcGPoCfj+56HLlr4fkUGAX5pJu/1+tVUWyswUEtzWQvCui
 R50JZruJQNEHDJ1LdVXJ+lOvLZ9wm2D0pPERZt2wS0rLYRAZacSGDIYFD1xb7GXADn/5
 9SSLbsQLuZWOzaQh/PfhWTfkTjSJtpyAR6c9dgk3wke54tf/9lq4DoddlkM/bBkjWiNm
 zSPQ==
X-Gm-Message-State: AOAM530bOnf3LzqY9Yr+jkZs4jAM9eaX3cvOJ13Zxgvl6p4WpKVgwQ1s
 TTmw8G7+aKqpsHUFbN82W00CILenDVM=
X-Google-Smtp-Source: ABdhPJwKMrlK7iVWHMtIw5QZJN7Nc1a8nJrnRH51nKAPJBT0OoCSS9a9c7IMsnOn2Ma8Bb625enIJg==
X-Received: by 2002:a17:907:20a8:: with SMTP id
 pw8mr11200757ejb.9.1613780060512; 
 Fri, 19 Feb 2021 16:14:20 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t13sm3690861edr.17.2021.02.19.16.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] hw/sd: sd: Move the sd_block_{read,
 write} and macros ahead
Date: Sat, 20 Feb 2021 01:13:04 +0100
Message-Id: <20210220001309.2225022-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

These APIs and macros may be referenced by functions that are
currently before them. Move them ahead a little bit.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 47ac0c51a8e..4c6e7c2a33e 100644
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
2.26.2


