Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8431BC24
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:20:00 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBffL-0007SO-Fi
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXE-0007l2-NQ; Mon, 15 Feb 2021 10:11:37 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXC-0004xZ-TF; Mon, 15 Feb 2021 10:11:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id hs11so11722586ejc.1;
 Mon, 15 Feb 2021 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Foot1z/bPEvPG+tsO1eP+dD8uRiPKW3JSFYgR5OC24=;
 b=cOsVRIs5QZ2JprVNeI3CiBSGWt2excuyYwid+JuLobLC4bIabAEKfIkRW10DOI7xgR
 gxwSJmLmqbZTGrkDLrfphUWFepmdtQOdtC6oT8RPxeIPwqsKxh5aiM3jtgMqK2jrY5u2
 NYyV5IyEgMTEyD8G/BcsgrgB26x/gZ1PpE0AvxqZKIpC0s7MHf+wz9XV1N74xR1aGNxQ
 9dNUkzPqGdFX1Yc8v2TPWtbA5IwhMtiT2ekLfezOs8ImM0vwrncj0b2K8Fu1rCxENijI
 rkgQ1ZHoLw2jO6jafw3DWt/ocOM1H0R9XFzAmiI5pkw2KvEwOZoSDGwJOcp2Pilli3Mh
 +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Foot1z/bPEvPG+tsO1eP+dD8uRiPKW3JSFYgR5OC24=;
 b=Ur/4XRDq4/aG2KdfnR8ZsGTVYQY+njgHKeFlDjnN6ksWRev79obUxQ78WuuUC294Q2
 BcBQqYER3bKKtYSJmD7L5/8h88Xr7lRKVMGD2mZlXhvvKxeG3y6V2KBM0QtUPeGTJVdQ
 6gLzBsDg+wAe7PGmCLzclJGQONdAc0O5dwx0IdHjHW/jMr8AVog4ow2dYd4YPMKVHxFJ
 wCIpag6ZqGdYlwK7owRn4EM8KZ2tO6vbsjqCueNc0KEjArdALedjjsbNp3wvTa4qv3q7
 X48EklfNq7mW2ty9T1BAauMi8E7y26WgUVIyvC2ZptFgwLW0a2qUWjnSTeRTOrjKj4Vt
 8d4A==
X-Gm-Message-State: AOAM531HHhIn86vgA7L2Mk44HA7vdvgpW6eZrvLXvx3Y4uSHMN1c3A1F
 SdIeIRC4jEOXQrq4+isvG2xN8u/3exo=
X-Google-Smtp-Source: ABdhPJzsw54s816+j79lFL/zuuuuMVRE+oB2mseU2IeuWo+j7Vog57vAPx96fFEHeVbdMtEu8fDNDQ==
X-Received: by 2002:a17:906:c08a:: with SMTP id
 f10mr16130711ejz.52.1613401892962; 
 Mon, 15 Feb 2021 07:11:32 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id gz14sm10813069ejc.105.2021.02.15.07.11.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:11:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH 1/4] hw/sd: sdhci: Don't transfer any data when command time
 out
Date: Mon, 15 Feb 2021 23:11:08 +0800
Message-Id: <1613401871-59515-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
---

 hw/sd/sdhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa539..1c5ab26 100644
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


