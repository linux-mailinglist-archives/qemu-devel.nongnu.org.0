Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA031C5E3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:49:42 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrMr-0002hK-4z
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKe-00012N-D7; Mon, 15 Feb 2021 22:47:24 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKc-0002Y8-Ez; Mon, 15 Feb 2021 22:47:24 -0500
Received: by mail-ej1-x636.google.com with SMTP id w1so14361112ejf.11;
 Mon, 15 Feb 2021 19:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z10+XB1F0+fTsGOFREXF6M/rN3WUhpA4tnZPLdlyDwA=;
 b=U1XkltPMUYqVcSYG3+NF9RpHAvydFFVqhzLFUdfsz2yPONYTFHafdcYPHP1o1jfamx
 7hFGODN24U2xL8I3bNO/Ge7j5DUTuiJnrzhZTGfEuJNXxff221Bz43ZPbJZ3Lu8NExWf
 7kuNMuAf8e1T9us4C+IpgNYMYDAD0OWWeq9Y9+fa4RXxC9QHFoxZpR2xAaDMjsacu94d
 JwmoOFGX2ht36XIgJErAyInQVGlmqDCs4nrFbN5KvJrl6xyV7hBX3kXhyAPg/kUpQ+ON
 EU5i+fiMqM3VXiS3vorfB3SuxGy8LzGwWw/r9j4p+mFZRO+1mfLl361/wZ82xYe9SxYT
 vi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z10+XB1F0+fTsGOFREXF6M/rN3WUhpA4tnZPLdlyDwA=;
 b=e7x7f823VS4owo8+sKWgPbp9ObJ0gJpRw9BohJEufb1qmlYH8Q2pb6NpTF8MhyBS2y
 SpT2ZeSkyzEDyPg7WoWwIeajEu58Xyxu7WafNOAX1R7C5EsEVZtuuBzlUXAk6vEEdCxL
 303YhyxCp8OkQ+kkCjn9dy8jrPm+JR45DO12qlhc9C2TaH7iu6TgI4E3LchoJq2I5nHE
 wkJKLupvaEdQwxwcKpao2DT4RCZMZ5CZOpfofI2hUfTSvcs85Ibbm95d6syX/946HhDQ
 CuL4BeNCmohqkND5l3xRqN9mCJ9VgDN9FHLER9dvqNIslUxZABWLDqm2QCvDYzXD3wZj
 xPdg==
X-Gm-Message-State: AOAM533oXb9XMvSbv35waBjsSSuy9LRPZqcHLF8G11oc6GDRNfmI5R1f
 XWUSDNSh6b2YXwlBptkmHJA=
X-Google-Smtp-Source: ABdhPJxPBL6B/csP+80ZjM+HImwmDocVHiSYegX9px2YGL7O9C6jrru+VujqR/mKoDlckfc5TdMp/w==
X-Received: by 2002:a17:906:5953:: with SMTP id
 g19mr3827470ejr.474.1613447240264; 
 Mon, 15 Feb 2021 19:47:20 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 2/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
 transfer is in progress
Date: Tue, 16 Feb 2021 11:46:50 +0800
Message-Id: <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
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

(no changes since v1)

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


