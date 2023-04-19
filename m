Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DF6E7DFF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9YX-0002Bo-En; Wed, 19 Apr 2023 11:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YQ-0002B1-NC
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YO-0001kc-CM
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kMyq9istx/NUmfj6S3R1d7DxEcfWbNHcYWrZ4I84cHo=; b=eWDsWIFDW2hipid4p6VO2LWdZK
 0hQqaszj/TrDgEZSHTPRGbkrkENSfBC+Ro4U/ofHm1McaHHmZma3WlaKsIO0gcx6eLz5RVd2NHMKu
 MYcQI4CkEtVCNKZhxb3iFGiBalIU/jUt+FJlGEnSktC1hyp+w6bIppU1Ny3OPncT/BJHmpVH4/m1V
 7ta15lohsDCPg/ZQQkZqNW8MRpCZ1Ma0iOAaHQXKcJha2YPsJjtozaPbiL9hcIuwDDhGcNd7ef685
 EgqCMI8AKTGJofqvikUalWRzg0jVcLaJvWxFXBT05SulhLM4Xj/HOoO+jrBdJ5n5dvprdNuVPHpPM
 ZtOg/sQFoGaz0iq3kCDNFzFmX3QQFsnxycZiJQJykjtobIq/LPR9a5P0IXy8MIk6A26rM0UZtm+4i
 3YW8KS2x0hDrNC0xrq+oiRo88GVi4HScHHOzdJAQJvqqcApMk/85P2Rnznh7fx4YUuKcya+KcqWzx
 CVp775Dh6PBJWjv1KnhOGkk4nG+8NC+kOEs/yAAqSXIkaKe1bG9PdWWAxr5WMUCLUa5PfC08paxSl
 yhFdIG+nUPfieD+TJNAtIM5DdW9/sxJTG9fTq73IDX6pxaAL2BOwO9qQJrgcw/n2gM2zdfLsgzmjL
 BIwcE+NlTI1aYDBup6HbzA0vPlTANTVwY/DQmhybU=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9XQ-00041C-QR; Wed, 19 Apr 2023 16:16:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 19 Apr 2023 16:16:49 +0100
Message-Id: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/3] softmmu/ioport.c: fix use-after-free when calling
 portio_list_destroy()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When attempting to use portio_list_destroy() to remove a portio_list then the
QEMU process segfaults with the backtrace below:

    #0 0x5555599a34b6 in phys_section_destroy ../softmmu/physmem.c:996
    #1 0x5555599a37a3 in phys_sections_free ../softmmu/physmem.c:1011
    #2 0x5555599b24aa in address_space_dispatch_free ../softmmu/physmem.c:2430
    #3 0x55555996a283 in flatview_destroy ../softmmu/memory.c:292
    #4 0x55555a2cb9fb in call_rcu_thread ../util/rcu.c:284
    #5 0x55555a29b71d in qemu_thread_start ../util/qemu-thread-posix.c:541
    #6 0x7ffff4a0cea6 in start_thread nptl/pthread_create.c:477
    #7 0x7ffff492ca2e in __clone (/lib/x86_64-linux-gnu/libc.so.6+0xfca2e)

The problem is that portio_list_destroy() unparents the portio_list MemoryRegions
causing them to be freed immediately, however the flatview still has a reference to the
MemoryRegion which causes a use-after-free segfault when the RCU thread next updates
the flatview.

This series resolves the issue by QOMifying the MemoryRegionPortioList, and setting
that as the MemoryRegion owner instead of the portio_list owner. This allows the
MemoryRegionPortioList to hold the refcount for its MemoryRegion and so manually
finalize it when flatview_destroy() removes its final refcount.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (3):
  softmmu/ioport.c: allocate MemoryRegionPortioList ports on the heap
  softmmu/ioport.c: QOMify MemoryRegionPortioList
  softmmu/ioport.c: make MemoryRegionPortioList owner of portio_list
    MemoryRegions

 softmmu/ioport.c | 62 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 7 deletions(-)

-- 
2.30.2


