Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2493A3BA8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:07:20 +0200 (CEST)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraK7-0007YC-3e
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraE2-0004Jv-KN
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraE0-0002HH-0F
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWYqLISlZUFuxol/ujckhOparOj46nCmK91ktko2KFk=;
 b=fphopHJyiLQXFYMaAjRkIn/XY0jc4F+z0RuoDZKJLOhM3W3j+avx6sjtWIC/KRvB6isncs
 jG3NWnZ0H2YZv9GhXhzzyZZ8k8evff7akJ3HRp0HzMortGa7k1DbFxPp0ShxZswOrH3Ng2
 VcCNetQHLxvPP+I2UTk+NSW9lxsR4Pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-cGJJHhcUNMK30U9zSjXj8A-1; Fri, 11 Jun 2021 02:00:57 -0400
X-MC-Unique: cGJJHhcUNMK30U9zSjXj8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1483100C611;
 Fri, 11 Jun 2021 06:00:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1379360D01;
 Fri, 11 Jun 2021 06:00:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 10/12] Add a function named packet_new_nocopy for COLO.
Date: Fri, 11 Jun 2021 14:00:22 +0800
Message-Id: <20210611060024.46763-11-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Use the packet_new_nocopy instead of packet_new in the
filter-rewriter module. There will be one less memory
copy in the processing of each network packet.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo.c            | 25 +++++++++++++++++--------
 net/colo.h            |  1 +
 net/filter-rewriter.c |  3 +--
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index ef00609..3a3e6e8 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -157,19 +157,28 @@ void connection_destroy(void *opaque)
 
 Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
-    Packet *pkt = g_slice_new(Packet);
+    Packet *pkt = g_slice_new0(Packet);
 
     pkt->data = g_memdup(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
-    pkt->tcp_seq = 0;
-    pkt->tcp_ack = 0;
-    pkt->seq_end = 0;
-    pkt->header_size = 0;
-    pkt->payload_size = 0;
-    pkt->offset = 0;
-    pkt->flags = 0;
+
+    return pkt;
+}
+
+/*
+ * packet_new_nocopy will not copy data, so the caller can't release
+ * the data. And it will be released in packet_destroy.
+ */
+Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len)
+{
+    Packet *pkt = g_slice_new0(Packet);
+
+    pkt->data = data;
+    pkt->size = size;
+    pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    pkt->vnet_hdr_len = vnet_hdr_len;
 
     return pkt;
 }
diff --git a/net/colo.h b/net/colo.h
index 573ab91..d91cd24 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -101,6 +101,7 @@ bool connection_has_tracked(GHashTable *connection_track_table,
                             ConnectionKey *key);
 void connection_hashtable_reset(GHashTable *connection_track_table);
 Packet *packet_new(const void *data, int size, int vnet_hdr_len);
+Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
 void packet_destroy(void *opaque, void *user_data);
 void packet_destroy_partial(void *opaque, void *user_data);
 
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 10fe393..cb3a96c 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -270,8 +270,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
         vnet_hdr_len = nf->netdev->vnet_hdr_len;
     }
 
-    pkt = packet_new(buf, size, vnet_hdr_len);
-    g_free(buf);
+    pkt = packet_new_nocopy(buf, size, vnet_hdr_len);
 
     /*
      * if we get tcp packet
-- 
2.7.4


