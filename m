Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC1A680F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUWI-0004D4-KH; Mon, 30 Jan 2023 08:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWA-0004BV-3h
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:18 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUW8-0003cg-MO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:17 -0500
Received: by mail-pl1-x636.google.com with SMTP id r8so4805860pls.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=BHqb9tibDCWVypFmMuXvt/ZKc8VWAe0aQz+AoLxLfxyOlBh+hj+3w8QENbDvHqUvf7
 rRg1VVgqTfDP01UHiwLzDwlfVJmR7T+fUc90eXZ6+esixIZ//K41j9qdI66EgM64C0GN
 dOSh11ZKmrzQ66BzMA47o9hfY+sUmDCAuFJPrt15JnEWHEbtuaN42DP08BCEydqwfA3L
 me9pFBPHBSqz2gRUp5kFjpqLyWUfM/Kf4rqE8gXMme818IlHgWzi6qKYaTO5eeNfSHj+
 TKuPdPs7W5CIqQgWwrzbmBE/Pm4gxHVJZE8lQWNat1DN9c/Sxm7CDGwiCq2eW86nbSvM
 1cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=EAKAELvPHOnYWfDHidezwjofu7I6Bjj8mltHWvCesNkTqvkq4ZY0ugyuCszjKa8QDR
 S5n5bhVZ9HhAILe3kYbH8+MqTY2DsO10vro3FfpM4zziARkuQ2GgXPGacjfVWmHVAuDD
 GPfUV6oA92OecgKlX8wKtGtdyYSlFR/v88biWeONmkb0x2f1bZRxVgf87KwA5i1lfv6W
 HrYddOhdbzNyDADvMS5LP1ba9eH3wnYaflhM6mok8gZI0PxymfghWKoSmCOITGNsr0uc
 RVdMdSI9/Ii40KJJ+Dg41NrKRWkDug57m5aKLkp0hiWJYMpfAO/YNwoNhdVbWIqonV8W
 wIDg==
X-Gm-Message-State: AO0yUKXVpuIHZX6r1MgPkZ2MYvIyfCErfpRz0Y/1WcAwCrO/9/yNyiRZ
 nv4FOdNrryD8BaSCm6krLrIcKg==
X-Google-Smtp-Source: AK7set/AmoRekuEOqbLOTn1tO+UwmunqznbOD3Ezt1RflWvevAbUs8lJFPVj7JMM+W/jvTtGJVi/XA==
X-Received: by 2002:a17:902:dcc5:b0:194:a7cd:7e09 with SMTP id
 t5-20020a170902dcc500b00194a7cd7e09mr6122914pll.50.1675086496090; 
 Mon, 30 Jan 2023 05:48:16 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:15 -0800 (PST)
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
Subject: [PATCH v4 16/28] e1000e: Set MII_ANER_NWAY
Date: Mon, 30 Jan 2023 22:47:03 +0900
Message-Id: <20230130134715.76604-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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


