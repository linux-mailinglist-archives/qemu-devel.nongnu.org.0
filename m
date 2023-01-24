Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D1678F3E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAyv-0002Vt-H8; Mon, 23 Jan 2023 23:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyt-0002Sy-0G
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:23 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyr-0002MI-Gd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:22 -0500
Received: by mail-pj1-x102b.google.com with SMTP id 88so2077717pjo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=GzULZ14UUCNT6JWC5sZDKfbTqFj4BE9RNdfvcD8m6wzl0pyBaBYh0rzJmVLBwrTBRX
 qcQOiVwXDhL2vSUmaRLTmUPF3ENRJ2Nj/bDBxY9YWeujkvyZLJGSy7jBxaJxljO6Peoc
 AaCGUj0Irb4nBuaFtGGWOGaSAbIF/X3/0sCe78T0JGqDccc08QDIzIG2H7rugeDZ4Dx4
 TXkqsArqoP3/vV/JZeovv4B0k2xRDP0k0jXC9FJCvlsy+wf3rVJ01+0cIkxyLwvMhpuH
 3UCMILZf6C9gQf2O2bK3bVIglfgUJCQ6Hbg1DHivHRqplfTR/eiWrukc8gS7RlXfYl8o
 IGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=4DmXWeRrCDsH3Mbt1JJ7osk9M7G7Q5SCPPGdCGw6aQ8PtH22kvz15ubnpVSqAnRrw5
 cMkenoDIf8W0RZDYI09Fi9AG7VhnKqtoIUEMSFzQN5tqx4snTYrzp2453JK3Rc1pLnap
 29QnTdNpYJA1vP/VHrGAcb/rjCbAlS4V2qCrIaXyUxzLMrz7QfXtBHGA3aZI/OySSfDf
 0hNwZYiJm8D/EgH6VIBjNPo1NwTl+RQsQnxnDnVqyL/byBzjG1W3mME/EBObObzzr0FF
 I9jKf5HZlFAydVHPSMF1ZznlDkcJRE0/BWzebczMbPqKKtZKanOahllh8hLGbC1jEPex
 LbjQ==
X-Gm-Message-State: AFqh2kqkYtAWhJAW3ObheUW7Pt8nWab76Tkrxngc++v2OC8ZOOvkcka9
 6KAuhHm9bpL9Dj5q9E7/WPL3UQ==
X-Google-Smtp-Source: AMrXdXsE9D9ySTK+/xu2AT5PDdcaY9YisH5nNGafF5EaG9hdKJq1++fqx0zzz7rM9Ftu3NQLFVEOqw==
X-Received: by 2002:a17:902:d888:b0:192:991f:d8e8 with SMTP id
 b8-20020a170902d88800b00192991fd8e8mr28762964plz.53.1674534740891; 
 Mon, 23 Jan 2023 20:32:20 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:20 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 09/26] e1000: Use memcpy to intialize registers
Date: Tue, 24 Jan 2023 13:31:26 +0900
Message-Id: <20230124043143.5515-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use memcpy instead of memmove to initialize registers. The initial
register templates and register table instances will never overlap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d9d048f665..3353a3752c 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -390,10 +390,10 @@ static void e1000_reset(void *opaque)
     d->mit_irq_level = 0;
     d->mit_ide = 0;
     memset(d->phy_reg, 0, sizeof d->phy_reg);
-    memmove(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
+    memcpy(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
     d->phy_reg[MII_PHYID2] = edc->phy_id2;
     memset(d->mac_reg, 0, sizeof d->mac_reg);
-    memmove(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
+    memcpy(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
     d->rxbuf_min_shift = 1;
     memset(&d->tx, 0, sizeof d->tx);
 
-- 
2.39.0


