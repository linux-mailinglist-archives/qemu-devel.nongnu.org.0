Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA246D7F4A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk434-0006iZ-LV; Wed, 05 Apr 2023 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk42y-0006i5-I4
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk42w-0007ty-MD
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230405142332euoutp01c9c139a4af01fba6cc1be3cdc5e0fafc~TD-DMTazk2696726967euoutp01e
 for <qemu-devel@nongnu.org>; Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230405142332euoutp01c9c139a4af01fba6cc1be3cdc5e0fafc~TD-DMTazk2696726967euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680704612;
 bh=f+vuwCd/DQ84p7Is64DxdsTVm+EfhS4OhGVkqV1oYHA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XuzyN7MlYEOlkcmZ9yTKNtRfUGKvbUUgFc68nz/qwbuFJdOGbJrLufTnoZ9hhI5cy
 IcPaP+0O6RjLWTmM97G79MEqXnF6NGw8/mnGA1Mr3xKdhZhrayckcJowsNCSuX+avr
 XUvQvzqUiUsVBYstm1uz9DaCV9IJXCFADL/t6NrA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230405142332eucas1p12ba3cf66ec644c32c92db82b831db2e8~TD-C6uE5j2168921689eucas1p1J;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A1.6D.10014.4648D246; Wed,  5
 Apr 2023 15:23:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061~TD-CpOhva2169621696eucas1p1i;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230405142332eusmtrp2be21eb7bcedd5f222b6dafd3ffa4a85b~TD-CoslGA2348123481eusmtrp23;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
X-AuditID: cbfec7f5-b8bff7000000271e-71-642d84645f61
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7A.87.09583.4648D246; Wed,  5
 Apr 2023 15:23:32 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230405142331eusmtip25c4170fb623c486fd5b1f0ac8b1a3ec9~TD-B_2z750708907089eusmtip2l;
 Wed,  5 Apr 2023 14:23:31 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com, jasowang@redhat.com, k.kwiecien@samsung.com
