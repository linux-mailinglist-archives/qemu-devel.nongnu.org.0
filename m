Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565786EF25E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcX3-0007iG-6h; Wed, 26 Apr 2023 06:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWw-0007fs-N2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWv-0002lL-6J
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:46 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso42051042b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505463; x=1685097463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=DicpEqqXI4YGDoCOa20hvlnvQdFe3BYtqlxDYF6aPDw6xJeQEWjMeMUbBh5EDabb0x
 XkxXVd/sy+jdrtjMYn4vyhcL8OqzveEyvY3W5e6EN5+pnRsP2kw/hyV7CAEiMzkJ/G2D
 P8xS9vxsRf2vI+cPGRqCo7CjI4KU7BdhEFDMrJbu65zHgFa4XgBTgwJ2FVRo5RWt6pAv
 DL6jB8RSBmdSfE+024gxItr9LDC0t8jFG04UNZ2KvBkJGt1wrp8MV5rLF/gQgpiyWm0Y
 x6diSPqChWl0QybuBsNgaQTYNsJuSkg46NENg7sEicABGRvMXaDc0SllXsJ4h6JtgZxV
 cmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505463; x=1685097463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=GoRrvViR07nzl8kEGNfG2TuC7F0WlInJYFoy6Y93nfu88MWokLFL8/7eEP2U7+Slb7
 BevFZpgRJ/HPbURzPT9QhBrdL7fluJUh33pB+5ZfBv+hsrgasTrbWXo1UBu2hS49XY12
 Uek6lY8t/RC5+uog+h2M+BoVm9aS34lf5cMgTD1HXJ7okIPYd6CZGbRG50SsJuxTid+Z
 4LkPYL21qjOaqkkaR8ze42CeyinOFGvhjsTJFdhTaYNpqZF9MLCmlgM1UipeNWMuJgw6
 MgB/RlJND6SKQNQz+tz8dK3jEXebkbR0/qO9Ho7ke0OIHNxAgVv05fvFyrIrZI3sr69n
 cMbQ==
X-Gm-Message-State: AC+VfDz/bhvgO9Pj+R6KG6WdWG+Z3LmJ72WcHzAxZX+onN9+OR6m5k2v
 dXX4+un6dl+hRMIvR8q+FB4LrA==
X-Google-Smtp-Source: ACHHUZ5h/3rseSl/TQNbwXZzEeJcn5dbPfJYjI8iPBK5RQYCzeSoqFUf30o7kOALXPcZVOdKMQWcGA==
X-Received: by 2002:a05:6a20:8f11:b0:f0:a283:4854 with SMTP id
 b17-20020a056a208f1100b000f0a2834854mr2370522pzk.13.1682505463002; 
 Wed, 26 Apr 2023 03:37:43 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:37:42 -0700 (PDT)
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
Subject: [PATCH v4 05/48] igb: Do not require CTRL.VME for tx VLAN tagging
Date: Wed, 26 Apr 2023 19:36:33 +0900
Message-Id: <20230426103716.26279-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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


