Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD416EF23B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXR-0000cg-Mk; Wed, 26 Apr 2023 06:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXO-0000PF-7h
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXM-00030n-Kk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso5514027b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505491; x=1685097491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=qt6Km7g+mwxkylJEodBnnUaezb1aADW6RH3u+V2RPeCUoboBA+jwFADGGV67Rp73sW
 mWHhKPY8KEDg1akkmUwrToh8g1QTuUGlEloWwYHGm1zXRYm1JqPo4xVoWg1ea99/JPp3
 0qBG2iaaamYI8adNRfFNvp3j4OQcnr0PEeBQQz7XoVj8l9z3QFrOaobpQF9HiUbVLP50
 JyqeWQybsNDZZtK02XWSjux4ZM3JQtASysO6K6ar3M3WU527POw9KyMcFJZDbmSAE7Pj
 mtYFlTPElagBGtLa2ac0mW55OYq7d1kMiQsRXNbmSX5dudQ0hk7NWpX1UnPB8A1roTUC
 1ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505491; x=1685097491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=f/BHguirskppKkwLdt9D3TPz67dIN2fhEvND7rgRQtrgtvtQPiO7BihW3QDDlyOkNY
 d5MzFXxmsYofBQfekxaBtTumEPZllt1xBWw+lteRy8DOizCDSskec24IG+2chxNNFnFM
 dQgCQ8GLrfblf4+Qc84yBrD31jXe4aPni6yt8q8CSU9xQWfva+2FU/I5mhJpZABvuRrM
 AvI6OPgNbMOaBbsqtaTy3j7SQ/W4elYC/RoVy25pgVUPL5hEQzmCKik/gFCqf8Qvxqui
 a9oHVIzNu7wUX3r5kiH6lzMH4w7tN3i7y9IkwL41g5p6UWRz9LS3LfueH2Th9Xvk0ZRW
 WcaQ==
X-Gm-Message-State: AAQBX9e81rgLsHmLLJfnMUxUZjm4yuoNrpTy6A3XN5wEpIKZYwooINxL
 ZabItEQwPbMyt4/gXipEBDOuLA==
X-Google-Smtp-Source: AKy350a1wjmfhn1khydsTbSyTJtAiudDdZroeFzayNO/uplm6f3q6cUo4Gvv2Svd20mw5eHa+HZCHQ==
X-Received: by 2002:a05:6a21:788b:b0:d9:2cef:949a with SMTP id
 bf11-20020a056a21788b00b000d92cef949amr27901528pzc.28.1682505491072; 
 Wed, 26 Apr 2023 03:38:11 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:10 -0700 (PDT)
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
Subject: [PATCH v4 13/48] hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
Date: Wed, 26 Apr 2023 19:36:41 +0900
Message-Id: <20230426103716.26279-14-akihiko.odaki@daynix.com>
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


