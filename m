Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041F2D0043
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 03:18:19 +0100 (CET)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kljcw-0001Zz-K8
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 21:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kljaF-0000AT-Q3; Sat, 05 Dec 2020 21:15:32 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:37283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kljaA-0004Sr-Gh; Sat, 05 Dec 2020 21:15:31 -0500
Received: by mail-qk1-x742.google.com with SMTP id h20so9441557qkk.4;
 Sat, 05 Dec 2020 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=su1F/v+5+aB1M38riLgjKG95V1Mh9HGEBldHjqNVRUM=;
 b=TdyDkqCWGblhOuKZpsO1dxV+LKOBRkwiBZTIHPq66a93eKkXM6ZRIb9GfI9Mla98vS
 DcmmN6P2DKo7qJ4WQUHVrmrEJ4C+dbQ0dsjQdMwuy03rhYFqtKqDNARJ3hmpbTeIDBSp
 RybTmnKTqhKGY8fsHdCLeesBkfvlM7iKsk19gYn4WW6de1mgh0zHvilrElLfXytHyklJ
 DyeAThJ/hEsft2Be5e3dZPNVw+BAxur2CFGh5Ohl16mMzYn/rbCGj9I8bF8vZFEUjFXK
 Lg1US5va1GpD9DOapI+KePYY0OJwqp1fCDFFucXsZZSFc13y0rW7y0YcmH4mjtjibHkF
 uVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=su1F/v+5+aB1M38riLgjKG95V1Mh9HGEBldHjqNVRUM=;
 b=ReK7XOJ5BRIbCrNmPnQ1MiFZLuqqC3a2fbWtNVmfifaCcM5/P9U+MXOPX7gLR9wPl5
 7a0J4cmWVSDWDB/sj7YIVvcNq1XXlo/kxj5BKManC2UUext3snR4lL/wvIAgM00DF7dO
 YufvvWGBWK0E6gXHptkWbfdyWzgfPNz2nGgN8yCQQIGe6vY1iHZL4GW00tCVhtt8yLhn
 IPP4C74QpocSY/+K4nGoNTylz2af0S55McWv+t2H22l8vGQUXbT22qjJg/O+VBBRwJQe
 vRXZDCbOMGSUPMARlin6jGQLJBSvlLbbePdzpvVYcOmCefc24uiNWsJMdC64/FdUFfKb
 qSbw==
X-Gm-Message-State: AOAM532KhgrruWQVgGurp92jJa5uCohOU2Zmt1PTFx6MKZFQqo9RUJ6C
 Ol0z7AnyMeohKVYxdJwRsIHUky9DlkY=
X-Google-Smtp-Source: ABdhPJz6I806bbxlzJbwwb4kQ3YSWW06ZHnPeCzANSQUQT99JyJR1eK9gpq6LyJ0IUUONb6beAYzeA==
X-Received: by 2002:a37:8943:: with SMTP id l64mr16832588qkd.212.1607220924201; 
 Sat, 05 Dec 2020 18:15:24 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g18sm9296306qtv.79.2020.12.05.18.15.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 18:15:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] net: checksum: Introduce fine control over checksum type
Date: Sun,  6 Dec 2020 10:14:07 +0800
Message-Id: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x742.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>, Zhang Chen <chen.zhang@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present net_checksum_calculate() blindly calculates all types of
checksums (IP, TCP, UDP). Some NICs may have a per type setting in
their BDs to control what checksum should be offloaded. To support
such hardware behavior, introduce a 'csum_flag' parameter to the
net_checksum_calculate() API to allow fine control over what type
checksum is calculated.

