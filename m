Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E264A306DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:53:47 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51Bb-0008Jk-0W
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511f-0000uH-LU; Thu, 28 Jan 2021 01:43:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511b-00055Z-A5; Thu, 28 Jan 2021 01:43:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so2775642plh.12;
 Wed, 27 Jan 2021 22:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k6LtT3oBEvr/RqKzWKwUas7YF00QYlOogchhlo2BSdQ=;
 b=QX1qjqL7glbEpdgVZ3EA4syfl88rIu/Y8YZHtf8phmocJdFYbLpisdO/TxYemgOqp+
 GYIAADthV0X5xn6lEde9M/eWJqq/K0x9Z6RuUIqQE7N+Bb0fcIUH4Rr9HVAoRN+Toz0A
 hAwHZI81VYazF0KPeRpqDT20apbXA1X7ZWa6B2MDzey7VHmJy2ISilbiDIIdKB8g0R35
 yZmUQpZr+vH8IauTj8kELXPlnnJ06PpMwe+fZpOm0LVKACASvUoHJLGk4JxuR3VdAwiM
 LXQTPnEzhmL39hmKZyiH5W+doWtsBWCYli+SU1i/6QIpyhzmmJ1ge+W6KZ9pvr4CggQv
 u3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6LtT3oBEvr/RqKzWKwUas7YF00QYlOogchhlo2BSdQ=;
 b=PU65RAHvhuTT5qcm1uwYaQ03ZWPv6+v2kWgl3aUHql7lrWM1sHJ5+DwInj2m4X1rEY
 m350YdjGojG06qoToE7D8V1N703Y65pm+YKUGe66dSiFfCC6bRylFIku6dOxIi5vggw3
 9VL4PS7oVod/Tdyvfxx7nn/tEUmITgaFb17WFCNFVTS5pagB2pzJE8xzvQoDi7kBAQsF
 CjDuo1JrGoCZMt3geahjNdAx4t3WDooba2Lr9AdqffaV/SS/Y6EIwsNfkewFQ8wDgqMi
 v8B9xDNLhgrCqqRW2Uaf4bW14PYPAb8n4VoSBs0X+Oep8Gg9+w9H43iDa51vXrzvs0rQ
 e5TQ==
X-Gm-Message-State: AOAM532SYXmSq9sj+ihe8R7npCr1zZZAn9VLrRKwPAZBrbhNcP13MHkb
 q2jcUXR39eFd1PJZVjuRusL4tiPupBh0Tw==
X-Google-Smtp-Source: ABdhPJxPTRWKNAHNCuojo+BuwWLzxaBd7E9p3JFqWGRrE2UyHyHlhrzEticx7lPnKHDb5nWdDxtSlQ==
X-Received: by 2002:a17:90b:948:: with SMTP id
 dw8mr9815500pjb.72.1611816203023; 
 Wed, 27 Jan 2021 22:43:23 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm3800609pjh.37.2021.01.27.22.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:43:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/sd: sd: Fix address check in sd_erase()
Date: Thu, 28 Jan 2021 14:43:10 +0800
Message-Id: <20210128064312.16085-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128064312.16085-1-bmeng.cn@gmail.com>
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

For high capacity memory cards, the erase start address and end
address are multiplied by 512, but the address check is still
based on the original block number in sd->erase_{start, end}.

Fixes: 1bd6fd8ed593 ("hw/sd/sdcard: Do not attempt to erase out of range addresses")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index c99c0e93bb..a6a0b3dcc6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -760,7 +760,7 @@ static void sd_erase(SDState *sd)
         erase_end *= 512;
     }
 
-    if (sd->erase_start > sd->size || sd->erase_end > sd->size) {
+    if (erase_start > sd->size || erase_end > sd->size) {
         sd->card_status |= OUT_OF_RANGE;
         sd->erase_start = INVALID_ADDRESS;
         sd->erase_end = INVALID_ADDRESS;
-- 
2.25.1


