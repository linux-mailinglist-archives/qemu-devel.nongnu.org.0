Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7633AE77
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:18:21 +0100 (CET)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjMi-0001U7-0K
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJu-00085g-5T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJs-0007xR-Hs
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bJKthAT4Mc9pCJJjfRZzZpHScIqv7jLZTPGXL8J8zk=;
 b=dv5oFgLGDfijCmgpPcfrGzMf6Uiqoc9tms+xhpSGtRh3bZwep2KMa4jp52EZzDMsBL1XxB
 B2WI7+zGDKD/cde542H/oqMg0GH1SJpsPUSwWBaBEmb6GzfZKPKSN+ADWXoJgXRF0rNlXl
 +8EyGPOl0gnIaw1eV3Los+H3ktXl8u8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-iXzACB29MgqNXQVCWgYgxA-1; Mon, 15 Mar 2021 05:15:22 -0400
X-MC-Unique: iXzACB29MgqNXQVCWgYgxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA8418460E2;
 Mon, 15 Mar 2021 09:15:21 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 410EB1007625;
 Mon, 15 Mar 2021 09:15:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 10/20] tx_pkt: switch to use qemu_receive_packet_iov() for
 loopback
Date: Mon, 15 Mar 2021 17:14:23 +0800
Message-Id: <1615799673-31549-11-git-send-email-jasowang@redhat.com>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_receive_iov() which can detect
reentrancy and return early.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/net_tx_pkt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index da262ed..1f9aa59 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -553,7 +553,7 @@ static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
     NetClientState *nc, const struct iovec *iov, int iov_cnt)
 {
     if (pkt->is_loopback) {
-        nc->info->receive_iov(nc, iov, iov_cnt);
+        qemu_receive_packet_iov(nc, iov, iov_cnt);
     } else {
         qemu_sendv_packet(nc, iov, iov_cnt);
     }
-- 
2.7.4