Existing users of this API are updated accordingly.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/net/allwinner-sun8i-emac.c |  2 +-
 hw/net/cadence_gem.c          |  2 +-
 hw/net/fsl_etsec/rings.c      |  8 +++-----
 hw/net/ftgmac100.c            | 10 +++++++++-
 hw/net/imx_fec.c              | 15 +++------------
 hw/net/virtio-net.c           |  2 +-
 hw/net/xen_nic.c              |  2 +-
 include/net/checksum.h        |  7 ++++++-
 net/checksum.c                | 18 ++++++++++++++----
 net/filter-rewriter.c         |  4 ++--
 10 files changed, 41 insertions(+), 29 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 38d3285..0427689 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -514,7 +514,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
         /* After the last descriptor, send the packet */
         if (desc.status2 & TX_DESC_STATUS2_LAST_DESC) {
             if (desc.status2 & TX_DESC_STATUS2_CHECKSUM_MASK) {
-                net_checksum_calculate(packet_buf, packet_bytes);
+                net_checksum_calculate(packet_buf, packet_bytes, CSUM_ALL);
             }
 
             qemu_send_packet(nc, packet_buf, packet_bytes);
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7a53469..9a4474a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1266,7 +1266,7 @@ static void gem_transmit(CadenceGEMState *s)
 
                 /* Is checksum offload enabled? */
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                    net_checksum_calculate(s->tx_packet, total_bytes);
+                    net_checksum_calculate(s->tx_packet, total_bytes, CSUM_ALL);
                 }
 
                 /* Update MAC statistics */
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 628648a..2b0afee 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -186,10 +186,8 @@ static void process_tx_fcb(eTSEC *etsec)
 
     /* if packet is IP4 and IP checksum is requested */
     if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
-        /* do IP4 checksum (TODO This function does TCP/UDP checksum
-         * but not sure if it also does IP4 checksum.) */
         net_checksum_calculate(etsec->tx_buffer + 8,
-                etsec->tx_buffer_len - 8);
+                etsec->tx_buffer_len - 8, CSUM_IP);
     }
     /* TODO Check the correct usage of the PHCS field of the FCB in case the NPH
      * flag is on */
@@ -203,7 +201,7 @@ static void process_tx_fcb(eTSEC *etsec)
                 /* do UDP checksum */
 
                 net_checksum_calculate(etsec->tx_buffer + 8,
-                        etsec->tx_buffer_len - 8);
+                        etsec->tx_buffer_len - 8, CSUM_UDP);
             } else {
                 /* set checksum field to 0 */
                 l4_header[6] = 0;
@@ -212,7 +210,7 @@ static void process_tx_fcb(eTSEC *etsec)
         } else if (flags & FCB_TX_CTU) { /* if TCP and checksum is requested */
             /* do TCP checksum */
             net_checksum_calculate(etsec->tx_buffer + 8,
-                                   etsec->tx_buffer_len - 8);
+                                   etsec->tx_buffer_len - 8, CSUM_TCP);
         }
     }
 }
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 782ff19..fbae1f1 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -573,7 +573,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             }
 
             if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
-                net_checksum_calculate(s->frame, frame_size);
+                /*
+                 * TODO:
+                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
+                 * however previous net_checksum_calculate() did not calculate
+                 * IP checksum at all. Passing CSUM_ALL for now until someone
+                 * who is familar with this MAC to figure out what should be
+                 * properly added for TCP/UDP checksum offload.
+                 */
+                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
             }
             /* Last buffer in frame.  */
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 2c14804..45f96fa 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -562,20 +562,11 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
         frame_size += len;
         if (bd.flags & ENET_BD_L) {
             if (bd.option & ENET_BD_PINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
-                if (IP_HEADER_VERSION(ip_hd) == 4) {
-                    net_checksum_calculate(s->frame, frame_size);
-                }
+                net_checksum_calculate(s->frame, frame_size,
+                                       CSUM_TCP | CSUM_UDP);
             }
             if (bd.option & ENET_BD_IINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
-                /* We compute checksum only for IPv4 frames */
-                if (IP_HEADER_VERSION(ip_hd) == 4) {
-                    uint16_t csum;
-                    ip_hd->ip_sum = 0;
-                    csum = net_raw_checksum((uint8_t *)ip_hd, sizeof(*ip_hd));
-                    ip_hd->ip_sum = cpu_to_be16(csum);
-                }
+                net_checksum_calculate(s->frame, frame_size, CSUM_IP);
             }
             /* Last buffer in frame.  */
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013..77e9ded 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1482,7 +1482,7 @@ static void work_around_broken_dhclient(struct virtio_net_hdr *hdr,
         (buf[12] == 0x08 && buf[13] == 0x00) && /* ethertype == IPv4 */
         (buf[23] == 17) && /* ip.protocol == UDP */
         (buf[34] == 0 && buf[35] == 67)) { /* udp.srcport == bootps */
-        net_checksum_calculate(buf, size);
+        net_checksum_calculate(buf, size, CSUM_UDP);
         hdr->flags &= ~VIRTIO_NET_HDR_F_NEEDS_CSUM;
     }
 }
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 00a7fdf..5c815b4 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -174,7 +174,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
                     tmpbuf = g_malloc(XC_PAGE_SIZE);
                 }
                 memcpy(tmpbuf, page + txreq.offset, txreq.size);
