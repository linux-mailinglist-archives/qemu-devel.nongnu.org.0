Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3E31C5E8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:53:34 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrQb-00088Y-NU
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrL1-0001v8-02; Mon, 15 Feb 2021 22:47:47 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKz-0002lV-5L; Mon, 15 Feb 2021 22:47:46 -0500
Received: by mail-ed1-x52b.google.com with SMTP id o3so8389424edv.4;
 Mon, 15 Feb 2021 19:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vby0w9tVl7tpi89wMw3MRMn6A1a+kR+5AXybQWDoxcQ=;
 b=cqB3QVOoqfI+mIMo17DZEyknr/9oGuMq6QHWk3gSSaU9qqUQ8729oL7kymkYALDW0c
 7dUjKCRvQFIon66OE1e7eZ3C5c0FTGOu2LSG0yCR2SF6jRQe3IYbgzH76Czc1wp1ZuOY
 ECXrGfiW1TBvJlHlFvFUiXso/ve779sZaS6u9RWEnJe/PcB9qBL1TLv+6GwjFnOv036M
 qORXUHSnrqUZgqxXN/p62V+MmNfTL8n7K0C3ZsYsrbm7kWQRSzK57O/HrEv+fyKG55gR
 86RnodSVIZ75h3igAXY5+IIpaqLU7p3ExFaMj+A1dRQ9KOdDEiBhXfcTtzCCW4N3io2r
 zF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vby0w9tVl7tpi89wMw3MRMn6A1a+kR+5AXybQWDoxcQ=;
 b=pr3Inbn9C2epLOa1UJdo6Tg/dbQDnEgUPyw71oGT9yP1Uygd6XUkPmaMoz1eorLB+k
 vdcqs9nIDSlPrll/bftf6TIumt6Ki1gpa587lGdtMgvA2/SryJp5/vjLH39l0vj702JE
 3lSsRZe11xbk/WpfffWUlAkA/atFMzrfJCm37sXB4zJA0ih7NyBiWaRWro3gHMuTWL6J
 Ab9yVk9Gw2yWNLwC/jxkc0n3YRwVs6JN9BXZ8+/pCuXpH+Ikec9N05djqkgVkt7ywRuH
 qnlR1gi2srWrwFIuIxrZmnZHJ5UK3cD918yeUxgzJVONV1KwOtwt7ulDyeXu21ljd8ez
 FkIg==
X-Gm-Message-State: AOAM531X/besuR6lf3ZWNdWUdNY5qlzuTWWa9HzkrrGM3mBQBDBJsjbR
 zYhJTpFHMHFf23T/R05AN8jhHH4YdKI=
X-Google-Smtp-Source: ABdhPJywooZx7cIcuoS8rdL003cDcqaLwdCw88wbwOj693BXkpYQIkKG5+Y0C+nrDtQ3AFFOTrGfSA==
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr19103957edt.130.1613447263141; 
 Mon, 15 Feb 2021 19:47:43 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:42 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 6/6] hw/sd: sdhci: Reset the data pointer of
 s->fifo_buffer[] when a different block size is programmed
Date: Tue, 16 Feb 2021 11:46:54 +0800
Message-Id: <1613447214-81951-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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

---

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


