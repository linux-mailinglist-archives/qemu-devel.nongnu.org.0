Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B86E226E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:40:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlf-0000hW-3k; Fri, 14 Apr 2023 07:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHla-0000bV-PI
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlY-0001PG-RJ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 y11-20020a17090a600b00b0024693e96b58so17242813pji.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472335; x=1684064335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5nszOMqQUezol6FiHYuWrZcdMW6lJNLoWyiDevlVfQ=;
 b=JuTnlcb+s7dNqsqfPxlOYdxFyRYFCyHVGrWK1aTf9LsOffawWgBWm8iMlcphQmBDNR
 p/qNDsrqw4xM68pDD9QdKOA8LBupcsbAtPz5D+hpG/ZXjOXi6TKQVrjuDssmEy9aPMxH
 niFblZMfrMvDBUv6S9PmYFD1Xjq0tJxw4/iUP1CoBKYsbFXzFadBkevCxHUF9gLrM2Iw
 hWoZOUa5UK1kNTSSSp35MUsr2O16XNWvWYsrZHAzVvoouXIg1VagJpvbeOIdgW3P/mvp
 NIRkDFp4mj4c8CIKnpQifLH0yqxyxr5trgSD/0sX02ke9mG7qlj93bzPiBoEifSuxX2j
 9IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472335; x=1684064335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5nszOMqQUezol6FiHYuWrZcdMW6lJNLoWyiDevlVfQ=;
 b=gWtxTmM2p0KEqEa4ZBS5RygyiThKt6dJ58lZ48gcyLO4JTnVKkhmvn2ZrMLs1P8JWO
 8blVQ8DD3jCIAtHwZ+RHB0dBBHZzdMjS30tGnVg7QtS3ckiHq+5revEoYBiYcHeLPzaI
 bFj+wqPHHVjvKSMuhJC+qjuy+LxVlLDC40jsx1x6HvqXPoWJUutrrrTjr6FfEgt6FCI9
 nJywJCf32q1hCFmPNjvvmnuF0Q3+2jWHLIViQ+DQg+C9klFkAmgWPIBDZs/jBXluyVme
 DK6yzzj8cNH55+uPX6Efm28H+Y40uwIcoiyBq4yePVz+60Jt0h7b0CuWn4ba0FjQRGLO
 uTMQ==
X-Gm-Message-State: AAQBX9f/ztx8ONxqRkn8OmWokfwZxMahMPkDVP0nGEc3n9b3NPShRIm3
 4USbKlHs5O59Y/PtkvI/qqAOyw==
X-Google-Smtp-Source: AKy350YXi4WYSypmNNLsiOEAqRq5lubpZtQkjmGYnHQPCxhmjAs3nrtjcpKxojLn+tigq8c8N13DAA==
X-Received: by 2002:a17:902:f685:b0:1a5:5e7:a1c9 with SMTP id
 l5-20020a170902f68500b001a505e7a1c9mr2981665plg.61.1681472335482; 
 Fri, 14 Apr 2023 04:38:55 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:55 -0700 (PDT)
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
Subject: [PATCH 12/40] hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
Date: Fri, 14 Apr 2023 20:37:09 +0900
Message-Id: <20230414113737.62803-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
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

This function is not used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_rx_pkt.c | 5 -----
 hw/net/net_rx_pkt.h | 9 ---------
 2 files changed, 14 deletions(-)

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
-- 
2.40.0


