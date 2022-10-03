Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F55F37F3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:40:28 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTAo-0005dI-Nt
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7m-00022x-9B; Mon, 03 Oct 2022 16:33:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7k-00042l-Rg; Mon, 03 Oct 2022 16:33:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s30so12488741eds.1;
 Mon, 03 Oct 2022 13:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mRnFp+ZCRYXyde5+5JQLZTlhkSBMC3xHyJohfm8ys4c=;
 b=EpQW0N7W3IMCqIYCb3UHxaWZOSabI7o12JUvHuJ0N20rmwaCvqv6AAXvrQTR0JqRnw
 FOV0dEOiqPJKE6qGgLNhl1YOM0cxxy/Erhv7qbgUhXdi8kG8XFe47BcI7OAnSKorsqUl
 yQ4c2E1T8/w+8b99phgWVp3xn6O0eGqBXl097+Z9UcGs3mdLqjVqagGJpQlLvVRiQPo3
 TBJ6DeRajCvekulsF67tET0ovIJ+b0Tckv9oJvD0BOVfpToTDYOnZG48Nl3Nav0T11cw
 dJ7SPVvakjJCboiwhh08kCRs1On1x9hgKQgwC1cHtkE2KF5JRQncdCtq/4d9EJReBywG
 jVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mRnFp+ZCRYXyde5+5JQLZTlhkSBMC3xHyJohfm8ys4c=;
 b=vfOQy85AztTqz6qhnNqSw9J47Ny1KTRkovpGcYva8Ml0+uSJ64zfxknwgmRK5Vvarg
 3U+B158atUSfapImOzHrFoarzGzXSXrwsgnJ4UB2S7FGdOMA+D7HgAmcfZC2nP//oZyq
 krvWGhFcUp6yNLBvKGZ+3KTOC0DTFY6FIacaZ8HnjnGZj17lPQq69q+gGLQNKVFrS/QU
 SzWBt8Ey8fxvdauS0+LmteAaNSX1VGrYHfCe9iQ2BBLAiihS0StlqKZCpnZ8Ovdax+89
 X+l0Dup9RM8xRWO2X5C5cgcs7PaRSVbIpZy5VM6utBosfTqPUiBQgD+NqObotzAnlhbI
 LlFw==
X-Gm-Message-State: ACrzQf0qV3rDyt/Mu1JYNAI/xWK1RccNncMVIcS5gAYDm8iMPxodzuax
 664fAUDFpPTDSdRlcModMBIz6wMf/LQ=
X-Google-Smtp-Source: AMsMyM53NfMKjWh3gk0VUBt/shSXxbNwBO+raU0P8X8+Zs5wToQXLTwyooIlMosvyfvQ5g/Uixkprw==
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id
 f7-20020a056402354700b004513be6d55bmr19923216edd.57.1664829191257; 
 Mon, 03 Oct 2022 13:33:11 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 08/13] hw/block/pflash_cfi01: Error out if device length
 isn't a power of two
Date: Mon,  3 Oct 2022 22:31:37 +0200
Message-Id: <20221003203142.24355-9-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

According to the JEDEC standard the device length is communicated to an
OS as an exponent (power of two).

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..8c9b3f518a 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,6 +708,10 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
+    if (ctpop64(device_len) != 1) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -865,7 +869,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl);
+    pflash_cfi01_fill_cfi_table(pfl, errp);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
-- 
2.37.3