Subject: [PATCH 1/2] net: TX SCTP checksum offload
Date: Wed,  5 Apr 2023 16:23:24 +0200
Message-Id: <20230405142325.1339-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsWy7djPc7opLbopBlsaZS0+n1rLbrHs0mcm
 i8b5c1gtjvfuYHFg8Tjx9iCrx5Nrm5k83u+7yubRt2UVYwBLFJdNSmpOZllqkb5dAlfG+hlT
 2ApaNSsW7znA2sC4WK6LkZNDQsBEYvqN76xdjFwcQgIrGCXWTz4D5XxhlLj6+gAjhPOZUeLS
 /e2MMC0LZqyCSixnlDj5uAOqpZ1Jou/1TVaQKjYBM4lHX+aB2SICkhK/u04zg9jMAp4SS9uf
 gcWFBYwkOn4+BouzCKhKNK9bALaBV8BJ4unfT8wQ2+QlZl76zg4RF5Q4OfMJC8QceYnmrbOZ
 QRZLCDRySPQsbGeCaHCReDjvLhuELSzx6vgWdghbRuL/zvlQNeUSP89uY4dobmGU2DN1MlSR
 tcSlrT+BruMA2qApsX6XPkTYUWLtvIlgYQkBPokbbwUhbuCTmLRtOjNEmFeio00IolpH4tum
 mWwQYSmJhTfqIMIeEg/mnQX7XEggVuL0gU1MExgVZiF5bBaSx2YhnLCAkXkVo3hqaXFuemqx
 cV5quV5xYm5xaV66XnJ+7iZGYBI5/e/41x2MK1591DvEyMTBeIhRgoNZSYRXtUsrRYg3JbGy
 KrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU1ILUIpgsEwenVAPTtMXGN5VDl283FypR
 KvDQXs15vW9xxelHffNPu796yHR+1cdFJxyfV3Ol5c6LP7ST/+CyCUf/7lZOsmA3OWrgyVTi
 Hq45y22ZzcFbb2P2tPLPTP2u52MsIjX9SyHrkzlhSQUv64MM0sOL7jdMmubPG8J9N75ezsHq
 9uwMo7mq2jwr3qztXf7GRewAt7L5sZdBfvafzDVdlnFtDy9e38avu+XLFT/2GwWXEpeUbQs9
 czh16adLzitOVX4RiTtcPif0muTtB6VtVUkXGRTKkyUmST66Nb249+TiZ8Fpy2ouO/8+2pi3
 I333xZC9TWvvtlnxfpLNvTHrE8M5l6AvOldmtSyo0Xutb9PQKiPY17BbiaU4I9FQi7moOBEA
 oFrj5ZEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsVy+t/xe7opLbopBgu/cFt8PrWW3WLZpc9M
 Fo3z57BaHO/dweLA4nHi7UFWjyfXNjN5vN93lc2jb8sqxgCWKD2bovzSklSFjPziElulaEML
 Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M9TOmsBW0alYs3nOAtYFxsVwXIyeH
 hICJxIIZqxi7GLk4hASWMkrsWLySHSIhJbGv5z+ULSzx51oXG0RRK5PEzf7vbCAJNgEziUdf
 5rGC2CICkhK/u04zg9jMAr4Sc4/8YwSxhQWMJDp+PgaLswioSjSvWwAW5xVwknj69xMzxAJ5
 iZmXvrNDxAUlTs58wgIxR16ieets5gmMfLOQpGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeu
 l5yfu4kRGL7bjv3csoNx5auPeocYmTgYDzFKcDArifCqdmmlCPGmJFZWpRblxxeV5qQWH2I0
 BbpvIrOUaHI+MILySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqY
 JF92dCik513zuLRywsy3k2SP7TkdsbrdsuD06qUXt3fHaznvlHdkyDe3rG8O/+JlmOjEpTn3
 3ZNJPTGTLonZ7dvBZueyx+dA85e/iXPYn1/dVcStbaw2e8rvH4lbwtT0Ym35Svau6JB3WHVz
 ye/0z4ILr6+8zMhWWmjB+M7+1uuJy3fqqs7aZd7bN8tIvygldGIb56L3v4NTlgQ9viE5d27k
 9rNf50bHC3QYep7QfbjbeP3PKXskD6b903+1cn3Xqp4Hhz+/fnElN4HPXKC33v9Bvsu5XoFl
 yTyfZzxI+m4gb/Xf4ur8i0ea3giY/9WfXK/z5Dy71qdPlQtuP2U+Ir27THT7kqeGyaHpbTL7
 xZRYijMSDbWYi4oTATr0EFroAgAA
X-CMS-MailID: 20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061
References: <CGME20230405142332eucas1p14546386ac74f8e7c6996bd80aa418061@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Modern NICs are able to offload SCTP checksumming. SCTP calculates
checksums differently than TCP / UDP: no pseudo-header and CRC32C
algorithm are used.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/net_tx_pkt.c    | 22 ++++++++++++++++++++++
 hw/net/net_tx_pkt.h    |  8 ++++++++
 include/net/checksum.h | 12 ++++++++++++
 include/net/eth.h      |  8 ++++++++
 net/checksum.c         | 24 ++++++++++++++++++++++++
 5 files changed, 74 insertions(+)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 986a3adfe9..1b97249000 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -510,6 +510,27 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
     iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
 }
 
+void net_tx_pkt_update_sctp_crc(struct NetTxPkt *pkt)
+{
+    struct iovec *iov = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
+    uint32_t csum_cntr = 0;
+    /* num of iovec without vhdr */
+    uint32_t iov_len = pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1;
+    size_t csum_offset = pkt->hdr_len + offsetof(struct sctp_hdr, sh_sum);
+
+    if (pkt->l4proto != IP_PROTO_SCTP) {
+        return;
+    }
+
+    /* Put zero to checksum field */
+    iov_from_buf(iov, iov_len, csum_offset, &csum_cntr, sizeof csum_cntr);
+
+    csum_cntr = net_sctp_checksum_add_iov(iov, iov_len,
+                                          pkt->hdr_len,
+                                          pkt->payload_len);
+    iov_from_buf(iov, iov_len, csum_offset, &csum_cntr, sizeof csum_cntr);
+}
+
 #define NET_MAX_FRAG_SG_LIST (64)
 
 static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
