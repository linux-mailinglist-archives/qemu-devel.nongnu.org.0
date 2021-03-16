Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2033CFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:24:38 +0100 (CET)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM50H-0003G5-3V
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4rE-0005ev-GR; Tue, 16 Mar 2021 04:15:16 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4rC-0000Wk-QH; Tue, 16 Mar 2021 04:15:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b16so7637584eds.7;
 Tue, 16 Mar 2021 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cmN5NzO57LfWfprzjE4bCEYT68GRBf/RW6A3lofTxXY=;
 b=VYQoXJWVpFMgZvORBe3D8isRsM6n7lFPJc+Xbw1i/6MSOV1VwxM5vV5UdgwS/vfLu5
 qdlK0KHgf0zYkyExyBSoNNjBtTGKO6WX/8NfZEXkAHilCLfWwT6+DdQgF7Ks6qZIJcL1
 cSxfBAoc1PzA9u0GCBTNriTN7vOrvzzAyCmmWgl0ApfuICq2iwUORNEfobtQLkM4Szft
 /u8PLde5eCi+PElLdXVZa/MUe5QpwpNY0+x8TFIHVGS15pBtyasR09hSD9EGpeT4TKhY
 GuR5B3Tu3e72GWY8KxDP4SUKTU4QiG0+JA4g/WDwOJywzm0UfFAKj8msmU9Qz6YlJYMi
 c94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cmN5NzO57LfWfprzjE4bCEYT68GRBf/RW6A3lofTxXY=;
 b=UtPU+FJCLVOVTVyTiCiVImF7u9ENGH3DzljsimX4jH4fE3G9lbKjOjVzIlWcDNeUDv
 lb56jgAd+hGKHRUi/V1jMkSfoDtPP4YowKnlhkbtSCNsK347eBBzcn1zOnZb6NUdxXxX
 m5/G8y8Fc3T0B0RTdL5uohCzZUQdll8y13C2u1opIDQCMOftWjsacaNL3dDPEJeuL6lJ
 zu/IVtBKzfiy4sJqoMiKVs6i2gX6rIIQRsLNlY5UNgCbj033+MlfVFG909gNHhvCKak0
 HP1vk5NPE3pXyMv2flhz4f4eckGl+j+lAHf+v6Mo8r/ocCJmlT6GfDnhh6F6WMjgeeu1
 AQzQ==
X-Gm-Message-State: AOAM532LBRmHmU4dVBmXeFLsf+eZI/6SSdDPj+Dv/vmCc1Lpf7+f2dC1
 +j+UC7aI3WUcxJyMbFkrJog=
X-Google-Smtp-Source: ABdhPJzqUUr+3R4gVQOfKYaxtJzA37VLFDdx4PIVbyuJOjoDyutef/x6MeqhK4MxIHbzHLoeHLlw3g==
X-Received: by 2002:aa7:c447:: with SMTP id n7mr34158408edr.171.1615882512967; 
 Tue, 16 Mar 2021 01:15:12 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id l10sm9778367edr.87.2021.03.16.01.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:15:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Date: Tue, 16 Mar 2021 16:15:05 +0800
Message-Id: <20210316081505.72898-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
min_frame_len should excluce CRC, so it should be 60 instead of 64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/fsl_etsec/rings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index d6be0d7d18..8f08446415 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -259,7 +259,7 @@ static void process_tx_bd(eTSEC         *etsec,
                 || etsec->regs[MACCFG2].value & MACCFG2_PADCRC) {
 
                 /* Padding and CRC (Padding implies CRC) */
-                tx_padding_and_crc(etsec, 64);
+                tx_padding_and_crc(etsec, 60);
 
             } else if (etsec->first_bd.flags & BD_TX_TC
                        || etsec->regs[MACCFG2].value & MACCFG2_CRC_EN) {
-- 
2.17.1


