Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B68344D34
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:25:18 +0100 (CET)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOIn-0007em-IJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAP-0007A5-6a; Mon, 22 Mar 2021 13:16:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAN-0000KS-8k; Mon, 22 Mar 2021 13:16:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id g25so9661713wmh.0;
 Mon, 22 Mar 2021 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fx8VAm9zrYSDZ0ArHiV/e2cWDHJq/XM1NI+23XhEP5s=;
 b=teSb+2zDD9ku6nM71ltqTkhjpzKwsAYyP1CAxpZkpLjwJjRVVBAhL2fRkpu86cia1A
 Q/aygWwXM2Zz645iua6XRWtrUICnRuagOv3oypiilPhzHKFwgBt2QZupml9N2ZA7bJGh
 XkQsypN7soufJsCFrTvvB7RzzFkOpUgvC7ezZTKm870pcuAlgIeabWbVd/5tJVxLh7K2
 xWF2OQHe30KR/Z4WRz+vbnNUbibEiIOFkNkjSDK3493RrXzH0hCHbmHKZNGAny8+2swX
 4qe4AZyUmQei3eGjBc/lwx78inuVpaFXIRQ4SGf5Rq4GCwePlK6c/+RIXbX45gCcB153
 6D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fx8VAm9zrYSDZ0ArHiV/e2cWDHJq/XM1NI+23XhEP5s=;
 b=KugW3Vi5s0EsCrDO4apVVph+lmuFTozFauwHp6es+KZ13AMwf1vD8cbHSpmW4oCC7w
 B0xHsWtyyY29U6xsYwWM7C+lvZeoXjkG0BfyuDyFRVXOfGekmcBfs01knVFpz08WM41v
 Ea6YiVuhEHlAqmJ+2RYwS8Kmcd7KhR3z4WyT0OYUsjEQQfkP97qplpqv6TMaEPdiUlfj
 ky+eSDxhr5osi0zISkUOndlCx1WJxeTsCwLuzPT71giIzze5igBnMyAhI268teS+btpQ
 V69P2IggLHY4eQ4awymscwn/lkNwoLbru7CftmxIuu9vaABu9Yya9XoSWm4Tq5eSNNdV
 gceA==
X-Gm-Message-State: AOAM532bBM7iYz+8OvSTFv/qjL4AEJOe5Ysj/sx3pKhpd8yfXPQwJka6
 FRhnoxClWWP4Ihceak9AYKXzQIFzeR7q2A==
X-Google-Smtp-Source: ABdhPJxZcMSzTeQBY93rK+f3r8ICZQPutHFagS8VWd+sgdSy9ofv6EoPVhxAMm+X6tvr0g6QFJaNQA==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr109516wmq.18.1616433393080; 
 Mon, 22 Mar 2021 10:16:33 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h9sm49147wmb.35.2021.03.22.10.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
 transfer is in progress
Date: Mon, 22 Mar 2021 18:16:07 +0100
Message-Id: <20210322171610.4183696-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Bin Meng <bmeng.cn@gmail.com>, Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Per "SD Host Controller Standard Specification Version 7.00"
chapter 2.2.1 SDMA System Address Register:

This register can be accessed only if no transaction is executing
(i.e., after a transaction has stopped).

With this fix, the following reproducer:

outl 0xcf8 0x80001010
outl 0xcfc 0xfbefff00
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xfbefff2c 0x1 0x05
write 0xfbefff0f 0x1 0x37
write 0xfbefff0a 0x1 0x01
write 0xfbefff0f 0x1 0x29
write 0xfbefff0f 0x1 0x02
write 0xfbefff0f 0x1 0x03
write 0xfbefff04 0x1 0x01
write 0xfbefff05 0x1 0x01
write 0xfbefff07 0x1 0x02
write 0xfbefff0c 0x1 0x33
write 0xfbefff0e 0x1 0x20
write 0xfbefff0f 0x1 0x00
write 0xfbefff2a 0x1 0x01
write 0xfbefff0c 0x1 0x00
write 0xfbefff03 0x1 0x00
write 0xfbefff05 0x1 0x00
write 0xfbefff2a 0x1 0x02
write 0xfbefff0c 0x1 0x32
write 0xfbefff01 0x1 0x01
write 0xfbefff02 0x1 0x01
write 0xfbefff03 0x1 0x01

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
       -nodefaults -device sdhci-pci,sd-spec-version=3 \
       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
       -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
Reported-by: Simon Wörner (Ruhr-Universität Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f72d76c1784..3feb6c3a1fe 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1121,15 +1121,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
     switch (offset & ~0x3) {
     case SDHC_SYSAD:
-        s->sdmasysad = (s->sdmasysad & mask) | value;
-        MASKED_WRITE(s->sdmasysad, mask, value);
-        /* Writing to last byte of sdmasysad might trigger transfer */
-        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
-                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
-            if (s->trnmod & SDHC_TRNS_MULTI) {
-                sdhci_sdma_transfer_multi_blocks(s);
-            } else {
-                sdhci_sdma_transfer_single_block(s);
+        if (!TRANSFERRING_DATA(s->prnsts)) {
+            s->sdmasysad = (s->sdmasysad & mask) | value;
+            MASKED_WRITE(s->sdmasysad, mask, value);
+            /* Writing to last byte of sdmasysad might trigger transfer */
+            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
+                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
+                if (s->trnmod & SDHC_TRNS_MULTI) {
+                    sdhci_sdma_transfer_multi_blocks(s);
+                } else {
+                    sdhci_sdma_transfer_single_block(s);
+                }
             }
         }
         break;
-- 
2.26.2


