Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98D32B6D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:48:37 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHP3U-0002wq-FF
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOx6-00064d-5K; Wed, 03 Mar 2021 05:42:00 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOx2-0001B9-Qf; Wed, 03 Mar 2021 05:41:59 -0500
Received: by mail-ej1-x62b.google.com with SMTP id c10so14720159ejx.9;
 Wed, 03 Mar 2021 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dU67z5mmiD/4zu7Zyv2gAWcs8YiHNtEyoZ8NTNJ6tkQ=;
 b=SKBW+WHp7Knhb+VTsSr3DGRL9S2MWg0qNqE1+UyPv79+afBYNd3bSY6Qz+Cr0O3SKR
 uLV8r/9jNcBVDOEPtSc2lNlthr6sjiNCoQz6qRUwW+ZrrWgM26AX1KGXw36C40jVqWiB
 1WE0JXcvfzuV0KD8phbZ3JrHP46CxcU7sJyQP0jVEewb57a3DUyDWS3TQmUvH1Ty37AP
 fkDDV1B7IzYhNmfGS5jZ4zqZ8ap8h2C1rHSVEtTx1+N1vHFq+AWdswY+YGZRHdW1fMU8
 8GiDkXd+A7+hdMBUw09mvvbJMY6WqxdmtT0KpaPY3NeCeCwz5e4IJXbrOjvuOud/W/q8
 0AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dU67z5mmiD/4zu7Zyv2gAWcs8YiHNtEyoZ8NTNJ6tkQ=;
 b=AynnBGkWlAuMcYNFxhAjD6k/VZtEGMptwJp+DFtklsE9uGARcS9031OT0Rc31lPpGP
 OYxakbMdfUwqMhS2fEUT0QdU0jHzgtEzUkGJZqoq8ZsB041T3ulT5lDoTmAOPPMDTKoV
 jhSop1IS8hwSjrLQHMi/mN4p275uXlH5LxmHhibFWuvVTABl5MORItfSlHu6z96Y5PVZ
 ZK+umPPglzfZvznMW6PB6gxq0nNdBAlXBKDezOdRItALPD11pfpGXcqgas7ZBy8mZq2j
 PBpsvUQvO4Za9524SJnk7V7i15v6LO5xZMY7kNaeiaRSpFv+qCmROiJ2kosBvT9aZHuW
 km2A==
X-Gm-Message-State: AOAM531Z7n6XAeJNNMVF9GZtyatLtWKNH5JZ0dLsG9QsBlsDN09IA0ba
 /2VW6g8XLUJnusZXlIYelEI=
X-Google-Smtp-Source: ABdhPJwVKobKI4Usd3MjNq+iDo5g1tz4AuCzGv0Jt3Kg7+xOQT5xXc7fLBwlVHep9DQam0Sq6AvDYg==
X-Received: by 2002:a17:906:1907:: with SMTP id
 a7mr25263190eje.142.1614768114300; 
 Wed, 03 Mar 2021 02:41:54 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.41.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:41:53 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 2/5] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
 transfer is in progress
Date: Wed,  3 Mar 2021 18:41:25 +0800
Message-Id: <1614768088-20534-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
References: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Muhammad Ramdhan
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Embed the reproducer in the commit message

 hw/sd/sdhci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f72d76c..3feb6c3 100644
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
2.7.4


