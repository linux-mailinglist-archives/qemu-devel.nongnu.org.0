Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E424C6EBCFE
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDx-0006Ud-HJ; Sun, 23 Apr 2023 00:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDe-0005zG-DC
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:59 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDc-0001Lh-OO
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:58 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a66b9bd893so30497105ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223655; x=1684815655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l+Oz5maSzDNe+2i6DODB/77+oirJqA9aouuomyS2Fs=;
 b=sY+way1wfuDCb1uxYPEVsphpQcwOb2wilTIIs82oZy6ceBUrTi51BeeKn6VoEU7rNR
 ZHZ2n6adSVDmxb9CWITlHujSQgYlTaTli44ZIizu+UYithIJIdSnJp1TTjf1stPFb2oN
 SFDBlIfLzX1qNci16MFjWBRY3rd/BX9VPAnhcsNYxE56xAM/1EdnWTOVtR2bDRW9JOHy
 mpRU//mqBjZPMAHQugczSFwAhNbG5PIXryR+/VH9zIZNR9GLNcJEqj8d2DpJjal/icBX
 L5FgsJWQmL5uoN+WgQgOlHtZIkljcd4z+gV7Dudv/WVs/GbGAKZ25nJhzYH4BacIUOhc
 h+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223655; x=1684815655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/l+Oz5maSzDNe+2i6DODB/77+oirJqA9aouuomyS2Fs=;
 b=ecPb+wLsWnBK1Pzl05B7PGpXWHxzIo9NQ5zp2DGSlacPksyvXz4IXbz7JzTSUJH0iV
 a1WqWo5wqYYooKn+DKJkwhHYSd8nKb6L1WejgsBRZmxB2uQmEfi3wefHM66p7zHZ5mla
 dyLaCe9mZpT0CRRRDXZzUFi0lxKG24cqfWhSSJFN8EIXZrQFxh7Mfl4MaCZKGlS6RLv2
 O9wfcSFzgmW+BrIJJ7fPWX3qpmI0U0/gs9lvQ4TNogSpA4m0N0ava+hbH5JZhCcwnGt3
 ZSeSrD0LFn3qfc6R+ShB+jT0FCoSkc4Mys3IBklFTartV6h/hYENPSqwKyp8hpYe9XG5
 BGuQ==
X-Gm-Message-State: AAQBX9dZp/bIm+73er3Uo5MmvpfCIB7GCQCUem4wGGSUA26VXufaRVKD
 D5x6wfgPWB16Dlnq1KmK5WL9Wg==
X-Google-Smtp-Source: AKy350b2qKWSMfak85AX83TaTlbvoS6kCduJwTBAwfLUEmTvSrF6HWIATouJJ9yLi+N4ddaJ70viAA==
X-Received: by 2002:a17:903:11c7:b0:1a5:1438:9bcd with SMTP id
 q7-20020a17090311c700b001a514389bcdmr12237279plh.35.1682223655434; 
 Sat, 22 Apr 2023 21:20:55 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:55 -0700 (PDT)
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
Subject: [PATCH v3 39/47] igb: Filter with the second VLAN tag for extended
 VLAN
Date: Sun, 23 Apr 2023 13:18:25 +0900
Message-Id: <20230423041833.5302-40-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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
index a51c435084..667ff47701 100644
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


