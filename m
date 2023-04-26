Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A76EF244
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYR-0004Ux-Bd; Wed, 26 Apr 2023 06:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYN-0004Jr-Uj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:15 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYM-0003Ji-Bb
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b50a02bffso5718634b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505553; x=1685097553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfMEYJ9MsNl1NEs1qpCe7w36MfTu1Ir4rIbITGTkOa8=;
 b=rb22nDfCSoXMRxnD/vMrnf+RCtoEbC+X430lXkn0SlhaXQDDU+M4IxxjLrY4jxmnyF
 Q7jyHvuPw/Pz21qe2h8Imp5h27QgSOCQIjdHgxnbdQ0aI8ZTjpJb/j1L8P14WCFSQ8cN
 A10ZSngBDy9bGKJW0q4SKinbC7+JT5gTdw6mElBjvqHhwtWiu5zXdRaDsp+g9X+l//L3
 f1lHTXauZ96T6kOQVWG49LbiQ3i3eGoewtRNkM7FhAtIfUE/TufxSzdwOPJyYJ5wnIoP
 +Vlwvrxw/4LIrm+gsDbvjpv8Ji0FELI8HTFwTS6vyfeNA5pJylm8TgEJx5bZ3/mdUsQn
 J5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505553; x=1685097553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfMEYJ9MsNl1NEs1qpCe7w36MfTu1Ir4rIbITGTkOa8=;
 b=esZLAhhJ8etylEwtfkdoLTJ7FFF2tjpwbylaMlzTJbHV7x4Ge5uFho4tsGw/m8HttX
 7ASMcdSbcXLZvR7VBHtSGw0HiTnXe73Xg+wpT2ffbW+2Kqxd7vdnrdSun5M08yP+IvSq
 MNMh/6hLCt8mQ/bXx59Z90nBozTFP9hsAj5vFjMwCqtFmc2R0btynuL4G3nkyhebP/SJ
 yR00aMPQQl+WjvsmHa85uqd2UPJd7e/zUgy55ylvyGdb/679Plf2i4dgoD4o5V+KXonL
 HYGRnEgS1SXyHKFrZxUc+q/V3EkzaEVzoSOZHX2wvH610ybRhmjh5BRKxLU+oGCsm35d
 aOSw==
X-Gm-Message-State: AAQBX9c1gfLKLvuu2dQOLYhAMMfF1DZ9xJVGtmdMiQPcBcz5TMgghvOw
 499e86Cr1V0nDBRFXM3Ec5E18w==
X-Google-Smtp-Source: AKy350b/7PEdjzFvNsud50s6fW+8+9VPRl68t+j0Kf/xYaoanmuybI8sGmFMbfpyxsnlv3qDYF08HA==
X-Received: by 2002:a05:6a20:8e24:b0:f3:3578:6699 with SMTP id
 y36-20020a056a208e2400b000f335786699mr17998327pzj.45.1682505553241; 
 Wed, 26 Apr 2023 03:39:13 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:12 -0700 (PDT)
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
Subject: [PATCH v4 31/48] net/eth: Always add VLAN tag
Date: Wed, 26 Apr 2023 19:36:59 +0900
Message-Id: <20230426103716.26279-32-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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


