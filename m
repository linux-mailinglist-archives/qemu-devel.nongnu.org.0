Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CB6E2283
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:45:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHor-0006LC-Tp; Fri, 14 Apr 2023 07:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmc-0004N3-8E
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHma-0001e2-An
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id p8so18074276plk.9
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472397; x=1684064397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlWHhvvn97HeemRYOl9EBY4zDXk3a0mHt1THnGfW0q0=;
 b=C5OIZX+BVEWsQ3CiVthne6mT7sU2Ic3mBYnmj/MS6410IzIGvWuN43ZSZMf60JolQ7
 ilzuEnii9K/s+Uea5hRm4LeBV1e+1oifVBSHUHHYVHBlEJakEC9GpM7xMV+E+qN64pT6
 WWIdDJIFMtaKQ23sY29C8IkocZgpWStfs8bXikyMlhnoXPht7uHX0R0/kwmIjWfHiWah
 SnCpKK9cgOAzblLWXqmw4WpchTMpkYXq4XZi6wf/GYCrMH5oML/arpkSJVlOTgfatgFA
 XR+tpluUEm1MaFaZGcRQN3hw5dC6tOosbpKVbQZKXvFrxDiyjEedo0ccwmKdfoHiiT5S
 pqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472397; x=1684064397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlWHhvvn97HeemRYOl9EBY4zDXk3a0mHt1THnGfW0q0=;
 b=cbbyrT6XnoUrTFMyqSwBo+YJjhaVDvpy2Y1d3W6P7HgKZmcEofw2TEl3llu9u9shSw
 wAJ2g/NM7OlYK5vhiX3lUyAL02HSS9KpDKO1NTIj/zx1OlNHXyCkYXrOttTE5W107OO8
 BDcZ17ocfhrdZO9TiarkJXY31+1w/4n2X8nknhuR+PidK3bxowKnJVHGcDhZlwPLqLlR
 VHPTQOUPFG1Rhso3iUHlP2luNR8282K15BJ0KH1HdnPy4N0jFI0rq3TBpJDnCmfEECwL
 Eos4ONEB06NGIfGq6UM44/IlYVdYSbleA0D9Q0B9uVH1fkQHislLGc1h0JdRgTDxnkp+
 m6pg==
X-Gm-Message-State: AAQBX9f3T97BXYX41P/sUyP6Pe1wv/LPa/xDja4a4ZhNUReRHhChlLfc
 KUD5OgjFU4bYxDZbYRxhGGZm92MpCNi8pEqkTxg=
X-Google-Smtp-Source: AKy350Z9j0o015l/tIoDvw/WT+FJgaMux9phMZ4BciO+tdmlyv9vc2NHm5c7dCQaf5CjEygJL5BiGg==
X-Received: by 2002:a17:90a:7c0f:b0:23f:83de:7e4a with SMTP id
 v15-20020a17090a7c0f00b0023f83de7e4amr5382400pjf.7.1681472397471; 
 Fri, 14 Apr 2023 04:39:57 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:57 -0700 (PDT)
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
Subject: [PATCH 30/40] igb: Implement igb-specific oversize check
Date: Fri, 14 Apr 2023 20:37:27 +0900
Message-Id: <20230414113737.62803-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
---
 hw/net/igb_core.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 2013a9a53d..569897fb99 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -954,16 +954,21 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
-static bool
-igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+static bool igb_rx_is_oversized(IGBCore *core, const struct eth_header *ehdr,
+                                size_t size, bool lpe, uint16_t rlpml)
 {
-    uint16_t pool = qn % IGB_NUM_VM_POOLS;
-    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
-    int max_ethernet_lpe_size =
-        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
-    int max_ethernet_vlan_size = 1522;
+    size += 4;
+
+    if (lpe) {
+        return size > rlpml;
+    }
+
+    if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
+        e1000x_vlan_rx_filter_enabled(core->mac)) {
+        return size > 1522;
+    }
 
-    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
+    return size > 1518;
 }
 
 static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
@@ -976,6 +981,8 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint16_t queues = 0;
     uint16_t oversized = 0;
     uint16_t vid = be16_to_cpu(l2_header->vlan[0].h_tci) & VLAN_VID_MASK;
+    bool lpe;
+    uint16_t rlpml;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -984,6 +991,14 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         *external_tx = true;
     }
 
+    lpe = !!(core->mac[RCTL] & E1000_RCTL_LPE);
+    rlpml = core->mac[RLPML];
+    if (!(core->mac[RCTL] & E1000_RCTL_SBP) &&
+        igb_rx_is_oversized(core, ehdr, size, lpe, rlpml)) {
+        trace_e1000x_rx_oversized(size);
+        return queues;
+    }
+
     if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
         !e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(ehdr))) {
         return queues;
@@ -1067,7 +1082,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         queues &= core->mac[VFRE];
         if (queues) {
             for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
-                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                lpe = !!(core->mac[VMOLR0 + i] & E1000_VMOLR_LPE);
+                rlpml = core->mac[VMOLR0 + i] & E1000_VMOLR_RLPML_MASK;
+                if ((queues & BIT(i)) &&
+                    igb_rx_is_oversized(core, ehdr, size, lpe, rlpml)) {
                     oversized |= BIT(i);
                 }
             }
@@ -1609,11 +1627,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         iov_to_buf(iov, iovcnt, iov_ofs, &min_buf, sizeof(min_buf.l2_header));
     }
 
-    /* Discard oversized packets if !LPE and !SBP. */
-    if (e1000x_is_oversized(core->mac, size)) {
-        return orig_size;
-    }
-
     net_rx_pkt_set_packet_type(core->rx_pkt,
                                get_eth_packet_type(&min_buf.l2_header.eth));
     net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
-- 
2.40.0


