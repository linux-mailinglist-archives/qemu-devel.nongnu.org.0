Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95B6EBCE0
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:22:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREU-0007Fj-Te; Sun, 23 Apr 2023 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDo-0006NX-PV
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDn-0001MY-7Y
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a66e7a52d3so27414915ad.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223665; x=1684815665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pp/9xkuxC/gq/G7v3vBMts7GKYikGcY/UqXta/10p5Q=;
 b=Objv0mvThYKlW51Z9INaT84EHJj5Z3Q9VbXTK3OCMqKinBbpd32qqLF5Wc9q1juBRL
 eLEXQcF1ztVmppdFD8MkmfB3BVZqzd74Y5JiZBTObdxgSKZLvTAaHpRxJtzR7CwqTn+A
 JfsbSWhbto4lKUDLhLijCeV+Xto8q+kUtUsfiAPjCJMTFjqm/rO7aLZdwFm3EEI/evGf
 Q2qpjMHMxY6DUyRQMjTtaqUOBoVyc2q/vttfw2Mq2qGQ8QEIxAi8zaF6+DUGFBrKVwBF
 uZxsNynIx03mu5sfZiRP8BKDQWTPJfhcqFDdIm42Vi8X/9PbYwedeNrTEu052XW6QyC4
 m+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223665; x=1684815665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp/9xkuxC/gq/G7v3vBMts7GKYikGcY/UqXta/10p5Q=;
 b=Blwc4KzQPR3URqSOPwB/pSzSCZMxjVeh2dpkIpmWUSkQ/zHyqZDK98Q7X4q9gS8P99
 yJ5hs8sesSL2z231mtw8qGlSPyAM5sWJaAD+j+DTiytse8VVR2KNeuvvuky6pwF6ulFG
 jrcTE66Dhc87IC7bfxvy4E+FZ1cvxVDbvTAfQKm75Y8PcZVhqHWsNmOoqxLBAX/FW9UK
 1AZ0JxUhlPxWcGEiAnA9fBPypxUYiSaw90K+Gt5KkzxZbJDn3gZIdDS3X1Tvey+FzYBf
 TsHll8OrTlTJ0x050gYOj4K6LrucZRav1JNWnzI9aXr6fN6tORhFmVeEMrvWYe0Iv+4k
 Gvyg==
X-Gm-Message-State: AAQBX9eJs9nk704+OArDvPynJ/Xf2m/60sX63vYuEZ+iXDkJ0zFA79lQ
 ZoS6aTXd77ClscD5NBeG3FZSBA==
X-Google-Smtp-Source: AKy350aIVw8v6PEgWn4ittb9IQm51Kop+vNyFfS89oRtrc6HZgMkdzpzSvwZEtmO9yJhKRc9EWhsfw==
X-Received: by 2002:a17:902:b944:b0:1a6:c81d:5f4d with SMTP id
 h4-20020a170902b94400b001a6c81d5f4dmr9821050pls.10.1682223665610; 
 Sat, 22 Apr 2023 21:21:05 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:21:05 -0700 (PDT)
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
Subject: [PATCH v3 42/47] igb: Implement Tx timestamp
Date: Sun, 23 Apr 2023 13:18:28 +0900
Message-Id: <20230423041833.5302-43-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_regs.h | 3 +++
 hw/net/igb_core.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 894705599d..82ff195dfc 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -322,6 +322,9 @@ union e1000_adv_rx_desc {
 /* E1000_EITR_CNT_IGNR is only for 82576 and newer */
 #define E1000_EITR_CNT_IGNR     0x80000000 /* Don't reset counters on write */
 
+#define E1000_TSYNCTXCTL_VALID    0x00000001 /* tx timestamp valid */
+#define E1000_TSYNCTXCTL_ENABLED  0x00000010 /* enable tx timestampping */
+
 /* PCI Express Control */
 #define E1000_GCR_CMPL_TMOUT_MASK       0x0000F000
 #define E1000_GCR_CMPL_TMOUT_10ms       0x00001000
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 627d75d370..1519a90aa6 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -659,6 +659,13 @@ igb_process_tx_desc(IGBCore *core,
                 tx->ctx[idx].vlan_macip_lens >> IGB_TX_FLAGS_VLAN_SHIFT,
                 !!(tx->first_cmd_type_len & E1000_TXD_CMD_VLE));
 
+            if ((tx->first_cmd_type_len & E1000_ADVTXD_MAC_TSTAMP) &&
+                (core->mac[TSYNCTXCTL] & E1000_TSYNCTXCTL_ENABLED) &&
+                !(core->mac[TSYNCTXCTL] & E1000_TSYNCTXCTL_VALID)) {
+                core->mac[TSYNCTXCTL] |= E1000_TSYNCTXCTL_VALID;
+                e1000x_timestamp(core->mac, core->timadj, TXSTMPL, TXSTMPH);
+            }
+
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
-- 
2.40.0


