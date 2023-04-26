Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B06EF24D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYj-00071j-Ut; Wed, 26 Apr 2023 06:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYg-0006tR-F6
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYe-0003Lp-GB
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:34 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-517bdd9957dso5032334a12.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505571; x=1685097571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1h2gNCPzKCVe4nkC9x4aEZNkMw7e5kJQrpSFW0kAms=;
 b=F43CKyYEZ8xqL3Phz+qEc7J17mjQv0+b7+AFF1htJdGZ7QOrf288YHo5NxEM0rvFA0
 U9rKy0tBX9AH3POf41qsKm2drYeLUSRiffvyNg0KViIJ//l7zU2H2mEEvBFBPl/mqf7s
 4+r6a7LG/0e0uteoQY/ynaVviB7/n5+b3vsEzRaEHrzcbGxcPCNDwNaf0OncI0GZq3zW
 +7ag/46BrQ0IsiLjhZfsCPRcxz7kt050HuW3GvCtojoMFOsgmf3T6NKzUdMZf4UrjPje
 DAT+MSUWU0PWWyI8zEL/ZWa0FD5iLSoujmXaJRN8xb87HBCO+3SdkiM7JQVukoKBpuzb
 0Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505571; x=1685097571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1h2gNCPzKCVe4nkC9x4aEZNkMw7e5kJQrpSFW0kAms=;
 b=P6rk87B66sKZCFDmXS7jrUERsuiH3mt49EAJI5lxf/90C63rfO/q5wsmliahrU2oaV
 kSVtwPp76eS0wX1U84xDzbaN12LJugTS+UPeyZr6VVb6m+QNHLXptkCSgVFCdTe++m2/
 +EiFXkMTjMXsMmohebfUhs+PPqNQqR9mXGhyGMr1fqVlKEtgP7icYL+YNmTHO17Hdxkv
 bCfrzRehxwLhj+S4WC/W4lBuh6x+bwZDhhK9sYXKD7elWBvYOXGiTn6lraux7KZh7V2F
 vAyu0hNmilmbnUNdD9zckjMRTgU7g592cUlKkhDj9iHG7yzRaPnXlDdblczqlNJI5Ptf
 wY1A==
X-Gm-Message-State: AAQBX9dKVTqxw2cmh5XwaazOaOjBKU1MEyN+XITtqMMOcfl6nyhm697g
 mGkY/5eTfMkNJ1M7cTdHm+HNOA==
X-Google-Smtp-Source: AKy350bOOMWM15NThxM+zxuxlyYYvNSnT1uazupEyXWjMLUn/NHOZkmD6nPv9f46AiD9x0vfYa7MMQ==
X-Received: by 2002:a17:90b:81:b0:247:3895:e416 with SMTP id
 bb1-20020a17090b008100b002473895e416mr19916238pjb.16.1682505570977; 
 Wed, 26 Apr 2023 03:39:30 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 36/48] igb: Implement Rx SCTP CSO
Date: Wed, 26 Apr 2023 19:37:04 +0900
Message-Id: <20230426103716.26279-37-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_regs.h     |  1 +
 include/net/eth.h     |  4 ++-
 include/qemu/crc32c.h |  1 +
 hw/net/e1000e_core.c  |  5 ++++
 hw/net/igb_core.c     | 15 +++++++++-
 hw/net/net_rx_pkt.c   | 64 +++++++++++++++++++++++++++++++++++--------
 net/eth.c             |  4 +++
 util/crc32c.c         |  8 ++++++
 8 files changed, 89 insertions(+), 13 deletions(-)

diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index e6ac26dc0e..4b4ebd3369 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -670,6 +670,7 @@ union e1000_adv_rx_desc {
 #define E1000_ADVRXD_PKT_IP6 BIT(6)
 #define E1000_ADVRXD_PKT_TCP BIT(8)
 #define E1000_ADVRXD_PKT_UDP BIT(9)
+#define E1000_ADVRXD_PKT_SCTP BIT(10)
 
 static inline uint8_t igb_ivar_entry_rx(uint8_t i)
 {
diff --git a/include/net/eth.h b/include/net/eth.h
index 048e434685..75e7f1551c 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -224,6 +224,7 @@ struct tcp_hdr {
 #define IP_HEADER_VERSION_6       (6)
 #define IP_PROTO_TCP              (6)
 #define IP_PROTO_UDP              (17)
+#define IP_PROTO_SCTP             (132)
 #define IPTOS_ECN_MASK            0x03
 #define IPTOS_ECN(x)              ((x) & IPTOS_ECN_MASK)
 #define IPTOS_ECN_CE              0x03
@@ -379,7 +380,8 @@ typedef struct eth_ip4_hdr_info_st {
 typedef enum EthL4HdrProto {
     ETH_L4_HDR_PROTO_INVALID,
     ETH_L4_HDR_PROTO_TCP,
-    ETH_L4_HDR_PROTO_UDP
+    ETH_L4_HDR_PROTO_UDP,
+    ETH_L4_HDR_PROTO_SCTP
 } EthL4HdrProto;
 
 typedef struct eth_l4_hdr_info_st {
diff --git a/include/qemu/crc32c.h b/include/qemu/crc32c.h
index 5b78884c38..88b4d2b3b3 100644
--- a/include/qemu/crc32c.h
+++ b/include/qemu/crc32c.h
@@ -30,5 +30,6 @@
 
 
 uint32_t crc32c(uint32_t crc, const uint8_t *data, unsigned int length);
+uint32_t iov_crc32c(uint32_t crc, const struct iovec *iov, size_t iov_cnt);
 
 #endif
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index aea70b74d9..0b939ff5a3 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1114,6 +1114,11 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
         return;
     }
 
+    if (l4hdr_proto != ETH_L4_HDR_PROTO_TCP &&
+        l4hdr_proto != ETH_L4_HDR_PROTO_UDP) {
+        return;
+    }
+
     if (!net_rx_pkt_validate_l4_csum(pkt, &csum_valid)) {
         trace_e1000e_rx_metadata_l4_csum_validation_failed();
         return;
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 41a2e5bf7b..95d46d6e6d 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1220,7 +1220,7 @@ igb_build_rx_metadata(IGBCore *core,
                       uint16_t *vlan_tag)
 {
     struct virtio_net_hdr *vhdr;
-    bool hasip4, hasip6;
+    bool hasip4, hasip6, csum_valid;
     EthL4HdrProto l4hdr_proto;
 
     *status_flags = E1000_RXD_STAT_DD;
@@ -1280,6 +1280,10 @@ igb_build_rx_metadata(IGBCore *core,
             *pkt_info |= E1000_ADVRXD_PKT_UDP;
             break;
 
+        case ETH_L4_HDR_PROTO_SCTP:
+            *pkt_info |= E1000_ADVRXD_PKT_SCTP;
+            break;
+
         default:
             break;
         }
@@ -1312,6 +1316,15 @@ igb_build_rx_metadata(IGBCore *core,
 
     if (igb_rx_l4_cso_enabled(core)) {
         switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_SCTP:
+            if (!net_rx_pkt_validate_l4_csum(pkt, &csum_valid)) {
+                trace_e1000e_rx_metadata_l4_csum_validation_failed();
+                goto func_exit;
+            }
+            if (!csum_valid) {
+                *status_flags |= E1000_RXDEXT_STATERR_TCPE;
+            }
+            /* fall through */
         case ETH_L4_HDR_PROTO_TCP:
             *status_flags |= E1000_RXD_STAT_TCPCS;
             break;
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 1de42b4f51..3575c8b9f9 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -16,6 +16,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/crc32c.h"
 #include "trace.h"
 #include "net_rx_pkt.h"
 #include "net/checksum.h"
@@ -554,32 +555,73 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
     return csum;
 }
 
-bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
+static bool
+_net_rx_pkt_validate_sctp_sum(struct NetRxPkt *pkt)
 {
-    uint16_t csum;
+    size_t csum_off;
+    size_t off = pkt->l4hdr_off;
+    size_t vec_len = pkt->vec_len;
+    struct iovec *vec;
+    uint32_t calculated = 0;
+    uint32_t original;
+    bool valid;
 
-    trace_net_rx_pkt_l4_csum_validate_entry();
+    for (vec = pkt->vec; vec->iov_len < off; vec++) {
+        off -= vec->iov_len;
+        vec_len--;
+    }
 
-    if (pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_TCP &&
-        pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_UDP) {
-        trace_net_rx_pkt_l4_csum_validate_not_xxp();
+    csum_off = off + 8;
+
+    if (!iov_to_buf(vec, vec_len, csum_off, &original, sizeof(original))) {
         return false;
     }
 
-    if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP &&
-        pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
-        trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
+    if (!iov_from_buf(vec, vec_len, csum_off,
+                      &calculated, sizeof(calculated))) {
         return false;
     }
 
+    calculated = crc32c(0xffffffff,
+                        (uint8_t *)vec->iov_base + off, vec->iov_len - off);
+    calculated = iov_crc32c(calculated ^ 0xffffffff, vec + 1, vec_len - 1);
+    valid = calculated == le32_to_cpu(original);
+    iov_from_buf(vec, vec_len, csum_off, &original, sizeof(original));
+
+    return valid;
+}
+
+bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
+{
+    uint32_t csum;
+
+    trace_net_rx_pkt_l4_csum_validate_entry();
+
     if (pkt->hasip4 && pkt->ip4hdr_info.fragment) {
         trace_net_rx_pkt_l4_csum_validate_ip4_fragment();
         return false;
     }
 
-    csum = _net_rx_pkt_calc_l4_csum(pkt);
+    switch (pkt->l4hdr_info.proto) {
+    case ETH_L4_HDR_PROTO_UDP:
+        if (pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
+            trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
+            return false;
+        }
+        /* fall through */
+    case ETH_L4_HDR_PROTO_TCP:
+        csum = _net_rx_pkt_calc_l4_csum(pkt);
+        *csum_valid = ((csum == 0) || (csum == 0xFFFF));
+        break;
+
+    case ETH_L4_HDR_PROTO_SCTP:
+        *csum_valid = _net_rx_pkt_validate_sctp_sum(pkt);
+        break;
 
-    *csum_valid = ((csum == 0) || (csum == 0xFFFF));
+    default:
+        trace_net_rx_pkt_l4_csum_validate_not_xxp();
+        return false;
+    }
 
     trace_net_rx_pkt_l4_csum_validate_csum(*csum_valid);
 
diff --git a/net/eth.c b/net/eth.c
index 5307978486..7f02aea010 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -211,6 +211,10 @@ void eth_get_protocols(const struct iovec *iov, size_t iovcnt, size_t iovoff,
             *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
         }
         break;
+
+    case IP_PROTO_SCTP:
+        l4hdr_info->proto = ETH_L4_HDR_PROTO_SCTP;
+        break;
     }
 }
 
diff --git a/util/crc32c.c b/util/crc32c.c
index 762657d853..ea7f345de8 100644
--- a/util/crc32c.c
+++ b/util/crc32c.c
@@ -113,3 +113,11 @@ uint32_t crc32c(uint32_t crc, const uint8_t *data, unsigned int length)
     return crc^0xffffffff;
 }
 
+uint32_t iov_crc32c(uint32_t crc, const struct iovec *iov, size_t iov_cnt)
+{
+    while (iov_cnt--) {
+        crc = crc32c(crc, iov->iov_base, iov->iov_len) ^ 0xffffffff;
+        iov++;
+    }
+    return crc ^ 0xffffffff;
+}
-- 
2.40.0


