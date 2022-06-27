Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D755B912
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:11:55 +0200 (CEST)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lig-0000MH-Ky
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o5lfU-0007my-VK; Mon, 27 Jun 2022 06:08:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o5lfS-00022y-PD; Mon, 27 Jun 2022 06:08:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 23so8655602pgc.8;
 Mon, 27 Jun 2022 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eP0j2lMLRSaXDCig0lrnVjG3GTAbfYlE1Lq00GjRMkQ=;
 b=qj4DVMYHFUBj0NA5ElIEi2S98Tz4M+QZm6tB5ctW0Bt5ggjnSTiGwv+mQd7OEXQoyi
 4tFtfHgSMx4xh48KZtL1q+H4P6YaqVElkHf+RheBRTSsWYL4Oj7r55fq7j1Ra6C6hp6W
 OZH4LXoUZV1dvSFcJj8NMw2ftxjVu9+ACf0FCuF0XPq1+bW6tFY8JGuiVqJRif6vsV/n
 ZWvKWQ5c8AH4GdpMrKhFFDtZ8AGbvAVgDHzftdAfNbYDc7GMscO3zAL3A2nh7ffErSpk
 J5wc1YJ1T+VI56IDzkKFpJ5BJDS0QE74CeAahgfwBPLvGmXPICY5ulvY6SiinOMrO1C9
 UztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eP0j2lMLRSaXDCig0lrnVjG3GTAbfYlE1Lq00GjRMkQ=;
 b=LO2n5KRZ6oI2F4aKtaARQ14RDKwdMXBK1FLkjyY9kew+hI1qps5vVa0IILT9+fMe8W
 z+pxc4i5UuI7FJokLETGU0UUwdUuzBWBDppx7r1Ccjuy42hDAT3PiJ1sFAjJx2OD5aPc
 8ecp8/SkB7TXjeNC5Bi3wXgmTVDLgt82zoZGU8gbWnuslIHZCZOaZUiGv566CRfK+2k5
 aCX+R+9ZhkF9AXQP0zB57YnbU0x8ITCPVnzHBcZMqgBavND3p7ITRD3aqQV+DOPR9Wsp
 lyWVSk8Hj+lJdo21r4ygqq3OcMwDYy2ArrdptLQBUL/k9g2kO60uTyr3PDu1Db3z4xRt
 KrTA==
X-Gm-Message-State: AJIora8eRKq3bY9VOeduRtjsnp6j/z8KScVmgTmlrOADgh2r4Lpc7TFs
 bSnitg/ik7H2DLIkjgH0Guw=
X-Google-Smtp-Source: AGRyM1tZuaFcufChgOhZelz7wqeBQVAcx4EsBLjH/Gtpj84k/p6t3xJaa1be0xs3b5FDsT4gQcLkqg==
X-Received: by 2002:a05:6a00:451c:b0:525:b802:bc3d with SMTP id
 cw28-20020a056a00451c00b00525b802bc3dmr4659092pfb.43.1656324507514; 
 Mon, 27 Jun 2022 03:08:27 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm6753675plk.269.2022.06.27.03.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:08:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>
Subject: [PATCH] aspeed/hace: Accumulative mode supported
Date: Mon, 27 Jun 2022 19:38:15 +0930
Message-Id: <20220627100816.125956-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

While the HMAC mode is not modelled, the accumulative mode is.

Accumulative mode is enabled by setting one of the bits in the HMAC
engine command mode part of the register, so fix the unimplemented check
to only look at the upper of the two bits.

Fixes: 5cd7d8564a8b ("aspeed/hace: Support AST2600 HACE")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_hace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 731234b78c4c..ac21be306c69 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -338,10 +338,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
         int algo;
         data &= ahc->hash_mask;
 
-        if ((data & HASH_HMAC_MASK)) {
+        if ((data & HASH_DIGEST_HMAC)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
-                          __func__, (data & HASH_HMAC_MASK) >> 8);
+                          "%s: HMAC mode not implemented\n",
+                          __func__);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-- 
2.35.1


