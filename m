Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AAE66A919
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXjZ-0000eE-4Q; Fri, 13 Jan 2023 23:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXib-0000H8-JE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:35 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiY-0005HP-W7
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so2383309pjg.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=lXiblTzGSp/VlnLoUI/hyTbVW1Tcyk/2XJtwdbm6RYx+0Ny9XkB5QSAUcaK6p+dss2
 a0+F4gy6Ee7aPwT+r6uUmCWN+/eCtBkhShct7keFJc3GHZrd/zFNXvspf1SFDZ9k/Xg/
 qXEThy7UeslcC/1ByF3k8bUk8d3wVm2Oe+OTU6J8dBkjiKTAmzJ2Ax6ZO1uxmTillnEI
 wAf+LVABWcOQW60umGzT7kdz2Y4qYuTone2+5Vbu9fRjXar1dijNBUQQq2zGQR9A6zdA
 lA3ZjGqNgn12oepY6zzuZbgVpgjbAzIhp3ID5W0mw7yilmVITjyZO59hAN05uB8sJAvL
 SD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=VFirOUJmbI05eS8OrlGEVh18HKhivurs8f3GpXJIMPH2olcQnnOMGmWbeJCSfJDuOQ
 f2CI9diNWiPDSG4mn9CbjBWPK13RUdvjFV6wvjWaz/iYze9oWJGAsOwaJ+3oM5Rqhd1K
 Vxs+6yAINwxg8MfUtoea3iEk1fz+6Um3ojCNOBWV/08gEz2deJz/MrDtf20WmtcN6QJM
 ad+n3mBeP3iVHGI8/MryqiUbMYscdfQft5oV8Rwr5W6uA7gd3OIe3wEimhNCsp8kFYNr
 h4SyHCYAQty2Sq7R9bcsnaE3gkPx6pTdCRLufUEIhlCkiaU0boJehaOYdrh8473kvb8R
 I8eg==
X-Gm-Message-State: AFqh2kp43l0MzBJQfTq03XoyJJYQntynUUed6/XRvBv7E8iKt1PaQrFd
 T3Uo0nuMkEzmQVXd2v88s7tgvA==
X-Google-Smtp-Source: AMrXdXslockuGn7V3jCu9rLzA38qX+GTuV6x4cq/L7T4DO+qaNz2Px8lvQroFc0LJ4YtLuxI2TYmhg==
X-Received: by 2002:a17:902:d305:b0:192:b2b5:f6b9 with SMTP id
 b5-20020a170902d30500b00192b2b5f6b9mr53547482plc.50.1673668830370; 
 Fri, 13 Jan 2023 20:00:30 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/19] e1000e: Set MII_ANER_NWAY
Date: Sat, 14 Jan 2023 12:59:16 +0900
Message-Id: <20230114035919.35251-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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
2.39.0


