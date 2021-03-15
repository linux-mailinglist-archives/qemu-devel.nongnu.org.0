Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0933AEC8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:28:38 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjWf-0007AF-6C
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjK7-0008WK-Sy
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjK5-00087c-Lj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbGpWHYX8p5RfriyfsnYp7IJPRDfebqyZu6HAJFvgYA=;
 b=SuV+fMAwffU+SWnvU/yPDx2gtlvecOkPCEbpCC4LKRGELwlPpmNzzH/aclRexGKvffMb3J
 rC7iddY8LUckVYUSeQN5UZz1FSo7BmGX8TuTUHyuy9LXBT0SRh3Ae/zF7Z2YpW0QLddXn3
 rPMrZoyHELp+n4cwHce9uffZb6Lu4Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-grscoyrrNTieU-l-PjZpwA-1; Mon, 15 Mar 2021 05:15:34 -0400
X-MC-Unique: grscoyrrNTieU-l-PjZpwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432FE107ACCA;
 Mon, 15 Mar 2021 09:15:33 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1211010190A7;
 Mon, 15 Mar 2021 09:15:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 13/20] cadence_gem: switch to use qemu_receive_packet() for
 loopback
Date: Mon, 15 Mar 2021 17:14:26 +0800
Message-Id: <1615799673-31549-14-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/cadence_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 9a4474a..24b3a0f 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1275,8 +1275,8 @@ static void gem_transmit(CadenceGEMState *s)
                 /* Send the packet somewhere */
                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
                                     GEM_NWCTRL_LOCALLOOP)) {
-                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
-                                total_bytes);
+                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
+                                        total_bytes);
                 } else {
                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
                                      total_bytes);
-- 
2.7.4


