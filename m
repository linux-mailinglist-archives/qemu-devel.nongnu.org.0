Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7E67540F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIq6k-0007iK-6i; Fri, 20 Jan 2023 07:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq66-0007al-Bv
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:02:24 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq5b-0003KE-2f
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:01:52 -0500
Received: by mail-oi1-x22f.google.com with SMTP id p185so4225913oif.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1tITeWldcCh2KaEUnv+qt9JQH+1nyZoijghT4qjLpo=;
 b=crZQ2N+xemXhFC5NoJV2CU+2gJ2Nl3JYn9itWyWP4SGMhJ+CvkNxaLkgkHnEw+bWqn
 lKQqW0UhVUAutgYArtqy6Uj3MRKqDuriAlzR925/ivpgHmQgd99DGGCOAunxw+S7R+ut
 yi2CtPtqoje9qQHOu9pweDDbQSXpnCoCYlGk+F4QtqPtmRCQsjx8ge8XCp2o6VAonqOs
 YaNG/vSc7/TbSgO7MnJ2a6I8x8XqImgX/sBylEDPH/DR5PZM7u43i9yge70Te8oQ8E6Y
 kBaGWcl7YIucgKia+vgv4QFWCsoHCASfX+nQXEI2XIf7JDd5ZQQBTnN4Sj+rhV0BGRI5
 6yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1tITeWldcCh2KaEUnv+qt9JQH+1nyZoijghT4qjLpo=;
 b=N8xhJY9sOhmnQPXGhZdWpioNE55pRYAmmBWotMZxWTzS/52XIHHMzZR0omhgD5lxz2
 6ZjV9SHtVsD0WVlQWOkVU8p1lIYHnxVUHgAs8bW4vMRw814MEDCK6FrMFQL1TfVDj9zL
 HXZP0gh+juKWCHJSEyKcGtopi2AZRl0rWYW6T6jyWtWu68/Cg3AdCao/ab5Gps9PyR8V
 q4CalapryOej+gzFq9A2cT/xjrdhMWo8U3v49/ONO/1cHRqW91ZkyZXL52rd04CbTAj/
 XvAPY/ejl6+mSmNNLC86kqLuYkbTFmH3tj7Unohp3vD7cbHnMUhv7WhmL5fYT1DkM5nn
 Kpag==
X-Gm-Message-State: AFqh2kohWO1DVi+0WsoIVbSTSxu7c82oYDwA98QkxItlo/GbZhF0qt+K
 5bN7TIh5ALAgs+mg22EpY8nnUB41eOk5H4Zh/sI=
X-Google-Smtp-Source: AMrXdXtz8qX5MGIgdUG0OzVs31Sx76q+Wq6XGmC/JOIrQlOazLfyu+/yKTcAEWr+mINxMtX3e1snqQ==
X-Received: by 2002:a05:6808:192a:b0:364:533d:8469 with SMTP id
 bf42-20020a056808192a00b00364533d8469mr9269624oib.24.1674216103052; 
 Fri, 20 Jan 2023 04:01:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 o66-20020acaf045000000b003645ec41412sm9946836oih.27.2023.01.20.04.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:01:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [RFC PATCH 2/2] hw/sd: skip double power-up in sd_vmstate_pre_load()
Date: Fri, 20 Jan 2023 09:01:33 -0300
Message-Id: <20230120120133.666993-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120120133.666993-1-dbarboza@ventanamicro.com>
References: <20230120120133.666993-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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

At this moment any migration with the RISC-V sifive_u machine
fails with the following error:

qemu-system-riscv64: ../hw/sd/sd.c:297: sd_ocr_powerup: Assertion
`!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)' failed.

The assert was introduced by dd26eb43337a ("hw/sd: model a power-up
delay, as a workaround for an EDK2 bug"). It introduced a delayed timer
of 0.5ms to power up the card after the first ACMD41 command. The assert
prevents the card from being turned on twice.

When migrating a machine that uses a sd card, e.g. RISC-V sifive_u, the
card is turned on during machine_init() in both source and destination
hosts. When the migration stream finishes in the destination, the
pre_load() hook will attempt to turn on the card before loading its
vmstate. The assert() is always going to hit because the card was
already on.

Change sd_vmstate_pre_load() to check first if the sd card is turned on
before executing a sd_ocr_powerup() and triggering the assert.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/sd/sd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bd88c1a8f0..4add719643 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -664,11 +664,19 @@ static int sd_vmstate_pre_load(void *opaque)
 {
     SDState *sd = opaque;
 
-    /* If the OCR state is not included (prior versions, or not
+    /*
+     * If the OCR state is not included (prior versions, or not
      * needed), then the OCR must be set as powered up. If the OCR state
      * is included, this will be replaced by the state restore.
+     *
+     * However, there's a chance that the board will powerup the SD
+     * before reaching INMIGRATE state in the destination host.
+     * Powering up the SD again in this case will cause an assert
+     * inside sd_ocr_powerup(). Skip sd_ocr_powerup() in this case.
      */
-    sd_ocr_powerup(sd);
+    if (!sd_card_powered_up(sd)) {
+        sd_ocr_powerup(sd);
+    }
 
     return 0;
 }
-- 
2.39.0


