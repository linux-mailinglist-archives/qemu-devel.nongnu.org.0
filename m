Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589556ADC0D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUfL-00082M-EY; Tue, 07 Mar 2023 05:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUfI-00081d-Bj; Tue, 07 Mar 2023 05:35:28 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUfG-0005Qf-P0; Tue, 07 Mar 2023 05:35:27 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so16139551pjh.0; 
 Tue, 07 Mar 2023 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678185324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCjmdbsQxid1obaHtp3lgEThZD4SzjxFBhumiAsIbiQ=;
 b=KVwLC4E1g7PTI/g8IQ84zryA6uFSzt436z5ZuoGi4rzqulx852FJXgdypy5mrLZgXH
 gFrEqxe6b1gw8I4VijplLDHC/j+Cr//MQR+rYqqZqzPJDLZkcrkhdDa8V7cTyIwzPMSC
 vGnwsmyBZhOdv9jJqzjYWr/SKV0uaz77d5zULC3f0O4jvc0AiXuksTQznRpWNGct0WOB
 WCa3H/cX7+UaEtX1a0fOXJyoKSt9Rd3cdBvBIP9Nb5TwdJNaKQl1ObHYFLPhj+ctlBGT
 UpzrBe4tcdTqjR59r9G5yjwj2Fi9KhS1EwOjZGTTl0yo0gSvV/O3/kRQvglaPtULqZZp
 4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678185324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCjmdbsQxid1obaHtp3lgEThZD4SzjxFBhumiAsIbiQ=;
 b=TRXBC2kOUUnc/1+J5h7+RMg63J+gQ7kw+WxH81BqDS+r71xJuYE6L9Il/HlkPFqHqM
 nEsGMz/dS1Ab2dBkGn0Ju93bJjfPUPPxR2XrlQ0CS0mnMVNjF6dw8IPd3pVGQrpWnew5
 0vxR48ER0tTVWi5m/rMSWNGsz08GXcMJdVlQWDZwi/OaYcUA8pf+RzKe/KBbzdzcN8x/
 s2hgT3FZupWq0/Hgjfi6JqJdZ9QqJ8mPr0pqyOSQYhIZmG5ye1yiw6+UW11FFIZ9hIu/
 tyx6d0Z1jVNhYIlx3bYkT7+NWSlnCKAnF02bY93NfWYMAtA1DD9GqRR4tLEcC2PduiCX
 QPDw==
X-Gm-Message-State: AO0yUKWXlLC8ZzotGhvYIuQcn1SLfkzyWXTVO31ezvJE9vE/7JUAbdtW
 5BH3AMr9cVfRnOuNhWDm1YY=
X-Google-Smtp-Source: AK7set+OIsOKk0SP16dx5js8K30TvvZe2D05mKnvBt8ABeivfpy2H3BRxTUx2OpcY9ziBPkVkgn6Qg==
X-Received: by 2002:a17:90b:1b45:b0:237:c565:7bc6 with SMTP id
 nv5-20020a17090b1b4500b00237c5657bc6mr14839477pjb.10.1678185323814; 
 Tue, 07 Mar 2023 02:35:23 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a655b4e000000b0049f5da82b12sm7518428pgr.93.2023.03.07.02.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:35:23 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Added TMP421 type sensor's support in tiogapass
Date: Tue,  7 Mar 2023 16:03:35 +0530
Message-Id: <20230307103334.3586755-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Added TMP421 type sensor support in tiogapass platform.

Tested: Tested and verified in tiogapass platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 86601cb1a5..c1843693fa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -542,6 +542,10 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54, 128 * KiB);
     at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 6), 0x54, 128 * KiB,
                           tiogapass_bmc_fruid, tiogapass_bmc_fruid_len);
+    /* TMP421 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421", 0x1f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
 }
 
 static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
-- 
2.34.1


