Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70D6017FC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:03 +0200 (CEST)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5i-0003p0-KD
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfD-0001sx-1h; Mon, 17 Oct 2022 15:20:41 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfA-0002t1-CL; Mon, 17 Oct 2022 15:20:37 -0400
Received: by mail-oi1-x22c.google.com with SMTP id l5so13220015oif.7;
 Mon, 17 Oct 2022 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7F1ACrj5VK+gCC8xu2+eSyk+37NdAxYY/oB2+sgdH5I=;
 b=j1FHOFGY7NQPk/XRnDpqCBnfWrgU0SCfJBomsx+9T7z/RHYYcWjU8GPmvKMd5+Ka/B
 jxVcy7MTlw3yJKnXGOviG/YLVA3fbhtQauj9600gnB/8rmPnGJ1tD7HNcUZjABZDuJfe
 iE4lnMX7Pp80fd9zIaOsOwI3KRPgfoQCJsEP+R0Tb0xABiT0WrxyF1w6C5w7rwYZ8oQO
 pUnj01/pJSkjcsjLlnMXG14CGJJ7+TXLXurzLf+7bq6mfil0Gbq293t9i5ysSctsnvS/
 uV53XQB/fAcHSNT2wuUE3JNramHMd8a9kvPmxPkDabHzWi/yIlMUr/iMVXEnSjM77m75
 B8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7F1ACrj5VK+gCC8xu2+eSyk+37NdAxYY/oB2+sgdH5I=;
 b=Abq8oIb+prcgbyr9BAJJ4Q9BNmVtYshVrm/8YKGq6owwC4VxW+xnYpEbbdunnSzjlQ
 JfY9Ry3YiAnecK7sMc0u8SSu5GLIYCpQeKRp0zYfsTbwzH4n0QLOSz/mLrf/7Br3U1CF
 rH2dJY/3EfgUxEozzzeH/1os+7PDWeVF61I9kAHkTORo4hpP+jpBAKaZLzTAB3CRaGDw
 l81YIOayS4GLsKk4acrZRSu8cubNGrv9zVG2MtDkT/IDoWDeu8d9Xki1rNJAF4oekYl9
 j3mSNk7Ks4dutykLvRAKXmDu5KikRCya9IxXtYJSStN8MxqH4hyHw+aMYcf0Zw02Pqx+
 Lq3w==
X-Gm-Message-State: ACrzQf3bFEmzFDyoeEZ+vEiXPaAUF34fEvGJx6zN5QD6uRFOvNuspdIm
 Np+jmPIhwb28tZxgz6QSCjS3PND95eo=
X-Google-Smtp-Source: AMsMyM54IeGSW76NaYv/KSO6rKekdAXksNN4chZEi5asQSWXfrnobvUHRRLmhG1SQrNoM7aoxNhIng==
X-Received: by 2002:a05:6870:538d:b0:136:3cc4:78fa with SMTP id
 h13-20020a056870538d00b001363cc478famr16459810oan.278.1666034423646; 
 Mon, 17 Oct 2022 12:20:23 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 03/38] ppc440_bamboo: Remove unnecessary memsets
Date: Mon, 17 Oct 2022 16:19:34 -0300
Message-Id: <20221017192009.92404-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

In ppc4xx_sdram_init() the struct is allocated with g_new0() so no
need to clear its elements. In the bamboo machine init memset can be
replaced with array initialiser which is shorter.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <529adc7705fb3e3e777439895bdaa136bacb9403.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 6 ++----
 hw/ppc/ppc4xx_devs.c   | 8 ++------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index ea945a1c99..5ec82fa8c2 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -169,8 +169,8 @@ static void bamboo_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *isa = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
-    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
-    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
+    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS] = {0};
+    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS] = {0};
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -205,8 +205,6 @@ static void bamboo_init(MachineState *machine)
                        qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
-    memset(ram_bases, 0, sizeof(ram_bases));
-    memset(ram_sizes, 0, sizeof(ram_sizes));
     ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
                        ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index ce38ae65e6..b4cd10f735 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -363,12 +363,8 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
     sdram->irq = irq;
     sdram->nbanks = nbanks;
     sdram->ram_memories = ram_memories;
-    memset(sdram->ram_bases, 0, 4 * sizeof(hwaddr));
-    memcpy(sdram->ram_bases, ram_bases,
-           nbanks * sizeof(hwaddr));
-    memset(sdram->ram_sizes, 0, 4 * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes,
-           nbanks * sizeof(hwaddr));
+    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
+    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-- 
2.37.3


