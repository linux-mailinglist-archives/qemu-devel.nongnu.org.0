Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2976E89E6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9s-00079D-5V; Thu, 20 Apr 2023 01:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9a-00076c-GU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:25 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9Z-0001E1-0b
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:22 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-518d325b8a2so588339a12.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969699; x=1684561699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=v5uf2qz0fbZQH1bXbYuRR0/7qUd+I2kGFP4zAPhT8ZC6A7UicQXZMf2F12zz/2Fg5P
 XPOU60r8lrEuwgAHToruyddC/cOujorO9YBxLL5HllPcEBPlr7qPgOD5x7xADptMSzVy
 ZNJbtpfg/dHZIA1NlYT+7Kl1PeOMnYgnoI3ikeCo2vtCb9FlF1WWi2Q+mjHMkMoY3SZk
 ACeNAgirSfbHK8tG8DORkt5P4X52PD2SkSQOsyoNM0pX9AhqfXbG78CoB5L0SxYePNOD
 mJBzrAuNBsvW4A8KsYa+wxSghHvftPJsQfMLeLiBw2vpu8JUttYwhrqPgMLC8Ndna6kC
 ISsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969699; x=1684561699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=j7YRUIjqoQfH6SpyBImyls+JsHRYwXGhmKhquU6qwOzyCI1f5+qbmiFcSEcfzNrTjb
 ioVciBe9lOfGKfKsPwl83egbItVZnllKrX8bvOc29IjP2aSgvdeDGjhntSfVEY37kzgO
 0okhKZ7EOMBchJnwEZvUoL9Ri/viMcDqk0a7B28NzGSlFfA73deTYZDGG5VLk4dbEn+S
 kOh6JSvK4mr/8YI+WJyvST07vZacf/0h3nOWF379ZJ+V9jvutuIM8euPHrvmD9pM92JV
 nEq3pqFAIUaMK+qBmYjjnKo4ERCzyzHb8+I2J5Hf5dn0F0RZwjLv9J1FnBTIg0xhLIjk
 zBGQ==
X-Gm-Message-State: AAQBX9eOw2B99EliN6VpHGfsumJYylIWi/JMDcQINbT7of+Lq6byt+5d
 UCi8v1bPrnVL7URMBf+/Sq/a+A==
X-Google-Smtp-Source: AKy350arh2GriEDXnYlE0YHBy8hppaZFS56gwe/aMfLLql0TSUXSfzZ7haWWwlVVQ3s0KZR2Zlgu2A==
X-Received: by 2002:a17:90a:2a03:b0:249:86bd:42a7 with SMTP id
 i3-20020a17090a2a0300b0024986bd42a7mr450105pjd.42.1681969699430; 
 Wed, 19 Apr 2023 22:48:19 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:19 -0700 (PDT)
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
Subject: [PATCH v2 12/41] hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
Date: Thu, 20 Apr 2023 14:46:28 +0900
Message-Id: <20230420054657.50367-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
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

This function is not used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_rx_pkt.h | 9 ---------
 hw/net/net_rx_pkt.c | 5 -----
 2 files changed, 14 deletions(-)

diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index a06f5c2675..ce8dbdb284 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -119,15 +119,6 @@ eth_ip6_hdr_info *net_rx_pkt_get_ip6_info(struct NetRxPkt *pkt);
  */
 eth_ip4_hdr_info *net_rx_pkt_get_ip4_info(struct NetRxPkt *pkt);
 
-/**
- * fetches L4 header analysis results
- *
- * Return:  pointer to analysis results structure which is stored in internal
- *          packet area.
- *
- */
-eth_l4_hdr_info *net_rx_pkt_get_l4_info(struct NetRxPkt *pkt);
-
 typedef enum {
     NetPktRssIpV4,
     NetPktRssIpV4Tcp,
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 63be6e05ad..6125a063d7 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -236,11 +236,6 @@ eth_ip4_hdr_info *net_rx_pkt_get_ip4_info(struct NetRxPkt *pkt)
     return &pkt->ip4hdr_info;
 }
 
-eth_l4_hdr_info *net_rx_pkt_get_l4_info(struct NetRxPkt *pkt)
-{
-    return &pkt->l4hdr_info;
-}
-
 static inline void
 _net_rx_rss_add_chunk(uint8_t *rss_input, size_t *bytes_written,
                       void *ptr, size_t size)
-- 
2.40.0


