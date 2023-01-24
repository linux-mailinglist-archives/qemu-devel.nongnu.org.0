Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CDC678F41
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzF-0002rk-UD; Mon, 23 Jan 2023 23:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzE-0002po-7k
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:44 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzC-0002SO-RG
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:43 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso772142pjj.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=BIN7zeEhj0fi7vIUsUEKNXhW2jnfX2BVVVuH24zwtlyYuOGK5FUHzapQXYqmyEf9JT
 mddijqUl6mxBhB/5Rtj3MeAp0sY3VQW0z3pdVMzzaa01IdqiAVrjDWaAY3qVDIYTOy4t
 i2wwWO5jPtEICrMw3uNg6GH8aW0fHh8hbJSBI2yuOXiZkOZsDABroEYsELEQ0lDSYaZC
 g0ENRAuMGO0tbmhgb3DI1MjB4P8HsFvlJv14nXTHe0HuofujZ0W+PNBumtm50/0k/fcv
 dWZbksxhssEIu+65I/r5jx9ab9F2xwP6rLav7knmViOcdTn/x9zKA1nfOZ91NQrzDHFn
 jYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2yWCEgQIhN3QzPkw0K6Wvtt0U+sc6KSxASGdiiNxV0=;
 b=u+KHX0zgzvcAbu7I9YMSwnIuWcCZoIhZNBXSLo20VpacOj6dn2BoauxnZMwD1RzZIF
 5PsVvN7tTgXmU1Kobi4CygnhmToq72kGeo2A9MbteTf5d4/dQgOh1Venmtp9D9KdcNQz
 99anmjlbAG+mUyETF/BJ6qNMJEPejYfUCZ2KBdhKXUvlGrcBzM/yccFWvLQA92mWHQVT
 xc4Bx4nERqNDphByg7t10Ra9wWwDgjiryLjKrn2e+45K+DY+eV7PTiyckaUdGx1817N0
 D7nqp14R1JIsE3qPlNs0jIe/2KH6vRjAhdensALxMXW2d5OC+ez1JBlD/BQ8FR709vlF
 1Hkw==
X-Gm-Message-State: AFqh2koQvDo7m54L4b+6Dm4aV/01GN9nzzwd6u39ari/RaoGSYqb+kdS
 A+76NiTHq6J8cz329fxJqRTwKg==
X-Google-Smtp-Source: AMrXdXsg0kzLuhC07x6OvjBFlI4oTz7pSPro9cJtMFEiiDudfcJdLNewsVzdW9yOmGGJ5QeiRY9BbQ==
X-Received: by 2002:a17:903:2284:b0:194:9480:fbc4 with SMTP id
 b4-20020a170903228400b001949480fbc4mr38524512plh.30.1674534762223; 
 Mon, 23 Jan 2023 20:32:42 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 16/26] e1000e: Set MII_ANER_NWAY
Date: Tue, 24 Jan 2023 13:31:33 +0900
Message-Id: <20230124043143.5515-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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


