Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1F5AC824
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:39:31 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzD8-0004h1-97
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9E-0006ut-Fd; Sun, 04 Sep 2022 19:35:28 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9B-0004zP-KN; Sun, 04 Sep 2022 19:35:28 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1225219ee46so18120541fac.2; 
 Sun, 04 Sep 2022 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VqXniqw9Zh63qugXsqiyJS4wC4jwjztfl5QCDy2Nztk=;
 b=NCpxpFpxdW60SEOoPAb5JjjZndauWBVQUEzI7O/+BjkEXSdgYM3vfSbPOtjPdYaBqC
 7MNnPBdshIXpFBATOFsr1eTYxI6Lb1c2RQJZqDgHogVZx5tdLbrOop81d4jAOHoR1J/D
 g1Ez35O0PcwPrLjWQomMYyjLMD5gTFqU4lRfxInE4BxDf2ZBS1/JePEITaWVfaXO9Ebb
 sVQafZ0c/rGzUoLTJ+uRHKRVSygPJsKJk2gr5gY3hkqm8lFNgX1d8ePA3qFoTD1Gc8IY
 x4iU4AZhowg+6V2PlCg/sEdCeh/N96Eqo9sgUoP9iB9MMdaAtOTWDCfPb44wsyDDm3m8
 2vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VqXniqw9Zh63qugXsqiyJS4wC4jwjztfl5QCDy2Nztk=;
 b=E0U25dgximwVyYxTy/EYG1Id6GYs0f5fcP8Wt76ByH2xKGzjMNVK+bth59mlqFly1o
 G2hXxlfdVxpDfVthMjJF1KI8FRrS2bJPSqLtFC995rDOhq0nYL9tHd+7whO2mkHe0EX1
 KGZ1wOCOWojD1NZm85Pnx/udfurXOWJ/EBJTBmRgVpdEC+T1JFR9mTFNokyOcPBFsCQn
 umbbUHSaMcTpzHliS/ewFdmpD1IgM/TK/zVdXTM/biVeVSpty3IMiPWoBuzFLqCUNvMs
 wUBli1cBumlKHxAVtZPuRVSMK6arLZBF4Bl+/sc/nDU7eLtANOc+p5Jg1ZfObvIHHs6t
 RbTA==
X-Gm-Message-State: ACgBeo32KVS5KN52ka1X8ReMkkNFTH8/aK3uSvgU2vTcQIBuqTG2C2FK
 pmnf88G6qkpQq0Oku8puUVUY5El9GaogjA==
X-Google-Smtp-Source: AA6agR7AwhjYbOmjxpQMGGbl/FyiNrH8UZzMRyxfifnwTufdvNrlm+88onohu3uxBXIy7hvplNfXBA==
X-Received: by 2002:a05:6808:1b2b:b0:343:f1e:1df9 with SMTP id
 bx43-20020a0568081b2b00b003430f1e1df9mr6885167oib.74.1662334523191; 
 Sun, 04 Sep 2022 16:35:23 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v6 09/14] hw/ppc: set machine->fdt in pnv_reset()
Date: Sun,  4 Sep 2022 20:34:51 -0300
Message-Id: <20220904233456.209027-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This will enable support for the 'dumpdtb' QMP/HMP command for
all powernv machines.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 354aa289d1..6a20c4811f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -678,7 +678,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Set machine->fdt for 'dumpdtb' QMP/HMP command. Free
+     * the existing machine->fdt to avoid leaking it during
+     * a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.2


