Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D06EF24C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYA-0003Ba-LF; Wed, 26 Apr 2023 06:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcY6-0002xg-ST
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:00 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcY5-0003H6-6u
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:58 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b620188aeso8232618b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505536; x=1685097536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ho7Ifk220llWAYq2NpVv9HWCzuj9d3CRqUY2rx+9SrM=;
 b=yfXnIfAszULTcAWNYR7tyuIg+Y8uZ/jvFFy38weM8HkQtzVV12DFAOygtxtP6TxBph
 dcleSf5tHr6G2SEQmVly318DyJZy3Fj7a8rrY32Fnmfr3Iwgcp3KND65nxm5yu1SBr6m
 b2PKw1s2V9PUNtapkbegRgJXe8HlkKyppUiswBff3DE2M9I1WUQE70pC166GCziuZbyE
 J2FWttqkeuqM1LgVAfGLL7B93Wtxogu0SgMvuIwyPJohxAtJhyFHRAaAI7/c/LsgJpSA
 ZQUchjWymGrClROwl/UBNes/Sjfc1lFmshsZJfdhndDIs4I1OVUOWM9cX/Crz6q8LRxW
 /z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505536; x=1685097536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ho7Ifk220llWAYq2NpVv9HWCzuj9d3CRqUY2rx+9SrM=;
 b=UvgYyXla3EhL/ia8mrWQ7VKoX/BD/AUEhPp/DWVocjQMJf0hhrPHO7h4gN0eN9KfN9
 AT0yhTpEUsMOzu2sQXHz7xFW4tJNHikt8RPeKHLdoiAnx4mhRls76gNjjxdq+3aI1aEh
 PJe21qxOHa+nJjHuOpcIeqab6DHEnqIblyUm8oMCLyGrlMjUtc8G7sbAd3JfCSE/y7uX
 hcYAw7ZNoSC6H+KOCkJBFAabVAhdLtn3W27gbDfQGDOyh3Bhm3NvgxMgaGMJ4w+qpsYy
 r54PXQd0HD+UpwnXHqw8lN9nu9wEnD0OdTWL4z9Sf0ugHN0vEu3bsRIbALfBBC94bLDh
 IKvA==
X-Gm-Message-State: AAQBX9fOIkXgNSqedCNMg9H6BkdLVXFXVASRtDWQEz+EZL/D3I9yT6WG
 DcePo5SMfarCqreae4c8YL0CCg==
X-Google-Smtp-Source: AKy350Y6hpF/dFlSSHwgy0ZQhN4bCzi51lwDbHpokUAA6Ihn5/PAQMHXf08dOTbH65C+JrCBU1ylFQ==
X-Received: by 2002:a05:6a00:2e8b:b0:63b:84a2:6f54 with SMTP id
 fd11-20020a056a002e8b00b0063b84a26f54mr26805852pfb.26.1682505535978; 
 Wed, 26 Apr 2023 03:38:55 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:55 -0700 (PDT)
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
Subject: [PATCH v4 26/48] igb: Fix igb_mac_reg_init coding style alignment
Date: Wed, 26 Apr 2023 19:36:54 +0900
Message-Id: <20230426103716.26279-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/igb_core.c | 96 +++++++++++++++++++++++------------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 56a53872cf..20645c4764 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -4027,54 +4027,54 @@ static const uint32_t igb_mac_reg_init[] = {
     [VMOLR0 ... VMOLR0 + 7] = 0x2600 | E1000_VMOLR_STRCRC,
     [RPLOLR]        = E1000_RPLOLR_STRCRC,
     [RLPML]         = 0x2600,
-    [TXCTL0]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL1]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL2]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL3]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL4]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL5]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL6]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL7]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL8]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL9]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL10]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL11]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL12]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL13]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL14]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
-    [TXCTL15]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
-                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
-                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL0]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL1]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL2]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL3]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL4]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL5]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL6]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL7]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL8]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL9]        = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL10]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL11]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL12]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL13]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL14]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL15]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                      E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                      E1000_DCA_TXCTRL_DESC_RRO_EN,
 };
 
 static void igb_reset(IGBCore *core, bool sw)
-- 
2.40.0


