Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686FB6E89DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNB5-0003O9-33; Thu, 20 Apr 2023 01:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNB1-00037u-KH
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAz-0001RC-TI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:51 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517c840f181so360445a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969789; x=1684561789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkoNbWZG9i1CmIE2Cu19bONHm4V6Lyc/RxJi0es0ArA=;
 b=RsFRoIzDSMapMZJ6F1zOH+pzkwGWA59nMwEa0+4HQpvmpZLGpi3LADf2DxMQxo/Ihl
 if/PX3nahtJtOWboB85vn3FvYOEcnvVhnpZjyTygi94RD8MLudb2+yyOa9cP7f9Jzyg1
 wBALJiUE5GYVkQQqBo7iv65pBz2QldyjkylgRCM2aeX/PxKthhdVpfpmB4v8uzofhdZg
 CeDRW7fR/r1xXrosruYfCCllFe7eO9rhA7H9TCodKFnTmfqXQibMR5/J+8yzdhahnx16
 g8AXD0XtiImiVuoxdSs2cKOp4yFpOXkKIapNHdROUMzpxv+9PdVfR5fZNh0uv4YrJI1l
 YIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969789; x=1684561789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkoNbWZG9i1CmIE2Cu19bONHm4V6Lyc/RxJi0es0ArA=;
 b=jCLSrv50AmMfEclauac9SCkjrWT7AIImLb+ZtWAVnVRR2T6kCkwfPjP2yG+h6tkeJq
 n0W+/PolgLXJSV6jVkuxtOy6Vh4kiPithHU1LyzsG/FKf28ndylCaFdorplbPqz6sgux
 MIkxKp8QmPu80zZKTBmrwrnMEKJ9AilDLbFtpeI+3mS8Ii/ng3jsE5Jge9Xm9ss0aHPR
 r+qFJYuOOouG8bi3Jkrv19Jhovu5b55dDFrRGZNVEW1xB0kkC0EqAVdBZ9bLhapz03pz
 bnqvTPlbmDTpHO8xnRRsa1Lsx0YEwr+f2QLkJbgp+oHNcXNYwXUMGFIx1Ik/EKmFNE4K
 FDsw==
X-Gm-Message-State: AAQBX9dVkliqrA0e3OhGtu/yAB0W5DHuixpHEFZb0mx7n2hLqNDQLKUw
 6eipIj4Rl1uwdOQc+CHEvmpQ6w==
X-Google-Smtp-Source: AKy350akgEeg6Wdmynni6GA/eRiI2+7tpZcPjuuQZ0UGWdrqpuWrMKiVJbUKzeAkZVbw+vCXz3QDDw==
X-Received: by 2002:a17:90a:4741:b0:249:6a63:7b8e with SMTP id
 y1-20020a17090a474100b002496a637b8emr635278pjg.5.1681969789223; 
 Wed, 19 Apr 2023 22:49:49 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:48 -0700 (PDT)
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
Subject: [PATCH v2 38/41] igb: Implement Tx timestamp
Date: Thu, 20 Apr 2023 14:46:54 +0900
Message-Id: <20230420054657.50367-39-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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
index 388614ea10..172543f291 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -651,6 +651,13 @@ igb_process_tx_desc(IGBCore *core,
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


