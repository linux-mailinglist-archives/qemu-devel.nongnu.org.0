Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66D6E228E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHrG-0008FA-Hl; Fri, 14 Apr 2023 07:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnC-0004pA-JL
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmw-0001sL-F2
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pm7-20020a17090b3c4700b00246f00dace2so10422661pjb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472410; x=1684064410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2cbV1iB8ftJHeUS1deH8mR5wYQQ1hxqCo1oleHvYRs=;
 b=tx4V7Yx5Zd+OMcXi40hx6p6Fm4jbo6mtYkDxuQJYadtOO4UNZJobb46W4QfBSsF1c7
 pi60K4X96DHsxm1Ll3ZFc3+em0VuHe5yCTn4m+ck0gz1QkFYVkvlR4vwbBN12fLa1RuD
 oFde9EVmmrDBFBj37SnO5nL1rFWQXQIi7LI1qjGIml/DETGOYvoxh1V7Am0iGmMa3Kl+
 35R9tBQBHTzHtyROlv8XAmRwxG1eH/aAG6ziTc8k8qIbpZ2AGdtSHNUhhI3LsrmvID7u
 y2eIsVlsedtdF7Sg7spjD4t7ADOWpcsY0GdD1b5+vajUQa+jOHH1//M6LCuOPe/NvUge
 LoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472410; x=1684064410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2cbV1iB8ftJHeUS1deH8mR5wYQQ1hxqCo1oleHvYRs=;
 b=AZ4hljnfklRna98/jk38FiIwcdYApOw5oLGX6uh1Cbb3sLUxuK2TLRt7zRD5K2E/zR
 UXbC1S2Hu+G7bDl767WWdWra3ce1otvQ5xnZNdBDBNC4+hI9ttPQrOA9Wdvid4zuiJDO
 GlnANYY+9L2KCHFotQzXglR0bwXGFrrkQreG8MkwvQg+RNc3aU6SZtoEiG471ZI4TOa5
 X1HW3HKH4K5vt7ZqOzrw3kUcJo/XpJivIdEMnXrSwhaAi/bRkcMywCpuAXSVYyu/KyqH
 wK4HqFrd28GJY2opbQWu+71HSGRwF+iWqCgVtQusRZ9sjSNfUslv2Sm4b1TloN1YnLEz
 tTjQ==
X-Gm-Message-State: AAQBX9djLrYFrITuLoarNvij43RIvWnuDHsonh6P607LG1rMxSu5vNBj
 O3XamHysYBU0DHky2Anhi1fQ8A==
X-Google-Smtp-Source: AKy350YMTCuwHmOcqh8N71a4A2TeZVdPVz3+SA4F6/kv3qZ3BngQ5QixGpME7srUrzDUrDxpK6kM3Q==
X-Received: by 2002:a17:902:efd4:b0:1a2:9e64:bc5e with SMTP id
 ja20-20020a170902efd400b001a29e64bc5emr2275531plb.39.1681472410698; 
 Fri, 14 Apr 2023 04:40:10 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:10 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 34/40] igb: Strip the second VLAN tag for extended VLAN
Date: Fri, 14 Apr 2023 20:37:31 +0900
Message-Id: <20230414113737.62803-35-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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
---
 hw/net/e1000e_core.c |  3 ++-
 hw/net/igb_core.c    | 14 ++++++++++--
 hw/net/net_rx_pkt.c  | 15 +++++--------
 hw/net/net_rx_pkt.h  | 19 ++++++++--------
 include/net/eth.h    |  4 ++--
 net/eth.c            | 52 ++++++++++++++++++++++++++++----------------
 6 files changed, 65 insertions(+), 42 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 9dc8b718c0..56a46b1897 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1711,7 +1711,8 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
     }
 
     net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac), core->mac[VET]);
+                               e1000x_vlan_enabled(core->mac) ? 0 : -1,
+                               core->mac[VET], 0);
 
     e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
     e1000e_rx_ring_init(core, &rxr, rss_info.queue);
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 955db1b1dc..6e8de9d878 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1621,6 +1621,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     E1000E_RxRing rxr;
     E1000E_RSSInfo rss_info;
     size_t total_size;
+    int strip_vlan_index;
     int i;
 
     trace_e1000e_rx_receive_iov(iovcnt);
@@ -1677,9 +1678,18 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
 
+        if (!igb_rx_strip_vlan(core, rxr.i)) {
+            strip_vlan_index = -1;
+        } else if (core->mac[CTRL_EXT] & BIT(26)) {
+            strip_vlan_index = 1;
+        } else {
+            strip_vlan_index = 0;
+        }
+
         net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                                   igb_rx_strip_vlan(core, rxr.i),
