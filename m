Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617A2B5D44
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:54:02 +0100 (CET)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keycb-00079E-1M
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyb9-0006Cm-CJ; Tue, 17 Nov 2020 05:52:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyb6-0005gK-LB; Tue, 17 Nov 2020 05:52:30 -0500
Received: by mail-wm1-x335.google.com with SMTP id p19so1764340wmg.0;
 Tue, 17 Nov 2020 02:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcIRTqJWAxUI4wqXZlNdJ3yOnii0HylN6UXy5e3pkQw=;
 b=R+UXGMk/oCz2FpFXmRqqCRZIO7NfaUHvLaElud5JbUWPlMo9BjQU4uu5atHVPcnYop
 z9B2+3nkLwqPtE0MOm5cLKpDQdu+kTxJDH2mNcVTqsbmkezwvvAJQey14dDA4B6maAca
 c7Qh+ubE7QvjxCAtKudHUCo8F6ScG/wTDPB9zqBZBn/7wMnAuObrnmAtuOzj5a+Uzw1A
 Rgbb1mypw+H/eP4AV48be/lEDSwddMws+uya0keB5NMxFOXQPtkR/x4L1ABXKPjcgP/v
 cI6cVwNyOSJeoXVwCNWddWVs1GGuYfrgw/CV4DlMTJk7NhNOLgWSC3suaokboFbG3epc
 g7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QcIRTqJWAxUI4wqXZlNdJ3yOnii0HylN6UXy5e3pkQw=;
 b=KGlvJMQxNrYjQe45IervhugH+cTtkZClQiiQNtHm6DqzX9XZlniRZ3krH1vL/l/VzM
 J7YmSrYaIbV6b5LO50gYZrQart912u4cKlglB2Nvt1/m6FWXhBDL9pbe7t515JadhSfi
 yVzYUgOiY2S8BK3bUNmXGsb8JD5u9l9ca2yOB/0uwHU2mjO/05g6FPDYiyDeAyzTeyon
 CNAH8PcxwgTRO+8RxEWPAcV1ytkTOv0h5eRPAnrtnFS6YT5uW7epPLfRCq0IavAMvq0i
 C9Llr9viKCdynPTjvY20/kJBjfV/qgGC1JiuggO7Pt+4QM6OBQvU/YtCYE90N4XnT5Kw
 SOGg==
X-Gm-Message-State: AOAM532/dnIZO/DiCJd8TjpD0LUM9iVO78MEkZIRMdbrwLgzifHXRAXd
 s3jWOUvEIHWvook9CSKsX8pQFHfwxGA=
X-Google-Smtp-Source: ABdhPJyOJBsjlp7PSnVq/5zPSiOkv3V9l0R29irm/JjNeakRf8H3lawn6oxLCYxGusj7bLnOSJz+Fg==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr3637465wmm.139.1605610346867; 
 Tue, 17 Nov 2020 02:52:26 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t23sm2820049wmn.4.2020.11.17.02.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:52:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] hw/sd: Fix 2 GiB card CSD register values
Date: Tue, 17 Nov 2020 11:52:19 +0100
Message-Id: <20201117105219.1185736-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201117105219.1185736-1-f4bug@amsat.org>
References: <20201117105219.1185736-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per the SD spec, to indicate a 2 GiB card, BLOCK_LEN shall be 1024
bytes, hence the READ_BL_LEN field in the CSD register shall be 10
instead of 9.

This fixes the acceptance test error for the NetBSD 9.0 test of the
Orange Pi PC that has an expanded SD card image of 2 GiB size.

Fixes: 6d2d4069c47e ("hw/sd: Correct the maximum size of a Standard Capacity SD Memory Card")
Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-Id: <20201025152357.11865-1-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 30913826145..1842c037978 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -389,10 +389,17 @@ static const uint8_t sd_csd_rw_mask[16] = {
 
 static void sd_set_csd(SDState *sd, uint64_t size)
 {
-    uint32_t csize = (size >> (CMULT_SHIFT + HWBLOCK_SHIFT)) - 1;
+    int hwblock_shift = HWBLOCK_SHIFT;
+    uint32_t csize;
     uint32_t sectsize = (1 << (SECTOR_SHIFT + 1)) - 1;
     uint32_t wpsize = (1 << (WPGROUP_SHIFT + 1)) - 1;
 
+    /* To indicate 2 GiB card, BLOCK_LEN shall be 1024 bytes */
+    if (size == SDSC_MAX_CAPACITY) {
+        hwblock_shift += 1;
+    }
+    csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
+
     if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
         sd->csd[0] = 0x00;	/* CSD structure */
         sd->csd[1] = 0x26;	/* Data read access-time-1 */
@@ -400,7 +407,7 @@ static void sd_set_csd(SDState *sd, uint64_t size)
         sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
         sd->csd[4] = 0x5f;	/* Card Command Classes */
         sd->csd[5] = 0x50 |	/* Max. read data block length */
-            HWBLOCK_SHIFT;
+            hwblock_shift;
         sd->csd[6] = 0xe0 |	/* Partial block for read allowed */
             ((csize >> 10) & 0x03);
         sd->csd[7] = 0x00 |	/* Device size */
@@ -414,9 +421,9 @@ static void sd_set_csd(SDState *sd, uint64_t size)
         sd->csd[11] = 0x00 |	/* Write protect group size */
             ((sectsize << 7) & 0x80) | wpsize;
         sd->csd[12] = 0x90 |	/* Write speed factor */
-            (HWBLOCK_SHIFT >> 2);
+            (hwblock_shift >> 2);
         sd->csd[13] = 0x20 |	/* Max. write data block length */
-            ((HWBLOCK_SHIFT << 6) & 0xc0);
+            ((hwblock_shift << 6) & 0xc0);
         sd->csd[14] = 0x00;	/* File format group */
     } else {			/* SDHC */
         size /= 512 * KiB;
-- 
2.26.2


