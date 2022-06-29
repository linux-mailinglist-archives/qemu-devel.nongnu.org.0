Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545955F430
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:39:24 +0200 (CEST)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OXy-00023D-ER
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVL-0007RG-ID; Tue, 28 Jun 2022 23:36:39 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVK-0006dY-1v; Tue, 28 Jun 2022 23:36:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id m2so12879319plx.3;
 Tue, 28 Jun 2022 20:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzL49z7f9q1RDvOIK4hpBj6ivrpxB/a+VyPlYZdu6RA=;
 b=Xcir9ZfGotLBQnpB98OqnxLQZF18EEoq+mCIx3ghudRFrYG3mHSTBX+t9mCxA3t+tc
 OsuJl0VWWIDkRAAwomH+B1uL0ph5tiF/JOj7Pm4dMVGoYuqcxBWHln9Mx0rOE+moq7Sg
 wPHD1/C0xHlhyRJFxrLwAiKYWykIzvnjCYU2xBaU8DopY2JubDfsNC0awfdBrPnCUUPk
 DrBWPRfu3GKBLx/nSattyOqAjGxQN6+vYYH36F+g5nhsxwLxOh0TwNR/PUs2kDVtIL+y
 oOl/l8YNyQZekuNRa164HX88nRGT5Yo0+Ple5Pr/Mu0m+4mxYkEvRV2h3oDJLTea1HJ0
 UyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzL49z7f9q1RDvOIK4hpBj6ivrpxB/a+VyPlYZdu6RA=;
 b=vtqJl4uyA33hcdmTWIh/0cfOhglfGkZsGHwV+a5J6o0lJnnILwp/vh7pVtLpDyUJjg
 W1cqQvwV1VtmiHdjcTmDh5Z1xjg4fz9GLcM1fj4DEK2feS1PaJ33zKxhlS47XEJ/AEAf
 sUIH10YfY7bbTaMebncLcZ57aVKTJVhNWCUNvAVN4qeSDQXLg4kIrJrhNLR/9FBKpnp1
 5AXsbhFx1KRgHgM9yNz00QQ15/jGAUJUBCG26qZ0E2rSmaoPj8xZqpAv+tXHO55KBNQQ
 DoF5RR9PmPX30aWdhN4AN40zwDtQLcAWlhH8y4cSX2djJqcL1ZTBg1GVXdltO1WG4dhf
 K1KQ==
X-Gm-Message-State: AJIora9dGulBW9edYmRlaJvDtreblNIlm+IIn9jWNaFlKAbiGiSveGFe
 DmY2ZTkCgNKRTglLBiBsVBc=
X-Google-Smtp-Source: AGRyM1t515/naIwTk0/6JId7zoZdRhFDOLBhzfxJ1iEwpRKeLRh2Ba/IDCEz4bLymS53OOPmU8a71w==
X-Received: by 2002:a17:90b:4a42:b0:1ec:adee:e298 with SMTP id
 lb2-20020a17090b4a4200b001ecadeee298mr3456564pjb.161.1656473796399; 
 Tue, 28 Jun 2022 20:36:36 -0700 (PDT)
Received: from localhost (fwdproxy-prn-008.fbsv.net.
 [2a03:2880:ff:8::face:b00c]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170902690c00b0016909be39e5sm10155813plk.177.2022.06.28.20.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:36 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 01/13] hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
Date: Tue, 28 Jun 2022 20:36:22 -0700
Message-Id: <20220629033634.3850922-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Very minor, doesn't effect functionality, but this is supposed to be
R_I2CC_FUN_CTRL (new-mode, not old-mode).

Fixes: ba2cccd64e9 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04..ff33571954 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -552,7 +552,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                           __func__);
             break;
         }
-        bus->regs[R_I2CD_FUN_CTRL] = value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
-- 
2.30.2


