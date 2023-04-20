Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E703F6E89DC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAw-0002Jp-A0; Thu, 20 Apr 2023 01:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAr-0001te-U0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAq-0001WG-7g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24736992dd3so368421a91.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969779; x=1684561779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4aodSVoRvLCqGZGe9Xf6Sd8SbqNHCRxb26wHWYA5Pk=;
 b=aE8ttKv5WkFhU+e3qI3JV771NoOu43CXt+6ynpyhfnRQRzyLbAjJa/nYO1O80OLVxJ
 1UAVjUW9cv7padk/cUfVefZIHejgJZzKbeWV/qWyBu7Bmua9hBgNSfYD10s/ZqP89ETA
 0MWth+BlCpQhz+wgcZJeNwpnENu5IKJXmJ9N/8Jt/MtOcsIUtniVoxb9tE0M/Wr23eBL
 EnSrc2l6ZTOlvh58hUXOOOw82oOcCnmi/yx/Mi/Crhd4Te1EoW1fhnaWQ4Ve44PfWw69
 CegLHmkuT6dCJ5jUYMLjRrrHxqWk2dVlPJq437LPS5gp0o2VTtcqCepRxAANmUsbGjER
 0nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969779; x=1684561779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4aodSVoRvLCqGZGe9Xf6Sd8SbqNHCRxb26wHWYA5Pk=;
 b=bCX1DAawiTk6TNJh27ZcWELCsocN7gqqH+MqCTwKzPIcNz4Ukq39Yx1f43kZ1obUq7
 7sLaXeL+MdPb6d/f20LOFgGoL7bOchQyaj8LfgHQ3IdX2yQvqmR50S88lN3hFk2c+DtY
 jzsLglWnSGbEOLqo5rp1OA/4fGe9tfui3ZOxelTJd5sHis+IIRptrB3/2aJV7dGayqgd
 AydaQlq+j6tPmhAriTOnEXxcluHBDcz2fGSf/7FovkY7CXPAjIrrR/2BNGTX/LYnGJ3C
 BshwkxcIkiX9Szz+Q78DuiBomt29IwHwno1rKXcN+R0WjsFhmtkUu5auGC9HpVtgPBFj
 TdLQ==
X-Gm-Message-State: AAQBX9drhM21Y6jrWqT/mVi3rYURSZc1VcM9FA6GfZvD+jqYRtwVmh3X
 nxFve51CU4EfnrYe+Z57gwgfig==
X-Google-Smtp-Source: AKy350YVgyPfDXgn6/PptH1mjPBM36LLalxekNT05jeyker1g6k+TlkYOZB45OHSAN4F5BJS29CHtQ==
X-Received: by 2002:a17:90a:df86:b0:247:802a:53a5 with SMTP id
 p6-20020a17090adf8600b00247802a53a5mr519167pjv.40.1681969778836; 
 Wed, 19 Apr 2023 22:49:38 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:38 -0700 (PDT)
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
Subject: [PATCH v2 35/41] igb: Filter with the second VLAN tag for extended
 VLAN
Date: Thu, 20 Apr 2023 14:46:51 +0900
Message-Id: <20230420054657.50367-36-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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
 hw/net/igb_core.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9590e9bc4e..54abcf023c 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -69,7 +69,7 @@ typedef struct IGBTxPktVmdqCallbackContext {
 
 typedef struct L2Header {
     struct eth_header eth;
-    struct vlan_header vlan;
+    struct vlan_header vlan[2];
 } L2Header;
 
 static ssize_t
@@ -993,7 +993,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
     uint16_t oversized = 0;
-    uint16_t vid = be16_to_cpu(l2_header->vlan.h_tci) & VLAN_VID_MASK;
+    size_t vlan_num = 0;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -1002,8 +1002,19 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         *external_tx = true;
     }
 
-    if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
-        !e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(ehdr))) {
+    if (core->mac[CTRL_EXT] & BIT(26)) {
+        if (be16_to_cpu(ehdr->h_proto) == core->mac[VET] >> 16 &&
+            be16_to_cpu(l2_header->vlan[0].h_proto) == (core->mac[VET] & 0xffff)) {
+            vlan_num = 2;
+        }
+    } else {
+        if (be16_to_cpu(ehdr->h_proto) == (core->mac[VET] & 0xffff)) {
+            vlan_num = 1;
+        }
+    }
+
+    if (vlan_num &&
+        !e1000x_rx_vlan_filter(core->mac, l2_header->vlan + vlan_num - 1)) {
         return queues;
     }
 
@@ -1057,7 +1068,9 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         if (e1000x_vlan_rx_filter_enabled(core->mac)) {
             uint16_t mask = 0;
 
-            if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff)) {
+            if (vlan_num) {
+                uint16_t vid = be16_to_cpu(l2_header->vlan[vlan_num - 1].h_tci) & VLAN_VID_MASK;
+
                 for (i = 0; i < E1000_VLVF_ARRAY_SIZE; i++) {
                     if ((core->mac[VLVF0 + i] & E1000_VLVF_VLANID_MASK) == vid &&
                         (core->mac[VLVF0 + i] & E1000_VLVF_VLANID_ENABLE)) {
-- 
2.40.0


