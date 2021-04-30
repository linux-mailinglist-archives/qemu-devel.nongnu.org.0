Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E316B370371
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:24:45 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbYz-0003n6-0C
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbY9-0003Fv-MX
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:23:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbY7-0005ds-UM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:23:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso735107wmo.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+20hUiagOV8D+dhZIu/lGuSxoJFQH5E6+upCy4ag+4=;
 b=DUDhqmD8zgoZstFcUG323aqCjVEIQhrsA0NCP2lyR7DyAuW4KySlkcgETz2B7uuAiA
 uwbL166GuBUwP69XZG/foYWjGb+NV1bCglt64Q4Qrj+EbYFCd642R8Nsu3OpJqqFG8OR
 OKilsSSSTPcpDbcKnOr+YS80Y3bVu33dm8ib6ht5C7Wwhtb/5ldpcBTLC13VP+FOnnih
 RuGCrSmF2+3ApyyWqtNn+Ssd7xFMh9dmmJZzFY50ug7RzcwHUlDMaHQb+ASn4tg6vs2k
 32OQlZv0QQEQXzDqA6Uh4riGtJc+EyaS6OcRb1Kq7LtDtasKja2SHeL6lxy4Y6gCeh9e
 GabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+20hUiagOV8D+dhZIu/lGuSxoJFQH5E6+upCy4ag+4=;
 b=Kwg6u9ltWiChQzRZ2E+RbA4jezlyWizFVEiI9FPld8ARw72f5w7E9It90yLhvIxqD2
 KnIn4fvVoQQeT4o+tp9WzoTxLRXv9x2LT63GIJTnfY4bw+PSuKJDh1KGk+8NGCNfEx9I
 oLYyBcf1/4PzS9wS82SsptzYAEUZOxSWAU0GxWMwyoR6N008fXVjTxB5n3/RpU4sb9Et
 NIN6cYU/d8RDO/enfBt0kzJHEZwq0XPfjTH8g56XHfKvEplNQzWarnzG3ufnAkwy8UIj
 sC9PjwoCk5dD3sDlGm1TwyhNK8WCt+Z5Z8yCUXEW8be7yexJNKooERTZ5fecS+s1B4no
 KvNg==
X-Gm-Message-State: AOAM532+sysBqAw7gk7UFHW3S73iSLTii9Yxq8XNBx0KAzDnigRZbGzX
 Jxoq+Qy5XJbGZ58cBP62id8mDw==
X-Google-Smtp-Source: ABdhPJwvngFjlLgNo2u5aWQ8NaGdYg1i3KuUBeajC7aBAjgsEnXHs06eJBJ8Z5OoxNlFxM188j3s7w==
X-Received: by 2002:a05:600c:b4c:: with SMTP id
 k12mr18949797wmr.186.1619821430395; 
 Fri, 30 Apr 2021 15:23:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm3719208wrs.68.2021.04.30.15.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 15:23:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Fri, 30 Apr 2021 23:23:48 +0100
Message-Id: <20210430222348.8514-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The omap_mmc_reset() function resets its SD card via
device_legacy_reset().  We know that the SD card does not have a qbus
of its own, so the new device_cold_reset() function (which resets
both the device and its child buses) is equivalent here to
device_legacy_reset() and we can just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
cc'ing Markus who was interested in conversions away from
the legacy API. As warned, the conversion patch itself is
not very interesting as the difficulty is all in confirming
that the device being reset has no qbuses...

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


