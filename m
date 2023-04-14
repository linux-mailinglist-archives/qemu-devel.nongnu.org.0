Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731D6E2261
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:38:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHkw-0008Aa-2W; Fri, 14 Apr 2023 07:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkt-00089p-Na
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHks-0001Gx-8F
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id lh8so5035834plb.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472293; x=1684064293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GRV00mR47xt54Z2xfqK1Bfv1vWuZXwFZ10az7Iecdc=;
 b=k+x46ttz7izDY3aLJBBdLhow14Br6aXs2ikXmOdRfBvNr/v+WOFgHz2LwyfP1PWqGE
 CghOX399PkbQbzZq6NE3TREwwrbnx1W/oksiv1a55/U6a1yPrrhwLccVJg1hhxXBmQRc
 zk8Uc8qimzrgjyAhJmi/K+rZRIRLgrw/IOVxqnUMdHOz8sjh6iUrT1HN27ZGkLnl/k4G
 WKtUhmL7TgvZubexpKQpnaBvPZlRKk0BsKqHnwx3ZsiR0UrycQysvk7XIWYjVKLNI9lU
 +/JKf2GavNuumxgA4lF9hRM1Xv8UGUV+X2Bs0Poteac8A2XdSGOjJBS0Id5t3LcWbxmE
 JW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472293; x=1684064293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GRV00mR47xt54Z2xfqK1Bfv1vWuZXwFZ10az7Iecdc=;
 b=gdlOHR5v851IACKc57pSDrKobO44s4bpOVAqYtiRC/GcigiZTjYmXzxG1TtRaI1OYN
 c51x3EeCsKoWw+xi2uOJmOavp9GX1DUEk1U5fkHmBcaxnxVdkLoQL+Kx5R/OONl+r4ht
 Jk41gUK6f/Jf/H43NSrpuJ/HCS//XD5kfCWnVWvGXr5qWpS7PNm/7JLIfZlU/F+ejYJf
 MSfOC4j6NkO2B+E2f0IlFOZ29TWsoALrMoiIjNE3IMXZvrkL6nA2g0rPw7meUgjBUHfe
 2r5vkcBCCXwnAb3IAESLLcVP/vpyRJ0Y5Su+4Om2qofqjuTmfZKSEl5IpHMYwo+PMHOm
 W5OQ==
X-Gm-Message-State: AAQBX9efSZxlK/hBOhCZHW9jY8fkiMhfsEnYhJA0nJOplIFQxuyjLEtE
 o4q09XVH2bAeFxJ+k+c8pGT4Tw==
X-Google-Smtp-Source: AKy350Z/joUC4h3JMSSUgQBP2CXeDu81g18LqvRlROGanFQaYmrg+xMYi40HJMWECykEbfE7vdDA+w==
X-Received: by 2002:a17:902:e3c3:b0:1a2:9a94:2f00 with SMTP id
 r3-20020a170902e3c300b001a29a942f00mr2130727ple.27.1681472292965; 
 Fri, 14 Apr 2023 04:38:12 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:12 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 05/40] igb: Do not require CTRL.VME for tx VLAN tagging
Date: Fri, 14 Apr 2023 20:37:02 +0900
Message-Id: <20230414113737.62803-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index f725ab97ae..5d4884b834 100644
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


