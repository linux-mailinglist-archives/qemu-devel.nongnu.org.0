Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A732B6CF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:46:08 +0100 (CET)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHP15-0001JF-Uo
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOxU-0006Qy-Og; Wed, 03 Mar 2021 05:42:24 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOxL-0001IT-Qj; Wed, 03 Mar 2021 05:42:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id dm26so5687008edb.12;
 Wed, 03 Mar 2021 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMLMbcPvRuScsv3aJbFKZOOHoEcVHNziE1l+xZ4aQhM=;
 b=B1kPv28YDhxQFA6Sy/CSJ9kfygWrH+sWBxN1trVxKTJIq6D883Zd4841j4eLQYcvX+
 0cOgls3DLcrDCATCqo6gTIaMDe/ZyvG5orQRJLu6P7WtNIMHUJuPfts3yMU3iLokGPgH
 LEtQxDAl4hLAmSaeL6iYmEWePOenN0LPEUT5Ru6jjdHsboq4dZlVeU7XlopOEqhlcmmg
 OlwLr3CV4b790DyTRrU+ICUMZgP2AI7Qxr960EI4BmIEBXRH3DN2DT6J937b7epV1ud/
 MVqiF2q6HdYZZY50NIMWOGRn0Ni02+2W3nQCz/d34J+8h0VZZ0fw35qxoknSmFRdT/7I
 /Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMLMbcPvRuScsv3aJbFKZOOHoEcVHNziE1l+xZ4aQhM=;
 b=f8zUV6QLG9ut7qtnO5q1x6wSC3xh1Xd23ixC7a1wVbdwQ9Yzv9b0mtwSKHoknDWLZb
 2/HrAkG9Ri7N55PnwkAgbER+6F1wnjtfg5p5HJ+cV4fUcaAEzlL2mtEaKdwVJKP+TgUK
 UnVAQ12bVsQDGfpl/pTpJTgtpkwparxzMtJvKbUGv3TvGO9CS/8hl77yh6O1BGzLUAqJ
 DtyH4Vnavusk0uQCWHgX1kb1w5h6qzQlJk+HFN5nfaNalHxCd8aiooDTpLupPwhVGq+2
 NeSIkAowWETtkOByTxGxWbIu6XLFlXafzCwdozW8EwkIJNlrElD+HhPOOOYDNkcQQ5C3
 NLCA==
X-Gm-Message-State: AOAM5323zhpfmf3nE/7JtuAZXSWn0ocyTdy7xhTkzwXzJVFL+F0gyddp
 cVhsj94U4Sb4WcxarKpmR8A=
X-Google-Smtp-Source: ABdhPJxv3OJDxYVr2RjBcHagFfMcHLepj51MJSqJJifimhTU/Ae1g+04QM1tKS8ohI8oeWnTuoKTFg==
X-Received: by 2002:aa7:d686:: with SMTP id d6mr14167895edr.146.1614768132379; 
 Wed, 03 Mar 2021 02:42:12 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.42.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:42:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 5/5] hw/sd: sdhci: Reset the data pointer of
 s->fifo_buffer[] when a different block size is programmed
Date: Wed,  3 Mar 2021 18:41:28 +0800
Message-Id: <1614768088-20534-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
References: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

If the block size is programmed to a different value from the
previous one, reset the data pointer of s->fifo_buffer[] so that
s->fifo_buffer[] can be filled in using the new block size in
the next transfer.

With this fix, the following reproducer:

outl 0xcf8 0x80001010
outl 0xcfc 0xe0000000
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xe000002c 0x1 0x05
write 0xe0000005 0x1 0x02
write 0xe0000007 0x1 0x01
write 0xe0000028 0x1 0x10
write 0x0 0x1 0x23
write 0x2 0x1 0x08
write 0xe000000c 0x1 0x01
write 0xe000000e 0x1 0x20
write 0xe000000f 0x1 0x00
write 0xe000000c 0x1 0x32
write 0xe0000004 0x2 0x0200
write 0xe0000028 0x1 0x00
write 0xe0000003 0x1 0x40

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

(no changes since v2)

Changes in v2:
- new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed

 hw/sd/sdhci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d0c8e29..5b86781 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         break;
     case SDHC_BLKSIZE:
         if (!TRANSFERRING_DATA(s->prnsts)) {
+            uint16_t blksize = s->blksize;
+
             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
 
@@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
                 s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
             }
+
+            /*
+             * If the block size is programmed to a different value from
+             * the previous one, reset the data pointer of s->fifo_buffer[]
+             * so that s->fifo_buffer[] can be filled in using the new block
+             * size in the next transfer.
+             */
+            if (blksize != s->blksize) {
+                s->data_count = 0;
+            }
         }
 
         break;
-- 
2.7.4


