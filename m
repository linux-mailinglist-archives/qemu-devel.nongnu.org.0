Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B36E89C3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:51:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAt-0001oN-A7; Thu, 20 Apr 2023 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAd-0001M7-Ad
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:34 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAP-0001PS-Hd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a645fd0c6dso6301395ad.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969751; x=1684561751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfMEYJ9MsNl1NEs1qpCe7w36MfTu1Ir4rIbITGTkOa8=;
 b=KwXMAiMlK4CkhNMYFYwTKTQnfYAZUpAKjucIrnh7Gbrsj4uAAvbvrDvMLYSYO/nlYe
 zgG5yZlTTdTpZ9ToAgc/VOJVeBPNNsUQWE38M3ABvmkocXThBCgxmQqmTtedRCvsZFwq
 9iAg0k+Ow4A0Oqovm7AWiJz7aX39iINF8TwjrZ2YWMKfWrdEZVnAg7h9pM5snqPWObbu
 Aep1Wy7yAy0DRdhOW6RUpHCeZ6mm2Aw+V78IjKRZrY8l16TRYQmVuSE2+3A9Ex6qYGow
 HCvamLrhieg0pgWNzCY5Wra47p8B+53XLsAz/YlO0GvZx6+YmNiQ3k3fq9yxmw8WttlW
 dR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969751; x=1684561751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfMEYJ9MsNl1NEs1qpCe7w36MfTu1Ir4rIbITGTkOa8=;
 b=IMuVdYfXnZi6+lJWCEe3qIo3NGnbp1FaeZlA+ACNu5SoQfrpDdbACG5PpaPWUjzVDq
 BfUrfLiGXfC1sLuuSvrVViT8xcvV92D+MC57ENYMWJTcodJ7PaPNfbsVIh1/XDnO4zzG
 P3jx7GtDqkQbQ6fL3OkFbbdtgOeMz9wfPyNgVJoPg12ku52XN1XnqU1LfYWIYalG4wYg
 tG3U/7Km+REOmU3ZMno6X5LhHF3vVOkOS3oTj98VhTJFKQOECVIly4ArgQPDJVH2VJQY
 MOrcciFtLTW49hKcvqqklCUAlow7+uDueEjQAL0cxxkxy7VpQmg2gjT8fY0GIBvu1uy2
 F15A==
X-Gm-Message-State: AAQBX9cTQSX2/fNHsBJI3t+vvfbBgy1EQTEM0jVM6EaPe9NlBdIR+XH1
 TS2B1CSuEfs9UNlMRHF4Ios8Zg==
X-Google-Smtp-Source: AKy350Yjav/oDDQJV5vocZnYpu7EtU8q5/rlTM8aDKEwSvieK9Jz58AoHvJMo+0Jb2kyss1t4SIx4w==
X-Received: by 2002:a17:903:22d0:b0:1a8:1867:1f71 with SMTP id
 y16-20020a17090322d000b001a818671f71mr454039plg.41.1681969751258; 
 Wed, 19 Apr 2023 22:49:11 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:10 -0700 (PDT)
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
Subject: [PATCH v2 27/41] net/eth: Always add VLAN tag
Date: Thu, 20 Apr 2023 14:46:43 +0900
Message-Id: <20230420054657.50367-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is possible to have another VLAN tag even if the packet is already
tagged.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/eth.h   |  4 ++--
 hw/net/net_tx_pkt.c | 16 +++++++---------
 net/eth.c           | 22 ++++++----------------
 3 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/net/eth.h b/include/net/eth.h
index 95ff24d6b8..048e434685 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -353,8 +353,8 @@ eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
 uint16_t
 eth_get_l3_proto(const struct iovec *l2hdr_iov, int iovcnt, size_t l2hdr_len);
 
-void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
-    uint16_t vlan_ethtype, bool *is_new);
+void eth_setup_vlan_headers(struct eth_header *ehdr, size_t *ehdr_size,
+                            uint16_t vlan_tag, uint16_t vlan_ethtype);
 
 
 uint8_t eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto);
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index ce6b102391..af8f77a3f0 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -40,7 +40,10 @@ struct NetTxPkt {
 
     struct iovec *vec;
 
-    uint8_t l2_hdr[ETH_MAX_L2_HDR_LEN];
+    struct {
+        struct eth_header eth;
+        struct vlan_header vlan[3];
+    } l2_hdr;
     union {
         struct ip_header ip;
         struct ip6_header ip6;
@@ -365,18 +368,13 @@ bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
 void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
     uint16_t vlan, uint16_t vlan_ethtype)
 {
-    bool is_new;
     assert(pkt);
 
     eth_setup_vlan_headers(pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base,
-        vlan, vlan_ethtype, &is_new);
+                           &pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len,
+                           vlan, vlan_ethtype);
 
-    /* update l2hdrlen */
-    if (is_new) {
-        pkt->hdr_len += sizeof(struct vlan_header);
-        pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len +=
-            sizeof(struct vlan_header);
-    }
+    pkt->hdr_len += sizeof(struct vlan_header);
 }
 
 bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, size_t len)
diff --git a/net/eth.c b/net/eth.c
index f7ffbda600..5307978486 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -21,26 +21,16 @@
 #include "net/checksum.h"
 #include "net/tap.h"
 
-void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
-    uint16_t vlan_ethtype, bool *is_new)
+void eth_setup_vlan_headers(struct eth_header *ehdr, size_t *ehdr_size,
+                            uint16_t vlan_tag, uint16_t vlan_ethtype)
 {
     struct vlan_header *vhdr = PKT_GET_VLAN_HDR(ehdr);
 
-    switch (be16_to_cpu(ehdr->h_proto)) {
-    case ETH_P_VLAN:
-    case ETH_P_DVLAN:
-        /* vlan hdr exists */
-        *is_new = false;
-        break;
-
-    default:
-        /* No VLAN header, put a new one */
-        vhdr->h_proto = ehdr->h_proto;
-        ehdr->h_proto = cpu_to_be16(vlan_ethtype);
-        *is_new = true;
-        break;
-    }
+    memmove(vhdr + 1, vhdr, *ehdr_size - ETH_HLEN);
     vhdr->h_tci = cpu_to_be16(vlan_tag);
+    vhdr->h_proto = ehdr->h_proto;
+    ehdr->h_proto = cpu_to_be16(vlan_ethtype);
+    *ehdr_size += sizeof(*vhdr);
 }
 
 uint8_t
-- 
2.40.0


