Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D136E2299
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:49:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHn6-0004FV-Ue; Fri, 14 Apr 2023 07:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmQ-0003ZG-Bj
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmO-0001SO-F5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:49 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so6855850pla.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472387; x=1684064387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyDU87BlE/kQQrI2wYzJ9rXC3RCPhxbvaI9JKH3Mb+E=;
 b=LkIW/GOEUMsGlTDdX8hEFscn57eYZzEHoOR9Dlc7e9AS+8vG1PYb4S5PN8aMgC0vem
 ACNLotUk+aABwaGW3ShTB6lxNqNfXnmOYl+rRfcScvvY/DSDeVfmLGKv9+/DYMeECmsH
 xCOhvSZfPRMyEOpoNxGBXRjeRoszv3/zZPGEIpDRXtktZt1NrNuPGCc8BpKvl0P2m41p
 rX4J48WsLQ8+dvIF13MUow0Bxwew6O5OVD5RyKgm8xHuyOWyQ0qe4vUc+UrXtI6NPHW+
 Y3VvjyOfv095a7OHaoVMULmgcf7bOeO7HT5n3ZZcVtU9pmwmfUD0ji6B5ApWITtIp+zu
 DuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472387; x=1684064387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyDU87BlE/kQQrI2wYzJ9rXC3RCPhxbvaI9JKH3Mb+E=;
 b=MSi+DfD+7XuqQmvFMpRiI5ZW5TmVhFvWaaqe1UO3SYRTYfKPxLd9ZyG8CVAjGqRKZk
 IKLrOKY9B3Mp4AaVJAj/m7Yu9uaRQBkgh32CgIQWAKaCwS8dWbLvHQeozyL30azWj6HK
 cS9CAQfSqcgZS1hcYa6ZcQ/78J2xZyTUvfzyRzJ5AhvhbHkmPw3NHCatEbdS1DJb3sWp
 e+rDiMzdhN8t2OfOPQ4KOSbLkA+8wxwaSYle0VHA6fNn6Bv9vh24cJKxXwjpAGEn6zxS
 vg40f5DZ6WShIwh7aJ3atOejcpKRK/jdo4wlYFLqUoYoLJOgwq90M/lFVH3U0MS+O32v
 bqlw==
X-Gm-Message-State: AAQBX9eMizPC/VqNVwsbGziQAreQsPjMBkdVFvYH1/mmG0KkXH7JCixG
 qrUecicNjLoPn6gogplIAQGReA==
X-Google-Smtp-Source: AKy350Yvan4QQsYWS/NnZ+RaBsc72Y8fkwkYln/6E/KNzUyw0tK5LubIfBzb2lcojmWG7XZOwfPetw==
X-Received: by 2002:a17:90b:287:b0:246:61ae:2fbb with SMTP id
 az7-20020a17090b028700b0024661ae2fbbmr5369013pjb.41.1681472387771; 
 Fri, 14 Apr 2023 04:39:47 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:47 -0700 (PDT)
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
Subject: [PATCH 27/40] hw/net/net_rx_pkt: Enforce alignment for eth_header
Date: Fri, 14 Apr 2023 20:37:24 +0900
Message-Id: <20230414113737.62803-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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


