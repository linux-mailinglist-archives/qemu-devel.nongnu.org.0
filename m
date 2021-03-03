Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8432B6D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:50:33 +0100 (CET)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHP5M-0004k0-BY
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOxC-00069S-O5; Wed, 03 Mar 2021 05:42:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOx9-0001Cz-RK; Wed, 03 Mar 2021 05:42:06 -0500
Received: by mail-ej1-x634.google.com with SMTP id bm21so22393660ejb.4;
 Wed, 03 Mar 2021 02:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROOsU76GJcJVvrIVwGueslnib1PHuO7eKBuEere6Byk=;
 b=K0smjPsWPQKELgNeXsGtseRNHPgv7N53AdtvazUfAxNYjv2qE8qpMPr+SYibNVDWP3
 7VcHRNDjCFfWP7ThJylizlnOjtXdjxiHLrkoRH63ZBc7VHqmdC65KOGyvXJIAnEi/pLl
 9OpTmDUjfSoX0qT4v8bhL1qqDhsp229C6RzpYM8TK8ipW34W31FD5comwZN4oeNMqIoU
 uQt2fYf/ZUyVjiLTrQfLj4jGHYzQDWQrN7Tmy12Pm3Pb7rYC3h4rQA417H+w3JFfNUKR
 NY8GgWNHhcQ9/7PLrZqrG6E2kv0sCHpGNSPeQZvzbomq4kWxlt1XbQysrag20GHZYziQ
 WQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROOsU76GJcJVvrIVwGueslnib1PHuO7eKBuEere6Byk=;
 b=h2HF6sAFqZlchnn2U3d3vEVpVYRvgjIbIodya7hD0nnjayCEa07NkMVBx/b6sx3YHU
 I9/CX8wzpVqsFZFXTuCYOb9ohYO4BNZWZrm5kNeV3kErc/JDfb7jGXLUJA3prt8cxNTc
 E984jm5HQcplbOwNxIb5VrsGypXJQAWLDzdx98fn1qwXa+A0YaeoJt1vjOUxV01Ck+Cl
 mD1PPVquhHQgVlYB2FBwrDkTqJ3mcisqUqzyjgKnfFct64J9HX10l2wNaTY92KWD0ndM
 eSB1u6AFSjriUGb89R14z8BL600mM5aaptbVE25e//FbsxcscEiN7fF7SK2wrfKNFeLr
 I/Sg==
X-Gm-Message-State: AOAM5312DYjFrE8pbdWEyAIrc4iHl32ytlielWig4TD2wNekHpzsR8ft
 M/QIe/3KreyANyqRwv3WNtc=
X-Google-Smtp-Source: ABdhPJzUTFUac1Ydck7xbf2dKrvsbwzXZ4ZuZcRbhp2HG2DjyW2njOmofekSByI3T8GJ7nhhwBHvrQ==
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr8023510ejq.115.1614768120192; 
 Wed, 03 Mar 2021 02:42:00 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.41.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:41:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 3/5] hw/sd: sdhci: Correctly set the controller status for
 ADMA
Date: Wed,  3 Mar 2021 18:41:26 +0800
Message-Id: <1614768088-20534-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
References: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
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
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3feb6c3..7a2003b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -768,7 +768,9 @@ static void sdhci_do_adma(SDHCIState *s)
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
             if (s->trnmod & SDHC_TRNS_READ) {
+                s->prnsts |= SDHC_DOING_READ;
                 while (length) {
                     if (s->data_count == 0) {
                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             } else {
+                s->prnsts |= SDHC_DOING_WRITE;
                 while (length) {
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.7.4


