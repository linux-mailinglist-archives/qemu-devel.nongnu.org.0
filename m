Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13258567CCE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 05:50:21 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8w3P-0000Ew-Tc
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 23:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0a-0007DE-QF
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0X-0002d9-TE
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657079240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2n2CBcM3fzTKojxV+5JCWF8I/8wnU4OV33bE/oQm54=;
 b=b+0kRUV2cQBWbH1KZEoWUVIfq4Lx59Ah5g3HRmFgbX1BFvDISrd86CasgK5/HzwK2bP/30
 htAnvZVioazNmc9JhagY1Pb/9C8Lz5SSvBqFC9ptICf60TgKwRo2BR8vnvzs3wSSUn5xJn
 ZASMUm9RXMq9Z6H3l9WvdjndYPlRlT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-ItBFd2qHP0yppyYhzMtYHw-1; Tue, 05 Jul 2022 23:47:17 -0400
X-MC-Unique: ItBFd2qHP0yppyYhzMtYHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C8F1C051A7;
 Wed,  6 Jul 2022 03:47:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-233.pek2.redhat.com
 [10.72.12.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C752A140EBE4;
 Wed,  6 Jul 2022 03:47:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Ding Hui <dinghui@sangfor.com.cn>, Leonid Myravjev <asm@asm.pp.ru>,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 Jing Zhang <zhangjing@sangfor.com.cn>,
 Frank Lee <lifan38153@sangfor.com.cn>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 1/2] e1000: set RX descriptor status in a separate operation
Date: Wed,  6 Jul 2022 11:47:05 +0800
Message-Id: <20220706034706.36620-2-jasowang@redhat.com>
In-Reply-To: <20220706034706.36620-1-jasowang@redhat.com>
References: <20220706034706.36620-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ding Hui <dinghui@sangfor.com.cn>

The code of setting RX descriptor status field maybe work fine in
previously, however with the update of glibc version, it shows two
issues when guest using dpdk receive packets:

  1. The dpdk has a certain probability getting wrong buffer_addr

     this impact may be not obvious, such as lost a packet once in
     a while

  2. The dpdk may consume a packet twice when scan the RX desc queue
     over again

     this impact will lead a infinite wait in Qemu, since the RDT
     (tail pointer) be inscreased to equal to RDH by unexpected,
     which regard as the RX desc queue is full

Write a whole of RX desc with DD flag on is not quite correct, because
when the underlying implementation of memcpy using XMM registers to
copy e1000_rx_desc (when AVX or something else CPU feature is usable),
the bytes order of desc writing to memory is indeterminacy

We can use full-scale test case to reproduce the issue-2 by
https://github.com/BASM/qemu_dpdk_e1000_test (thanks to Leonid Myravjev)

I also write a POC test case at https://github.com/cdkey/e1000_poc
which can reproduce both of them, and easy to verify the patch effect.

The hw watchpoint also shows that, when Qemu using XMM related instructions
writing 16 bytes e1000_rx_desc, concurrent with DPDK using movb
writing 1 byte status, the final result of writing to memory will be one
of them, if it made by Qemu which DD flag is on, DPDK will consume it
again.

Setting DD status in a separate operation, can prevent the impact of
disorder memory writing by memcpy, also avoid unexpected data when
concurrent writing status by qemu and guest dpdk.

Links: https://lore.kernel.org/qemu-devel/20200102110504.GG121208@stefanha-x1.localdomain/T/

Reported-by: Leonid Myravjev <asm@asm.pp.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-stable@nongnu.org
Tested-by: Jing Zhang <zhangjing@sangfor.com.cn>
Reviewed-by: Frank Lee <lifan38153@sangfor.com.cn>
Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index f5bc812..e26e0a6 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -979,7 +979,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         base = rx_desc_base(s) + sizeof(desc) * s->mac_reg[RDH];
         pci_dma_read(d, base, &desc, sizeof(desc));
         desc.special = vlan_special;
-        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
+        desc.status &= ~E1000_RXD_STAT_DD;
         if (desc.buffer_addr) {
             if (desc_offset < size) {
                 size_t iov_copy;
@@ -1013,6 +1013,9 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
             DBGOUT(RX, "Null RX descriptor!!\n");
         }
         pci_dma_write(d, base, &desc, sizeof(desc));
+        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
+        pci_dma_write(d, base + offsetof(struct e1000_rx_desc, status),
+                      &desc.status, sizeof(desc.status));
 
         if (++s->mac_reg[RDH] * sizeof(desc) >= s->mac_reg[RDLEN])
             s->mac_reg[RDH] = 0;
-- 
2.7.4


