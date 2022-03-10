Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2B4D40CD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 06:27:05 +0100 (CET)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSBKJ-0004Xm-IL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 00:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nSBFj-0003bT-My; Thu, 10 Mar 2022 00:22:19 -0500
Received: from [2607:f8b0:4864:20::436] (port=44608
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nSBFh-0000ze-Gd; Thu, 10 Mar 2022 00:22:19 -0500
Received: by mail-pf1-x436.google.com with SMTP id u17so1987472pfk.11;
 Wed, 09 Mar 2022 21:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBQTtlB0KqlIMhJnql0rNU1+jRIZv2h/2JcGaWNnNiA=;
 b=JIrXjceNk7xl5elE6naIXZ06Umw8/iT7fhV9k6CsQPFEBBM8WSsg+Pp9pkLh+2OdCv
 +ncyV6F0Lmk8mC4OZWi4abmPwq6/+rOQ+VA6n6dSkWR8Tgp+PcpdNhtA4Vz8JU/J6gO5
 PLz1MUDp9JdYNOYQEeEFZrNzZULo2z8n4q7TKEEWH3Uplm46ko82XHodGeTfzINyz2R+
 5X1vXQSgIAMUpjY5bmBSI3jPJrO7vQ6c4boeICwY/C3ZfJofi+L7IGuJTnbrlP807hTS
 8Pj8yk1niivYbv5FBjHJVYRX6VU3YIroa0eTea72538oTDLTi/ywX1IucVTjxouawONg
 1lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OBQTtlB0KqlIMhJnql0rNU1+jRIZv2h/2JcGaWNnNiA=;
 b=p4Upw86EkyGNKRohygEqieFuDi+XuBV5gbNG3abPmW595/YrFSpNw9D2BV3t6OcHQA
 j29vE1wjm0DydTNqbRhh3FmhiuEG6Dcx9/APCksCXmPbiJAcr9xfzBMZ1NBpZRppEi5L
 fxBjPLFjYQFOdQYNAUBaAqv37onhyuyBuOSigo3r20J9qKHZayczhKGYExfDz0S0kYst
 YzXkcKSGkB32FFQEdbiqbaBKz7I1/KuHtfm8zr+Ug2+LSyLWJQ5wnD5qc2tdn2J1b2XR
 amdckXHHT/boUzCaeWutWblO5Jw14nwYf+qrnBcBdBstttGDLKQK/b0V07R0qlbbtawQ
 Im5A==
X-Gm-Message-State: AOAM530vLNW1VKN3y5llHSdTj4ncdvDQBfbJePT4+0zh1yLWbfTed9Ei
 y2JeczRjtoAsYuRClZfatpc=
X-Google-Smtp-Source: ABdhPJxYH1ZIIftIDgCe8EvOXoHVnt9D4hvdQx62mSmeTddxOh95jKcZVOgEEaJuTqAZxM0mmXII8g==
X-Received: by 2002:a63:7158:0:b0:37d:f96f:3c78 with SMTP id
 b24-20020a637158000000b0037df96f3c78mr2601238pgn.378.1646889734784; 
 Wed, 09 Mar 2022 21:22:14 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f76735be68sm2237242pfu.216.2022.03.09.21.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 21:22:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed: sbc: Correct default reset values
Date: Thu, 10 Mar 2022 15:51:59 +1030
Message-Id: <20220310052159.183975-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to correctly report secure boot running firmware, these values
must be set. They are taken from a running machine when secure boot is
enabled.

We don't yet have documentation from ASPEED on what they mean. Set the
raw values for now, and in the future improve the model with properties
to set these on a per-machine basis.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sbc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 40f2a8c6312f..857a947b68a2 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -17,6 +17,7 @@
 
 #define R_PROT          (0x000 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_QSR           (0x040 / 4)
 
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -50,6 +51,7 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (addr) {
     case R_STATUS:
+    case R_QSR:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
@@ -77,8 +79,9 @@ static void aspeed_sbc_reset(DeviceState *dev)
 
     memset(s->regs, 0, sizeof(s->regs));
 
-    /* Set secure boot enabled, and boot from emmc/spi */
-    s->regs[R_STATUS] = 1 << 6 | 1 << 5;
+    /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
+    s->regs[R_STATUS] = 0x000044C6;
+    s->regs[R_QSR] = 0x07C07C89;
 }
 
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
-- 
2.34.1


