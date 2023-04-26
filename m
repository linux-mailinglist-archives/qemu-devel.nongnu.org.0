Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB96EF264
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYv-000825-L8; Wed, 26 Apr 2023 06:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYt-0007pt-Tj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYs-0003Ob-0r
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b4e5fdb1eso8218308b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505585; x=1685097585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oa4nI3WEIewnmzpuEcGtrA2tT88NXiwX772ys8tKjw0=;
 b=3iDTZgnOZy0Eq7zrqWGlRLrNUsqa3wp6cKwXEDxwAWZ0pQKPK6Bhu1kU+56fLQXggZ
 fFuGS5UjyAztpTqSx7zIZZVpif42MLB48Gi8SmQc1M0ZNO9GEwvQQgZx6yGNG/plgfj5
 wFp8TpYrbDNFoDuiEhGmFKDam2kTIqYk88KXkfdtBYU26xHgDT6qVxPfNhhUwzuflCF+
 dggECrxi7KY1Jds6/+HIjGGetkAbwOIydZelZ7LgZZ9P6GftRujDyR6mSsAxK1YwTRo7
 n8d/pboRzy5kvyAu+xnt1LYzLaW9HFl8DsAzSzBRQqAGzme/GBN8W/TL05jdLhOkVPaR
 LGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505585; x=1685097585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oa4nI3WEIewnmzpuEcGtrA2tT88NXiwX772ys8tKjw0=;
 b=OdrxIhR18fCScNavmHs5bgwm38PItLyZ8FwpsQYZkT0VPrH/rzDe8G5sj23RI1IIzN
 7m2orGYJx/q+B0WgZr54EvP0V+hcAhjEG66sUPgtRjmlP457FpugKORDr9bhUui0Q/3p
 Ndzuih8c6ODsm7LE1McH5WGIAc6wxVxGwQNXpvsgztHufrQEgm7lF0ATZ0IYLATFNTY7
 djopgEgYydoKbG6DDy1baYWmIMHoPVF0eo1nf3w+ZI7qWLogVrepi7C6wNvBA13wRrMZ
 1+JCDM1xfEhmD2yo/SbpEA0e09OuGgSVPvcT3/qFAqHelxPvEGfh59tWgrrxiKfSdCre
 vKEg==
X-Gm-Message-State: AAQBX9eUYZmfsmbs/E4ncKMxMXbWuakr+WVQQ/9PXwXxt3ynWyXgM5Z0
 tm6EHRjLlpsI2vsJQievmWk4khKvbMeTLZcBoTE=
X-Google-Smtp-Source: AKy350at+IzE96FQQVPicDiym5XKyfbMKN7eMPoxR03J9V25RGlOLbtdtLEzh7iy3Gp1fEs12mIQaw==
X-Received: by 2002:a05:6a00:c8a:b0:626:cc72:51ac with SMTP id
 a10-20020a056a000c8a00b00626cc7251acmr28283131pfv.30.1682505584841; 
 Wed, 26 Apr 2023 03:39:44 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:44 -0700 (PDT)
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
Subject: [PATCH v4 40/48] igb: Implement igb-specific oversize check
Date: Wed, 26 Apr 2023 19:37:08 +0900
Message-Id: <20230426103716.26279-41-akihiko.odaki@daynix.com>
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

igb has a configurable size limit for LPE, and uses different limits
depending on whether the packet is treated as a VLAN packet.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 5345f57031..c04ec01117 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -980,16 +980,13 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
-static bool
-igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+static bool igb_rx_is_oversized(IGBCore *core, const struct eth_header *ehdr,
+                                size_t size, size_t vlan_num,
+                                bool lpe, uint16_t rlpml)
 {
-    uint16_t pool = qn % IGB_NUM_VM_POOLS;
-    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
-    int max_ethernet_lpe_size =
-        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
-    int max_ethernet_vlan_size = 1522;
-
-    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
+    size_t vlan_header_size = sizeof(struct vlan_header) * vlan_num;
+    size_t header_size = sizeof(struct eth_header) + vlan_header_size;
+    return lpe ? size + ETH_FCS_LEN > rlpml : size > header_size + ETH_MTU;
 }
 
 static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
@@ -1002,6 +999,8 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint16_t queues = 0;
     uint16_t oversized = 0;
     size_t vlan_num = 0;
+    bool lpe;
+    uint16_t rlpml;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -1021,6 +1020,14 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         }
     }
 
+    lpe = !!(core->mac[RCTL] & E1000_RCTL_LPE);
+    rlpml = core->mac[RLPML];
+    if (!(core->mac[RCTL] & E1000_RCTL_SBP) &&
+        igb_rx_is_oversized(core, ehdr, size, vlan_num, lpe, rlpml)) {
+        trace_e1000x_rx_oversized(size);
+        return queues;
+    }
+
     if (vlan_num &&
         !e1000x_rx_vlan_filter(core->mac, l2_header->vlan + vlan_num - 1)) {
         return queues;
@@ -1106,7 +1113,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         queues &= core->mac[VFRE];
         if (queues) {
             for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
-                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                lpe = !!(core->mac[VMOLR0 + i] & E1000_VMOLR_LPE);
+                rlpml = core->mac[VMOLR0 + i] & E1000_VMOLR_RLPML_MASK;
+                if ((queues & BIT(i)) &&
+                    igb_rx_is_oversized(core, ehdr, size, vlan_num,
+                                        lpe, rlpml)) {
                     oversized |= BIT(i);
                 }
             }
@@ -1662,11 +1673,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         iov_to_buf(iov, iovcnt, iov_ofs, &buf, sizeof(buf.l2_header));
     }
 
-    /* Discard oversized packets if !LPE and !SBP. */
-    if (e1000x_is_oversized(core->mac, size)) {
-        return orig_size;
-    }
-
     net_rx_pkt_set_packet_type(core->rx_pkt,
                                get_eth_packet_type(&buf.l2_header.eth));
     net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
-- 
2.40.0


