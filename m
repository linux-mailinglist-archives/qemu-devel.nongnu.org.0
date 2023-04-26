Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8E6EF27F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:45:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZ3-0000bK-Km; Wed, 26 Apr 2023 06:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZ1-0000Rw-M0
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYz-0003Pw-3S
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-247399d518dso4563578a91.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505592; x=1685097592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJaHYb5ZBx6mBlkjO3CEFU89Jr/yyywaCiZzfHpn5xE=;
 b=z8mPbbwSC0TiY7hUVUuIeCn1oPLR0FD/IwYNd5Z9vzKZZZmwlfyjuSJqmH5WFAPrDf
 OjnD8A88yqsp78z8J5AR4kxDlCuTQs7Gl6cE30WcGmp+Tt3VeF85YNIj+TmTpkKGecXJ
 DP0ZPo6lLqHO9IWHfkChswXKNQ80klKLAJ1UQYte3HcygrJiXS3zCkAXBNBdd4nI5+MR
 C78OX7SasiHBlYP4ICrWZBUtee2YmPeDs2pYROVZOwHMAvvNcSxRNq1Gx3nv1A7j5iiO
 xyi3XRvuJuo2cDXlGfhMpABQh6dGuGG3qM+0xaGqqCp0gBo5OBsAA7FExiErR4u+0l8N
 72sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505592; x=1685097592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJaHYb5ZBx6mBlkjO3CEFU89Jr/yyywaCiZzfHpn5xE=;
 b=Z4BDzVV5+xYIDeMV+adw3ppjnj4W8sB4GEw07T3TFrMs02B7caJSzla3uGROJwKZ0N
 xUb+HIFAouBTenRBx+pSQQL/rETha8NzJQlvPB4ExX0sISIal5T1ttQjBR1PwP2EhbpM
 MYcNdY4OEYykMWT+D3nEo2vqAzji/CrUHACnChFV5Zy6cohv21xBWN7e0fdSUEhk2OjH
 sBIoA0ipmB+1sRnv0MCy/+X2ewl7HqK1QN04v5PwwbijZFGCC/nUZai8a/pjAHpVhmsq
 h93PodgO02Gok31RMNt+497oWCijx1G5OnOi48gt/sicXq73BMfZ3FTiBW1tm26K8vQf
 NkwQ==
X-Gm-Message-State: AAQBX9cO91LW2/hKuTVUm4u+fHfVGqcQqBPJAXy32ApU+boleEK9q2GU
 tfpSBCpWuKXh6FFyK3C+4Zx0KA==
X-Google-Smtp-Source: AKy350ZHjs1QrRLgU6v9vUKDDUvDn1TsNnI/paeK13nX3PQWKMJFEpDx7GeS7g4UESRoW045j6RdyA==
X-Received: by 2002:a17:90a:bd02:b0:23b:2f4a:57bb with SMTP id
 y2-20020a17090abd0200b0023b2f4a57bbmr20305000pjr.10.1682505591923; 
 Wed, 26 Apr 2023 03:39:51 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:51 -0700 (PDT)
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
Subject: [PATCH v4 42/48] igb: Implement Tx timestamp
Date: Wed, 26 Apr 2023 19:37:10 +0900
Message-Id: <20230426103716.26279-43-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
index e0433ae7cf..57973c3ae4 100644
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


