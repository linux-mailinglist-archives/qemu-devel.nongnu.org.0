Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8C6E89D6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9t-0007Kg-FI; Thu, 20 Apr 2023 01:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9o-00079q-Ex
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:37 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9m-0001Hx-MQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:36 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-517c57386f6so391211a12.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969713; x=1684561713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzMYVPOHwBXyLt8U0v8KjlVgvUCA6OmXyQHXHv1DCkc=;
 b=0QvvJVA5sqmAF7xvVz+sG8RODJcHnfrUqB4J7j8+8pv6UjNnd54z9J4vl3ermbla11
 ZRxAUJCAngBPs8K9Ohkt8oD2rYl1/Rmi5noo6gmlUC2vYLxq+uH3JGJqBvSlgy+mESXR
 QdKjuLsYowxCQFjimurCnMELZ/yfdPV9bf79Nd3/rxIobvfCVmGv5yESB7lFZlOu8x1H
 ZENfy/1yRK/HccycsSC9/Xjpj5sE+7UEaxaLxdyW4JAmu/CPWIyswWaNKrNBK61bPgXV
 h6Y3ZBdQaAivnohMLVZxCl3Il6XkKgFimngSeBUXWDpr/LyAljsfNm+8Kd/RjxZ5Nueq
 QU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969713; x=1684561713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzMYVPOHwBXyLt8U0v8KjlVgvUCA6OmXyQHXHv1DCkc=;
 b=XMgb4jIaeIqufTWTKjQWNQYfP/9P9ef6s/gXo+boRrnQr1CT8tnzyr/7uAEB5n+nAB
 CMvyWmQExFwovp4APsqkGYrYuVodiie5h3fCOrnoeuvb+73h28gFHlDpOCXU5xH7W09Q
 qN1xnWcdPR1ltt2bXjNdPFutjwwNdg5F8kgsqUMXkPAzT5Kxw/0JiTQ3bdLsyI3w22vR
 3BO4l70K8zGezNVr/um0Tt4+KN0/TmtDqWQLMs/qgOSqYJUfq2LFU+Xt+QIzz1NmjCTt
 CANtUkSAA6PylKestmT+o0rSwASXNfchmq3pRZn6IjsYdtYyPgQ3CQRWh4iQpLAqA4A2
 lcUQ==
X-Gm-Message-State: AAQBX9fe8pax6pW26WzXn97Vkfx99XkFtahVNO4Cff/tENnNr7rVtk0s
 kk5wvlc5GwM1h/7A3IMLpzLtUA==
X-Google-Smtp-Source: AKy350YE2tLFpar55Ep8gsqg7g+dR+pClrFCWv5LEd6eGYFesDvj/VGbswUkLfBqE6+u00H6lLSB5A==
X-Received: by 2002:a17:90b:143:b0:247:ad6d:7250 with SMTP id
 em3-20020a17090b014300b00247ad6d7250mr841567pjb.12.1681969713555; 
 Wed, 19 Apr 2023 22:48:33 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:33 -0700 (PDT)
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
Subject: [PATCH v2 16/41] e1000x: Rename TcpIpv6 into TcpIpv6Ex
Date: Thu, 20 Apr 2023 14:46:32 +0900
Message-Id: <20230420054657.50367-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
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

e1000e and igb employs NetPktRssIpV6TcpEx for RSS hash if TcpIpv6 MRQC
bit is set. Moreover, igb also has a MRQC bit for NetPktRssIpV6Tcp
though it is not implemented yet. Rename it to TcpIpv6Ex to avoid
confusion.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000x_regs.h | 24 ++++++++++++------------
 hw/net/e1000e_core.c |  8 ++++----
 hw/net/igb_core.c    |  8 ++++----
 hw/net/trace-events  |  2 +-
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index 6d3c4c6d3a..13760c66d3 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -290,18 +290,18 @@
 #define E1000_RETA_IDX(hash)        ((hash) & (BIT(7) - 1))
 #define E1000_RETA_VAL(reta, hash)  (((uint8_t *)(reta))[E1000_RETA_IDX(hash)])
 
