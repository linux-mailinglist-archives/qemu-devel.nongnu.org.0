Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C882AF231
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:31:20 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqDX-000859-Mf
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvG-0007Kg-WD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvE-0002Fv-VH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=HEguIJXVsjbU2EJs7LzNyarOp7zgAEN0BuNJ/Q6EjJE=;
 b=JUqCsVPPibdq3SqWHLd1UlCiUrZw6uZFFwUYCAfktvh6JUb7xZCrza4KgGCg9mrGcX0JY8
 DcjP1ptBsyjXGzd3sUxgIFy7NnN54brpdXCoFkMUeauYmQ6atw+vYwpBWPlark4LftkShB
 3/jO+md4Shwce0JAx6cdx5PibYhbymg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-iS34KW1RNgqTh5GIAKX4vg-1; Wed, 11 Nov 2020 08:12:22 -0500
X-MC-Unique: iS34KW1RNgqTh5GIAKX4vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB3351009443;
 Wed, 11 Nov 2020 13:12:20 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58EA375139;
 Wed, 11 Nov 2020 13:12:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 15/17] hw/net/can/ctucan: Avoid unused value in
 ctucan_send_ready_buffers()
Date: Wed, 11 Nov 2020 21:11:39 +0800
Message-Id: <1605100301-11317-16-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that in ctucan_send_ready_buffers() we
set buff_st_mask = 0xf << (i * 4) inside the loop, but then
we never use it before overwriting it later.

The only thing we use the mask for is as part of the code that is
inserting the new buff_st field into tx_status.  That is more
comprehensibly written using deposit32(), so do that and drop the
mask variable entirely.

We also update the buff_st local variable at multiple points
during this function, but nothing can ever see these
intermediate values, so just drop those, write the final
TXT_TOK as a fixed constant value, and collapse the only
remaining set/use of buff_st down into an extract32().

Fixes: Coverity CID 1432869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/ctucan_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index 8486f42..f49c762 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -240,8 +240,6 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
     uint8_t *pf;
     int buff2tx_idx;
     uint32_t tx_prio_max;
-    unsigned int buff_st;
-    uint32_t buff_st_mask;
 
     if (!s->mode_settings.s.ena) {
         return;
@@ -256,10 +254,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         for (i = 0; i < CTUCAN_CORE_TXBUF_NUM; i++) {
             uint32_t prio;
 
-            buff_st_mask = 0xf << (i * 4);
-            buff_st = (s->tx_status.u32 >> (i * 4)) & 0xf;
-
-            if (buff_st != TXT_RDY) {
+            if (extract32(s->tx_status.u32, i * 4, 4) != TXT_RDY) {
                 continue;
             }
             prio = (s->tx_priority.u32 >> (i * 4)) & 0x7;
@@ -271,10 +266,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         if (buff2tx_idx == -1) {
             break;
         }
-        buff_st_mask = 0xf << (buff2tx_idx * 4);
-        buff_st = (s->tx_status.u32 >> (buff2tx_idx * 4)) & 0xf;
         int_stat.u32 = 0;
-        buff_st = TXT_RDY;
         pf = s->tx_buffer[buff2tx_idx].data;
         ctucan_buff2frame(pf, &frame);
         s->status.s.idle = 0;
@@ -283,12 +275,11 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         s->status.s.idle = 1;
         s->status.s.txs = 0;
         s->tx_fr_ctr.s.tx_fr_ctr_val++;
-        buff_st = TXT_TOK;
         int_stat.s.txi = 1;
         int_stat.s.txbhci = 1;
         s->int_stat.u32 |= int_stat.u32 & ~s->int_mask.u32;
-        s->tx_status.u32 = (s->tx_status.u32 & ~buff_st_mask) |
-                        (buff_st << (buff2tx_idx * 4));
+        s->tx_status.u32 = deposit32(s->tx_status.u32,
+                                     buff2tx_idx * 4, 4, TXT_TOK);
     } while (1);
 }
 
-- 
2.7.4


