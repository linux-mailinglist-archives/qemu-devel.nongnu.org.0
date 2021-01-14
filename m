Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC02F63FE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:17:14 +0100 (CET)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04N7-0003hw-OY
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gl-0006SH-SQ; Thu, 14 Jan 2021 10:10:39 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gk-0004IH-Bp; Thu, 14 Jan 2021 10:10:39 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y8so3036730plp.8;
 Thu, 14 Jan 2021 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqcTZr+UBuBY93y+f17AGADvFaFWY8Chw5yZcKTF3D0=;
 b=JKU55CeR1npS7xr1eJWnr1hhVThKFM4Ijo7B2CngTgj+MxyW4bqwMrAWCrbvTJX8An
 meQvHRssF3m6S3nymQzIjfDn29VTbhNZMyZ1zKV1t12jAH11YEOS6kjGbhgeiGTd9VWo
 tsMM479jNXSFDwuBTjUahXl/STQ245c3RHr7rVnTtOetR40zIwoaBoD8raWqZElQ0Uk2
 MMM/CFA6OJ2q3WZdJyQswAcHz8p7aTclmkyMWGDV7sgE0fDO5oPvmsDBFSb7F1xqDXCe
 lPvuSlYJexAFjCv4z26m7q0DGtiKjZM+IevSaCJvuo9/NMTuycLICy/vqN58swB3IOjj
 hdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqcTZr+UBuBY93y+f17AGADvFaFWY8Chw5yZcKTF3D0=;
 b=hpNhRH0HZHumbrQ6ZEgve6DPAoHpvpbvLlOX/Kr+g6ZKUYSQBx4GNR7FecXWvOFgjC
 FpuC/lQF8VUqOXn+dc2dUiEpsbKtQM7BmfCw5ZIR8s8qJXjIjVXDfQjaa2F5sCCglBzw
 i3by5DyATqmhtmc8X/+9Qek9DDixC7M7S3w3b/X+Ad/QS2U1NyAD+dQABezUPOuYn4Mi
 Nk4a6LS3jNMPJTRzllK3Hnuyr6cPAZlE41tBU/2lN+f/lSBK/7qRHknG8uhCp7OvxS21
 C5cURPks6C1p/XfHBrhiJjHD5DtPNwpjfhawTOj9FFe18VCZYrOa0+15rsHYEpQj2kKa
 2FcQ==
X-Gm-Message-State: AOAM53271X7Uj6c3RJGLgX5bXFx8onwi/3VbUSb3SGM+pb7YLA3OI4EI
 cG8RyEdXlkK7tsP1oDaYhqI=
X-Google-Smtp-Source: ABdhPJxrZoAP9IB96M45BnxWp+3u/lnoA71AeQeoF8iWQb1yqrepe2PTTae+sFYFH3i44WBbJk3T2g==
X-Received: by 2002:a17:902:9049:b029:da:efd6:4c12 with SMTP id
 w9-20020a1709029049b02900daefd64c12mr7862715plz.12.1610637036475; 
 Thu, 14 Jan 2021 07:10:36 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 7/9] Revert "aspeed/smc: Fix number of dummy cycles for
 FAST_READ_4 command"
Date: Thu, 14 Jan 2021 23:09:00 +0800
Message-Id: <20210114150902.11515-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This reverts commit 7faf6f1790dddf9f3acf6ddd95f7bbc1b4a755d0.

The incorrect implementation of dummy cycles in m25p80 model is now
corrected. Revert this commit.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 16addee4dc..1e78b5232f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -802,11 +802,11 @@ static int aspeed_smc_num_dummies(uint8_t command)
     case FAST_READ:
     case DOR:
     case QOR:
-    case FAST_READ_4:
     case DOR_4:
     case QOR_4:
         return 1;
     case DIOR:
+    case FAST_READ_4:
     case DIOR_4:
         return 2;
     case QIOR:
-- 
2.25.1


