Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF20685DFA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vS-0006y0-SU; Tue, 31 Jan 2023 22:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vQ-0006uv-QO
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:45 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vL-0000Tr-OK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jh15so8130449plb.8
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=L8mCLd4v3BSUybE9fRMSAGDN6e9G/K5ZmoHSwYLnLP228rMtHYJyNEjTbDNB/Qx9OY
 zeWAM7+EcXPXd9YGuiT8jWHFtgEqDVHMfn0cHgfHsALevXQPR8XuN0nE67P2bUZS9Rw/
 XcQYPKZdl5VtWAsesAboIu2TFMhejf7GIIvm80LVpEsB6+If9Zab+ulvVzCVs4qriuvI
 Rzx4Rq/Il6lQbW/uapl2jJQYBJcJUvDlKkcqdc6uc9Mg5E9iG2CWOmpu+JlaX6ocJl+u
 mnJnfif8BLONh7o83WYYWyZGEPbOQEf9nrXwYWvLDtotiCIzp9qsjAoVpCkejPOrxpd9
 87Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=AzmldjkxdD8wEAvBJEluX//cMmiORXG3+hwZJbEOZhZI5r/Kd6CuTwKv3InxaJ7c8P
 IfnHDEXLd6+gNZ1oeLchcJI0JoMtTObB/74Rj8T33wEnpYQbE7+r8xlP0TK5ExLfa1Ud
 T5P3ZG7dV9HsCFExRl2msWc4zYUYGmEYzlisVFv+JvvNgXVu4XD0GsiRgSpusCTFOCDR
 Y0YAsNdAPvUWsjSJZ1owuoQejQFfMyIPoejS+Gc9T9if4ru7K3dHrS9Ox1SsrA9eaUIB
 NjwIDZvmxTSdqz/0bM0UEf9y7Fs1PihgKj3kxeJZx7DGQFjPjimT/RQObrK5saIn+c+4
 88uQ==
X-Gm-Message-State: AO0yUKV+ueBotyFOf37SChssXOvNjiG8aPcp8/ShnOlR4hJUuEsK4lGq
 FA4YfN2UA+s3Iyed0Ja3930Qsg==
X-Google-Smtp-Source: AK7set/F+tI6qDsNLyJnIy5q3Pu0NWJM9j3GjuAsg5I0ZbQmhwxm9WF6yoJpTJDytkJkRv4LHWOddw==
X-Received: by 2002:a17:902:f0c4:b0:193:6520:73a4 with SMTP id
 v4-20020a170902f0c400b00193652073a4mr1064377pla.61.1675222598295; 
 Tue, 31 Jan 2023 19:36:38 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:38 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 16/29] e1000e: Set MII_ANER_NWAY
Date: Wed,  1 Feb 2023 12:35:26 +0900
Message-Id: <20230201033539.30049-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This keeps Windows driver 12.18.9.23 from generating an event with ID
30. The description of the event is as follows:
> Intel(R) 82574L Gigabit Network Connection
>  PROBLEM: The network adapter is configured for auto-negotiation but
> the link partner is not.  This may result in a duplex mismatch.
>  ACTION: Configure the link partner for auto-negotiation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000e_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d8c17baf8f..736708407c 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3426,7 +3426,7 @@ e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
         [MII_ANLPAR]            = MII_ANLPAR_10 | MII_ANLPAR_10FD |
                                   MII_ANLPAR_TX | MII_ANLPAR_TXFD |
                                   MII_ANLPAR_T4 | MII_ANLPAR_PAUSE,
-        [MII_ANER]              = MII_ANER_NP,
+        [MII_ANER]              = MII_ANER_NP | MII_ANER_NWAY,
         [MII_ANNP]              = 1 | MII_ANNP_MP,
         [MII_CTRL1000]          = MII_CTRL1000_HALF | MII_CTRL1000_FULL |
                                   MII_CTRL1000_PORT | MII_CTRL1000_MASTER,
-- 
2.39.1


