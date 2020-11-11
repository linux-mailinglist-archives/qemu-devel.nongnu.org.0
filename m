Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4C2AF237
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:34:12 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqGK-0002UG-1c
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvG-0007K6-Nf
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvE-0002FU-Pn
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=FZNuZNSALLZhBLBMem6DriO7AmdJ8F3r0mh6HWNNVcw=;
 b=Iuhb7pHCgvYvD512CpbBSY8Go7QNjg4HWAS/5ZwY7xl1tEVXv8+7f1QYDbrjEzKH2ybEn8
 RB0Bvxp4/H97ZHP6KD2/N4uiBj/XrU6TuZqboopmxj0c2VhiECHZasexvAcFUfbgbVCgGP
 lXaqc3n0XEnCRGIPkRK7xIUiC8U0VCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-VvpyrAUtOb2sCoLS4f2IVw-1; Wed, 11 Nov 2020 08:12:19 -0500
X-MC-Unique: VvpyrAUtOb2sCoLS4f2IVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CECFD64081;
 Wed, 11 Nov 2020 13:12:18 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BF1555760;
 Wed, 11 Nov 2020 13:12:16 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/17] hw/net/can/ctucan: Don't allow guest to write off end of
 tx_buffer
Date: Wed, 11 Nov 2020 21:11:38 +0800
Message-Id: <1605100301-11317-15-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
Cc: Jason Wang <jasowang@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The ctucan device has 4 CAN bus cores, each of which has a set of 20
32-bit registers for writing the transmitted data. The registers are
however not contiguous; each core's buffers is 0x100 bytes after
the last.

We got the checks on the address wrong in the ctucan_mem_write()
function:
 * the first "is addr in range at all" check allowed
   addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
   byte off the end of the range
 * the decode of addresses into core-number plus offset in the
   tx buffer for that core failed to check that the offset was
   in range, so the guest could write off the end of the
   tx_buffer[] array

NB: currently the values of CTUCAN_CORE_MEM_SIZE, CTUCAN_CORE_TXBUF_NUM,
etc, make "buff_num >= CTUCAN_CORE_TXBUF_NUM" impossible, but we
retain this as a runtime check rather than an assertion to permit
those values to be changed in future (in hardware they are
configurable synthesis parameters).

Fix the top level check, and check the offset is within the buffer.

Fixes: Coverity CID 1432874
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/ctucan_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index d20835c..8486f42 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
     DPRINTF("write 0x%02llx addr 0x%02x\n",
             (unsigned long long)val, (unsigned int)addr);
 
-    if (addr > CTUCAN_CORE_MEM_SIZE) {
+    if (addr >= CTUCAN_CORE_MEM_SIZE) {
         return;
     }
 
@@ -312,7 +312,9 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
         addr -= CTU_CAN_FD_TXTB1_DATA_1;
         buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
         addr %= CTUCAN_CORE_TXBUFF_SPAN;
-        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
+        addr &= ~3;
+        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
+            (addr < sizeof(s->tx_buffer[buff_num].data))) {
             uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data + addr);
             *bufp = cpu_to_le32(val);
         }
-- 
2.7.4


