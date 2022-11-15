Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB7629F2E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouywE-0008NZ-LI; Tue, 15 Nov 2022 11:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouywB-0008Kl-MB
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouyw9-0002Ol-3S
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668530244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0V9FW4XgRhJvhlV4mqFDlfCynvDX4A/FbUDSpDmXChc=;
 b=AFRyQA/QHxmkEADSpdbbzgMTLrcQlm7JSnoG7xOCP/GwGFtUBCr2C0xbPwLCFudivkNFU6
 6jVTF4QM2sH3BeBmHApdtZzqu3ZkVBRGwgf7LWOLyLz4chS8ZOL2jvPZWWM6JnpxZD8ZAQ
 zrQVOXiksoNsD3+W4HgifzAx5FOa0ow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-goINLCQPNi2SEylKk-NQRg-1; Tue, 15 Nov 2022 11:37:20 -0500
X-MC-Unique: goINLCQPNi2SEylKk-NQRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D90CB101A528;
 Tue, 15 Nov 2022 16:37:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28D6E40C835A;
 Tue, 15 Nov 2022 16:37:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Tobias Fiebig <tobias+git@fiebig.nl>
Subject: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Tue, 15 Nov 2022 11:36:59 -0500
Message-Id: <20221115163659.1595865-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This issue was discussed in the past here:
https://lore.kernel.org/all/20161114162505.GD26664@stefanha-x1.localdomain/

Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
Reported-by: Tobias Fiebig <tobias+git@fiebig.nl>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1312
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

Tobias: Please test this fix. Thanks!

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index e6643e3c9d..ecc4dcb07f 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -77,7 +77,6 @@
     ( ( input ) & ( size - 1 )  )
 
 #define ETHER_TYPE_LEN 2
-#define ETH_MTU     1500
 
 #define VLAN_TCI_LEN 2
 #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
@@ -2151,8 +2150,8 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
 
                 int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
 
-                DPRINTF("+++ C+ mode offloaded task TSO MTU=%d IP data %d "
-                    "frame data %d specified MSS=%d\n", ETH_MTU,
+                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
+                    "frame data %d specified MSS=%d\n",
                     ip_data_len, saved_size - ETH_HLEN, large_send_mss);
 
                 int tcp_send_offset = 0;
@@ -2177,9 +2176,13 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     goto skip_offload;
                 }
 
-                /* ETH_MTU = ip header len + tcp header len + payload */
+                /* MSS too small? */
+                if (tcp_hlen + hlen >= large_send_mss) {
+                    goto skip_offload;
+                }
+
                 int tcp_data_len = ip_data_len - tcp_hlen;
-                int tcp_chunk_size = ETH_MTU - hlen - tcp_hlen;
+                int tcp_chunk_size = large_send_mss - hlen - tcp_hlen;
 
                 DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP "
                     "data len %d TCP chunk size %d\n", ip_data_len,
-- 
2.38.1


