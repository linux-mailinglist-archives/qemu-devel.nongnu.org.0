Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE467C922
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:51:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzny-0004GZ-Qz; Thu, 26 Jan 2023 05:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzne-0002z9-9U
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznc-0005YX-P7
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id v23so1505870plo.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=pZfPknlEKH39Lz4QlTullMAGdK0Tb13G34SVvhXMhzgfVDtzn8pXdsqz6oqXrVZlou
 xJCVGY9Uew1mNSNDmTz7jL39mETTrDNjfRNEHCWsnYCFntR1zoHvoCSAmkK17bGVRwCJ
 ZKpGkpP0bpGfLnhzq3SSB3l22ZOxJWEWFur6/nITQuDoeXVwE4PfAGXRp9+jDiygjWFv
 fLWCOKJoSk/1PUALmktXzDRM183urJWyaqwO/uXr+HRA1Rd+fcswhSVcbsb5s6cfs0ax
 0dIaJEcLoUd97FfIclfPJsVGebVq/ygHuCUlqs8eWkwdjvoypLaQZ45pvJiC8lXQRjAB
 XSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=emeqCDZ7xukkMBVFE3FSFR026Rv+tZxN1+215toJo1kE+WtFLjXtky4Rymm5Bh8g6r
 GRl7Ni2f/5GWdGdUAI1cj9PWIfC+SWiScZ2yyN4o/R+feeUXnYbSY3EPZXBtBErH+omr
 tiPH3KV4FEQfKyZTdEq3n2Jgz+MhLMB3bjwHoE/87Ofk9XsRBhXmxcUZJpdfhgF/VRrp
 GWnRdjt87g3KqXwPxPUEemsa97U3HU8UOcPH7t8P/76QqhGNX4eT+47i1MhedaCmTiDf
 mnBGutlVmIcwLaT87I2fFjIRLSW603D8yitH5CQnyyQfh7yLT19BmsPdOB/PZZC9tW/H
 kW9Q==
X-Gm-Message-State: AFqh2kqcYind2puEGaSpXoHFlMff/9AEIVos3WQdg/5pPhxUXBDZcCI4
 t8xGXVcxXQNWto/qdBjLBhhMrw==
X-Google-Smtp-Source: AMrXdXuynsXEIE9CxbaJrI7NDaLloNDGuS4XuW6YwA+DluKWeNqeRRlAuCfkCHUUxXHEmUe2GUFf5Q==
X-Received: by 2002:a05:6a20:1601:b0:b8:c659:9d51 with SMTP id
 l1-20020a056a20160100b000b8c6599d51mr44566475pzj.56.1674730088164; 
 Thu, 26 Jan 2023 02:48:08 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:07 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 16/26] e1000e: Set MII_ANER_NWAY
Date: Thu, 26 Jan 2023 19:46:55 +0900
Message-Id: <20230126104705.35023-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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
2.39.0


