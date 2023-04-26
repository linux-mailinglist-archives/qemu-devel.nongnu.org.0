Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C948F6EF249
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYX-0005Ae-7v; Wed, 26 Apr 2023 06:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYS-0004v0-KI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:20 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYQ-0003K1-Sw
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:20 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so8219937b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505557; x=1685097557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cbPtOGCt4/DtgDNQOMqkazCwuM1SU58VR9lfEcSjFg=;
 b=hw54M7VBYGISGO3Kt+gmGet5n8z0bODob2Iw8yfaD2FqrLVDuitAsAwn+CqonsXsB/
 sUPhl0Tn6o1e8VFoHK2vqZa5qzi5Ky5fq4Gx8Q1uljQEXS0rjcBr0sTvKe4+L4crac07
 GxP0ZI1f/YIlmNRInU2JNeeUco/IEnRit92pPdm2DFcaUBe94nzFTSZZvDaeZRhqiaAn
 ngobLYVaz8QToFManTARnzIE0oxKQ526U4Cc9RBJiAK5Dd6I9n96hzpu1ldEvZ7kATgC
 3fU5zKPR1A7UoCWr30YHOFaqWJdiCGHZgrKXTLBL2+HJ39r5mGPQ1dReCKn8wwO1rHyx
 1z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505557; x=1685097557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8cbPtOGCt4/DtgDNQOMqkazCwuM1SU58VR9lfEcSjFg=;
 b=QOW7DZZVqkAY2OrA1ZONzOY6iky5m/sYZeLa0dpxkNaWfi16xLAEMJt/RnlQqdJlep
 hl9REFD2ogChFQ0SxgCXy4N9HWQyoy7M5G5yTTwS67113IqBOMB8ha2wWj7PX/EUzMTY
 6p7Q72Dx8Z7xZle+0dwJ/Yb8kjVJMVMn34w80Tft9NfYd+IWt3rH6ivkDZiCN5eqYXW5
 gYRhgy3tbjzEV9mmTOmSupT3liftbusx4F/RSFHOc4IWVD0yHZrQOW5x1w5N1Z1JZhsI
 XRfThHB6x4sNArRkyPEesNtfDoYInTbqLOuMYBktR8mrkepfFpZxA8JJbIAeOnjmc1rM
 KQoA==
X-Gm-Message-State: AC+VfDzSf2brP92nv3YviojzxYlhOCOPq7VOlRy445ajeZ3dqwSsw0Av
 xWWens4ksP/ebqKoihWW4nrJcw==
X-Google-Smtp-Source: ACHHUZ695xuXPN+rCljXR2poYk1E3OjQlT/ZFI/r7mxqbIZoHJzM7aI0953MvDbwJsTqTCMl7eF9cg==
X-Received: by 2002:a05:6a20:1606:b0:f6:5a75:7d44 with SMTP id
 l6-20020a056a20160600b000f65a757d44mr5898263pzj.12.1682505556742; 
 Wed, 26 Apr 2023 03:39:16 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:16 -0700 (PDT)
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
Subject: [PATCH v4 32/48] hw/net/net_rx_pkt: Enforce alignment for eth_header
Date: Wed, 26 Apr 2023 19:37:00 +0900
Message-Id: <20230426103716.26279-33-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
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

eth_strip_vlan and eth_strip_vlan_ex refers to ehdr_buf as struct
eth_header. Enforce alignment for the structure.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/net_rx_pkt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 6125a063d7..1de42b4f51 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -23,7 +23,10 @@
 
 struct NetRxPkt {
     struct virtio_net_hdr virt_hdr;
-    uint8_t ehdr_buf[sizeof(struct eth_header) + sizeof(struct vlan_header)];
+    struct {
+        struct eth_header eth;
+        struct vlan_header vlan;
+    } ehdr_buf;
     struct iovec *vec;
     uint16_t vec_len_total;
     uint16_t vec_len;
@@ -89,7 +92,7 @@ net_rx_pkt_pull_data(struct NetRxPkt *pkt,
     if (pkt->ehdr_buf_len) {
         net_rx_pkt_iovec_realloc(pkt, iovcnt + 1);
 
-        pkt->vec[0].iov_base = pkt->ehdr_buf;
+        pkt->vec[0].iov_base = &pkt->ehdr_buf;
         pkt->vec[0].iov_len = pkt->ehdr_buf_len;
 
         pkt->tot_len = pllen + pkt->ehdr_buf_len;
@@ -120,7 +123,7 @@ void net_rx_pkt_attach_iovec(struct NetRxPkt *pkt,
     assert(pkt);
 
     if (strip_vlan) {
-        pkt->ehdr_buf_len = eth_strip_vlan(iov, iovcnt, iovoff, pkt->ehdr_buf,
+        pkt->ehdr_buf_len = eth_strip_vlan(iov, iovcnt, iovoff, &pkt->ehdr_buf,
                                            &ploff, &tci);
     } else {
         pkt->ehdr_buf_len = 0;
@@ -142,7 +145,7 @@ void net_rx_pkt_attach_iovec_ex(struct NetRxPkt *pkt,
 
     if (strip_vlan) {
         pkt->ehdr_buf_len = eth_strip_vlan_ex(iov, iovcnt, iovoff, vet,
-                                              pkt->ehdr_buf,
+                                              &pkt->ehdr_buf,
                                               &ploff, &tci);
     } else {
         pkt->ehdr_buf_len = 0;
-- 
2.40.0


