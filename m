Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515E680F91
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUVq-00042O-Km; Mon, 30 Jan 2023 08:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVn-00040A-Td
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:55 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVm-0003Y7-BS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:55 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d3so11628028plr.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=3qjWLPPm+tUvBO/vcTvB0dhCoX1veJWsV60J/VYvS+CU1CyheAmR9aFSUDsF6CWGP4
 Sf3YOpM5m3Ejbpmm0cqHqvZFz1GQxq1sNWzWXxCB1SP1ntT06Nb6iOY3CTdITJNK6cRs
 ylUz0ezARBzQ474FTWavvPmajavWCemWM+fgxVJPUvK4MkrI1XZgf+Pe2NVSPNaBQMVV
 x83Hx5FbQr+SabO0Ptu0Ulx2/D+QDtl0wBwrDsi1g9mQS8VQ9vfZbuXViYsYurzuoOHf
 p5XCjCY6uBhM24sFC0bDNtZUQk37jvXTAmkhG5qtuxyhXxVgnkamzZ9/TzUnoAseMMSD
 qX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=E2xfMrtkP+QcME7C8cN21faHPKcjKK/EKkLkEqiJ3+oF3aJixKMKMb9gGaU+08OnA3
 zSedJVo3epnf/2ik5QWO7jKm8KPTnZresNJ1/khgRAgbkiktddgltqxv9lzghM32D8tH
 tjDuj/gZN0kD5wPm94WXGG454g2CWJO4nmrRtqAtJEJ1ArwO4BBk0+o6s5/eE5ZxjJPE
 MCcHfhFSXQ1qDVtHjyHu2Ue/7Jk3MTYbjURCEO04X+ePvRP9CkjXaTa+ik5zItDyd2EM
 20JxTV9ct5d4W8cSOFZx4SxtkKOQoZCFNK1QosWYYNETwSpfWovmV5+g5twNNTuVakAC
 pq3g==
X-Gm-Message-State: AFqh2kq3wgJtj/TDDPv4iQXHjoDqhyG7aAuCe0SAKuOQDnB+UGOFV9l5
 KzdnSYzdwH5z5mr9RYzDiczuaQ==
X-Google-Smtp-Source: AMrXdXu3OKZASSK1pOpFFuqpemfHQJ9d7e5R3AhGIH8mN9RA+z5nrjbHDx/AOqrh3qrd3Ac1v6bg3A==
X-Received: by 2002:a17:902:7597:b0:194:afe4:3011 with SMTP id
 j23-20020a170902759700b00194afe43011mr44147371pll.52.1675086473694; 
 Mon, 30 Jan 2023 05:47:53 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:53 -0800 (PST)
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
Subject: [PATCH v4 09/28] e1000: Use memcpy to intialize registers
Date: Mon, 30 Jan 2023 22:46:56 +0900
Message-Id: <20230130134715.76604-10-akihiko.odaki@daynix.com>
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
2.39.1


