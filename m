Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A663D32B6CC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:45:09 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHP08-0000ds-KD
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOx0-00061Q-I0; Wed, 03 Mar 2021 05:41:54 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOww-00017o-5w; Wed, 03 Mar 2021 05:41:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id v13so12814758edw.9;
 Wed, 03 Mar 2021 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/nyi8An80ek+P1n9KALG11eHTIo9X/dg63n9CXHSx4=;
 b=nQlIdfbGlCdvg2KJiJihql/BVfKZXieDm5mJxBvZu/4T3KR0BekNhrmyYI4s1+URtu
 2LwKPRYR6ElVo5LvYBAHm0Key6LUtpG+YD9nRfqG2dkZVEfFYUHkxLNTYbhjcU69TmDV
 S6mK1Z8pl0IQsng7yxH/3YjErs+Y8fDe50mmTgvvViWNYCehoa5hKYJ/tz66ylqytIuO
 fNs0fM5KslcXB5U7Jfe7tX11qVjqh594kEDhY+U7OYdPzjxqKX//ZXRxUT7fdoNUlmLj
 uG6K9kcjyPE1Q00RW6DlZ7bEAWuCOo/ntBMT5hZLToiZk7yJLvP/3WkPhPxd7gVFKNty
 CuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/nyi8An80ek+P1n9KALG11eHTIo9X/dg63n9CXHSx4=;
 b=hsK8YyMS9Bh1K4pqA5rjBzc1q1bYRg4rLD2gJYmwTazpFW1+GF8Fqdv7iP8J3awQcT
 21f9i9jLST+8YVdNHjIxxBSSh4ykJvmCh4jzeViRsfjPFvDbHRaljw7C7z17sYs3pm1M
 qr8UXXG6isZlL37rGQn246bED7hLAQbDaRMYy928pHMyADSb+PNvOVKaO+5Bl3d6qEIh
 M6bD8oAsNhlrHX7PYc3KtVG1HZIwC8idDZf2rR6nDIzXBXcM9fTBqYGYirQioU4r+Wu3
 XcYqsdv7oSskkMDPdeZFRoph50H/k6q2w4ZzIFRAAm+85mADNlQG8rkAt6vF2nmCnZzI
 VMzg==
X-Gm-Message-State: AOAM533AeFnctfZQCcGVwYjlvhSVjxO0sRPi+r8DUwZFA/Aps0EvTAon
 43A76XF5wIdWM812MnVVbFo=
X-Google-Smtp-Source: ABdhPJzPYjSxWEyuYJ7HlN8+hP6cpX6IM+az5MFPVKEPaihcQVXF5Aw0jTXKTJHdWTvxHfK+x9o0Qw==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr11013881edp.167.1614768108126; 
 Wed, 03 Mar 2021 02:41:48 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.41.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:41:47 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 1/5] hw/sd: sdhci: Don't transfer any data when command
 time out
Date: Wed,  3 Mar 2021 18:41:24 +0800
Message-Id: <1614768088-20534-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
References: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Muhammad Ramdhan
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/sd/sdhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 9acf446..f72d76c 100644
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
2.7.4