-                net_checksum_calculate(tmpbuf, txreq.size);
+                net_checksum_calculate(tmpbuf, txreq.size, CSUM_ALL);
                 qemu_send_packet(qemu_get_queue(netdev->nic), tmpbuf,
                                  txreq.size);
             } else {
diff --git a/include/net/checksum.h b/include/net/checksum.h
index 05a0d27..7dec37e 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -21,11 +21,16 @@
 #include "qemu/bswap.h"
 struct iovec;
 
+#define CSUM_IP     0x01
+#define CSUM_TCP    0x02
+#define CSUM_UDP    0x04
+#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)
+
 uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
 uint16_t net_checksum_finish(uint32_t sum);
 uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
                              uint8_t *addrs, uint8_t *buf);
-void net_checksum_calculate(uint8_t *data, int length);
+void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
 
 static inline uint32_t
 net_checksum_add(int len, uint8_t *buf)
diff --git a/net/checksum.c b/net/checksum.c
index dabd290..70f4eae 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
     return net_checksum_finish(sum);
 }
 
-void net_checksum_calculate(uint8_t *data, int length)
+void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
 {
     int mac_hdr_len, ip_len;
     struct ip_header *ip;
@@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
 
     /* Calculate IP checksum */
-    stw_he_p(&ip->ip_sum, 0);
-    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
-    stw_be_p(&ip->ip_sum, csum);
+    if (csum_flag & CSUM_IP) {
+        stw_he_p(&ip->ip_sum, 0);
+        csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
+        stw_be_p(&ip->ip_sum, csum);
+    }
 
     if (IP4_IS_FRAGMENT(ip)) {
         return; /* a fragmented IP packet */
@@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int length)
     switch (ip->ip_p) {
     case IP_PROTO_TCP:
     {
+        if (!(csum_flag & CSUM_TCP)) {
+            return;
+        }
+
         tcp_header *tcp = (tcp_header *)(ip + 1);
 
         if (ip_len < sizeof(tcp_header)) {
@@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
     case IP_PROTO_UDP:
     {
+        if (!(csum_flag & CSUM_UDP)) {
+            return;
+        }
+
         udp_header *udp = (udp_header *)(ip + 1);
 
         if (ip_len < sizeof(udp_header)) {
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index e063a81..80caac5 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -114,7 +114,7 @@ static int handle_primary_tcp_pkt(RewriterState *rf,
             tcp_pkt->th_ack = htonl(ntohl(tcp_pkt->th_ack) + conn->offset);
 
             net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
-                                   pkt->size - pkt->vnet_hdr_len);
+                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
         }
 
         /*
@@ -216,7 +216,7 @@ static int handle_secondary_tcp_pkt(RewriterState *rf,
             tcp_pkt->th_seq = htonl(ntohl(tcp_pkt->th_seq) - conn->offset);
 
             net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
-                                   pkt->size - pkt->vnet_hdr_len);
+                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
         }
     }
 
-- 
2.7.4


