Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B215D25BB67
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 09:11:51 +0200 (CEST)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDjPS-0006WW-RD
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 03:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDjOd-000619-T5
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDjOb-0008Su-8D
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 03:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599117055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T5ZfoAzWZJb7OL8G9LB8xC0vvEMd9TxuJopR1WzXeX4=;
 b=Zy9yPg3pmaL9TSUFXFUC1Iws1Vw/W2aU7NOOvO0fFEQxNbZfAPe/2KRxlfvpPX+K73cEMP
 Vm8ZpkhD25W6XOlh6r9ocD5l9jjJ/+WY+SkmULtVR/N7veot7VUrEXibFpOFahEhrGhqVE
 zgKCLI1XPF++hvPWcJoowyxYEjJGDCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-xU47r8Q8NDWkwj0eo8Fx6Q-1; Thu, 03 Sep 2020 03:10:50 -0400
X-MC-Unique: xU47r8Q8NDWkwj0eo8Fx6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ABB5801AE6;
 Thu,  3 Sep 2020 07:10:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-31.rdu2.redhat.com
 [10.10.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB581002D53;
 Thu,  3 Sep 2020 07:10:46 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v1] sd: sdhci: assert data_count is within fifo_buffer
Date: Thu,  3 Sep 2020 12:38:42 +0530
Message-Id: <20200903070842.2125083-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While doing multi block SDMA, transfer block size may exceed
the 's->fifo_buffer[s->buf_maxsz]' size. It may leave the
current element pointer 's->data_count' pointing out of bounds.
Leading the subsequent DMA r/w operation to OOB access issue.
Assert that 's->data_count' is within fifo_buffer.

 -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Fsdhci_oob_write1
 ==1459837==ERROR: AddressSanitizer: heap-buffer-overflow
 WRITE of size 54722048 at 0x61500001e280 thread T3
 #0  __interceptor_memcpy (/lib64/libasan.so.6+0x3a71d)
 #1  flatview_read_continue ../exec.c:3245
 #2  flatview_read ../exec.c:3278
 #3  address_space_read_full ../exec.c:3291
 #4  address_space_rw ../exec.c:3319
 #5  dma_memory_rw_relaxed ../include/sysemu/dma.h:87
 #6  dma_memory_rw ../include/sysemu/dma.h:110
 #7  dma_memory_read ../include/sysemu/dma.h:116
 #8  sdhci_sdma_transfer_multi_blocks ../hw/sd/sdhci.c:629
 #9  sdhci_write ../hw/sd/sdhci.c:1097
 #10 memory_region_write_accessor ../softmmu/memory.c:483
 ...

Reported-by: Ruhr-University <bugs-syssec@rub.de>
Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/sd/sdhci.c | 2 ++
 1 file changed, 2 insertions(+)

Update v1: use assert(3) calls
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg00966.html

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 1785d7e1f7..023acbed41 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -604,6 +604,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                     s->blkcnt--;
                 }
             }
+            assert(s->data_count <= s->buf_maxsz && s->data_count > begin);
             dma_memory_write(s->dma_as, s->sdmasysad,
                              &s->fifo_buffer[begin], s->data_count - begin);
             s->sdmasysad += s->data_count - begin;
@@ -626,6 +627,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 s->data_count = block_size;
                 boundary_count -= block_size - begin;
             }
+            assert(s->data_count <= s->buf_maxsz && s->data_count > begin);
             dma_memory_read(s->dma_as, s->sdmasysad,
                             &s->fifo_buffer[begin], s->data_count - begin);
             s->sdmasysad += s->data_count - begin;
-- 
2.26.2


