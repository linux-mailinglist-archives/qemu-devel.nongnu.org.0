Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9566EF234
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYJ-00049l-5P; Wed, 26 Apr 2023 06:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYH-0003zr-0Z
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:09 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYF-0003Ie-CZ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:08 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso5501212b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505546; x=1685097546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MRmwwy8OAhnmp58Nb2Kd682XzfWOCrxeSmDJ43dpfc=;
 b=VRC4swqxvCt6up0fUvwgxQ7tZZEeckJz7s69CUjAkWO/hNZmQY05vn64rkJkEjjOXr
 6xbJrCT3Xpj6CgUBMTMOSPUC3GRm+w8cI1hQAqF3iUYggn3eAPXK+r8MYcww1UF1/nU5
 j4rjF5yeR2c/7WxEyfKWQvALYV2gpUeed3FoUZOxw6k1yGC0mq1veH5H81gf+s72jRT8
 DsSdaCpETJNCAQq2p5Ddc79TQVLkO2T+W7uQzeK8ioqxaq6h93ConrjB5Jli6Ao1MuAk
 5BeWmx5k7XUlnQavwzIhlEzMZz16TjgnRQ9CHRJKDtRmMrwNPzLUu6865gEoBrjrwweB
 kSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505546; x=1685097546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/MRmwwy8OAhnmp58Nb2Kd682XzfWOCrxeSmDJ43dpfc=;
 b=Vr7Nzymy530SzGNKmTxobdhcKOqnUr/8owCBroDwfSn7fK74qEtpXh2gYzRVD1XaoF
 qDnLA93QS8i9rxvNBuOP7S5uPrXtYXFpTJuaYcWZaUpkpnTm/PP2X/Ja1CBM2mUirZyv
 o3OlrdbrbqaMRuf5K2IyWAN2mt3gtBEI6UTTttJO3F5Pxs/WVIUZShoqdZzWH1394SJp
 +QRE7EaUzaIIdwD3bt37gFdutr4g51rREh5V9FdWTSmXQZBwmr4/E1+nCe3zaMNmKVQO
 TSDlcuxSiPlUuozseLkDOHgZoviUr7c2iUFBCP8lWEQDff3/Bo7Ur4E3nzojqjoiqGHx
 +2Qw==
X-Gm-Message-State: AAQBX9cZrNdNsLeATK1Wi+RJ3facqyKGFTFgKFCN6L4boFfM4rpizl7b
 kp7fLgoG4yGeXrK7+vyBzgxt4w==
X-Google-Smtp-Source: AKy350YoAhTKx+TeQWpiJMkEQvw1GsiX1WDtJJ5NrTqKBJxruBAjDv9vSpQopb5DzbFMtaXsPJIcwQ==
X-Received: by 2002:a05:6a20:1456:b0:f0:110b:bf9b with SMTP id
 a22-20020a056a20145600b000f0110bbf9bmr28643262pzi.16.1682505546263; 
 Wed, 26 Apr 2023 03:39:06 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:05 -0700 (PDT)
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
Subject: [PATCH v4 29/48] igb: Rename a variable in igb_receive_internal()
Date: Wed, 26 Apr 2023 19:36:57 +0900
Message-Id: <20230426103716.26279-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index edda07e564..c954369964 100644
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


