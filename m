Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932F2344D30
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:23:35 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOH8-0004gs-2y
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAK-00076h-9X; Mon, 22 Mar 2021 13:16:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAI-0000Em-Mo; Mon, 22 Mar 2021 13:16:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11579587wmy.5; 
 Mon, 22 Mar 2021 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6fcUI3H7jskHCLqFpINNM6Pf5bSNLsoK0ZIXh21OqY=;
 b=SjcdtENv/ls/aZ+dct5ApBlHANT3gGZS+8UrHW1Lw3L8PJ9QEfg9AoTgbqsh6rQ17D
 maorTRLbgvOukCvVCB03R2AU+P/54lCNPwk2mWbQv/EBTUBn3IV/lrA3hcmMef7KpQo1
 gvidZMe7XyRL4M3WEvKtOuWPVCkG26VANUtRYeF9eKWlP6Bu3G6YiqDI9l1a4tzZ5ztH
 raC1OvixGOz2/jtbtHCsQRrU4QJW288eoSLjV4l3ribKp+xT3qCM0ARASj9SQBcWSL2j
 smhjEMaWRglYvSPGyWxjrX99v1cVLiOSfo5r6FTQ/d7KBt16qF6iFb02saMIZcxvBp0X
 ODjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c6fcUI3H7jskHCLqFpINNM6Pf5bSNLsoK0ZIXh21OqY=;
 b=MGmpIelsQ5u7L1D/g8hRJipUp2CAjz0uPnLDdAq9+couDE3B4a3PC5q/5KM/zEIGEx
 evJIU/0vEeIuMOMuvoZKCoiWqAd1R6pbQQl3WMrLKOCf1X4t/YVGQk3JGGKKs7TQG5sG
 uHDcDA8z1d2pxGVKbmOWTR4/2ePHNLtLyll1lQUw1O7Uavz0dPDkn59GyE0yt2xRmenC
 cA0Hxl71l+jLbosVeuirsrLWY1NjOR4ZuZLYqB9fZ8Dxmkj+pKUuGuNzc9ui+RuBdrZj
 RstITIhB9UxJ/IGeQ12W+9vCtWXOc6hqug4ePnht0sLS2efzBcerREPvKFqFlILYctkO
 XuIw==
X-Gm-Message-State: AOAM530jYaLEBvgTUYZOvl3uno7LMiBJ/JDR9BxM8Q7b6dWdHRMfqren
 Fn7drvr1R+2CpASsA65gLuP2a3LlqHwRGQ==
X-Google-Smtp-Source: ABdhPJw7QtCP0ILOM2QNNRP9etNkscziNk27vGny4qjpom5tnhelnCRL4xa/d404d9Y0dcUNRZZtkA==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr89352wmq.166.1616433388030; 
 Mon, 22 Mar 2021 10:16:28 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm20388115wrr.78.2021.03.22.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] hw/sd: sdhci: Don't transfer any data when command time out
Date: Mon, 22 Mar 2021 18:16:06 +0100
Message-Id: <20210322171610.4183696-4-f4bug@amsat.org>
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

At the end of sdhci_send_command(), it starts a data transfer if the
command register indicates data is associated. But the data transfer
should only be initiated when the command execution has succeeded.

With this fix, the following reproducer:

outl 0xcf8 0x80001810
outl 0xcfc 0xe1068000
outl 0xcf8 0x80001804
outw 0xcfc 0x7
write 0xe106802c 0x1 0x0f
write 0xe1068004 0xc 0x2801d10101fffffbff28a384
write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
write 0xe1068003 0x1 0xfe

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
      -device sdhci-pci,sd-spec-version=3 \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
      -device sd-card,drive=mydrive \
      -monitor none -serial none -qtest stdio

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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 9acf4467a32..f72d76c1784 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
     SDRequest request;
     uint8_t response[16];
     int rlen;
+    bool timeout = false;
 
     s->errintsts = 0;
     s->acmd12errsts = 0;
@@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
                                    s->rspreg[1], s->rspreg[0]);
         } else {
+            timeout = true;
             trace_sdhci_error("timeout waiting for command response");
             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
@@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
 
     sdhci_update_irq(s);
 
-    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
+    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
         s->data_count = 0;
         sdhci_data_transfer(s);
     }
-- 
2.26.2


