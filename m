Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3D6C81AA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfeGC-0005b5-Ki; Fri, 24 Mar 2023 06:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfeGA-0005ax-D8
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:02:58 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfeG3-0004x6-SE
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:02:58 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5447d217bc6so23904827b3.7
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679652169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1R+aEVDBOJIlT2PKegpb/El2YxGuu/QJmhVuq/d/KI=;
 b=A232QgSpaVpGvT6bzpssEj+Zzvj/Ppv0zhux13tfaqasWzCccUULldCnBBAizFGgEo
 y8W0YUdTnZFYFD4ycwlsVsI/acPNgiQBD/09V9h/g1YOxJ+hn+v5H3yX+uVR6mE3Mwrk
 OSTY7QhKqCuvcTB32tgiy2wTgYoTsUdvQEXlF8nbMaXX4cSkDxdLFz/Ucx8WHoKs/n+F
 wJhEQ/FEjJJnfxXhZ0uMtsMzS+GKXTYIhttZENb9DglmvxHSktpyTJQ33HEE43fC2clg
 Nx49V6pcehn51GQhPlpIIjXAY/uJ5lTfJ9t9r+I8g6fRPtQk62sCHUsTPW44Rl5oO0qS
 ZgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679652169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1R+aEVDBOJIlT2PKegpb/El2YxGuu/QJmhVuq/d/KI=;
 b=GrlTYHnK065lJJceLxF85M6Y99xwJyvO6BLiKhyQ6gIk+Lco7gOURydyKYtRpQArWw
 qetV1DKnjgRb7P+e98fHXdjpznBp7NskwRE07fjk0+f/JLDXhxto9nZIpVCnMbEzGQyy
 Hnc9xfrI/zE9eJ/8hRJbaVdtYhWium/+Os2zIN/jd/PpFxEpEnaiS8OWakqgITBp6wa1
 gm/PUkEfgnzJeGFEUAal2L+Fc5TZJWVl8XumF9PaCn+O250mu0W5Klc2z1GDdUjstG3C
 fNIhk6YzRg6F0GlsQiSg4ZHf1pN8oHzOI+7uN0t/yCKNZfLC1Itf2Mr5H3XwS/G3mB93
 E5KQ==
X-Gm-Message-State: AAQBX9dIZBESp7Qpxc5WM7mQcs7Xmur6PZNvEOlNkj5DIHYoXzpTlNuW
 VveoKIaB5bfaTYgWt8I/lZ2Yg6Us9jsFgrMt7uF9Hw==
X-Google-Smtp-Source: AKy350Y0eTw+pJPsfHyZVpZ/BFf2Gr+pckqbA497JXHXVanWK5neK4/o07ZoqP/BAWgD0QLTDm2TWQ==
X-Received: by 2002:a17:902:ec91:b0:1a1:dd3a:7509 with SMTP id
 x17-20020a170902ec9100b001a1dd3a7509mr2368911plg.48.1679651704969; 
 Fri, 24 Mar 2023 02:55:04 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902748500b001963bc7bdb8sm13785614pll.274.2023.03.24.02.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:55:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 3/4] hw/net/net_tx_pkt: Ignore ECN bit
Date: Fri, 24 Mar 2023 18:54:33 +0900
Message-Id: <20230324095434.44973-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324095434.44973-1-akihiko.odaki@daynix.com>
References: <20230324095434.44973-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1131;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

No segmentation should be performed if gso type is
VIRTIO_NET_HDR_GSO_NONE even if ECN bit is set.

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index cb606cc84b..efe80b1a80 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -796,11 +796,13 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
 {
     assert(pkt);
 
+    uint8_t gso_type = pkt->virt_hdr.gso_type & ~VIRTIO_NET_HDR_GSO_ECN;
+
     /*
      * Since underlying infrastructure does not support IP datagrams longer
      * than 64K we should drop such packets and don't even try to send
      */
-    if (VIRTIO_NET_HDR_GSO_NONE != pkt->virt_hdr.gso_type) {
+    if (VIRTIO_NET_HDR_GSO_NONE != gso_type) {
         if (pkt->payload_len >
             ETH_MAX_IP_DGRAM_LEN -
             pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len) {
@@ -808,7 +810,7 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
         }
     }
 
-    if (offload || pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+    if (offload || gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
             net_tx_pkt_do_sw_csum(pkt, &pkt->vec[NET_TX_PKT_L2HDR_FRAG],
                                   pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1,
-- 
2.39.2


