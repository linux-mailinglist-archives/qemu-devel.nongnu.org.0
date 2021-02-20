Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BE32022C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:22:47 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG2o-00043I-ML
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuD-0000qI-66; Fri, 19 Feb 2021 19:13:53 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuB-0005Yt-O9; Fri, 19 Feb 2021 19:13:52 -0500
Received: by mail-ej1-x62a.google.com with SMTP id d8so16916759ejc.4;
 Fri, 19 Feb 2021 16:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGPDZTaV0ikSGAYkSsSAAwTyV1EcBkuaVgyp/NFAuhI=;
 b=T7Dy+sGGWdm05YCG8xIboJpe+caUC17ZEB/Bai9RWD00PjwhfhMWNCUI82vQAwSK4z
 ZJD3uDw+Dn5U1q4kgRq8H7y7vSu0fuwW1iNMXZ1Rm/NKndq2b7DcBgm+AXyqZbcC6TPm
 eN9eqOE/ZmOFCjueVnxNYw3yv9htkN7uQUdDEpRExeejd3mm73ivHLl+ntztuzecS7X7
 EEqursh43LM5RxbCTbiuNtURsKXs2cYea6O2gnNO/UJkMF1OwBSRo0wC9jdn/WYaIgwv
 GD525xKLm2QIVkPSu+iRFEvsR44M1egYdxbnhTO1ceBlle7R9ussYcuuZ9zzqkYhE7QH
 tmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oGPDZTaV0ikSGAYkSsSAAwTyV1EcBkuaVgyp/NFAuhI=;
 b=TiXxRHg7Tt0VYNJzKCynC32oB7wUWBghMpyrU6zjbysgrHvLrOipnZSZSs4fevyIli
 XoKWYrgHrnF2pA9cXz9sMghVTo5VUvDVyZMc9w/TL83kmq4rzOuGcrCTfZNa2/hHolMk
 IPt/JuUs3JUDGJcg2jvRTP6JwtfeIHG4gqRK/C0vJM08of9U7nxF5+h+B/SxIHrQwJYt
 YjEwUUAkQu2/a0cLw2b9emeA+cgNtmzKzjMBYjhsi/Cefm4XD02L9I2Jv9xcdCajiaZw
 Lc+qxItt//FPDYQ9LaxM9LRSHQIw6cJC3j6Rv5YzZgx7pOzsFcsmUQE+FONnG+e/m7Uy
 yWGg==
X-Gm-Message-State: AOAM532SX5SM3QShTjQvKlzxa9eSJiwkM8foJtaiwG6DpprqVDC8XDto
 NCO0tZ5fe68ua0O2+UYxjoGDCbGil3Y=
X-Google-Smtp-Source: ABdhPJwgW+/hOEULvSwJxsLnWdLkxFnsH7do3LOmKTuVScmAso0HPG13Jj/y0Pki8795P+mL0Oktsg==
X-Received: by 2002:a17:906:a090:: with SMTP id
 q16mr10853089ejy.236.1613780029307; 
 Fri, 19 Feb 2021 16:13:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bz20sm5666154ejc.28.2021.02.19.16.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response
Date: Sat, 20 Feb 2021 01:12:58 +0100
Message-Id: <20210220001309.2225022-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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

The SEND_IF_COND command (CMD8) response is of format R7, but
current code returns R1 for CMD8. Fix it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210128063035.15674-8-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 200e885225a..84c873b3fd4 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -176,9 +176,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->arglen = 1;
                 s->response[0] = 4;
                 DPRINTF("SD command failed\n");
-            } else if (s->cmd == 58) {
-                /* CMD58 returns R3 response (OCR)  */
-                DPRINTF("Returned OCR\n");
+            } else if (s->cmd == 8 || s->cmd == 58) {
+                /* CMD8/CMD58 returns R3/R7 response */
+                DPRINTF("Returned R3/R7\n");
                 s->arglen = 5;
                 s->response[0] = 1;
                 memcpy(&s->response[1], longresp, 4);
-- 
2.26.2


