Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62869378C60
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:42:34 +0200 (CEST)
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5F3-0005R2-Ex
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z8-00066B-8K
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z5-0003Fm-P2
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d4so16408610wru.7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NwdX6azGIkk9RW5w8G/+mwtZRtmOOUwHdFzdJF/aMkw=;
 b=XJKzl2gP+a0CoHFbJLf1g1cqUlGuKJCIArd7A5KGKBetziWfzT3b/FFC7Ly/CjyUxB
 Xib/7dUfn+TV2cpn4t4pOEKpaVoXCpEQwwOfgIKly+lazwWwG5wcXt6YHbnMacQeW2UA
 HJI98chOBDoYnzWiMhm7EdqUwUXKLEJO161n66OCxe670MCnmrH/rk/dc6Ny7JM5T59t
 k3n/OlHKDll/EeaPAUlmwkboQhXarECggTD9cCGl8Yw2AGSMUf5Hq4xO1QTYxQw1XGhf
 FK/KZode0Ouxz8mA+vlEw6l2AlXH5gzDjPX9DFcXz3uWgPC0BZQzY9d+iakv3kiUIp6W
 mfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwdX6azGIkk9RW5w8G/+mwtZRtmOOUwHdFzdJF/aMkw=;
 b=piDJEz5sSnVRvU2JLKWIaNQC0/TvjVPt0jO4RYu6+FUK+CH6oH2HHSutl5Fhl4Khww
 50n+JcOqohFkw4R1y3rexAteGEbGwCO1/hbbvhfxzrnAHWEsui1aQS+lDKHMctpOlS3u
 vsUwnKAl33/wrswPfDTVf9i9WOVbUkygCzjprb+2IyFGZ/5IYZ5jb2BzWJRABhY+diUn
 0v7PEedtix0T2lnlW+v2t9DVBPZYeLWyW9SAnCMZZ9fFUDdrnth+zuloE3IaJbcAl32v
 k+uctMzwdNv5zAvCIXwa2GwN84wkBoVVkEKQNuoT8OLrohA2xOKNOrDqUaCB095wisDy
 NH0Q==
X-Gm-Message-State: AOAM530n6MCf4yhi0YmWc6mWZQPK8VfqMd8a7HKymp2hwrLuxtQ/psZ9
 wr3mkl+okO5Ok4id+KfIxbsOIV3EoVUzsA==
X-Google-Smtp-Source: ABdhPJyDvl5HzC8E2+lzOJ+bmKvocStC6erNYU9ugg4BRqYSDb7AMVzou6LSsMzd3Iae5okGuLQrYg==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr30692843wrs.343.1620649562463; 
 Mon, 10 May 2021 05:26:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Mon, 10 May 2021 13:25:40 +0100
Message-Id: <20210510122548.28638-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The omap_mmc_reset() function resets its SD card via
device_legacy_reset().  We know that the SD card does not have a qbus
of its own, so the new device_cold_reset() function (which resets
both the device and its child buses) is equivalent here to
device_legacy_reset() and we can just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210430222348.8514-1-peter.maydell@linaro.org
---
 hw/sd/omap_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 1f946908fe1..b67def63813 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -318,7 +318,7 @@ void omap_mmc_reset(struct omap_mmc_s *host)
      * into any bus, and we must reset it manually. When omap_mmc is
      * QOMified this must move into the QOM reset function.
      */
-    device_legacy_reset(DEVICE(host->card));
+    device_cold_reset(DEVICE(host->card));
 }
 
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
-- 
2.20.1


