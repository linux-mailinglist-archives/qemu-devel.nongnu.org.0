Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3791731C5E5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:51:09 +0100 (CET)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrOG-0005mF-8a
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKk-0001Ex-1j; Mon, 15 Feb 2021 22:47:30 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:32889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKi-0002bb-2z; Mon, 15 Feb 2021 22:47:29 -0500
Received: by mail-ej1-x630.google.com with SMTP id jt13so14492566ejb.0;
 Mon, 15 Feb 2021 19:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oHNEb+qV5J/dMuxCdQI4vMzHRdDunuvvJ/n3BHngy4w=;
 b=gquck7oAI5TFTg/RmtY0y1wSIHSrEGEgbHcsRL4uxXDzheYaWfQCmhPByc2P7BJFWB
 fdfDqL1CSZIngfHAVm2jw1ebWqbxL70SFAxotAHh0WMLbKF8p/vTJAhnfGKlAnGa4TP6
 +pRraL5+r2CKxCFFswpUXWCUdWWcjEWJLBFAWI22npUwvlMuGjGbbf0ogfcO7y9pFKES
 BRP64fGFv6KIrlp4ZlFIbbh4GNeAWQR6f7uZwEW1mmDPxn3zfxY+yylfO8G9/d0A4nEl
 91t0Rjg6sGRFZjCAxLn6d0AdW+hkB1rQg1wuiklsQnY/L5zv26fklbncIwyaDanx102c
 gOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oHNEb+qV5J/dMuxCdQI4vMzHRdDunuvvJ/n3BHngy4w=;
 b=JPBpvdEO3/q1FS2ZW+sE2+pEllE3YMC/Ept314IjbIzRF9pYOEpGQqAsRXic5OD9Ab
 dR9rDCuQusyKoqBUdDrBq06e8vJdf7uFlj/BH3Qsj8mGt9lB2fU31zkF1bqX+/0TRjvB
 hh0d5IX1LWpQoG66KXSKQ1FiFT8+3Gobl19FknSv65civa2jHsp0e9c/ItfwwDpu1ItF
 xumCFET6zngeYDoRiBvuRmdfPndS4FZWOAo9DkyRc22ylQUe7fS9IyFh6hcy7+1mCzjh
 KLeUIWq5apqg9KIW26DvWL9V9XmCjF5SKCOfZsx/yGJFpBUGdWdYuRCu7JUQc6rhF9s4
 WVyA==
X-Gm-Message-State: AOAM533WTMdcLiw7Px5qQNVpcl3eFKhijH5/TWdBP33y9DWk9A/mABgz
 sMTLEVScwfhgVJSGrAs3yvg=
X-Google-Smtp-Source: ABdhPJwJMFWj0YSCX8xOvacnZQ613v5C4KHM1gAvIVj2L3vy0YZNXsU8ct1pbUzX8WSclT6L9mFqag==
X-Received: by 2002:a17:906:f8c5:: with SMTP id
 lh5mr5496536ejb.294.1613447246121; 
 Mon, 15 Feb 2021 19:47:26 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 3/6] hw/sd: sdhci: Correctly set the controller status for
 ADMA
Date: Tue, 16 Feb 2021 11:46:51 +0800
Message-Id: <1613447214-81951-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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

When an ADMA transfer is started, the codes forget to set the
controller status to indicate a transfer is in progress.

With this fix, the following 2 reproducers:

https://paste.debian.net/plain/1185136
https://paste.debian.net/plain/1185141

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

 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 05cb281..0b0ca6f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -769,7 +769,9 @@ static void sdhci_do_adma(SDHCIState *s)
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
             if (s->trnmod & SDHC_TRNS_READ) {
+                s->prnsts |= SDHC_DOING_READ;
                 while (length) {
                     if (s->data_count == 0) {
                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -797,6 +799,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             } else {
+                s->prnsts |= SDHC_DOING_WRITE;
                 while (length) {
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.7.4


