Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB836EBCED
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDU-0004hY-2h; Sun, 23 Apr 2023 00:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD6-0004NV-Ho
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD4-00018p-Vq
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:24 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a920d4842bso27036305ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223621; x=1684815621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwJfDqqBhjAuYC/ssH4g4y70iA4xa/LgCFt3ljPGHSA=;
 b=pL8D+GIKBVUvjXG+eIid4QvvWaeV+XQhF9Lm2bvieD3uo231WSmJHLLn+4Fetpkfo8
 FHKfRy03vIK6u9kACN1HuYRYkkc2itF9yvDrTbKjhioSZFYjPgNOP9qjHttxzqSWJh/7
 1fPkTqyJm2IzDRpncr0AskdkKiga1AWAgfIgXsewC3+BIr3eY+EGAySTw3YFwNx9dqpG
 oCw09jAwJPrTFI4gzqtrf6rusv/Y4ftaJ1aUboqjjEal6EJOxKsDNyFh7bKlB8xp6D/h
 q5Ry9Ijq6WTfKWTwluG6gKU8LZFIOnfdNgW8ZGc2F2wvoS2rIfpGvNaxznJ0Fzw+7oPf
 wVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223621; x=1684815621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwJfDqqBhjAuYC/ssH4g4y70iA4xa/LgCFt3ljPGHSA=;
 b=JVHkaIaXWDbnYeN2leBydk/j4zPzC3Sblo1AQJGbbEcPujtlU0WLaM97Y8cDGlpdri
 J/PPBwUcSAAB/dsc375fTRxujiNwJRtgY3/Yvyy15o+kaIjRqbxjluZUPjRKjlwzfPkI
 3eu85/THBXSmxpKuOQfFLef6ckNqV6Z9rTCI8BYZlvyBngLTTpqt3kvuupMbO8mk47Fg
 RJjzhb4p6gDcadx7ebrKk/eopD4SEXeU9/cHaVqp8Rpmq7RYm8DMkPazOTIVspL3HFai
 WT9AE1IqBilwhz+sCh8qSqI5vwhuXEDYLSllym90SOfirJTFV2FGx6dXtLwytZaD57O/
 D8uA==
X-Gm-Message-State: AAQBX9chzqZrZsraMuVQ7cs1OV5HMRKyn2RiLsBa+bqjQXKgHgaNKFg/
 JiOgWt6+60OhMiYn9eux4dccEw==
X-Google-Smtp-Source: AKy350ZULymCOM/YDXl1iatQonb7LcsfBvF8IlKoUH3CGRD6pcGEjvrfpvDinKUyj6nR5OXB5GdXqw==
X-Received: by 2002:a17:902:eb84:b0:19e:839e:49d8 with SMTP id
 q4-20020a170902eb8400b0019e839e49d8mr9950062plg.59.1682223621657; 
 Sat, 22 Apr 2023 21:20:21 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:21 -0700 (PDT)
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
Subject: [PATCH v3 29/47] igb: Rename a variable in igb_receive_internal()
Date: Sun, 23 Apr 2023 13:18:15 +0900
Message-Id: <20230423041833.5302-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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

Rename variable "n" to "causes", which properly represents the content
of the variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index ef29e68096..77e4ee42a5 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1569,7 +1569,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                      bool has_vnet, bool *external_tx)
 {
     uint16_t queues = 0;
-    uint32_t n = 0;
+    uint32_t causes = 0;
     union {
         L2Header l2_header;
         uint8_t octets[ETH_ZLEN];
@@ -1649,19 +1649,19 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             e1000x_fcs_len(core->mac);
 
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
-            n |= E1000_ICS_RXO;
+            causes |= E1000_ICS_RXO;
             trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
             continue;
         }
 
-        n |= E1000_ICR_RXDW;
+        causes |= E1000_ICR_RXDW;
 
         igb_rx_fix_l4_csum(core, core->rx_pkt);
         igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
         /* Check if receive descriptor minimum threshold hit */
         if (igb_rx_descr_threshold_hit(core, rxr.i)) {
-            n |= E1000_ICS_RXDMT0;
+            causes |= E1000_ICS_RXDMT0;
         }
 
         core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
@@ -1669,8 +1669,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         trace_e1000e_rx_written_to_guest(rxr.i->idx);
     }
 
-    trace_e1000e_rx_interrupt_set(n);
-    igb_set_interrupt_cause(core, n);
+    trace_e1000e_rx_interrupt_set(causes);
+    igb_set_interrupt_cause(core, causes);
 
     return orig_size;
 }
-- 
2.40.0


