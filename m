Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367F2AF235
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:34:09 +0100 (CET)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqGG-0002QR-HI
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvK-0007Nn-VI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvI-0002HT-Lh
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhHctUgBLKeuQGVfGwsPAFIarLfy5Zp2GRSCj1/r2pk=;
 b=E9pQgFY7LzHBS0EQ2+StKy8RPf1ybaANOZZMmhISuzZszNAwcEpMVP3JiEhiekqROXj76S
 V0ktVQ0Xjp1Y6D18p9AtcA0qbGLNDHlOqngvJOBvNEZ7K0YIfal14tSGYCRnIHvTkWxN9/
 Xs8bRC+E/ZNKYVucfR3WCg+gZfi7260=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-ceKP-XgkNZS74NWMK4eIjQ-1; Wed, 11 Nov 2020 08:12:25 -0500
X-MC-Unique: ceKP-XgkNZS74NWMK4eIjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A299364083;
 Wed, 11 Nov 2020 13:12:24 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7C055760;
 Wed, 11 Nov 2020 13:12:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 17/17] hw/net/can/ctucan_core: Use stl_le_p to write to
 tx_buffers
Date: Wed, 11 Nov 2020 21:11:41 +0800
Message-Id: <1605100301-11317-18-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jason Wang <jasowang@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Instead of casting an address within a uint8_t array to a
uint32_t*, use stl_le_p(). This handles possibly misaligned
addresses which would otherwise crash on some hosts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/ctucan_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index f49c762..d171c37 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -303,11 +303,9 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
         addr -= CTU_CAN_FD_TXTB1_DATA_1;
         buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
         addr %= CTUCAN_CORE_TXBUFF_SPAN;
-        addr &= ~3;
         if ((buff_num < CTUCAN_CORE_TXBUF_NUM) &&
-            (addr < sizeof(s->tx_buffer[buff_num].data))) {
-            uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data + addr);
-            *bufp = cpu_to_le32(val);
+            ((addr + size) <= sizeof(s->tx_buffer[buff_num].data))) {
+            stn_le_p(s->tx_buffer[buff_num].data + addr, size, val);
         }
     } else {
         switch (addr & ~3) {
-- 
2.7.4


