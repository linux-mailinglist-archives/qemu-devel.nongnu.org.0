Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444B4E2EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:07:47 +0100 (CET)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLVS-0004mk-5o
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:07:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRd-0001pq-Fv
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRb-00059G-5K
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZnkYDrLKn2aQlBR9ldwfjO/dZAkNOjwwAi3aWEwJJI=;
 b=RW9CyIYYM+tPMJ+1XbosfxZ4gWTQtmTSFp38agZjHTJMtmgqo9ni9d2MAdSofZ8xMeKEeh
 e2/EW7piDLex7EFqXHBICzhqFic8NS15ZvlhExX0A9gjvRi+g98NhO92Xlo7kJZj3YGiu7
 wmEp20OrJ8fNbbY0PjtbyNs5LpchW/o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-ZvkQZI2IMSym9vOCgpC51g-1; Mon, 21 Mar 2022 13:03:43 -0400
X-MC-Unique: ZvkQZI2IMSym9vOCgpC51g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1BCD1C0B043;
 Mon, 21 Mar 2022 17:03:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8F640C1257;
 Mon, 21 Mar 2022 17:03:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/8] hw/sd/sdhci: Prohibit DMA accesses to devices
Date: Mon, 21 Mar 2022 18:03:19 +0100
Message-Id: <20220321170320.282496-8-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The issue reported by OSS-Fuzz produces the following backtrace:

  ==447470==ERROR: AddressSanitizer: heap-buffer-overflow
  READ of size 1 at 0x61500002a080 thread T0
      #0 0x71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
      #1 0x7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
      #2 0x721b937b in memory_region_read_accessor softmmu/memory.c:440:11
      #3 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #4 0x7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
      #5 0x7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
      #6 0x7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
      #7 0x7212f958 in flatview_read softmmu/physmem.c:2921:12
      #8 0x7212f418 in address_space_read_full softmmu/physmem.c:2934:18
      #9 0x721305a9 in address_space_rw softmmu/physmem.c:2962:16
      #10 0x7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #11 0x7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
      #12 0x71759684 in dma_memory_read include/sysemu/dma.h:152:12
      #13 0x7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
      #14 0x7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
      #15 0x7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
      #16 0x717629ee in sdhci_write hw/sd/sdhci.c:1212:9
      #17 0x72172513 in memory_region_write_accessor softmmu/memory.c:492:5
      #18 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #19 0x72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #20 0x721419ee in flatview_write_continue softmmu/physmem.c:2812:23
      #21 0x721301eb in flatview_write softmmu/physmem.c:2854:12
      #22 0x7212fca8 in address_space_write softmmu/physmem.c:2950:18
      #23 0x721d9a53 in qtest_process_command softmmu/qtest.c:727:9

A DMA descriptor is previously filled in RAM. An I/O access to the
device (frames #22 to #16) start the DMA engine (frame #13). The
engine fetch the descriptor and execute the request, which itself
accesses the SDHCI I/O registers (frame #1 and #0), triggering a
re-entrancy issue.

Fix by prohibit transactions from the DMA to devices. The DMA engine
is thus restricted to memories.

Reported-by: OSS-Fuzz (Issue 36391)
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/451
Message-Id: <20211215205656.488940-3-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/sdhci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index fe2f21f0c3..0e5e988927 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -741,6 +741,7 @@ static void sdhci_do_adma(SDHCIState *s)
 {
     unsigned int begin, length;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
+    const MemTxAttrs attrs = { .memory = true };
     ADMADescr dscr = {};
     MemTxResult res;
     int i;
@@ -794,7 +795,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     res = dma_memory_write(s->dma_as, dscr.addr,
                                            &s->fifo_buffer[begin],
                                            s->data_count - begin,
-                                           MEMTXATTRS_UNSPECIFIED);
+                                           attrs);
                     if (res != MEMTX_OK) {
                         break;
                     }
@@ -823,7 +824,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     res = dma_memory_read(s->dma_as, dscr.addr,
                                           &s->fifo_buffer[begin],
                                           s->data_count - begin,
-                                          MEMTXATTRS_UNSPECIFIED);
+                                          attrs);
                     if (res != MEMTX_OK) {
                         break;
                     }
-- 
2.27.0


