Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC663680F51
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:49:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUVz-00046L-9h; Mon, 30 Jan 2023 08:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVr-00042m-0v
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:59 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVp-0003XZ-EX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:58 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k13so11719067plg.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=QTLCshtcz/fLY2ur12iJHAx0wZ0wsJFMpoilaZGob9D7nb8DgZGGX0dOO3LffiVoyi
 V3oTuv42MaST4hkk5HhU6S4tTaTK7nWOm1Cp46P61UhOLSm70Mid+QNXPjhDMHMil1vs
 UBcfHR0Mw7uLlrbXkpJoZOk4LZElJ06BF/OJ3ZVeliIL89+Gc9iLgptu9bM+Fxz+Hw+o
 QvBUMBIIiOXkxLTmE0/vcXqUlzR98YGgkTW488iygHcfg32bX+GZQLvRdpqbk3EetEnV
 I9h57ZwiD8V1wMh/hcck9FhZ/+lIW78uMN5tJ0VRjIlSsxmahmud7Sur+I0VFugybjjg
 BsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=OHuu+/eeGhA15jm3F1XoWSiWFeSY4XyovC4+04GPp0p9qNZKEUKXO6TxgvVt8brDmN
 UAmPagSzR+eWjYhfptHnvdE1DBVWvEWfpKmPRR1txBxjTY2h47hvd1lF7V2VZ0giJqEq
 aClKGuoFeNjweDTJNV+9LDl9n4MMMAetcDXuksgv93hHda5OyxnTY53V8aglZFb2w5U5
 7voBFEJ5Ov/uthtKTPlkmmsOTtkAu1Uvd19Sx1mNq0B51B+nQRlTguezCO2tiuNAZk2q
 6MB3Wx9ni7DiVqcP5y0jtKUoEqF2chNkbGpwZEFQluBrm6l1Iiv3hXdb1XMAvmrFxbAr
 sEPw==
X-Gm-Message-State: AO0yUKX425Ds4KOmjMQyPMIPVMOlOeOBem8fQB6wg56AZ/3KOFha5BfE
 1L4bK1h7UxOyFTAUPdeGgWnbuQ==
X-Google-Smtp-Source: AK7set8bRH063ylYHXKac6ftJj1sO9FB9pktD+iKmx1JK83w7c4E6KSrWTxi6JQskRqJ2SKoEBh3hg==
X-Received: by 2002:a17:902:d102:b0:197:8f7a:b01d with SMTP id
 w2-20020a170902d10200b001978f7ab01dmr730860plw.10.1675086476838; 
 Mon, 30 Jan 2023 05:47:56 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 10/28] e1000e: Use memcpy to intialize registers
Date: Mon, 30 Jan 2023 22:46:57 +0900
Message-Id: <20230130134715.76604-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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
 hw/net/e1000e_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 6a4da72bd3..87f964cdc1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3511,9 +3511,9 @@ e1000e_core_reset(E1000ECore *core)
     e1000e_intrmgr_reset(core);
 
     memset(core->phy, 0, sizeof core->phy);
-    memmove(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
+    memcpy(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
     memset(core->mac, 0, sizeof core->mac);
-    memmove(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
+    memcpy(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
 
     core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
 
-- 
2.39.1


