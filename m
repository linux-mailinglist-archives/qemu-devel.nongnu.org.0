Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD96EF27E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:45:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYt-0007fj-9p; Wed, 26 Apr 2023 06:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYq-0007Th-2F
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYo-0003Ms-Ft
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b620188aeso8233728b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505581; x=1685097581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPvTkBCxnRmVQmgIKjTmgQ+aBaL4yZpdSUSmce9k6qw=;
 b=DkFfpWDB7JQG0jtLSNmOVVg5vO/dZzSvmx7VIMOexEKrLdylD1pEUHBqQK2Zk8VdAl
 riixcrcbjy8m7eaqDJFc9nXFXPDoa1IIFhCQjUdHKz3OjCHGLbycn6jUOuSvNxQTkyze
 R1hHMr/WPkXrgTtEyQfurtRBJtIjkgjg30pkIwcSLF133Xay1gsZPLiMiIp2tcVT2ytA
 WV1KEoyEAc6Vzsqzsp/uW49sQ/N061l94+g7CL6PVHhREuWXc3vBnglcs+EmOxt24EdN
 JWwGN2ivkHVi8i8YfW1cVIgsjyK/NVFvUPxD8Nmuz0T7PGmuI/QK9INsoNPkvVZJeo/V
 OCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505581; x=1685097581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPvTkBCxnRmVQmgIKjTmgQ+aBaL4yZpdSUSmce9k6qw=;
 b=O+IXjAf5iqqYvgiOyYBDKzHgbtkIXrbybxhdbKS0pY8ehlJo0pXk/0ClqSXzeICMyU
 fqVePtZj4WDMgli9GjQGkJUIfKVb12oPmFWtL1rSswaPcoB/6VD3x4G3vWdSeNo6iWkB
 aLCppQwc/JIQyhjVK+bSRDG/bTJL+8KjqmPOkt3HLPIpRboDm9VWgNI7LYChsvMna3AO
 NXTxCTDacAl/k5TGj6avt6WZA8b+Wak/SyFE3AfL/O//RtDoZdoyhxoJPYXtaj0U2ua6
 uO7yu4Suo81GC1da4XKhd5o9LVO9n2XU/iIipmAZdtt4Bz+6GLau2LLFBSUezblwZO7B
 2x4g==
X-Gm-Message-State: AAQBX9dOQEAIv6JrB++TRrngEcxNL9LQ5X41uQjETOCPsrA0JM3bP5/O
 gR4uY/PsRtrVYJB6cWI264qbSg==
X-Google-Smtp-Source: AKy350ayHnR9egIme6CpwqDYS2g+jGW0SaLz1+gDVhg6RhhsS1NHSBPBVaEyVs2WVJMDnqJVS0vlaA==
X-Received: by 2002:a05:6a00:1305:b0:63d:a0d:6fa1 with SMTP id
 j5-20020a056a00130500b0063d0a0d6fa1mr23963010pfu.21.1682505581321; 
 Wed, 26 Apr 2023 03:39:41 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:41 -0700 (PDT)
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
Subject: [PATCH v4 39/48] igb: Filter with the second VLAN tag for extended
 VLAN
Date: Wed, 26 Apr 2023 19:37:07 +0900
Message-Id: <20230426103716.26279-40-akihiko.odaki@daynix.com>
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 688eaf7319..5345f57031 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -69,7 +69,7 @@ typedef struct IGBTxPktVmdqCallbackContext {
 
 typedef struct L2Header {
     struct eth_header eth;
-    struct vlan_header vlan;
+    struct vlan_header vlan[2];
 } L2Header;
 
 static ssize_t
@@ -1001,7 +1001,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
     uint16_t oversized = 0;
-    uint16_t vid = be16_to_cpu(l2_header->vlan.h_tci) & VLAN_VID_MASK;
+    size_t vlan_num = 0;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -1010,8 +1010,19 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
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
 
@@ -1065,7 +1076,9 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
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


