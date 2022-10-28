Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AC6117ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooST6-0005Xb-0z; Fri, 28 Oct 2022 12:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSk-0001b9-LO; Fri, 28 Oct 2022 12:44:06 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSi-00010I-SV; Fri, 28 Oct 2022 12:44:06 -0400
Received: by mail-oi1-x22f.google.com with SMTP id y67so6726422oiy.1;
 Fri, 28 Oct 2022 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPsjNWUlnzAtKEaOlOgj7hfAM51su/vOOnHQpznXcSE=;
 b=Dsesw3p43d0C+1rzM8Ot96EzycvHg6LxdzMhiYumppFn/noPkNe9CbUlLR3hdzl51A
 8v53rf/fSH9RxuHhmtH4wYWi1dOE7PviU+muvGvj+BANpCjcWrcYhRksV966IIkAlzCh
 O31IfKHBrvT2QbT2NWBvNYLKStMBI+13uC+7jgdz6hUX0BOAhOZPSkjd2gDyqkEToshx
 tOj4qe8mTfj2TqD/Tn+857gBJgcU8+VAVMp7i6KOSuTWhJSIn+rO0Mhw+qlsFOx0V2Mm
 w83cDxPgL4L+/aoV/+G9U3/FVRjwzLCxtYr3gllAlPz2zqAsxM5XclAeROt8Fj1xfYuh
 ya4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPsjNWUlnzAtKEaOlOgj7hfAM51su/vOOnHQpznXcSE=;
 b=0LJRuysdASnSXLChLal49JRNb+id1Mf4WZJ+BVHuPGiGdsXjABBXivHPtl+GUcJF4v
 R+ZhQpYRx/ViVBKSp7rRjzNfd9En+RJTmzyqWQv2bCLC2ueSA5dioArbVIdGGLz+l6A9
 fkbEkSb1eP8ySj6ExI0Di8UeXBEnsjink/RwWJcvJ796GZK1NqxraT/7Nk1sI56QKniH
 ejMwnC163avUTQfHpfWh7MWM9moArQtJjFZHtEcfbpM9jbenqDmWz0cVaUMoABFdPMYU
 YUT2F/0yR/NemqedTBKlca8pWS7GcZQPQ4QmQf0BP13Tdncgw36L34a+bZ3n+eQVc8Q/
 hZwA==
X-Gm-Message-State: ACrzQf1kQ1LSSc4ocEOnJgS9nh3E+t8scH0RipCJMMnWiKjojU9Dkj7O
 3ew+IbmheIWKegQcEb3NtPopqO4o0z1Pzw==
X-Google-Smtp-Source: AMsMyM6/fOWD0N37LXyjxeDufExVLAF9JZrB8NTgV6zPkoZ3DAlB1B4B6/E+0nGtr5D6P+r1aMZeug==
X-Received: by 2002:a05:6808:1205:b0:354:2815:4f3c with SMTP id
 a5-20020a056808120500b0035428154f3cmr8704402oil.26.1666975443151; 
 Fri, 28 Oct 2022 09:44:03 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 55/62] ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
Date: Fri, 28 Oct 2022 13:39:44 -0300
Message-Id: <20221028163951.810456-56-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Do not exit from ppc4xx_sdram_banks() but report error via an errp
parameter instead.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <04bb3445439c2f37b99e74b3fdf4e62c2e6f7e04.1666194485.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_sdram.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 7c097efe20..8d7137faf3 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -52,10 +52,12 @@
  * must be one of a small set of sizes. The number of banks and the supported
  * sizes varies by SoC.
  */
-static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
+static bool ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                                Ppc4xxSdramBank ram_banks[],
-                               const ram_addr_t sdram_bank_sizes[])
+                               const ram_addr_t sdram_bank_sizes[],
+                               Error **errp)
 {
+    ERRP_GUARD();
     ram_addr_t size_left = memory_region_size(ram);
     ram_addr_t base = 0;
     ram_addr_t bank_size;
@@ -93,14 +95,16 @@ static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                                    sdram_bank_sizes[i] / MiB,
                                    sdram_bank_sizes[i + 1] ? ", " : "");
         }
-        error_report("at most %d bank%s of %s MiB each supported",
-                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
-        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
-            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
+        error_setg(errp, "Invalid SDRAM banks");
+        error_append_hint(errp, "at most %d bank%s of %s MiB each supported\n",
+                          nr_banks, nr_banks == 1 ? "" : "s", s->str);
+        error_append_hint(errp, "Possible valid RAM size: %" PRIi64 " MiB\n",
+                  used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
 
         g_string_free(s, true);
-        exit(EXIT_FAILURE);
+        return false;
     }
+    return true;
 }
 
 static void sdram_bank_map(Ppc4xxSdramBank *bank)
@@ -399,7 +403,10 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Missing dram memory region");
         return;
     }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    if (!ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank,
+                            valid_bank_sizes, errp)) {
+        return;
+    }
     for (i = 0; i < s->nbanks; i++) {
         if (s->bank[i].size) {
             s->bank[i].bcr = sdram_ddr_bcr(s->bank[i].base, s->bank[i].size);
@@ -666,7 +673,10 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Missing dram memory region");
         return;
     }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    if (!ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank,
+                            valid_bank_sizes, errp)) {
+        return;
+    }
     for (i = 0; i < s->nbanks; i++) {
         if (s->bank[i].size) {
             s->bank[i].bcr = sdram_ddr2_bcr(s->bank[i].base, s->bank[i].size);
-- 
2.37.3


