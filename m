Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7D6017CB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:17 +0200 (CEST)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwG-0007mc-1f
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfU-0002Gj-4s; Mon, 17 Oct 2022 15:20:58 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfS-0002vF-LE; Mon, 17 Oct 2022 15:20:55 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-132af5e5543so14379918fac.8; 
 Mon, 17 Oct 2022 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sl+Xgwlf3JmcptDuQ2ViGdnZb/dhS4gihd8ni7BpFMs=;
 b=ay+SfruHtT6MpP+6GFilUMjjShp+1GCe0fvYUL/mQFxLkelkoR+7hydKuicYg91Ucu
 Cd1xzl9bL3Znr6Qdduz47VeNAeovTIUzJrKpXEbqq0Rg2Lxmk+l89oo92JLSELwjoTAN
 3lydjEqeeX1T8fxwV9dGYUmsjuTECnyf4A8LuihbTtEupX8wYj6dP7+I2NRL+9F6A/p7
 GTh37ud9J7RpJM8irlBKcxnJvxV6UWalSZ+qXIX7TqqmsYv31HfuWSG0ov8JeLd2g8pR
 lx95qMv8ZOF4qMerMk+T28fTtHPrIZjBIG5yL4fsUrQoG7RJkSN2oZi1x/UgelnQe8xt
 A0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sl+Xgwlf3JmcptDuQ2ViGdnZb/dhS4gihd8ni7BpFMs=;
 b=nIqJ2ryT4z1P3kNaliE87bzY8MIkM9A633aZGwC3HBYLIu1csoHjj8Dk9uxuaLEQsA
 6RpYhsuIzziqeH4h08Kr0c7qfAUmy35nZjnTgsA1pZSrb0b+uFuyP5hf/tWXKwKXI1g5
 dBmt7UbzoN8YQcV6/HLYMg1K2dOw35Bswedp6eWXLjFJHiL25YoAYIxrcISygcikoWfi
 UA4QcTDWkIGB2VmcvJgnzvHiDheXmUEpu6o6vFCoKvqeteJsY/9eop3Nk6GDdaxX+73N
 LvpSXT9aaCWp510MfP5lUf0nYHEUOINBr58HIag01rDoshV0wCWEEH067tcxIyh8g/i1
 IaCA==
X-Gm-Message-State: ACrzQf1+Z9psJW3wLtwvI2NkD3IOSXv2PzikRGSAYhjp7O55P69cVzVn
 zIjLnEvusVZu5bCoBGNOo5qKrwCwRdo=
X-Google-Smtp-Source: AMsMyM7fc/NGuvZLp7HWwrNDUX1AVJo5bOxA+0npQL+gbd77k7LNtHtE8qZnOMxRJ6904j64owPiUg==
X-Received: by 2002:a05:6870:5b9d:b0:12b:5871:22f4 with SMTP id
 em29-20020a0568705b9d00b0012b587122f4mr6631264oab.211.1666034453047; 
 Mon, 17 Oct 2022 12:20:53 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 14/38] ppc440_sdram: Rename local variable for readability
Date: Mon, 17 Oct 2022 16:19:45 -0300
Message-Id: <20221017192009.92404-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Rename local sdram variable in ppc440_sdram_init to s for readability.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <7351b80fa321c32a6229e685dfdc940232f8b788.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index e8bc088c8f..97e6d5f5b2 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -734,40 +734,40 @@ static void sdram_reset(void *opaque)
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        Ppc4xxSdramBank *ram_banks)
 {
-    ppc440_sdram_t *sdram;
+    ppc440_sdram_t *s;
     int i;
 
-    sdram = g_malloc0(sizeof(*sdram));
-    sdram->nbanks = nbanks;
+    s = g_malloc0(sizeof(*s));
+    s->nbanks = nbanks;
     for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_banks[i].ram;
-        sdram->bank[i].base = ram_banks[i].base;
-        sdram->bank[i].size = ram_banks[i].size;
+        s->bank[i].ram = ram_banks[i].ram;
+        s->bank[i].base = ram_banks[i].base;
+        s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, sdram);
+    qemu_register_reset(&sdram_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &dcr_read_sdram, &dcr_write_sdram);
 }
 
 void ppc440_sdram_enable(CPUPPCState *env)
-- 
2.37.3


