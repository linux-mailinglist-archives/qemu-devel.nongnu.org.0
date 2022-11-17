Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26CE62E254
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviBW-0005rH-W7; Thu, 17 Nov 2022 11:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBU-0005qp-0o
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBS-0007nT-CV
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668704173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yYVLofEmu2NspRaxaIPhn3aTno+moMYuabjvgVu3SU=;
 b=RHbXiz4nH29VZws3dc0E/0cY5mgw0FpaeWenk6nM9rZEjrLtdJ0XtFYmfxEb5mb00Dc0IX
 BKISzv+EJgGJASQfPJ++yD3Nthshzia4hQNk8fsI+zhXEloO1Fuvg6LHOS1etygXreQqrt
 BfZ1cN5183h8sj8RBdz1leuUCStrL/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-xadYxSxSM3y5CCy_fE3O8g-1; Thu, 17 Nov 2022 11:56:12 -0500
X-MC-Unique: xadYxSxSM3y5CCy_fE3O8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6B09882820;
 Thu, 17 Nov 2022 16:56:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B70040C83AA;
 Thu, 17 Nov 2022 16:56:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
Date: Thu, 17 Nov 2022 11:55:54 -0500
Message-Id: <20221117165554.1773409-4-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-1-stefanha@redhat.com>
References: <20221117165554.1773409-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a
Large-Send MSS value where the driver specifies the MSS. See the
datasheet here:
http://realtek.info/pdf/rtl8139cp.pdf

The code ignores this value and uses a hardcoded MSS of 1500 bytes
instead. When the MTU is less than 1500 bytes the hardcoded value
results in IP fragmentation and poor performance.

Use the Large-Send MSS value to correctly size Large-Send packets.

Jason Wang <jasowang@redhat.com> noticed that the Large-Send MSS value
mask was incorrect so it is adjusted to match the datasheet and Linux
8139cp driver.

This issue was discussed in the past here:
https://lore.kernel.org/all/20161114162505.GD26664@stefanha-x1.localdomain/

Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
Reported-by: Tobias Fiebig <tobias+git@fiebig.nl>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1312
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 6dd7a8e6e0..700b1b66b6 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -77,7 +77,6 @@
     ( ( input ) & ( size - 1 )  )
 
 #define ETHER_TYPE_LEN 2
-#define ETH_MTU     1500
 
 #define VLAN_TCI_LEN 2
 #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
@@ -1934,8 +1933,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
 #define CP_TX_LS (1<<28)
 /* large send packet flag */
 #define CP_TX_LGSEN (1<<27)
-/* large send MSS mask, bits 16...25 */
-#define CP_TC_LGSEN_MSS_MASK ((1 << 12) - 1)
+/* large send MSS mask, bits 16...26 */
+#define CP_TC_LGSEN_MSS_SHIFT 16
+#define CP_TC_LGSEN_MSS_MASK ((1 << 11) - 1)
 
 /* IP checksum offload flag */
 #define CP_TX_IPCS (1<<18)
@@ -2152,10 +2152,11 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     goto skip_offload;
                 }
 
-                int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
+                int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
+                                     CP_TC_LGSEN_MSS_MASK;
 
-                DPRINTF("+++ C+ mode offloaded task TSO MTU=%d IP data %d "
-                    "frame data %d specified MSS=%d\n", ETH_MTU,
+                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
+                    "frame data %d specified MSS=%d\n",
                     ip_data_len, saved_size - ETH_HLEN, large_send_mss);
 
                 int tcp_send_offset = 0;
@@ -2180,25 +2181,22 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     goto skip_offload;
                 }
 
-                /* ETH_MTU = ip header len + tcp header len + payload */
                 int tcp_data_len = ip_data_len - tcp_hlen;
-                int tcp_chunk_size = ETH_MTU - hlen - tcp_hlen;
 
                 DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP "
-                    "data len %d TCP chunk size %d\n", ip_data_len,
-                    tcp_hlen, tcp_data_len, tcp_chunk_size);
+                    "data len %d\n", ip_data_len, tcp_hlen, tcp_data_len);
 
                 /* note the cycle below overwrites IP header data,
                    but restores it from saved_ip_header before sending packet */
 
                 int is_last_frame = 0;
 
-                for (tcp_send_offset = 0; tcp_send_offset < tcp_data_len; tcp_send_offset += tcp_chunk_size)
+                for (tcp_send_offset = 0; tcp_send_offset < tcp_data_len; tcp_send_offset += large_send_mss)
                 {
-                    uint16_t chunk_size = tcp_chunk_size;
+                    uint16_t chunk_size = large_send_mss;
 
                     /* check if this is the last frame */
-                    if (tcp_send_offset + tcp_chunk_size >= tcp_data_len)
+                    if (tcp_send_offset + large_send_mss >= tcp_data_len)
                     {
                         is_last_frame = 1;
                         chunk_size = tcp_data_len - tcp_send_offset;
@@ -2247,7 +2245,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     ip->ip_len = cpu_to_be16(hlen + tcp_hlen + chunk_size);
 
                     /* increment IP id for subsequent frames */
-                    ip->ip_id = cpu_to_be16(tcp_send_offset/tcp_chunk_size + be16_to_cpu(ip->ip_id));
+                    ip->ip_id = cpu_to_be16(tcp_send_offset/large_send_mss + be16_to_cpu(ip->ip_id));
 
                     ip->ip_sum = 0;
                     ip->ip_sum = ip_checksum(eth_payload_data, hlen);
-- 
2.38.1


