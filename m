Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D3675410
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:03:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIq6p-0007rk-6f; Fri, 20 Jan 2023 07:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq66-0007am-8L
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:02:24 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq5b-0003K6-2Y
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:01:52 -0500
Received: by mail-oi1-x233.google.com with SMTP id s66so4207796oib.7
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgHjRenA7NpaqR457Q9oYFnXWiPC6fA1CGCdduZQheo=;
 b=B4INXknfQ+kZIBIEu0ua2pmcorJUogDHaPMotAK+NXmrQeljs2UndxP88yowsJB4VA
 8gko7OAq1lTC96tiviZfJW7birTkrq2d5/0KXpdUOwfKOGRH50QRC7u5tdNQrxk99fOf
 YZ3blYg1ixJyG2hr5aznSRoqvkeH85IFNS+dnkpKO6j0YfHbdCiuE7hl/2GSIEQQnF7h
 MKJh55UALK9dF4TtKSkEOT4ZafQJ2oNGprEgwGhqntrk/jdNhqtR3avZ2lHDYJWM4nSw
 7qpQsr4uq20ZgNXex/tPOT+EqwGoJ8YoZ50U6ZCLPFl6QBqySlc7QlDVo4tDghRry/ZU
 atAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgHjRenA7NpaqR457Q9oYFnXWiPC6fA1CGCdduZQheo=;
 b=4xX6eGn3ra6/LGAE8LktDVhCJEcGv3bVRdHxcg2Zoz/6K5Y0UDHS1z/TKuP1qbhUT4
 fYDlmL3jh2sqm5KejqfSN4uuTilp+xYJuxSoNj+NRb67mgUef/CacueHQocPkpsSBZy5
 RjCMtPJYWT+6zOoxUDygJ0eLfEYvzg2e0kM5wUx2rf+vfGYhmmEumfRnMBS4iOSLjuBh
 sXDJ+T7EDY6iJtps2O9UuHwF3IVpwzRxFzFh8LgVlk3dRbv/Lx4VF7/kDFqXYTiUmxSy
 kbeiek1eqv6sKLNK1l880lT/r+e0VjP3ffpf2K4sYAKod5N//Zf1Y3rKi1qb1fW7qYCH
 zUFA==
X-Gm-Message-State: AFqh2krQiuvup14OrkdTYceNGAZ6QMxbOvQkzl6tMD5yhUJJE3B4yB6H
 Xz4ymO/LUbQ8+sEsZsE3Qjk2O0N5kMwNJO4iEms=
X-Google-Smtp-Source: AMrXdXtWlDpRfHt7K7j8Q03T1THev7IoQOCkEjjYuz1A8TOV+yHBRaPurdc4z2G6nIQWGg9K5pxFHg==
X-Received: by 2002:a54:4e98:0:b0:364:c003:2909 with SMTP id
 c24-20020a544e98000000b00364c0032909mr5907786oiy.58.1674216100615; 
 Fri, 20 Jan 2023 04:01:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 o66-20020acaf045000000b003645ec41412sm9946836oih.27.2023.01.20.04.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:01:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [RFC PATCH 1/2] hw/sd/sd.c: add sd_card_powered_up()
Date: Fri, 20 Jan 2023 09:01:32 -0300
Message-Id: <20230120120133.666993-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120120133.666993-1-dbarboza@ventanamicro.com>
References: <20230120120133.666993-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're going to add another verification with CARD_POWER_UP. Do a helper
to make the code easier to follow.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/sd/sd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index da5bdd134a..bd88c1a8f0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -289,12 +289,17 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
                                | R_OCR_CARD_CAPACITY_MASK \
                                | R_OCR_CARD_POWER_UP_MASK)
 
+static bool sd_card_powered_up(SDState *sd)
+{
+    return FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP);
+}
+
 static void sd_ocr_powerup(void *opaque)
 {
     SDState *sd = opaque;
 
     trace_sdcard_powerup();
-    assert(!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP));
+    assert(!sd_card_powered_up(sd));
 
     /* card power-up OK */
     sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
@@ -640,7 +645,7 @@ static bool sd_ocr_vmstate_needed(void *opaque)
     SDState *sd = opaque;
 
     /* Include the OCR state (and timer) if it is not yet powered up */
-    return !FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP);
+    return !sd_card_powered_up(sd);
 }
 
 static const VMStateDescription sd_ocr_vmstate = {
@@ -1616,7 +1621,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
          * UEFI, which sends an initial enquiry ACMD41, but
          * assumes that the card is in ready state as soon as it
          * sees the power up bit set. */
-        if (!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)) {
+        if (!sd_card_powered_up(sd)) {
             if ((req.arg & ACMD41_ENQUIRY_MASK) != 0) {
                 timer_del(sd->ocr_power_timer);
                 sd_ocr_powerup(sd);
-- 
2.39.0


