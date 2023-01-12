Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53672666F69
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMi-0003pQ-3S; Thu, 12 Jan 2023 04:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMf-0003os-T5
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:17 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMd-0004U6-Qd
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:17 -0500
Received: by mail-pl1-x635.google.com with SMTP id v23so14811589plo.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4945uIF7CxDWO/pb8PosLzZq6NlYd+40zVHvjxEnEQ=;
 b=LXwusgklQXzswVnGkg3c5qFMXbe2xsDBpiXPrXDEI44YUn/k9oN+8K3CENcOJ3bxfw
 oTQ4nfJ0gS5/A56kLbwUAqqrKAQ3X6z4QZQPhfw2XWxS9o17raAkKFmSL94Ul7FhW3LQ
 /ZaiTmkwVzLjwCh9PzGvN5X8PMQIL+eNzrOchtzDWO2NgXm0vkZYWi2RT2RypZqHu2SD
 2VET51/IVp6Kea6TT9Jn6slwr8WIhDU7gOMoJBFdeVjOtyzlmY1uml8aFmA0aGAZMBeA
 9A4sN0QhhuvJLiPiCyrJkRFuPi0m6Vog8WlmpxWL1w0Q7CqyZOLOIsht/WftGhRxI905
 S77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4945uIF7CxDWO/pb8PosLzZq6NlYd+40zVHvjxEnEQ=;
 b=3P4if+xQglF1Hx2QknRuSy6PnltNpniPb4aGOgJ8+WASoxIt41H19Dp9SaoKES3AYH
 LSP8PwYk9lWCoT2/dIQFcnrk/l90sCc5suPN4q4PDmabWyykle53pWlUkMGX+OHwqlXf
 oRV0kmJwgHRLs9bwncWA5+c0+NPqcAMkAJm6gsUS0lHTTqVQ++zkQpw+fPd0oYWNtw4a
 YU4BBib+ZI5t1QpdvS96K+g4j2EAEu6GmFdd/cw/McSg6rL7J3XLYL5wax2XOhwbW5UW
 VvnWJaDFfqTDHHDA2EVYRJ1/PXV7Kb865aL0SqJoYoAoHt8Vhz5ktTNDRenrF8hTX1cg
 Jpmg==
X-Gm-Message-State: AFqh2kq1MbmXMdYXoluSvFF/C1LNcUceS8a9BP4qlx9ww/ujnFNiIeoV
 bZ7MDo2BeGuWBWvhzfX3c/eipw==
X-Google-Smtp-Source: AMrXdXvgMABf9CowRb6MMbYBuxdzgSj3Xk+UKNo9++pnIfx4pmrpAmixbgzX33HESI0cnLUDao/uIA==
X-Received: by 2002:a17:90a:bd95:b0:225:a202:5fb5 with SMTP id
 z21-20020a17090abd9500b00225a2025fb5mr78274183pjr.44.1673517554507; 
 Thu, 12 Jan 2023 01:59:14 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:14 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 16/31] e1000e: Set MII_ANER_NWAY
Date: Thu, 12 Jan 2023 18:57:28 +0900
Message-Id: <20230112095743.20123-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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
2.39.0


