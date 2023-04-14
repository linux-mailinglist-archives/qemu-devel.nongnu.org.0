Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1876E2263
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:38:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHku-00089w-KU; Fri, 14 Apr 2023 07:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkn-00088R-MA
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkl-0001CD-Mk
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso21361543pjs.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472286; x=1684064286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7X6sr/5Em7HKxWqg0sLHs04a6P2VHelqS35NL+9JQDE=;
 b=XpXxUcLFNv0lzBrzEmkxcCRbOT5FgGsc1YPqGqOCdPhPHMpEf4E0NAar6ioQabS2dB
 ZqmCdysthvRcZi35CxbUu1xcb60ooJdqNjX3jJyAIhmibo0f+0VeGvmJw1xdHHOH4JIs
 FPlKbGYBUAZ9UdtpPa1xIh6au1yuVFLJy1qJJOSxF6wBx6plRmDs5g0SVWo1lhyqYij+
 bjgeYWvja9WpyAZrA2KMKQe5Gqfea056GpL4pvPThDhN8h02i+iWhJhVgUKy5KpkFrDl
 ALB0YJlGCHugtMCYGic3bACJMwNpKquVi4gJZYCgENhCj3EdAsZG9PhsOiW875zOY4X0
 MZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472286; x=1684064286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7X6sr/5Em7HKxWqg0sLHs04a6P2VHelqS35NL+9JQDE=;
 b=e6VUYfE3tabSktDjsy31LkxyPlQqiQePg/EJgT3Fphz708W38nH/Ae0TJ/Facq3X2o
 Hl/X/aRBYo7/7RXUBasz8CkZcotIz+A2u1yAtatgwOnj7d/QCyvJnaZGtfo3hkcMZF80
 dEDlwua4hY/okSo5pApukXic6im2AsQiH+7CBH46Tq9rQLRCbZ+fBfdhqR/GhcOKoJlx
 u7Y/lBCrsOTxqMGhQMEyzw0VJON2U47MkuvniT7qW/OqddV7ONZBgbNQbysRgQF4pUDp
 E2sVAo81WzZyo7O7JQeRixxd2ORXzF2Qiej6nL8HOXMbW4POZPTkfAvwicvxzN3n0tHV
 S6Gw==
X-Gm-Message-State: AAQBX9e4lR1CS8IwTBtYo0XN4qwf1OkffK73niYI+vQJfNelPNU9qXj/
 HYU/CnX4qiKfsLI5ql6rkT1pPg==
X-Google-Smtp-Source: AKy350bO39Knhs84g/ajdT5+Rl7g4t70emEvU9tjtmiBJ/6TLhy+yNeiHpIZSXaoYya3TKMAWRgYbQ==
X-Received: by 2002:a17:902:f690:b0:1a6:6b30:2b3b with SMTP id
 l16-20020a170902f69000b001a66b302b3bmr2631063plg.64.1681472286525; 
 Fri, 14 Apr 2023 04:38:06 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:06 -0700 (PDT)
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
Subject: [PATCH 03/40] igb: Fix Rx packet type encoding
Date: Fri, 14 Apr 2023 20:37:00 +0900
Message-Id: <20230414113737.62803-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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

igb's advanced descriptor uses a packet type encoding different from
one used in e1000e's extended descriptor. Fix the logic to encode
Rx packet type accordingly.

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 464a41d0aa..55de212447 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1227,7 +1227,6 @@ igb_build_rx_metadata(IGBCore *core,
     struct virtio_net_hdr *vhdr;
     bool hasip4, hasip6;
     EthL4HdrProto l4hdr_proto;
-    uint32_t pkt_type;
 
     *status_flags = E1000_RXD_STAT_DD;
 
@@ -1266,28 +1265,29 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_ack();
     }
 
-    if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
-        trace_e1000e_rx_metadata_ipv6_filtering_disabled();
-        pkt_type = E1000_RXD_PKT_MAC;
-    } else if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP ||
-               l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
-    } else if (hasip4 || hasip6) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
-    } else {
-        pkt_type = E1000_RXD_PKT_MAC;
-    }
+    if (pkt_info) {
+        *pkt_info = rss_info->enabled ? rss_info->type : 0;
 
-    trace_e1000e_rx_metadata_pkt_type(pkt_type);
+        if (hasip4) {
+            *pkt_info |= BIT(4);
+        }
 
-    if (pkt_info) {
-        if (rss_info->enabled) {
-            *pkt_info = rss_info->type;
+        if (hasip6) {
+            *pkt_info |= BIT(6);
         }
 
-        *pkt_info |= (pkt_type << 4);
-    } else {
-        *status_flags |= E1000_RXD_PKT_TYPE(pkt_type);
+        switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_TCP:
+            *pkt_info |= BIT(8);
+            break;
+
+        case ETH_L4_HDR_PROTO_UDP:
+            *pkt_info |= BIT(9);
+            break;
+
+        default:
+            break;
+        }
     }
 
     if (hdr_info) {
-- 
2.40.0


