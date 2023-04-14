Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED36E229F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:50:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmX-0003qC-LC; Fri, 14 Apr 2023 07:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmP-0003UH-NQ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:50 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmM-0001W3-Of
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so22897041pll.7
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472384; x=1684064384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hmZvns6ZgFmFErqkrVHsTVvD6smwQ4uBNyqqlfACCM=;
 b=j7wC+9elD3sg2n3hfo295AfNSBCavj/F9KEoG0WUz6HH6H+SxB6pr1NJ36pEvOLQFs
 l8thSC1PJEhUUxgOENH0m6IAVB4tcSS8P6NB0japur38hzeVR2iZK+tb3fcLC6SRD8+0
 JTbxRSpAGF3DzjGhXguNcAqMU/escZD4mEXRNcUlmJIzGeUEyLJZWwo7MxLrnBn4KK65
 +6aTI4zXw+JJmwvTyOQUIC40/AH4flo1iPcY6e+4h07z1JTT5UK9Uy/fiMgN+XJsKQYo
 9S4qb/8I68mfiTzi0dJB5OOJ7ZZeFNa7jMruy76WQltiI9O68cLKVMR33tjbfO4paOwg
 O1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472384; x=1684064384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hmZvns6ZgFmFErqkrVHsTVvD6smwQ4uBNyqqlfACCM=;
 b=dkblwC0YDwvsB07bAPGh/GpkPXIgnNkun1IkHXxzkzIw6xUnZ3jbp0xmm31Qx5+JMN
 w4faXu0S3osWNBpjQkinnykYqOl8WhF1e59KsZ5a8YE8JxBi7e7Pl+xOtUJFBI0TNI2n
 DbOF0YTLwRhON1+GwDJtf2EmxDcPdhShSm5M5olpECcdFHZVgDCkZ0z4NFgBdn5KmvCc
 +L96BQIa4TKhIE7FqXJ2lxbPqJLDKsez0Zg7vmIbtpe3wuMFcr+4N17FamYenmAqharr
 9Xj3cM2eC9JXW9iTkGg8ZwspG8M+sWEo7KIk+bm9/WoS4jkjVQyo3hLZ09wukC8NtKdn
 I9bw==
X-Gm-Message-State: AAQBX9dQKQr+CehG9FF+8R7ofzT573ZVJh6/edfhdOLHK6pTt1124BsU
 LmlEMnXb1G5r+8az2VOctogi/g==
X-Google-Smtp-Source: AKy350Zf28mlj5sK07YZ7x1Za+wE7d+utJuQUcJ0pJ62Viyb5E9qGV9977Qojt+MatrA43ZKJl3JDQ==
X-Received: by 2002:a17:90a:5d11:b0:233:e1e6:33d4 with SMTP id
 s17-20020a17090a5d1100b00233e1e633d4mr5349783pji.47.1681472384475; 
 Fri, 14 Apr 2023 04:39:44 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:44 -0700 (PDT)
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
Subject: [PATCH 26/40] net/eth: Always add VLAN tag
Date: Fri, 14 Apr 2023 20:37:23 +0900
Message-Id: <20230414113737.62803-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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
 hw/net/net_tx_pkt.c | 16 +++++++---------
 include/net/eth.h   |  4 ++--
 net/eth.c           | 22 ++++++----------------
 3 files changed, 15 insertions(+), 27 deletions(-)

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
diff --git a/include/net/eth.h b/include/net/eth.h
index 2f87a72170..2bbd04ec3b 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -351,8 +351,8 @@ eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
 uint16_t
 eth_get_l3_proto(const struct iovec *l2hdr_iov, int iovcnt, size_t l2hdr_len);
 
-void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
-    uint16_t vlan_ethtype, bool *is_new);
+void eth_setup_vlan_headers(struct eth_header *ehdr, size_t *ehdr_size,
+                            uint16_t vlan_tag, uint16_t vlan_ethtype);
 
 
 uint8_t eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto);
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