-                                   core->mac[VET] & 0xffff);
+                                   strip_vlan_index,
+                                   core->mac[VET] & 0xffff,
+                                   core->mac[VET] >> 16);
 
         total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
             e1000x_fcs_len(core->mac);
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 3575c8b9f9..32e5f3f9cf 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -137,20 +137,17 @@ void net_rx_pkt_attach_iovec(struct NetRxPkt *pkt,
 
 void net_rx_pkt_attach_iovec_ex(struct NetRxPkt *pkt,
                                 const struct iovec *iov, int iovcnt,
-                                size_t iovoff, bool strip_vlan,
-                                uint16_t vet)
+                                size_t iovoff, int strip_vlan_index,
+                                uint16_t vet, uint16_t vet_ext)
 {
     uint16_t tci = 0;
     uint16_t ploff = iovoff;
     assert(pkt);
 
-    if (strip_vlan) {
-        pkt->ehdr_buf_len = eth_strip_vlan_ex(iov, iovcnt, iovoff, vet,
-                                              &pkt->ehdr_buf,
-                                              &ploff, &tci);
-    } else {
-        pkt->ehdr_buf_len = 0;
-    }
+    pkt->ehdr_buf_len = eth_strip_vlan_ex(iov, iovcnt, iovoff,
+                                          strip_vlan_index, vet, vet_ext,
+                                          &pkt->ehdr_buf,
+                                          &ploff, &tci);
 
     pkt->tci = tci;
 
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index ce8dbdb284..55ec67a1a7 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -223,18 +223,19 @@ void net_rx_pkt_attach_iovec(struct NetRxPkt *pkt,
 /**
 * attach scatter-gather data to rx packet
 *
-* @pkt:            packet
-* @iov:            received data scatter-gather list
-* @iovcnt          number of elements in iov
-* @iovoff          data start offset in the iov
-* @strip_vlan:     should the module strip vlan from data
-* @vet:            VLAN tag Ethernet type
+* @pkt:              packet
+* @iov:              received data scatter-gather list
+* @iovcnt:           number of elements in iov
+* @iovoff:           data start offset in the iov
+* @strip_vlan_index: index of Q tag if it is to be stripped. negative otherwise.
+* @vet:              VLAN tag Ethernet type
+* @vet_ext:          outer VLAN tag Ethernet type
 *
 */
 void net_rx_pkt_attach_iovec_ex(struct NetRxPkt *pkt,
-                                   const struct iovec *iov, int iovcnt,
-                                   size_t iovoff, bool strip_vlan,
-                                   uint16_t vet);
+                                const struct iovec *iov, int iovcnt,
+                                size_t iovoff, int strip_vlan_index,
+                                uint16_t vet, uint16_t vet_ext);
 
 /**
  * attach data to rx packet
diff --git a/include/net/eth.h b/include/net/eth.h
index 6d65b7e2cb..7e76a4b139 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -345,8 +345,8 @@ eth_strip_vlan(const struct iovec *iov, int iovcnt, size_t iovoff,
                uint16_t *payload_offset, uint16_t *tci);
 
 size_t
-eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
-                  uint16_t vet, void *new_ehdr_buf,
+eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff, int index,
+                  uint16_t vet, uint16_t vet_ext, void *new_ehdr_buf,
                   uint16_t *payload_offset, uint16_t *tci);
 
 uint16_t
diff --git a/net/eth.c b/net/eth.c
index 7f02aea010..649e66bb1f 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -269,36 +269,50 @@ eth_strip_vlan(const struct iovec *iov, int iovcnt, size_t iovoff,
 }
 
 size_t
-eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
-                  uint16_t vet, void *new_ehdr_buf,
+eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff, int index,
+                  uint16_t vet, uint16_t vet_ext, void *new_ehdr_buf,
                   uint16_t *payload_offset, uint16_t *tci)
 {
     struct vlan_header vlan_hdr;
-    struct eth_header *new_ehdr = (struct eth_header *) new_ehdr_buf;
-
-    size_t copied = iov_to_buf(iov, iovcnt, iovoff,
-                               new_ehdr, sizeof(*new_ehdr));
-
-    if (copied < sizeof(*new_ehdr)) {
-        return 0;
-    }
+    uint16_t *new_ehdr_proto;
+    size_t new_ehdr_size;
+    size_t copied;
 
-    if (be16_to_cpu(new_ehdr->h_proto) == vet) {
-        copied = iov_to_buf(iov, iovcnt, iovoff + sizeof(*new_ehdr),
-                            &vlan_hdr, sizeof(vlan_hdr));
+    switch (index) {
+    case 0:
+        new_ehdr_proto = &PKT_GET_ETH_HDR(new_ehdr_buf)->h_proto;
+        new_ehdr_size = sizeof(struct eth_header);
+        copied = iov_to_buf(iov, iovcnt, iovoff, new_ehdr_buf, new_ehdr_size);
+        break;
 
-        if (copied < sizeof(vlan_hdr)) {
+    case 1:
+        new_ehdr_proto = &PKT_GET_VLAN_HDR(new_ehdr_buf)->h_proto;
+        new_ehdr_size = sizeof(struct eth_header) + sizeof(struct vlan_header);
+        copied = iov_to_buf(iov, iovcnt, iovoff, new_ehdr_buf, new_ehdr_size);
+        if (be16_to_cpu(PKT_GET_ETH_HDR(new_ehdr_buf)->h_proto) != vet_ext) {
             return 0;
         }
+        break;
 
-        new_ehdr->h_proto = vlan_hdr.h_proto;
+    default:
+        return 0;
+    }
 
-        *tci = be16_to_cpu(vlan_hdr.h_tci);
-        *payload_offset = iovoff + sizeof(*new_ehdr) + sizeof(vlan_hdr);
-        return sizeof(struct eth_header);
+    if (copied < new_ehdr_size || be16_to_cpu(*new_ehdr_proto) != vet) {
+        return 0;
+    }
+
+    copied = iov_to_buf(iov, iovcnt, iovoff + new_ehdr_size,
+                        &vlan_hdr, sizeof(vlan_hdr));
+    if (copied < sizeof(vlan_hdr)) {
+        return 0;
     }
 
-    return 0;
+    *new_ehdr_proto = vlan_hdr.h_proto;
+    *payload_offset = iovoff + new_ehdr_size + sizeof(vlan_hdr);
+    *tci = be16_to_cpu(vlan_hdr.h_tci);
+
+    return new_ehdr_size;
 }
 
 void
-- 
2.40.0


