Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0553491A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:11:46 +0100 (CET)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOq1-0003nB-6z
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOns-0002oO-2v; Thu, 25 Mar 2021 08:09:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOnq-0004VI-K0; Thu, 25 Mar 2021 08:09:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x13so2025505wrs.9;
 Thu, 25 Mar 2021 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WxJT/LZbxF9lKkeuQCTE0WCh2OqIbI/yLxA+fPtTMk=;
 b=UNRxPEQYGO8KJPvrtNVTturRBVENBL7f6V77+PNUSKaGOyDqSMxOEjpp5E16I2Peus
 nsaCnG9ST5C3nbUpSoHAAEaM7v+5AFARHb0KaVccCFD7gVj/DjMdGzMErBKaixYMuU1b
 p8xeq7yhAK4VgCBSHPjGDGxneu9Tky8wsPNzmek2JD5jsRTg4d4txwfraoIxA1mAk5H6
 S7hOYycZAMS/uYF9iFCbggkxpNz4WpUxuFG5yuwM4SFwhubNR2LG32Utg7OlIVFC1lUr
 lxQsmSNvuJuUkLsOuZHyak6GtBY2yfYnWzIHRCa4M+10sr2V6eg9n1LZuT/vnw6Fbq1e
 9Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+WxJT/LZbxF9lKkeuQCTE0WCh2OqIbI/yLxA+fPtTMk=;
 b=K36oOnXOcssC2P/DEdyb6IrQI+fD9qIJTjFY7H3z5HE3Ml/3Cg/a/ZS478031QQSpW
 +zMc8YjZoF252dJem2MIp3p//QgsQt4SQaUvbNML5qw9ulw9gFbqynwrskdolKqe1xzH
 EkkJ5K/FAKBEG4mHE7YAvRy7+TJPDVzFhCoWjE4dTBERM2lL1AJP5nQ9Ae+mV/vOfGWo
 RijxQzm9ujKCe3UKG5UOXqcVMMTo+lndgzR9t9000LKuyzQebOjTaVzI4ENBgbu5EIe4
 bNkge265cVrOicoZ9bqsVHvCR215RZO4pwp+GPCy0OjfGv6CdtZgnlP4Wo9pMAlWlQAA
 Xdow==
X-Gm-Message-State: AOAM530Xbsz8YGbqTohmshNfAwL3yb9+9STCTSH7Wle6IDWioN3i8nbJ
 kItNBcdcxsUlDJArlaA08Dlj3oweSaY1eg==
X-Google-Smtp-Source: ABdhPJzeo1F0fm6nuMTV55uPL6KcQeQzqyCqCPL/o88ymzRJjZhnS08kZWM9XAVfPc0YdaSt/grscQ==
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr8933717wrj.248.1616674167906; 
 Thu, 25 Mar 2021 05:09:27 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n9sm6660439wrx.46.2021.03.25.05.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:09:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 1/2] hw/block/pflash_cfi02: Set romd mode in
 pflash_cfi02_realize()
Date: Thu, 25 Mar 2021 13:09:20 +0100
Message-Id: <20210325120921.858993-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210325120921.858993-1-f4bug@amsat.org>
References: <20210325120921.858993-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ROMD mode isn't related to mapping setup.
Ideally we'd set this mode when the state machine resets,
but for now simply move it to pflash_cfi02_realize() to
not introduce logical change.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 25c053693ce..35e30bb812c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -173,7 +173,6 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
                                  "pflash-alias", &pfl->orig_mem, 0, size);
         memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
     }
-    pfl->rom_mode = true;
 }
 
 static void pflash_reset_state_machine(PFlashCFI02 *pfl)
@@ -917,6 +916,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     /* Allocate memory for a bitmap for sectors being erased. */
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
+    pfl->rom_mode = true;
     pflash_setup_mappings(pfl);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-- 
2.26.2


