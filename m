Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D46EBCD9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCH-0001vV-P0; Sun, 23 Apr 2023 00:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCD-0001vN-Vp
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:29 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCC-0000oR-FY
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:29 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5191796a483so2638585a12.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223567; x=1684815567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=L5KEy90k4bC0P1voYkM64QUXy0FQIRSock0sRoUD/9yJZS5QuJYYirIi9mOlh0KggL
 ew7/j4vF9/ueDApSVd/QLj+0pwiGZzjbqVYQnLIfY29BPv7QgIaKfXzl1T5PtCP0g13O
 xDSsI508R+6Da4bRAnEma/ZI6fEYoE7IhNMNQBvqvHQbkiYfiNObNYTaK/S/W10p7Ssc
 XaRHI69xpPJlkhTcn6xfKbI7pQX7kYWks3NtA1tI0Pm+V9bVUP2NfSkYa5HCxrys+MI9
 3XTAIgvmYCOYJbgsNyuUe2ZCKgFnhRvSqC8/j+Uw34nQ+t22swbPs5AN3B0All8byMp/
 4iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223567; x=1684815567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7PZIm04ooSj6Ki8OsJLg23id0yLR39T0g3+u0vz1Wk=;
 b=fep+pRMdZcVm89VeJVA02l1ThwTurgcuzZWUIB03oiUxtY8sC40dxoy18YXhQU1c3C
 f75XRUWPwccpPwzxGyg5UsQg1WtMIfx1HpIqXfMyHLHrRnbAv88Y52e6eYBwKiy2Tl8m
 wYTcZsEiXn+LUyyCKxVGg0+UCJA4aepWqJ594ZUtPOD2qRMMezVpOnfJxDCMddN9hBll
 ZhTEGKtEtZ9TRuVwyLH1IKgEdV79j1Oid19w8uY/sqO1FEWlR/HLjtfipRO/s57XjXBE
 xyQAG7RmivL4qm9O0MojrjV+00PkpsVBZTZY86oWA9556DTmMGy/GqvFms/XeMVxJUSG
 8Vjw==
X-Gm-Message-State: AAQBX9ddijEIToOdy82tTsSJaERsVz9DbrY10x1JY1vNLb2ZEi8WlO0t
 xGaVMCa5xWWDjRAc0kLZ+DJTPA==
X-Google-Smtp-Source: AKy350a2/iDgXAyz2I15duRVzNF/RfWUe2X5yUPTIx5R7s1hELle6OJ1gajZSlNCNTiUKs+65j3zcA==
X-Received: by 2002:a17:902:e54e:b0:1a3:d5af:9b6f with SMTP id
 n14-20020a170902e54e00b001a3d5af9b6fmr10620832plf.19.1682223567268; 
 Sat, 22 Apr 2023 21:19:27 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:27 -0700 (PDT)
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
Subject: [PATCH v3 13/47] hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
Date: Sun, 23 Apr 2023 13:17:59 +0900
Message-Id: <20230423041833.5302-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
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


