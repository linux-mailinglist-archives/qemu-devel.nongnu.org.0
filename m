Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381646EBCFB
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRC3-0001rs-LI; Sun, 23 Apr 2023 00:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC1-0001rf-Ry
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBz-0000lq-V2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a6c5acf6ccso27184975ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223554; x=1684815554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2efEXahMU255jZT21UZSosQiwqibmKe3zIsscPOME/E=;
 b=JwIf0Hx/yqgFVmiyar3E7a9LPxIEENo/5CXAzEN90j9teHKw4z2U59sBTgbrSrKGyG
 44iuFrpX/gVZGprJGeMGe/HXVjtV99hlWsfIZMZRbxmVeRR+wr0li1USKDDLHBKWxApz
 MuHecaWDnv9z4aRm0izIvFB5M/T51lvPBRJlF56SwX3+9NUQA6wjPfxnJ4p6PEbTABch
 4avJFtGkfmI1eyPzaB9YyfLmk79AIY+D7NptLbcgCxbpf2qY7SXFeGuE8ecfYCYC9fuC
 VZbZIpiSHV6DFap3Qn+GIH5NCyosxO+qae1PHKw5y3ff22N8Gsqlae6H7qx0UNzjg80L
 xmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223554; x=1684815554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2efEXahMU255jZT21UZSosQiwqibmKe3zIsscPOME/E=;
 b=SJKw7k/Je246k9qiU2jUaUyl+JHvwr/iiaMBQc+GwO0s33mr2OqRqt8ez7iUlvY2G4
 jgVNCz0IzKPHNfqRMegKujTHsWDXsm5haqXx0gutvP0GQ+bOVwGOPL6GBPoJMKrh+9j7
 kKa2U9NFkoZDBKytyFq/YEBq10KoSwkXU+iuc5r6VunxvsOXgC9AkGdmwdZ8S+FK2KnO
 3w/Fhmxd5/05Bk/mkN0ydEnH7fjPR/HAojviIxElCc/FJGkJoRJEulfPKYnwjQjtWqSI
 MyG8FduH0UU00DQwxEdDdYDlF0rz5JVcJ5bWalBKjBvwA5WvAsqYlHyf6QfpyBezsYuI
 J9Vw==
X-Gm-Message-State: AAQBX9ey7Loqbj/syvglcn95inI6abEDsHfaCcL9CecM0OnvRFstuPFA
 tQa38MXl1CcPUBWYinlFC508Ow==
X-Google-Smtp-Source: AKy350bXeCNq+gaO5zuChLZGSPjVZrzjDrFmgWK9UicCHovs+R1Gd0ur70lT8jEDTQPDyRFHoAopQg==
X-Received: by 2002:a17:903:1212:b0:1a1:c3eb:afd with SMTP id
 l18-20020a170903121200b001a1c3eb0afdmr11884538plh.65.1682223553763; 
 Sat, 22 Apr 2023 21:19:13 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:13 -0700 (PDT)
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
Subject: [PATCH v3 09/47] igb: Always copy ethernet header
Date: Sun, 23 Apr 2023 13:17:55 +0900
Message-Id: <20230423041833.5302-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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

igb_receive_internal() used to check the iov length to determine
copy the iovs to a contiguous buffer, but the check is flawed in two
ways:
- It does not ensure that iovcnt > 0.
- It does not take virtio-net header into consideration.

The size of this copy is just 22 octets, which can be even less than
the code size required for checks. This (wrong) optimization is probably
not worth so just remove it. Removing this also allows igb to assume
aligned accesses for the ethernet header.

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 21a8d9ada4..1d7f913e5a 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -67,6 +67,11 @@ typedef struct IGBTxPktVmdqCallbackContext {
     NetClientState *nc;
 } IGBTxPktVmdqCallbackContext;
 
+typedef struct L2Header {
+    struct eth_header eth;
+    struct vlan_header vlan;
+} L2Header;
+
 static ssize_t
 igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                      bool has_vnet, bool *external_tx);
@@ -961,15 +966,16 @@ igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
     return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
 }
 
-static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
+static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
                                    size_t size, E1000E_RSSInfo *rss_info,
                                    bool *external_tx)
 {
     static const int ta_shift[] = { 4, 3, 2, 0 };
+    const struct eth_header *ehdr = &l2_header->eth;
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
     uint16_t oversized = 0;
-    uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
+    uint16_t vid = be16_to_cpu(l2_header->vlan.h_tci) & VLAN_VID_MASK;
     bool accepted = false;
     int i;
 
@@ -1590,14 +1596,13 @@ static ssize_t
 igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                      bool has_vnet, bool *external_tx)
 {
-    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
-
     uint16_t queues = 0;
     uint32_t n = 0;
-    uint8_t min_buf[ETH_ZLEN];
+    union {
+        L2Header l2_header;
+        uint8_t octets[ETH_ZLEN];
+    } min_buf;
     struct iovec min_iov;
-    struct eth_header *ehdr;
-    uint8_t *filter_buf;
     size_t size, orig_size;
     size_t iov_ofs = 0;
     E1000E_RxRing rxr;
@@ -1623,24 +1628,21 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         net_rx_pkt_unset_vhdr(core->rx_pkt);
     }
 
-    filter_buf = iov->iov_base + iov_ofs;
     orig_size = iov_size(iov, iovcnt);
     size = orig_size - iov_ofs;
 
     /* Pad to minimum Ethernet frame length */
     if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
+        iov_to_buf(iov, iovcnt, iov_ofs, &min_buf, size);
+        memset(&min_buf.octets[size], 0, sizeof(min_buf) - size);
         e1000x_inc_reg_if_not_full(core->mac, RUC);
-        min_iov.iov_base = filter_buf = min_buf;
+        min_iov.iov_base = &min_buf;
         min_iov.iov_len = size = sizeof(min_buf);
         iovcnt = 1;
         iov = &min_iov;
         iov_ofs = 0;
-    } else if (iov->iov_len < maximum_ethernet_hdr_len) {
-        /* This is very unlikely, but may happen. */
-        iov_to_buf(iov, iovcnt, iov_ofs, min_buf, maximum_ethernet_hdr_len);
-        filter_buf = min_buf;
+    } else {
+        iov_to_buf(iov, iovcnt, iov_ofs, &min_buf, sizeof(min_buf.l2_header));
     }
 
     /* Discard oversized packets if !LPE and !SBP. */
@@ -1648,11 +1650,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    ehdr = PKT_GET_ETH_HDR(filter_buf);
-    net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
+    net_rx_pkt_set_packet_type(core->rx_pkt,
+                               get_eth_packet_type(&min_buf.l2_header.eth));
     net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
 
-    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
+    queues = igb_receive_assign(core, &min_buf.l2_header, size,
+                                &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.40.0


