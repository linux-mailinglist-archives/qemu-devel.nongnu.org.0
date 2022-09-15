Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04A5B9EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:34:07 +0200 (CEST)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqsQ-0003vh-Qv
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkY-0007po-EX; Thu, 15 Sep 2022 11:25:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkW-0007Fl-W0; Thu, 15 Sep 2022 11:25:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id e18so27498132edj.3;
 Thu, 15 Sep 2022 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sFdf1oPA62Q+TusNnPSBgdpUc9EHL+7pGgxHWwy/730=;
 b=Ckkw49d+MbYGhGIjebz6mAwWUxzvLsvR+xu4BqMOzYmz0SJniqf5aVzMc4uaM88eig
 hYtRyuWR/D89IwA1apgd352Ksstz47disXmxQs1FHG1WAMic6fCB4Jqjhod7QfDRylrf
 VccwggvsLfbRhdNyKpPNfjnBsXgHLMYBclnGQLXxcxae0X4a/khT5oX1Vz1h7Ag+3ez4
 j5ubvda0ATKCGzTgQ9k96knd7ZUFeUJJHtRaphTdQJJSItFbNAD6sFEMp/Qq+zW0rCRj
 utaFKtTjUWP8EkcmGJjFn39PWNLEgHYW6zWjmn7Y8sTSmLf0tnfEeOD1IwlKstW0rHgg
 cmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sFdf1oPA62Q+TusNnPSBgdpUc9EHL+7pGgxHWwy/730=;
 b=slZC64nxGoHg/gPW5jd8ieQf869OUpKwY1Xxt7NyAqrtv4ppXJN4WhumHB9KUwgtAc
 vGrUj8+npK93RQ4CMW1UolVClu1PFdeH1/SzuSFyuQ5qMoxRdK1uOxeuK+5aIsO7U5to
 snaTpIzCEW34CkVGkJRDGujv+Gyvd8XVN71hDSSA3Pbjlkj01CSU8zEaL0ogSBgA5kl+
 3HcyONCKGsRwvLZLdoSSwMvJZ4/1RDh3JYd7YXvqfuP3j3+zhytdEJcZJp3QZqXoFzu6
 wO+ZwE9b27cssX6rlZg5l5O6hjvRWQ+eSSXNIZY7FzzsYiPGRqrlNbRg1cM9i4C+DO4C
 k3mg==
X-Gm-Message-State: ACrzQf0a4SzQWGWOv5BhOJsUm6+zmiSIRUkYwYzLV4kkZnVwyuFLApsp
 YGHG6RipR8XKKD82vMuNFQ5mbG0Apkg=
X-Google-Smtp-Source: AMsMyM6UK/8LZSGFTThl5ABlHynNlbsPe7RXpxqUAI6p4ZXtU7lLHiYgRSbrWgu+KEe3C6xi1crlZQ==
X-Received: by 2002:a05:6402:440f:b0:435:2e63:aca9 with SMTP id
 y15-20020a056402440f00b004352e63aca9mr354035eda.162.1663255554666; 
 Thu, 15 Sep 2022 08:25:54 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:54 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/11] docs/system/ppc/ppce500: Add heading for networking
 chapter
Date: Thu, 15 Sep 2022 17:25:12 +0200
Message-Id: <20220915152520.21948-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sudden change of topics is slightly confusing and makes the
networking information less visible. So separate the networking chapter
to improve comprehensibility.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 9beef39171..ba6bcb7314 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -146,6 +146,9 @@ You can specify a real world SoC device that QEMU has built-in support but all
 these SoCs are e500v2 based MPC85xx series, hence you cannot test anything
 built for P4080 (e500mc), P5020 (e5500) and T2080 (e6500).
 
+Networking
+----------
+
 By default a VirtIO standard PCI networking device is connected as an ethernet
 interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
 
-- 
2.37.3


