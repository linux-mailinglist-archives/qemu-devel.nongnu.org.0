Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272343C89C6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:27:30 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ifR-00024R-0V
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idU-0008NB-DE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idP-0005dR-Hk
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so3081278wmf.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=h79E14m8AkzaudlYkN/EqOip6NbTl7HX4Yl0rCHXLGTrQDJYDuPyQ55dExS5IhrRyj
 Smern6yuZFdLdQQnEtOiFJQ8LRxToeCEtlSeJFus0Na+ugATlBZnJ0+7tt3ycERCgmgW
 SUodca4Q50z4Q06pujL0EY+k2HXEx2dOE1YtsdoV9nS08A3weKWh/z7jiYnA4uHxnYeL
 Q6IHXJzsdA7xX1099IjAY1Ue40T/pT5+bBQIWa8VCAu2TAOAn2/xtXgFzC88/yPZi0ll
 rWa6UYBi+mx8ZOdnW55BgPbGe9RfFT7RdyMI7Iw9t9fr92siFn6fD9RPwND0R44Rs9nL
 5Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=ntBuTWDMD0GH55FaSP248FqALPXsnp9AU4mGBsNTXkHKNkygVLWXaSuhbRs8Jnjh5m
 9LWzv5PB25nn5dH48vAgZuUWSk71tcfvcSbbgyAfkNB25WN2M6xiQlNxX8LgfQWRMT4d
 qrWqJ7DKigjcqJcmPzkAtHEMSN6t4YvLs1Zy3ltSIa7us4XY2qmJsgoC5cn+FTpxQBXT
 HYp1iCfh/fLFDzJ0mtrUMrquMtaiAi/vGHulYzAukprRo+0mrmta3wjQwFwLSP8tThhl
 S2AtFTC2mVq4uDQFc3UMt6e5zXjhXg6AbS00/sKoxx4WPUHSmHvLQy7jKRqczESqRe24
 KbDA==
X-Gm-Message-State: AOAM533VvHtX5CdpQBhV6W+xM8mD4LwzwpzwO1SDwxl9x6jCWAEXvJcO
 N/RuNgOa5el1OsuGKUBvGaUm4GssxIeopg==
X-Google-Smtp-Source: ABdhPJwEH3ZNE/vfGsYoYvM6/UHV2/3YA2WbyGn8cnnxUgenipXBKkdv+WUK1omVknbtYRN8kQMHdQ==
X-Received: by 2002:a1c:1d8e:: with SMTP id d136mr12427234wmd.52.1626283521800; 
 Wed, 14 Jul 2021 10:25:21 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:21 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] plugins/cache: Fixed a bug with destroying FIFO metadata
Date: Wed, 14 Jul 2021 19:21:47 +0200
Message-Id: <20210714172151.8494-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This manifests itself when associativity degree is greater than the
number of sets and FIFO is used, otherwise it's also a memory leak
whenever FIFO was used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index bf0d2f6097..4a71602639 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -200,7 +200,7 @@ static void fifo_destroy(Cache *cache)
 {
     int i;
 
-    for (i = 0; i < cache->assoc; i++) {
+    for (i = 0; i < cache->num_sets; i++) {
         g_queue_free(cache->sets[i].fifo_queue);
     }
 }
-- 
2.25.1


