Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6296EBCF7
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRBp-0001pP-9l; Sun, 23 Apr 2023 00:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBm-0001or-Op
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:02 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBl-0000kY-8a
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:02 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a526aa3dd5so38184825ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223540; x=1684815540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=UsDQenw0GsOb9iEer5TyzcWo6yX4aDnbWMymCCHi0JABj73PTvbTJxIsL2ZoqpWMEv
 8HWzgY9fsFZGwDZ8GVBMPjbT6R6f4tELRGe2aItEz6xLmhl7JF87DN/7Z5Vm/LomajFk
 5hGiVCgtoYe+zq38pXrMl+uoKojMiKGN+cHOgDS3wfuM4yllRR3GzItjdRVXnppxhIaM
 dvWt5chXBIIgULJOAEvLsbhnTkf7We0FG9cvP9SmS/B7IFEEgC2kx9n4MMSHAKZWUbai
 hEwGE0L7qrggGGUsgXD09I9wfpbO2Be8MsrL/79l2e9zCdyDiWcf7q/bz0aD68kW9VRi
 ihXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223540; x=1684815540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=FqhvO70IlJN5WnsZ6ONtK1PoZf5RhrTP+hWk+jEAWn3g7vpPGACT3/tudpFBfizuX4
 Z7IxRTkvUSEcZHIteFdTj9S0QFNbuSC8+qx+LiBesFY/wlT1CBu5MZmG/XAn8t5S2Df6
 huqhL36tBMIB/3l+8IGwBFl1efuOJ7SSm+D9T2pScBLjFNTQJzPItAbhuIR4Mkzb1dqU
 V9cqQehttdhLthg5IRBAiDjzRI7xtlF65JGbNPyF1ZnQ0nz/Qt8A5TbZyeGr4vaqlvpd
 5pRIj9ZE0smKWH818pntvPTGIlipfULN7S36Iby1VOHhCaeini8lBolb3Gon/ufvtrUp
 rxlQ==
X-Gm-Message-State: AAQBX9erfPlM5lVAtk62a5oXFSRRz9/Lz0MirB+C+CIAhtE+EiEA2YsW
 l2Rhk1zIXwtGtwVroZh2AQuNPXORDgt01wJmyLA=
X-Google-Smtp-Source: AKy350abQNig62S4NF5JSks4WIp3AxdUSocwllQY5LnUAsX6CshdjjU2LZONHaei9ZaRFr6kkk//kA==
X-Received: by 2002:a17:903:113:b0:1a5:167f:620f with SMTP id
 y19-20020a170903011300b001a5167f620fmr8751489plc.15.1682223540169; 
 Sat, 22 Apr 2023 21:19:00 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:18:59 -0700 (PDT)
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
Subject: [PATCH v3 05/47] igb: Do not require CTRL.VME for tx VLAN tagging
Date: Sun, 23 Apr 2023 13:17:51 +0900
Message-Id: <20230423041833.5302-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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

While the datasheet of e1000e says it checks CTRL.VME for tx VLAN
tagging, igb's datasheet has no such statements. It also says for
"CTRL.VLE":
> This register only affects the VLAN Strip in Rx it does not have any
> influence in the Tx path in the 82576.
(Appendix A. Changes from the 82575)

There is no "CTRL.VLE" so it is more likely that it is a mistake of
CTRL.VME.

Fixes: fba7c3b788 ("igb: respect VMVIR and VMOLR for VLAN")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index dbd1192a8e..96a118b6c1 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -402,7 +402,7 @@ igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
         }
     }
 
-    if (insert_vlan && e1000x_vlan_enabled(core->mac)) {
+    if (insert_vlan) {
         net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan,
             core->mac[VET] & 0xffff);
     }
-- 
2.40.0


