Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBA3024ED
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:28:38 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40yz-0007Z3-CF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40u0-00031J-Mq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tt-0007tR-Ts
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611577401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=u2G89Z36/wSDze7ulXLsFFw66Wxg90K6z0OfUh+k1qY=;
 b=SopUM0Tyz+1ehRqy0na6vvllVnAnwF4DcQdLJ2CT6bxYuVrqg+pjwVje3MIz+8qPA+JcaW
 QQAouyNN0aPsap8oh7r4droiFsOsZsbgUcJjrNYUGprCJHN7qHCDkPqr8rjTKBuNu4cqAy
 5mb4d+0WlfPkXG3RKY1IXTb9/E9fKLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-Hf2P1JsPPLGNPWl_f-kxCg-1; Mon, 25 Jan 2021 07:23:17 -0500
X-MC-Unique: Hf2P1JsPPLGNPWl_f-kxCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C17B5100558A;
 Mon, 25 Jan 2021 12:23:15 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C6419C44;
 Mon, 25 Jan 2021 12:23:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [RESEND PULL 2/4] net: checksum: Skip fragmented IP packets
Date: Mon, 25 Jan 2021 20:23:05 +0800
Message-Id: <1611577387-4296-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
References: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Carlstedt <markus.carlstedt@windriver.com>

To calculate the TCP/UDP checksum we need the whole datagram. Unless
the hardware has some logic to collect all fragments before sending
the whole datagram first, it can only be done by the network stack,
which is normally the case for the NICs we have seen so far.

Skip these fragmented IP packets to avoid checksum corruption.

Signed-off-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/checksum.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/checksum.c b/net/checksum.c
index aaa4000..5cb8b2c 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -106,6 +106,10 @@ void net_checksum_calculate(uint8_t *data, int length)
         return; /* not IPv4 */
     }
 
+    if (IP4_IS_FRAGMENT(ip)) {
+        return; /* a fragmented IP packet */
+    }
+
     ip_len = lduw_be_p(&ip->ip_len);
 
     /* Last, check that we have enough data for the all IP frame */
-- 
2.7.4


