Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26AB6EF240
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXa-0001Ui-IT; Wed, 26 Apr 2023 06:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXY-0001MR-Cz
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:24 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXW-00036C-OR
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:23 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63f273b219eso3370027b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505501; x=1685097501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwy5rvMUqP3oelPjHxfIZcxpBNQc9ghPL/3JUmVe4oU=;
 b=0MLh28W8nT2dLpm+PmyKJbvKoo70w2guKkOeT6qvcJCmJd5y+SZQJHxLN+NyTyP5Tc
 JtOEEXIbn1iE4zBLSrOfqlrUFFMnBg2ADWWFuEiJoHk5L481VhpodiZdro0Emtn9YKwO
 90+kcw1r/5WOBU8RHbDqxSJCy15SZ6htq+HE6PLaa6M4ycqML+7YxYFq/KYJKqhNxM6d
 RIgnsOctbk2VD4lovcFPxmPE1ezD9eTas2/YVI9PWWcDohHSz1diBx3w/340GJT8mC+q
 w26n9BsvQJmotlPAdru1plt1V+pmR4iYsdtq//GCN7W2je07YXKDpMIPd39RnCFA6hWs
 6SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505501; x=1685097501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwy5rvMUqP3oelPjHxfIZcxpBNQc9ghPL/3JUmVe4oU=;
 b=ZOY/uSGe03BSuwxB8fUKKfbNTxm9m8kfFZP7l6fTczF9AExmtO3KDCPBf9oFL9AGu4
 3hFzymiUXsWHSqpPNwHEzngtjs4ZsLq+mG+XzXcTEvHxsyMBAS3O0VZn+e2r7I3EjKDH
 X3QPRdobVSlIe37k/t0Wbj0XOWM9KHWdh31Fp2m05pmAIVd+COyAjGtgC+a0b318mpQr
 3BHoAlz7AlQ4ptWsJvbdichze309f6KSdkeb5NBWT7PYmLLTlquGysgKAxhu2XzdcQd3
 E2cLlxpbwiWiltw0Ddq7M/wXB2iamaQr5RWWdy5+e3BehKnSi0Ld9AqxhF9h7aGpo7RU
 aTuQ==
X-Gm-Message-State: AAQBX9dCZjB7LK8Z75W5Oz4P48l1SRcbQ8b3JeOdMJRkYazvkEYCO8RK
 FZBNxAdlUdkRw1NCAYu+tZuKxQ==
X-Google-Smtp-Source: AKy350arCH229KHj6sNierzRm5VuvD+Ij4+qgpoWa5vk+c9wBwU3ngS/LrNEZPCIn7pBRpVyge5Paw==
X-Received: by 2002:a05:6a00:b46:b0:63b:6b43:78c with SMTP id
 p6-20020a056a000b4600b0063b6b43078cmr26301469pfo.29.1682505501457; 
 Wed, 26 Apr 2023 03:38:21 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:21 -0700 (PDT)
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
Subject: [PATCH v4 16/48] e1000x: Take CRC into consideration for size check
Date: Wed, 26 Apr 2023 19:36:44 +0900
Message-Id: <20230426103716.26279-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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


