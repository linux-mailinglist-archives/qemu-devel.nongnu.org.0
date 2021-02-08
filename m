Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA63143A1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:22:18 +0100 (CET)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FrF-0005nJ-NH
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9CJO-0005Sj-Nj; Mon, 08 Feb 2021 14:35:09 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9CJC-00022S-MA; Mon, 08 Feb 2021 14:35:02 -0500
Received: by mail-ej1-x631.google.com with SMTP id b9so26949004ejy.12;
 Mon, 08 Feb 2021 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V+mk+aC2y/rzDR5LVlHgI6DrxiMswv/ScJdkQl4PRxE=;
 b=IHkd1PQ9gNvWI72q/swI/rwVFfxotdq2GTu+c2QfBLakzxu4BO84U9AiPnsi1Q9jCf
 3IaCnv6SGmkDWUlD+J7+utatnjluBO04QDm5tIM4RW2If1hESYHuR3U1JTB7FQGfyC/2
 7WRx9hGNl98cVpxxK+NQu2N3FEgHn6wOSTtC0AmAE/pY8Zg2EZHz+otEHuvSNpjaVfgV
 nB+ecZFCymypGqCNNtftwOJ/x0Bim71Yn0YsUgcIylww46FJ6M+1Z1tgnQQ0r92KQ7Tj
 0kNFA8xiZIJG3iw15KyG80or96W80q0IwbzFG4PjskGtwW1ZmjvHFdNdJvDKaR5SGw/2
 zYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=V+mk+aC2y/rzDR5LVlHgI6DrxiMswv/ScJdkQl4PRxE=;
 b=o6tb4EOznz/v7IvYwMB1sOLtIRyDRo/P3L5ynPT5Jv4XF+x3vIovGFXJgFwFIkG8yO
 oYVWvht7aCv0fYBDygSTVY2aMaipnFk4SHuBWw3Rys60bySERsyKVe9nWxSDhX8iFhWg
 69oWbEzt/iJ9TBUqUZcI4IvSgDYByCIYz9v+758TkE6m/BtdPbZnnFD36DSVgCH9J16K
 nVyWvq8hL2I0YSVvHjqHNHn4J9PM00MSdcUUnh+kYGcLr0R2MFtlmNi6g51x0sm/e53R
 X2ElbGQdhy1DCqYpsAK+yITr9VwMTEW0ycMqBmbHTjjKNzhq6PUEFJyzGeNex8euurF6
 DiRw==
X-Gm-Message-State: AOAM532uYQbbgT6v1zMY+VatCjCKCV+7GeGHCEiHFvAQilpt7mb4TYRv
 nmhoOLcJoIekAY6aGqKrkFTKBx7dkD4=
X-Google-Smtp-Source: ABdhPJxBTYYeCRq2OkN+pglxD912pb6fBOCHKybLw1t3cPXt8IHUk5G6krIDFN7LqFpeN80/5Ngj0A==
X-Received: by 2002:a17:906:59a:: with SMTP id
 26mr18530216ejn.309.1612812892364; 
 Mon, 08 Feb 2021 11:34:52 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p25sm9684055eds.55.2021.02.08.11.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 11:34:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if transaction
 in progress
Date: Mon,  8 Feb 2021 20:34:49 +0100
Message-Id: <20210208193450.2689517-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "SD Host Controller Simplified Specification Version 2.00"
spec. 'Table 2-4 : Block Size Register':

  Transfer Block Size [...] can be accessed only if no
  transaction is executing (i.e., after a transaction has stopped).
  Read operations during transfers may return an invalid value,
  and write operations shall be ignored.

Transactions will update 'data_count', so do not modify 'blksize'
and 'blkcnt' when 'data_count' is used. This fixes:

$ cat << EOF | qemu-system-x86_64 -qtest stdio -monitor none \
               -nographic -serial none -M pc-q35-5.0 \
               -device sdhci-pci,sd-spec-version=3 \
               -device sd-card,drive=mydrive \
               -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive
  outl 0xcf8 0x80001810
  outl 0xcfc 0xe1068000
  outl 0xcf8 0x80001814
  outl 0xcf8 0x80001804
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fa20
  write 0xe106802c 0x1 0x0f
  write 0xe1068004 0xc 0x2801d10101fffffbff28a384
  write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
  write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
  write 0xe1068003 0x1 0xfe
  EOF
  =================================================================
  ==2686219==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500003bb00 at pc 0x55ab469f456c bp 0x7ffee71be330 sp 0x7ffee71bdae0
  WRITE of size 4 at 0x61500003bb00 thread T0
      #0 0x55ab469f456b in __asan_memcpy (qemu-system-i386+0x1cea56b)
      #1 0x55ab483dc396 in stl_he_p include/qemu/bswap.h:353:5
      #2 0x55ab483af5e4 in stn_he_p include/qemu/bswap.h:546:1
      #3 0x55ab483aeb4b in flatview_read_continue softmmu/physmem.c:2839:13
      #4 0x55ab483b0705 in flatview_read softmmu/physmem.c:2877:12
      #5 0x55ab483b028e in address_space_read_full softmmu/physmem.c:2890:18
      #6 0x55ab483b1294 in address_space_rw softmmu/physmem.c:2918:16
      #7 0x55ab479374a2 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
      #8 0x55ab47936f50 in dma_memory_rw include/sysemu/dma.h:127:12
      #9 0x55ab4793665f in dma_memory_read include/sysemu/dma.h:145:12
      #10 0x55ab4792f176 in sdhci_sdma_transfer_multi_blocks hw/sd/sdhci.c:639:13
      #11 0x55ab4793dc9d in sdhci_write hw/sd/sdhci.c:1129:17
      #12 0x55ab483f8db8 in memory_region_write_accessor softmmu/memory.c:491:5
      #13 0x55ab483f868a in access_with_adjusted_size softmmu/memory.c:552:18
      #14 0x55ab483f6da5 in memory_region_dispatch_write softmmu/memory.c:1501:16
      #15 0x55ab483c3b11 in flatview_write_continue softmmu/physmem.c:2774:23
      #16 0x55ab483b0eb6 in flatview_write softmmu/physmem.c:2814:14
      #17 0x55ab483b0a3e in address_space_write softmmu/physmem.c:2906:18
      #18 0x55ab48465c56 in qtest_process_command softmmu/qtest.c:654:9

  0x61500003bb00 is located 0 bytes to the right of 512-byte region [0x61500003b900,0x61500003bb00)
  allocated by thread T0 here:
      #0 0x55ab469f58a7 in calloc (qemu-system-i386+0x1ceb8a7)
      #1 0x7f21d678f9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
      #2 0x55ab479530ed in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
      #3 0x55ab476f102a in pci_qdev_realize hw/pci/pci.c:2108:9
      #4 0x55ab48baaad2 in device_set_realized hw/core/qdev.c:761:13

  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1cea56b) in __asan_memcpy
  Shadow bytes around the buggy address:
    0x0c2a7ffff710: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7ffff720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7ffff730: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7ffff740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7ffff750: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  =>0x0c2a7ffff760:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7ffff770: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7ffff780: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7ffff790: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7ffff7a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7ffff7b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Heap left redzone:       fa
    Freed heap region:       fd
  ==2686219==ABORTING

Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: Bandan Das <bsd@redhat.com>

RFC because missing Reported-by tags, launchpad/bugzilla links and
qtest reproducer. Sending for review meanwhile.
---
 hw/sd/sdhci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa53999d8..7ac7d9af9e4 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1133,6 +1133,12 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         }
         break;
     case SDHC_BLKSIZE:
+        if (s->data_count) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Can not update blksize when"
+                          " transaction is executing\n", __func__);
+            break;
+        }
         if (!TRANSFERRING_DATA(s->prnsts)) {
             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
-- 
2.26.2