-#define E1000_MRQC_EN_TCPIPV4(mrqc) ((mrqc) & BIT(16))
-#define E1000_MRQC_EN_IPV4(mrqc)    ((mrqc) & BIT(17))
-#define E1000_MRQC_EN_TCPIPV6(mrqc) ((mrqc) & BIT(18))
-#define E1000_MRQC_EN_IPV6EX(mrqc)  ((mrqc) & BIT(19))
-#define E1000_MRQC_EN_IPV6(mrqc)    ((mrqc) & BIT(20))
-
-#define E1000_MRQ_RSS_TYPE_NONE     (0)
-#define E1000_MRQ_RSS_TYPE_IPV4TCP  (1)
-#define E1000_MRQ_RSS_TYPE_IPV4     (2)
-#define E1000_MRQ_RSS_TYPE_IPV6TCP  (3)
-#define E1000_MRQ_RSS_TYPE_IPV6EX   (4)
-#define E1000_MRQ_RSS_TYPE_IPV6     (5)
+#define E1000_MRQC_EN_TCPIPV4(mrqc)   ((mrqc) & BIT(16))
+#define E1000_MRQC_EN_IPV4(mrqc)      ((mrqc) & BIT(17))
+#define E1000_MRQC_EN_TCPIPV6EX(mrqc) ((mrqc) & BIT(18))
+#define E1000_MRQC_EN_IPV6EX(mrqc)    ((mrqc) & BIT(19))
+#define E1000_MRQC_EN_IPV6(mrqc)      ((mrqc) & BIT(20))
+
+#define E1000_MRQ_RSS_TYPE_NONE       (0)
+#define E1000_MRQ_RSS_TYPE_IPV4TCP    (1)
+#define E1000_MRQ_RSS_TYPE_IPV4       (2)
+#define E1000_MRQ_RSS_TYPE_IPV6TCPEX  (3)
+#define E1000_MRQ_RSS_TYPE_IPV6EX     (4)
+#define E1000_MRQ_RSS_TYPE_IPV6       (5)
 
 #define E1000_ICR_ASSERTED BIT(31)
 #define E1000_EIAC_MASK    0x01F00000
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 743b36ddfb..481db41931 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -537,7 +537,7 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
                                 ip6info->rss_ex_dst_valid,
                                 ip6info->rss_ex_src_valid,
                                 core->mac[MRQC],
-                                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC]),
+                                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV6EX(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV6(core->mac[MRQC]));
 
@@ -546,8 +546,8 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
                               ip6info->rss_ex_src_valid))) {
 
             if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
-                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
-                return E1000_MRQ_RSS_TYPE_IPV6TCP;
+                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC])) {
+                return E1000_MRQ_RSS_TYPE_IPV6TCPEX;
             }
 
             if (E1000_MRQC_EN_IPV6EX(core->mac[MRQC])) {
@@ -581,7 +581,7 @@ e1000e_rss_calc_hash(E1000ECore *core,
     case E1000_MRQ_RSS_TYPE_IPV4TCP:
         type = NetPktRssIpV4Tcp;
         break;
-    case E1000_MRQ_RSS_TYPE_IPV6TCP:
+    case E1000_MRQ_RSS_TYPE_IPV6TCPEX:
         type = NetPktRssIpV6TcpEx;
         break;
     case E1000_MRQ_RSS_TYPE_IPV6:
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 4b9131e566..0182880adf 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -301,7 +301,7 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
                                 ip6info->rss_ex_dst_valid,
                                 ip6info->rss_ex_src_valid,
                                 core->mac[MRQC],
-                                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC]),
+                                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV6EX(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV6(core->mac[MRQC]));
 
@@ -310,8 +310,8 @@ igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
                               ip6info->rss_ex_src_valid))) {
 
             if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
-                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
-                return E1000_MRQ_RSS_TYPE_IPV6TCP;
+                E1000_MRQC_EN_TCPIPV6EX(core->mac[MRQC])) {
+                return E1000_MRQ_RSS_TYPE_IPV6TCPEX;
             }
 
             if (E1000_MRQC_EN_IPV6EX(core->mac[MRQC])) {
@@ -343,7 +343,7 @@ igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
     case E1000_MRQ_RSS_TYPE_IPV4TCP:
         type = NetPktRssIpV4Tcp;
         break;
-    case E1000_MRQ_RSS_TYPE_IPV6TCP:
+    case E1000_MRQ_RSS_TYPE_IPV6TCPEX:
         type = NetPktRssIpV6TcpEx;
         break;
     case E1000_MRQ_RSS_TYPE_IPV6:
diff --git a/hw/net/trace-events b/hw/net/trace-events
index a34d196ff7..64d776bc2a 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -179,7 +179,7 @@ e1000e_rx_rss_disabled(void) "RSS is disabled"
 e1000e_rx_rss_type(uint32_t type) "RSS type is %u"
 e1000e_rx_rss_ip4(int l4hdr_proto, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: L4 header protocol %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
 e1000e_rx_rss_ip6_rfctl(uint32_t rfctl) "RSS IPv6: rfctl 0x%X"
-e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, int l4hdr_proto, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, L4 header protocol %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
+e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, int l4hdr_proto, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6ex_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, L4 header protocol %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6ex enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
 
 e1000e_rx_metadata_protocols(bool hasip4, bool hasip6, int l4hdr_protocol) "protocols: ip4: %d, ip6: %d, l4hdr: %d"
 e1000e_rx_metadata_vlan(uint16_t vlan_tag) "VLAN tag is 0x%X"
-- 
2.40.0


