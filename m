Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E16E89CC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9t-0007Na-T1; Thu, 20 Apr 2023 01:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9l-00078t-Ef
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9j-0001HJ-HL
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-246f856d751so422713a91.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969710; x=1684561710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwy5rvMUqP3oelPjHxfIZcxpBNQc9ghPL/3JUmVe4oU=;
 b=z99POhVF1wAAkbCarreAxiBmsXtJoW6piDVE72G53O3UfHzCh28ssQG6cD4IcyyKPs
 mC1Yxk2RdiXRdMSyWNUVyNyujCVmuIfFB+HWjWotFDIlRCK79TYQJCwC+wCkyxt4ug5w
 PJqtVrLXvXBZb3372zb8nDel+mlvGDzYovkL4uTPn4FuEVII9+gsmqzKkcAybRkCrdk/
 OqBFw1/FWRMV5t9vLGvzBPXNfcskP5p4GSFQpov1ufuq/gfF9dZaknLvLrpXGTFpiORr
 vEbc2yG95IOOZ+g/fZWeV+CW16FpWrzQXegbVjQLocVptHUFfT9n1I/vVnVu3EnbBUjn
 hCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969710; x=1684561710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwy5rvMUqP3oelPjHxfIZcxpBNQc9ghPL/3JUmVe4oU=;
 b=g2VhqEiK+RoeOJUOnycQnrewZe7E+pnYbPjxVlrOaoJ4AKHVKP+WGXytgrlMarvQCA
 nhVlpg8FnVaRkXeeQUQssijD6Mv8/J6B9HqjtE03QJMvqMqkRFmf+FQtUX2zh+oYSbg5
 g7U4Q/xREjEGIurwuY/mrKGC/dkTv/WxM9qn4ZbjbJ5kkTrpKv9JFOiuPba18Ip8lQcp
 1HSwKflGsfbr5/89u3Vxu2hn4ltjK2bS7wwrQUnpGB4w9hTgAyvbuZ/p0p8FFQBurT93
 NFl0kp/I6WGFecetkePIHBdA7fD2Xh0POsWXUzhJ3fBkuqvKSwjfGESVz2mAbZCvqKXJ
 iL3A==
X-Gm-Message-State: AAQBX9clNk88D18zB/YPwwDu0PB2Wc+4zUSkot59i8YxyOIOgMrMJhV5
 B29V/zNB0rJnNkLC1OiRbLgReA==
X-Google-Smtp-Source: AKy350Y71wXpBixiHN//zuNJXObUNIEPzLgN3OformdI5Adw9143eDqsNcHWNDBz6FJ8Em1ldgYv5w==
X-Received: by 2002:a17:90a:4547:b0:246:696f:b1f1 with SMTP id
 r7-20020a17090a454700b00246696fb1f1mr730830pjm.6.1681969709865; 
 Wed, 19 Apr 2023 22:48:29 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:29 -0700 (PDT)
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
Subject: [PATCH v2 15/41] e1000x: Take CRC into consideration for size check
Date: Thu, 20 Apr 2023 14:46:31 +0900
Message-Id: <20230420054657.50367-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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

Section 13.7.15 Receive Length Error Count says:
>  Packets over 1522 bytes are oversized if LongPacketEnable is 0b
> (RCTL.LPE). If LongPacketEnable (LPE) is 1b, then an incoming packet
> is considered oversized if it exceeds 16384 bytes.

> These lengths are based on bytes in the received packet from
> <Destination Address> through <CRC>, inclusively.

As QEMU processes packets without CRC, the number of bytes for CRC
need to be subtracted. This change adds some size definitions to be used
to derive the new size thresholds to eth.h.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/eth.h      |  2 ++
 hw/net/e1000x_common.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/net/eth.h b/include/net/eth.h
index e8af5742be..05f56931e7 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -32,6 +32,8 @@
 #define ETH_ALEN 6
 #define ETH_HLEN 14
 #define ETH_ZLEN 60     /* Min. octets in frame without FCS */
+#define ETH_FCS_LEN 4
+#define ETH_MTU 1500
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 6cc23138a8..212873fd77 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -140,16 +140,16 @@ bool e1000x_hw_rx_enabled(uint32_t *mac)
 
 bool e1000x_is_oversized(uint32_t *mac, size_t size)
 {
+    size_t header_size = sizeof(struct eth_header) + sizeof(struct vlan_header);
     /* this is the size past which hardware will
        drop packets when setting LPE=0 */
-    static const int maximum_ethernet_vlan_size = 1522;
+    size_t maximum_short_size = header_size + ETH_MTU;
     /* this is the size past which hardware will
        drop packets when setting LPE=1 */
-    static const int maximum_ethernet_lpe_size = 16 * KiB;
+    size_t maximum_large_size = 16 * KiB - ETH_FCS_LEN;
 
-    if ((size > maximum_ethernet_lpe_size ||
-        (size > maximum_ethernet_vlan_size
-            && !(mac[RCTL] & E1000_RCTL_LPE)))
+    if ((size > maximum_large_size ||
+        (size > maximum_short_size && !(mac[RCTL] & E1000_RCTL_LPE)))
         && !(mac[RCTL] & E1000_RCTL_SBP)) {
         e1000x_inc_reg_if_not_full(mac, ROC);
         trace_e1000x_rx_oversized(size);
-- 
2.40.0


