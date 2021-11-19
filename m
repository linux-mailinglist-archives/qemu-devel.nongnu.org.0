Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19A4568EC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 05:06:46 +0100 (CET)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnvAj-0002dX-QP
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 23:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7y-0000Z6-R5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7v-0006Aa-VW
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637294631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSNqzMdiYd1AqcnEVTVw0nNmp24RCW0UjMdkXR+jmI8=;
 b=Lg4mr/JrDb9g2dKhCWBY+PTHYBtuTFYAW9v3FyvQMzUJ5tf7XiMXH/J3XyR5H7emfig6Yj
 VroFv7N0q0+NblXiNvcnpqzGUNuHLbgzfO9KJlDG6a1wx5SPvZj53/ovT0kIFRCswQG688
 YDWDtRNK+o/ZoNH0j91JmIqq4IWwmw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-_0mhWNoXPA-pjKG-CXMGVQ-1; Thu, 18 Nov 2021 23:03:47 -0500
X-MC-Unique: _0mhWNoXPA-pjKG-CXMGVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF86802C91;
 Fri, 19 Nov 2021 04:03:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-18.pek2.redhat.com [10.72.13.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8BDF60BF1;
 Fri, 19 Nov 2021 04:03:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/3] net/colo-compare.c: Fix ACK track reverse issue
Date: Fri, 19 Nov 2021 12:03:35 +0800
Message-Id: <20211119040336.14460-3-jasowang@redhat.com>
In-Reply-To: <20211119040336.14460-1-jasowang@redhat.com>
References: <20211119040336.14460-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

The TCP protocol ACK maybe bigger than uint32_t MAX.
At this time, the ACK will reverse to 0. This patch
fix the max_ack and min_ack track issue.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b8876d7..1225f40 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -209,7 +209,8 @@ static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
 
     pkt->tcp_seq = ntohl(tcphd->th_seq);
     pkt->tcp_ack = ntohl(tcphd->th_ack);
-    *max_ack = *max_ack > pkt->tcp_ack ? *max_ack : pkt->tcp_ack;
+    /* Need to consider ACK will bigger than uint32_t MAX */
+    *max_ack = pkt->tcp_ack - *max_ack > 0 ? pkt->tcp_ack : *max_ack;
     pkt->header_size = pkt->transport_header - (uint8_t *)pkt->data
                        + (tcphd->th_off << 2);
     pkt->payload_size = pkt->size - pkt->header_size;
@@ -413,7 +414,8 @@ static void colo_compare_tcp(CompareState *s, Connection *conn)
      * can ensure that the packet's payload is acknowledged by
      * primary and secondary.
     */
-    uint32_t min_ack = conn->pack > conn->sack ? conn->sack : conn->pack;
+    uint32_t min_ack = conn->pack - conn->sack > 0 ?
+                       conn->sack : conn->pack;
 
 pri:
     if (g_queue_is_empty(&conn->primary_list)) {
-- 
2.7.4


