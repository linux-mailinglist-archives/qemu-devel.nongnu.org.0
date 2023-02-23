Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A76A0612
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8kG-0008HJ-1t; Thu, 23 Feb 2023 05:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kE-0008Fu-DK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:34 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kC-0002py-1K
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:34 -0500
Received: by mail-pj1-x1030.google.com with SMTP id l1so1976134pjt.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VULQj5NfLj7RDTPoNyYcaS23xm3yQNzy0k0wd+rAKig=;
 b=LLg6gk94mR0I2qVZ5Vap8dxrRz2suDinZQ3Fmbtck0YHFDwsCedj+Jmv/naIyTpYx4
 G3YBPhyhnNO1GsRNw0/zWjyMuB56PPeqHi9izErGl+J4Tk+oZnldz2QKcT3Lln+ko63z
 NyGOVVgFpZ2S0q8lEjhfWx94Bephx/KrmLa9uvgCYjU1Uc+WFdUc0rTYwBXfk1vL+i/t
 m04XGMQjhVa7XndT4awEXq+nykpnqkeGIzAGSAgaVkT1qwRvQntbwzFEddRjnmy8gfop
 5sxt320+r4ZsSzgZGorR3pTmj0npr/rx+UOGsOq7BFN0pwI2i86ob6YAD5mc/tZs36i1
 hZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VULQj5NfLj7RDTPoNyYcaS23xm3yQNzy0k0wd+rAKig=;
 b=w3ne6knhvrWMKcSPzcPMDzdEz86G9fl2Xn3n2WI10796IORp4AqP2TTIAR3rNGrfMy
 SWOVMl5i1fXNRivm1iUZt1UHReQsS78qO9wLUxRL+RBXbOqVT1uhmuhZUAUIgpW70Q32
 tkj7owtMX/JHnAH0RwpcKSeSLlwwUDexN7SvdfPuDmlaRbYMQyqBTFtaTCXc9+uF6hQC
 1uqkrfSGIQ0gxa07eezIrMqG6byQPbMIx2U7Cazv0rFhvJF4l1gvBZYpkO0gPIi144uK
 w0HXAymZdPPbXuPBW8//VMaCv4y/6GLSuH3DV/vXfBISOZ2tce0E30iMrnl4dhtFcocv
 EjFA==
X-Gm-Message-State: AO0yUKU+imrVjMeHvVyee2PdNAWwdLlQsnR190mjLpsvv7CC6c7fS6L0
 brOEBCHiNJcK6S4ErbXbyLeKUA==
X-Google-Smtp-Source: AK7set/u2zOICp5RiJRvgcPPR2xQRvHTKIS29C2J44N+l2Jr7mtZGx3S3B64BHYcHa0Vs6QyWgVSbw==
X-Received: by 2002:a17:903:2289:b0:19a:9833:6f8 with SMTP id
 b9-20020a170903228900b0019a983306f8mr17747178plh.35.1677147750981; 
 Thu, 23 Feb 2023 02:22:30 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:30 -0800 (PST)
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
Subject: [PATCH v6 32/34] e1000e: Count CRC in Tx statistics
Date: Thu, 23 Feb 2023 19:20:16 +0900
Message-Id: <20230223102018.141748-33-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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

The datasheet 8.19.29 "Good Packets Transmitted Count - GPTC (0x04080;
RC)" says:
> This register counts the number of good (no errors) packets
> transmitted. A good transmit packet is considered one that is 64 or
> more bytes in length (from <Destination Address> through <CRC>,
> inclusively) in length.

It also says similar for the other Tx statistics registers. Add the
number of bytes for CRC to those registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 4fec6dfe7e..326b9a166d 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -691,7 +691,7 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, struct NetTxPkt *tx_pkt)
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
 
-    size_t tot_len = net_tx_pkt_get_total_len(tx_pkt);
+    size_t tot_len = net_tx_pkt_get_total_len(tx_pkt) + 4;
 
     e1000x_increase_size_stats(core->mac, PTCregs, tot_len);
     e1000x_inc_reg_if_not_full(core->mac, TPT);
-- 
2.39.1


