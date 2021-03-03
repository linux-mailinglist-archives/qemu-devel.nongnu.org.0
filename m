Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457432B7CF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:30:16 +0100 (CET)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQdr-00081X-0Y
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQb1-0003fe-7b; Wed, 03 Mar 2021 07:27:19 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:41170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQaz-0000iH-Bp; Wed, 03 Mar 2021 07:27:18 -0500
Received: by mail-qt1-x830.google.com with SMTP id r24so17278268qtt.8;
 Wed, 03 Mar 2021 04:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TXctM3Fn8bK0tRq+mSGwar6P0XRgVpVS0svruWa4hI=;
 b=FAitC34ROyNOKBetLcvmL8wFBMHUn6tRJlHSWS9Mizr3lOu8k/18iYMbDvqLV4ggO4
 LG90DeQaie63NWeWHSh1ZeJI0hgiohGxby2SFu8YmnLV5vTdPQUcqFjFlecL1ywdNA/0
 Itkff6ZeXMCjakWs3Yhabps+8nWRWEv4PrsHMU+pa85eRRF/Eg/uTuIi223B8n2uXmkR
 EbGpYsqlEAtjy6zAhDOJL9yZeg0JWA3RNPf8xbxhI8Mpy/xXkzPH/fCS2O5lYkurESkN
 K5RaAWL259v2q++zmTeaPa73zwC6KjbJqjwaUIo0SNpMD1x/8FFV59IgSArdaXQNftsH
 7Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TXctM3Fn8bK0tRq+mSGwar6P0XRgVpVS0svruWa4hI=;
 b=kXPlBBJgSdL2h13csoWljm41uGOGhFYoqrOYS2mRsaDsO/jYTs3plVXZnA8EuCKpFO
 Eq+EZxGQzSodHoy7NY4AMmBydVOWwa1DK1RGm/K8uoO9JUcZ2y3l0UuCp5D+seehYnVl
 JZxYefo9wLgqHNMrWjRtZQKxcr6oELVxXkdrAnsmG6Ln/+F2Lh5mtvFyhSLFB9Er6gmZ
 /9HHs5SELAwsbtlx4kXxpRgFd+0x/FSbWPmugrAK6hNkjtU3Qgl8nt1k7Y7EcmSQWd+D
 i6C8nUplQ+2NB0jLOc8YU5du5JIHs3S2B5dqoRaz1aXnAJmpVMlqsZYi6gCkk83zmLzn
 RJcw==
X-Gm-Message-State: AOAM530rvD3lXbsaByMRhjX91IoGiKC7XR8kmfBxXs12Kf4Fw5Kgx4MH
 lgTVn0ciF3HMoQ/JqPufKKQfQz5yHPE=
X-Google-Smtp-Source: ABdhPJzgQ4RhMKmO5QcRRNg7Y7HmN44sAt8gOp1lbmNmuyrI34hYyHrpdWAWOPl6Ah4e/62fSrKC3A==
X-Received: by 2002:ac8:44a8:: with SMTP id a8mr7241297qto.329.1614774435476; 
 Wed, 03 Mar 2021 04:27:15 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:27:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 5/5] hw/sd: sdhci: Reset the data pointer of
 s->fifo_buffer[] when a different block size is programmed
Date: Wed,  3 Mar 2021 20:26:39 +0800
Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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

---

(no changes since v2)

Changes in v2:
- new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed

 hw/sd/sdhci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d0c8e293c0..5b8678110b 100644
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
2.25.1