@@ -846,3 +867,4 @@ void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
         }
     }
 }
+
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index f57b4e034b..56475b462c 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -204,4 +204,12 @@ bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt);
  */
 void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt);
 
+/**
+* Update SCTP CRC32C value.
+*
+* @pkt:            packet
+*
+*/
+void net_tx_pkt_update_sctp_crc(struct NetTxPkt *pkt);
+
 #endif
diff --git a/include/net/checksum.h b/include/net/checksum.h
index 7dec37e56c..987d66546d 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -64,6 +64,18 @@ uint32_t net_checksum_add_iov(const struct iovec *iov,
                               uint32_t iov_off, uint32_t size,
                               uint32_t csum_offset);
 
+/**
+ * net_sctp_checksum_add_iov: scatter-gather vector checksumming for SCTP
+ *
+ * @iov: input scatter-gather array
+ * @iov_cnt: number of array elements
+ * @iov_off: starting iov offset for checksumming
+ * @size: length of data to be checksummed
+ */
+uint32_t net_sctp_checksum_add_iov(const struct iovec *iov,
+                                   const unsigned int iov_cnt,
+                                   uint32_t iov_off, uint32_t size);
+
 typedef struct toeplitz_key_st {
     uint32_t leftmost_32_bits;
     uint8_t *next_byte;
diff --git a/include/net/eth.h b/include/net/eth.h
index c5ae4493b4..a946de1250 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -147,6 +147,13 @@ struct ip6_option_hdr {
     uint8_t len;
 };
 
+struct sctp_hdr {
+  uint16_t sh_sport;           /* source port */
+  uint16_t sh_dport;           /* destination port */
+  uint32_t sh_vtag;            /* verification tag */
+  uint32_t sh_sum;             /* sctp checksum */
+};
+
 struct udp_hdr {
   uint16_t uh_sport;           /* source port */
   uint16_t uh_dport;           /* destination port */
@@ -222,6 +229,7 @@ struct tcp_hdr {
 #define IP_HEADER_VERSION_6       (6)
 #define IP_PROTO_TCP              (6)
 #define IP_PROTO_UDP              (17)
+#define IP_PROTO_SCTP             (132)
 #define IPTOS_ECN_MASK            0x03
 #define IPTOS_ECN(x)              ((x) & IPTOS_ECN_MASK)
 #define IPTOS_ECN_CE              0x03
diff --git a/net/checksum.c b/net/checksum.c
index 68245fd748..4869b1ef14 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "net/checksum.h"
 #include "net/eth.h"
+#include "qemu/crc32c.h"
 
 uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq)
 {
@@ -206,3 +207,26 @@ net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
     }
     return res;
 }
+
+uint32_t
+net_sctp_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
+                          uint32_t iov_off, uint32_t size)
+{
+    size_t iovec_off;
+    unsigned int i;
+    uint32_t res = 0xffffffff;
+
+    iovec_off = 0;
+    for (i = 0; i < iov_cnt && size; i++) {
+        if (iov_off < (iovec_off + iov[i].iov_len)) {
+            size_t len = MIN((iovec_off + iov[i].iov_len) - iov_off , size);
+            void *chunk_buf = iov[i].iov_base + (iov_off - iovec_off);
+
+            res = crc32c(res, chunk_buf, len);
+            iov_off += len;
+            size -= len;
+        }
+        iovec_off += iov[i].iov_len;
+    }
+    return res;
+}
-- 
2.25.1


