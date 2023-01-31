Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57BE682279
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 04:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMguW-0005E0-0S; Mon, 30 Jan 2023 22:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMguM-0005Di-Dl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:02:06 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMguI-0004f0-Mq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:02:05 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k13so13766475plg.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 19:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmPVWHsYTl+pKuj/umNSaH4m0dh1m1gnSRWlI0Es1wA=;
 b=ar4OF4xYmfgT4PwF+d1WqgKwWZusO50OsjWbNbm0cx8giG84zvJmtu03Y5gQMjKMXy
 WsGvJzGi6W9PtYC1ZvrxYRnUB51se3Zd1E7DYnwlVfnOLwS6yblSkMuKpA587u2uHsTM
 A0FLY8wv2d4btGvc+pxN0aWpf1ZIWX1WBU0MPlSQiC4x2Sp1kt5aM9H4C1NZBrf0EQmE
 ZF3febIoeqhEcLKR0vm+xyEOf/h6dkxrmkPMF8rSs96M2l0t322f2KPFRBgqLHrz3rK9
 C8JZEE8Plyx3PkfTtkBaEAOG6oUam2hhD3sVFr5kiG5FevKRhTarFAVTAUPKwbVlI0Hn
 sGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmPVWHsYTl+pKuj/umNSaH4m0dh1m1gnSRWlI0Es1wA=;
 b=3+VQU3LIVdJ8Cku3UV7sx65R8xuyiwMMdtrEQBx17FzjNEVmRIawq00Y8L9leNEXML
 7J/VrNCPfDN/vBN3+q6M8wBBhvkT0SJH0O8QjY1FZwrQnflcny6FvjAqpk7qC+A5dkij
 A57uPJQiQbMK4B60oIthg+gH3Lo1NYyfbNZr1jkp2JTugRjZ0atB7ll7A9p75IIpQWBh
 kbDL+cn0Nl2f0QyVSBT4KguFdOKwhJ5mGtcr18Xl0+GFRG2oRvIAs9M53V6Qh+dRZj3S
 GWVySB+xOoDCNDAw0vpXV4B/MSRs9Iu92zs+aYUlNl8KVc23qUZrL0rTGh78RgRV8cAW
 8I3Q==
X-Gm-Message-State: AO0yUKV4qe8YihixCO4NVdSjq47q5jqxP2Zv0BTqKLRjdjb2+SsBfeOx
 Q2bS9UfVfi3yykAy5ypTB8/Frw==
X-Google-Smtp-Source: AK7set/2w7VsCX9hxzZiASObk/IG1bi5eZU9KL4Jc+smkyhweecJs195py/obg0c+5iLT3HlPZoKLA==
X-Received: by 2002:a17:902:f690:b0:196:6301:9e74 with SMTP id
 l16-20020a170902f69000b0019663019e74mr14509110plg.20.1675134120946; 
 Mon, 30 Jan 2023 19:02:00 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170902ed1300b001944b1285easm8478942pld.198.2023.01.30.19.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 19:02:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2] softmmu: Use memmove in flatview_write_continue
Date: Tue, 31 Jan 2023 12:01:55 +0900
Message-Id: <20230131030155.18932-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We found a case where the source passed to flatview_write_continue() may
overlap with the destination when fuzzing igb, a new proposed network
device with sanitizers.

igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
buffer. While pci_dma_write() is usually used to write data from
memory not mapped to the guest, if igb is configured to perform
loopback, the data will be sourced from the guest memory. The source and
destination can overlap and the usage of memcpy() will be invalid in
such a case.

While we do not really have to deal with such an invalid request for
igb, detecting the overlap in igb code beforehand requires complex code,
and only covers this specific case. Instead, just replace memcpy() with
memmove() to tolerate overlaps. Using memmove() will slightly damage the
performance as it will need to check overlaps before using SIMD
instructions for copying, but the cost should be negligible, considering
the inherent complexity of flatview_write_continue().

The test cases generated by the fuzzer is available at:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Alexander Bulekov <alxndr@bu.edu>
---
V1 -> V2: Correct spellings in the message

 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cdf23..3cd27b1c9d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2828,7 +2828,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
         } else {
             /* RAM case */
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
-            memcpy(ram_ptr, buf, l);
+            memmove(ram_ptr, buf, l);
             invalidate_and_set_dirty(mr, addr1, l);
         }
 
-- 
2.39.1


