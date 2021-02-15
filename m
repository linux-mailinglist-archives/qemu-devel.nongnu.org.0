Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D331BC07
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:15:55 +0100 (CET)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfbO-00046T-Op
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXM-0007nM-5j; Mon, 15 Feb 2021 10:11:45 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXI-00050E-S6; Mon, 15 Feb 2021 10:11:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id df22so8506800edb.1;
 Mon, 15 Feb 2021 07:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H2L8unWUlArPw7R/5bRhRpbQDhA50JONh9WRib1752Y=;
 b=lvyPJw1Pat1C2EwVjY+MsFATiTwx+G0mLcX/13ynnjiV8JRPs7WrXTgBTxA5Ytg29V
 JLvhZW4kFlXmfn2IP9Nkq6IfrIp2iT/e7KZh0n6WCklUhur4A5TalMqXfOwLiYkKo89A
 8mHZNEwaG2vGPw+8NlPk1Gvj5nUQZDRsLpW7PtqU6ECl1jpBFDEJhGKxAH6kuG/P7lUj
 WOERulNZEjg6DWgn6FGOlgdVUW4wUktPZSE31J6Ny5sHTj80fvOxUtdKVeSK3jbUGviw
 GUJ9R045n9nGTsX5jRBkCdDvRDjqa/85gUVUF+n2LBWuRbB73a0rKah3QV7E0niEjWF4
 budQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H2L8unWUlArPw7R/5bRhRpbQDhA50JONh9WRib1752Y=;
 b=qcK3SxIyV6b1HFjYRqGQSm9RyY4FN3uj/jV4mgqGqBmZiqvms5TabwpLIL64VJAzhF
 Bb+r9I2UVmOFFittMvn/oyLCQHzHZ7CcurzwyxSqaAuiauzB7V7rsMKjf5DzX54B+7Xu
 Tm327ZKZUkQwLOLlkQsICmxVzat7W76J3fvcxup/1k5DZcpznp3WQf40PgSzDgR2L6Td
 xRxjQc8/xGpjULb4mRNRkLLPoxOjwzXe3nu8xl9pQme+746xP0BOamjgndmXkliMuveh
 mIbYsyJJ8wog7DnwyZvVohyA756+RZqLtyst20v3IoxDZFPshl90oPSl6WHSxiSgHlGA
 yF7Q==
X-Gm-Message-State: AOAM531c56K2pFg3mvjCUR611z565CKndUOivOBO8EYeRZX01SmS+ALU
 ULBqzgOB04L0N/+JOUtf5qXcgyDWpkY=
X-Google-Smtp-Source: ABdhPJy11EPXWff25kIje7TEFOyHCm/KL3NXUL+7UmL9EJ5gP1cDlKgY6Uj0pvlv3iI+EMp2/j63hQ==
X-Received: by 2002:a05:6402:3508:: with SMTP id
 b8mr16083634edd.341.1613401898759; 
 Mon, 15 Feb 2021 07:11:38 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id gz14sm10813069ejc.105.2021.02.15.07.11.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:11:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH 2/4] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
 transfer is in progress
Date: Mon, 15 Feb 2021 23:11:09 +0800
Message-Id: <1613401871-59515-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per "SD Host Controller Standard Specification Version 7.00"
chapter 2.2.1 SDMA System Address Register:

This register can be accessed only if no transaction is executing
(i.e., after a transaction has stopped).

With this fix, the following reproducer:

https://paste.debian.net/plain/1185137

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
---

 hw/sd/sdhci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 1c5ab26..05cb281 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1122,15 +1122,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
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


