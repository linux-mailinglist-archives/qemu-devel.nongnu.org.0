Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA59344D26
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:21:14 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOEr-0000cr-1n
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAG-00075G-Im; Mon, 22 Mar 2021 13:16:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAF-0000Ae-5N; Mon, 22 Mar 2021 13:16:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id z2so17978136wrl.5;
 Mon, 22 Mar 2021 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohREe5zF+9RenfzBySXXkP5MaNeGCcx5njG2MsDavJw=;
 b=FJm7rpWqsoZ47JMdcUHelWBOagV2fOHdQVKmmBfwW+MANIFQ6MvPZwxRAKpTS6Bq/G
 V8c9lpdgJcBUlGu+fyDS+/3ifU/gWGep21qUaG+pUzgpDCXgoa6/Y7NE4XqwxxfsbRcb
 lkxDc9ZR3APcGQyn4S5B4tNVF3H53JZRyOG8zkVcHlQ5EbzsW0vKlgIE/eYasPs5VJfJ
 NYKcxhhq8sriUxo7EWw15vleYLGGZhob0lrSVt8sUUJsCluxoMcd9mMy9xNYis+lqeWZ
 Oo9qy9WE3eDqCxOggSb6y21lRx0sdQHOO2AaJTUoRcVHyPmSAQ6S5ANMN7cHYa+F2BKZ
 kwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ohREe5zF+9RenfzBySXXkP5MaNeGCcx5njG2MsDavJw=;
 b=J+FamvBos4XAkffiXHJM0CjrCp1Oy1riwYQFD4z23DhaI2mhuGHSlXYvrRlOFBcRP0
 v+HnSu8gnp6izxsxu4bmE/SJM1GzcppYwtM5K+FoDEdagewYIADmUwlDv3Zj0+Mh0nAI
 Z3jIor04hexAAoINvGwmEiWIDjSq3mN0X7kcJ3HHwyzhLeXHUj+Jwy/sysryaP7XpwBy
 EmiOCKVqgtrzedph0Av+ZPquqDk1g9Wo7ESwW8ijjQzJ6fwz+GALfpuyPcF8Gxe+yV+k
 6T68CK3/+GFdL1vPy2afz3KI/ulX2ZWq7uY5XC+8kBrL7/i09qxxoNbC8qYYWK4MkXDp
 gk6Q==
X-Gm-Message-State: AOAM5337A4txDn6pdjfHQQy0tNhxtdAWJko2ukqTlyJ2mfZCDgNvlL6B
 nd3v/1Uuf62oLU2xiJgvGwzBxEtVBoLitQ==
X-Google-Smtp-Source: ABdhPJxnb5kN3O3S7bHsQfHMFEVgotGZ6L5/lfeNKkWfL/DIQSYnB11QO4OIoxrs8ztO6jbYXyutmg==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr601313wrt.192.1616433383099; 
 Mon, 22 Mar 2021 10:16:23 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j20sm53865wmp.30.2021.03.22.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] hw/sd: sd: Actually perform the erase operation
Date: Mon, 22 Mar 2021 18:16:05 +0100
Message-Id: <20210322171610.4183696-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>,
 Bin Meng <bin.meng@windriver.com>, Muhammad Alifa Ramdhan <info@starlabs.sg>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the sd_erase() does not erase the requested range of card
data to 0xFFs. Let's make the erase operation actually happen.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1613811493-58815-1-git-send-email-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7b09ce9c2ef..282d39a7042 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -763,10 +763,12 @@ static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 
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
@@ -795,17 +797,19 @@ static void sd_erase(SDState *sd)
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
2.26.2


