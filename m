Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00567C916
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:50:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznq-0003bw-8n; Thu, 26 Jan 2023 05:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznL-0002nE-Li
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznI-0005LU-2w
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:49 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b10so1176166pjo.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=Z7SvaEdnlyYrPQLeRmaXv0Thjk5HNNI1ZBEjC7ZGWqhaMCBnqUUZivZPk04A8zxpzG
 GuszV3iRt6zaGPho8aMPz4DChANnPo7lQs5usIJirVhn/sQZoKm9l8MG1hBtZEpxX/5g
 f7M2V2sc2PUANl3hd4yI9fTCXaRBW0Ehk9EHZU4yxcV1jpgENTJ+wnBQ6OpKmeMT9jUi
 ATvJf/TqbhZi+4FeptWA2qvWT04XukOX1Gz/4bsdReG+w/eU13pP8Uz8aloD/fDqIL2+
 4NadkiGxFHdjQA+xruM5iu2rJQsKIP0nSiCGOJoarN0Y0XMfT1zRfgDpMRKz12yIZSwy
 NZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=M/6QN24H+U68gcSMlpSgd343uG2yNuWeBMdsiQcrLYIIfeh8oDqRY/JeIAlvoNTcbX
 xsG5MQ7C3awtp8lSXOg3O6Q2q1GG4Ao1Wx1Vn4kdr4OMrh5Acc8+/RV7GF2GrdbkfZpZ
 AztMT+3mSP5Vq8JzSM9UnhmC4km57tSPb9GBQyTGvCtlDmYi9YbYhojlwKw4v22BO0JC
 e6fUr+NqhvoSlxuyLobIzDwp+ADJCLcyzTDTlqUGi0+WI8rLoOpJERrtf3oz6/xC4xjC
 Vj116V2X5C7+COF/qmKKrhxM1j6ATIzCeZ/MqEz8V1cafw8PHDA9NCcIRy8RYYzh6yPB
 iVNA==
X-Gm-Message-State: AFqh2kr62sfoNs9UXQT2a8xR/QucF9gSxCnM8QLFCA3x5A4dGsDEc75E
 +CqJXF7rslxMFibhDSWvEV+qVQ==
X-Google-Smtp-Source: AMrXdXuBmlDrXhFWUQp+jFrm3MV/p+OkcuBsmIrLkOlDBeI3WmdUTJjmihqJR26109w6zdp5HD/VXQ==
X-Received: by 2002:a05:6a20:d68c:b0:b8:65b8:6a4e with SMTP id
 it12-20020a056a20d68c00b000b865b86a4emr39437874pzb.45.1674730066108; 
 Thu, 26 Jan 2023 02:47:46 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:45 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 09/26] e1000: Use memcpy to intialize registers
Date: Thu, 26 Jan 2023 19:46:48 +0900
Message-Id: <20230126104705.35023-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
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


