Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A135AA886
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 09:09:07 +0200 (CEST)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0na-0007Iu-3s
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 03:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0OC-00084i-Pg
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0OB-0004yB-7r
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc0N2REmDmqyeL22Uv1jv8lmIURq2MzxLIYIY6P6MFk=;
 b=Vf1vNMP6h8WDtkAX8MLFE5YCQ/3cVH+aGA/gYemx5ilMZ/+1T7MDIZdRXYT8UVDnQ9yevN
 upG2TdqN7LBXz4Jv2EM7TNvtah68tmeDyDwV88E+TNHm6X04Fyt8KkNBfRZ4xQ+mEsjbLk
 5c10D9m2ZDKWCapXOqi9MjuE4Vsex1s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-bwJY4vwDM-SQdxZBI5uwfw-1; Fri, 02 Sep 2022 02:42:47 -0400
X-MC-Unique: bwJY4vwDM-SQdxZBI5uwfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BFC73C0ED69;
 Fri,  2 Sep 2022 06:42:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DAB71415138;
 Fri,  2 Sep 2022 06:42:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/21] net/colo.c: Fix the pointer issue reported by Coverity.
Date: Fri,  2 Sep 2022 14:41:37 +0800
Message-Id: <20220902064138.56468-21-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Zhang Chen <chen.zhang@intel.com>

When enabled the virtio-net-pci, guest network packet will
load the vnet_hdr. In COLO status, the primary VM's network
packet maybe redirect to another VM, it needs filter-redirect
enable the vnet_hdr flag at the same time, COLO-proxy will
correctly parse the original network packet. If have any
misconfiguration here, the vnet_hdr_len is wrong for parse
the packet, the data+offset will point to wrong place.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo.c       | 25 ++++++++++++++++---------
 net/colo.h       |  1 +
 net/trace-events |  2 +-
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 6b0ff56..fb2c36a 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -44,21 +44,28 @@ int parse_packet_early(Packet *pkt)
 {
     int network_length;
     static const uint8_t vlan[] = {0x81, 0x00};
-    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
+    uint8_t *data = pkt->data;
     uint16_t l3_proto;
     ssize_t l2hdr_len;
 
-    if (data == NULL) {
-        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
-                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
+    assert(data);
+
+    /* Check the received vnet_hdr_len then add the offset */
+    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr_v1_hash)) ||
+        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header) +
+        pkt->vnet_hdr_len)) {
+        /*
+         * The received remote packet maybe misconfiguration here,
+         * Please enable/disable filter module's the vnet_hdr flag at
+         * the same time.
+         */
+        trace_colo_proxy_main_vnet_info("This received packet load wrong ",
+                                        pkt->vnet_hdr_len, pkt->size);
         return 1;
     }
-    l2hdr_len = eth_get_l2_hdr_length(data);
+    data += pkt->vnet_hdr_len;
 
-    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
-        trace_colo_proxy_main("pkt->size < ETH_HLEN");
-        return 1;
-    }
+    l2hdr_len = eth_get_l2_hdr_length(data);
 
     /*
      * TODO: support vlan.
diff --git a/net/colo.h b/net/colo.h
index 8b3e8d5..22fc303 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -18,6 +18,7 @@
 #include "qemu/jhash.h"
 #include "qemu/timer.h"
 #include "net/eth.h"
+#include "standard-headers/linux/virtio_net.h"
 
 #define HASHTABLE_MAX_SIZE 16384
 
diff --git a/net/trace-events b/net/trace-events
index 6af927b..823a071 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -9,7 +9,7 @@ vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
 
 # colo.c
 colo_proxy_main(const char *chr) ": %s"
-colo_proxy_main_vnet_info(const char *sta, int size) ": %s = %d"
+colo_proxy_main_vnet_info(const char *sta, uint32_t vnet_hdr, int size) ": %s pkt->vnet_hdr_len = %u, pkt->size = %d"
 
 # colo-compare.c
 colo_compare_main(const char *chr) ": %s"
-- 
2.7.4


