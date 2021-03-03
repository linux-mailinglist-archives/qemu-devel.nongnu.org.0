Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34332B7CE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:30:08 +0100 (CET)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQde-0007ir-Ew
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQai-00034R-Ic; Wed, 03 Mar 2021 07:27:00 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQag-0000cw-R5; Wed, 03 Mar 2021 07:27:00 -0500
Received: by mail-qk1-x72c.google.com with SMTP id q85so23684987qke.8;
 Wed, 03 Mar 2021 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OG4goZFEaNkkukUoQrBUegD/8Ki3U9WGREFx1JPyYo4=;
 b=SFexncU+WlvYtbpNnYCjmD70U44+jUb+WnXBwGi4piehhuy9AQY+2OHy97P+fhslGZ
 7XwA/PhkTAt9Lmh9WfPca0unayvkt5xvLnQskb8rOQ/VjjfuUjXQRLG+dycqNZihLMm4
 wKKgaciirLeL8Jt6Kk84H66RwZfIXW6Y2OJrvDUQgWkKXN0cE+J6O1bezspTsR4fIlWd
 NvQFxNr3rjofyhAuoTqnm+nUm+K6qTAi/CsNsZ/GA8dhkwFW7mgw5fx75dyW0huzpxat
 fn/wpwJKEF86S8hEvFKAN1h5d6ps1HHpJxii+IJ4jr6ClM0l0hNhDvIOm8QfgmFDwVtr
 BPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OG4goZFEaNkkukUoQrBUegD/8Ki3U9WGREFx1JPyYo4=;
 b=X8iCMzZ2x4qLRYoNmYtVQahDfkobUSfVh2pTUkQVEQJWNiFl9wg+DzPpadaKgBehT9
 5V7eaU/nPWh/dBndCXR8hfB32SfVYT50pyVT7ZZT3MC3x9U3UgX3Zq/PFdBdziaA4diz
 j1lK41kIfLKfBxoFAhCHPeIIUqiswrQ2+DZ372cV5O5EKXngjwpqWb1FuBtAwVsNpPhV
 pUps+9U65tLLTn+OFRSYJiG4YD5KGFBDCRxJp3ofjW6YbafcH1+XfS+omIN8KVGZj+kc
 mjmCfA7kM7WqpHGSTKNyi1JVsvXZNtIRDqevJiC9SrJFjMHny1IkZBZbVKIWgTjENtI4
 EwMg==
X-Gm-Message-State: AOAM533XFApjjbYU/SZ8nH+sKT30mVVmLJ6zbcgN7FLn2ZpcdW7xovmN
 b6Qg/GTUYRb/YAEDWeG03+0=
X-Google-Smtp-Source: ABdhPJyxhffo5oA52IO5azMr8/tiIr4CsKKlQ/jxhJjzsdxSnDEkgqR3jXsN2rqiZtAfrShwsd+rqw==
X-Received: by 2002:a05:620a:1107:: with SMTP id
 o7mr505302qkk.188.1614774417087; 
 Wed, 03 Mar 2021 04:26:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:26:56 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 1/5] hw/sd: sdhci: Don't transfer any data when
 command time out
Date: Wed,  3 Mar 2021 20:26:35 +0800
Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
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

(no changes since v1)

 hw/sd/sdhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 9acf4467a3..f72d76c178 100644
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
2.25.1


