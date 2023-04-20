Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F56E89CF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAY-0000zz-QF; Thu, 20 Apr 2023 01:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAT-0000X7-L9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAS-0001Px-07
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-24704a7bf34so495157a91.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969754; x=1684561754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyDU87BlE/kQQrI2wYzJ9rXC3RCPhxbvaI9JKH3Mb+E=;
 b=Qbe/1w3XB54213D1eWoj9YtQ2MKWf5oANMFc3aS12ejHjOgn0yRpd3dFVAcHrUxy83
 0XrNlh0O5LqO3u6I1nmoTGzopbUeBLOyw/qKERpg8VAYzxue3HpBnaknYTP/IgcMZpfJ
 INy4+Adem8RTayftA25cpWLFT6jzh+MT93w7Lct7fZs4Ci+eY7jK+KWyBPA1C/dg8IH3
 Ke8PcEG3+JnAhFiwyJdmLnXqOlCoSq6MycMaZUvM7zmWXWKWfeJxj15jNJlzud0EArHl
 YJrwGcOhiVFv2bMR9I+bPChOFqiOXNenAfu1NhZrv1IkmjD5qGu8FtksytGDrOT/5Av2
 qsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969754; x=1684561754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyDU87BlE/kQQrI2wYzJ9rXC3RCPhxbvaI9JKH3Mb+E=;
 b=NyxnKMlewHN6/TEA1h4XXlQKvCnvG7sw7kxMa3rBHVhT1kkmvRgyIqeN9RhDztOM6D
 P07Ka9hwj1HsWBptJtRri9UB7IC014GLlmGgS+3QEUpZoH7rJYGdfdsXCS5Ce5UjZwJ2
 W38kaPMDe2SE4C2W3B9lF6PVwsg+ERXj0ShtFWXwrRPSo6Li1BohRzIdDBWmRAx9SoGG
 7OLKhasqJifGisVDGKhWucRBE75e4lPDeleKQPCjfJE/xxF1t9YHix5rEgBBBMkH+nUU
 9DpsEYtNI4+h6njcEuYMv0QOV+giVZFn9SKc0bEaQNm+RClcJvanY7q8uL7t40fZMYXZ
 iY7g==
X-Gm-Message-State: AAQBX9cRt7pIY4G30aRh8j2n38NpJhduWDyIUBJdnWf3vNjQRKrJ7+TP
 rvJy+UHaWT7vHJ0pyEHCdkv6og==
X-Google-Smtp-Source: AKy350ZNn7o7+1d5itsFxjFUNm20syfgu0/+M7O3e5d1+VviuqJlUh7pYZxIJiVu6pt2a8bsEUKGiA==
X-Received: by 2002:a17:90a:7003:b0:233:f393:f6cd with SMTP id
 f3-20020a17090a700300b00233f393f6cdmr632023pjk.5.1681969754695; 
 Wed, 19 Apr 2023 22:49:14 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:14 -0700 (PDT)
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
Subject: [PATCH v2 28/41] hw/net/net_rx_pkt: Enforce alignment for eth_header
Date: Thu, 20 Apr 2023 14:46:44 +0900
Message-Id: <20230420054657.50367-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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


