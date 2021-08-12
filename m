Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4213EA23A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:41:44 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7Db-0002Jc-FM
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76S-0005iF-5Q
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0007zP-4r
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so874963wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWrCXYmtjRAj4C2W/jwTV681ZVj1OFk4kh1hAJn5cf8=;
 b=ldLtkpcQfIO4X9+Fs0T3dRlRaZw9qUzoA3obUNyGcTPXsVSuU/7VIN1FC7AZ7OJqe4
 czs9/8JexnaqVQrk0qQNYMW+6EGjEXosVauGqOZSMO0MNqcworSvhWjNUafGyP1JjW0/
 +498IjTp2iuNBFZJBB51gk3SL7GKMzUq1pnek6HsM1zUI7ZbLGNeV1RZACKrbTuGuFo5
 z2X7Xzniy7U+GAD1srek2QRXHjKb1ZZrA+YxtjRCdce4DM2ikeehVnv6DoybgHCYAp5V
 Fvhl7KwreuhB7wm+Ezhbw3e7E3s/ZEXXi7huPy7+LX2A9u30RFdNfOPGdRTSc3zu21tg
 3Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWrCXYmtjRAj4C2W/jwTV681ZVj1OFk4kh1hAJn5cf8=;
 b=q3YHulR70Lhx2DRWJ9zO+YdsjTQ71S2n46/rSjAX9UDSVfACvXSpofEKPUN/e+fiJX
 c9LRtzfHCb4fFRPaeM+uTvJvg2NVoJkp89INbb419T4exGJKrMk14YQJuIVrvnik00Ss
 v29xx6arAGzhpj3Qb7a6wGiNRa9v4B95jCrZQdG4DDgq8TCCIWUpSuCt+8lPaR0+k8W3
 wtaH/syD/HSVhJWaKmKVeLF22HGwdh228gvhcpg0WeOitkXYZqD2m5TO8AvWkNa+aY0p
 i7F6x5meYotKqsxtFg3k70COnaYWVSJjCwcwuPOm2QJ4bblrSdlthmfZRp+HflsXOTli
 e+rw==
X-Gm-Message-State: AOAM531Wt07Hc3QEJFkjkqMeQ+nN9xHqRAc23zrzd9fNUbykAwaTpAbZ
 q9DerV6WoWMWXaijBoVUPbgtnA==
X-Google-Smtp-Source: ABdhPJwrGb1qWvf4WyppYanKBJDB4Mt2ZJE0Uf+bGT67LGbi5GDWgC3sk5+7HxoHaDFVStlSv51ztA==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr10377886wmq.143.1628760855171; 
 Thu, 12 Aug 2021 02:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/25] hw/arm/stellaris: Wire sysclk up to armv7m
Date: Thu, 12 Aug 2021 10:33:48 +0100
Message-Id: <20210812093356.1946-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the sysclk to the armv7m object.  This board's SoC does not
connect up the systick reference clock, so we don't need to connect a
refclk.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index bf24abd44fd..8c8bd39e2fe 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1322,7 +1322,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     DeviceState *ssys_dev;
     int i;
     int j;
-    uint8_t *macaddr;
+    const uint8_t *macaddr;
 
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *flash = g_new(MemoryRegion, 1);
@@ -1364,6 +1364,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
+    qdev_connect_clock_in(nvic, "cpuclk",
+                          qdev_get_clock_out(ssys_dev, "SYSCLK"));
+    /* This SoC does not connect the systick reference clock */
     object_property_set_link(OBJECT(nvic), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     /* This will exit with an error if the user passed us a bad cpu_type */
-- 
2.20.1


