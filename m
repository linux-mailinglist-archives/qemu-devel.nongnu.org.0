Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D56A061D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8ja-0006mC-Fw; Thu, 23 Feb 2023 05:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jP-0006dr-N5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:45 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jO-0002V8-5Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:43 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso8261390pjn.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=RkD3SdpHjMH1Nd0uVY/p5abQAnxU4FGGwSS+QP99/TtoWsLqmrTYLPzv0Kx/xkAF+3
 l9xWob3mIWhf5OT5ivbufYXfjjW5AkBRh3aCMyL8eu5CjFw+Oo3eY7cuILXHTk2MLJcA
 TUfu6b8cG0iWSqK6fnHS6S5crOfazlmJi73O/oxSoFaZH1w+/ElvXoGgFrYYhLQ9Alci
 ubk9yHdwual+qi4Faa0iF9k4Ce10FsIZFRF2z5X0SFQIEGVaTl3mqA90p2QswErgXGXP
 mLMhWQJQEOFzeNszTMNHlXq6gbSYGkk7gWcRD83LxJ+z/M90bbmo+ezUtQDNuAlbyQCS
 Tp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZRgT2FmJP6k2+ivrsYlbkoFP3usbYCinymjfjo1wFU=;
 b=h7uTBouDEdjJ/6Dc+wEqT3kkv14julFiQJ7roQn11ZOPJeWrIuT5bMhFEqBye4vEle
 +NRcbugtUMGIhhdwcrfnOWuhGV4cIjBJjgKkoYqlAOdXrHlsD6bVmg4I1KCpo7L6HbwL
 qhBRVknI4AmuQ8uj7E3KSIToXTXbug1zfKBSBBou7w1d57ZVszdDPwLCQ7oyHOAK6Oaa
 GUDRn3XD9AJnfs2oKwvfsHvhYc8heEgEczU/4v0lDiN7zEnOkjbamNi+50Uk9KuGM/eR
 ZrWFnKX7vbSFf61exAXjvj2Ejqpi90oD2cy4z/lnbhSvOB+89BQFEzJGqEYUaWE++xf5
 4JFg==
X-Gm-Message-State: AO0yUKVIPvF6M/DN3+9eYLh7pU8NPPNqQyNOkE46wf4VXjBsJr4Wix46
 MMOyvxP007KbFO4JgOAueUW9I4ilB03gJRo9
X-Google-Smtp-Source: AK7set++mzEIoX7Dh0DVvVparDWYz5sEiTpeparkCXQZcWnwoqinyQw+8ZetJfnpvYqYF/2RliaQDg==
X-Received: by 2002:a17:902:ecd0:b0:19b:2332:18cb with SMTP id
 a16-20020a170902ecd000b0019b233218cbmr14090957plh.1.1677147700974; 
 Thu, 23 Feb 2023 02:21:40 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:40 -0800 (PST)
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
Subject: [PATCH v6 17/34] e1000e: Set MII_ANER_NWAY
Date: Thu, 23 Feb 2023 19:20:01 +0900
Message-Id: <20230223102018.141748-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


