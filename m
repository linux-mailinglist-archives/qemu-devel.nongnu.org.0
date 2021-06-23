Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182E3B1A91
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:57:47 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Ru-0005ho-33
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pq-00036X-Sp
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pp-0007rj-6p
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so1287765wma.2
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pu70vuuOrGGdpc3zSu0b7nOAKtxemuN+ozgFx3K1bf4=;
 b=LHS1h56xh5tB2vXhVvBWcqHcnvT8vD6+/578dkRTObJLruEVMmvbSpWnz54hvuy6EF
 HbCD9lSKldEdl5IFxeg2ywXUg+/TgmR9orUNvlLHW9oJ1No1wUNDRc5A+hKiTO/yk5LI
 iAbjXXDexR4wNmArf0/o38QaE8L/bomynJfDqNdhzPQfuVG8w1kYIElKtwIXPLarLtit
 s9tRP0a8U98dbeMyl+7ZK6+6RiIPYd0hkLYxmrzE8lbVM1yneuS8HXpbmkBYu+gts1AO
 I+PDYSKNIK6UPn1R0OZHbEzazFLbiP/BscPUSksIuHUk4wwwaji60/8IcwcdDAJ0nV+T
 0/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pu70vuuOrGGdpc3zSu0b7nOAKtxemuN+ozgFx3K1bf4=;
 b=gFYGH2pp55gkAE3zrnEnU091vAzP+kEhtbnajvQayPbiZwT5+lvx0pNnvlPmc1O+c5
 MJExEUaWZtp87N1HYfZz+4JWDa83q1ypVEHSIn2URBFpbtmBhnr3T5w1VoMCH8p3JypM
 FLyxqz1kT4PfpY8SbQkScJdA8QCp4hS0zPJA53CTJJrGbXFFhr8zAaW/8g9qogN/F5mw
 pJCMktn6BcdcIdFIykAUpVxJLz6vVJxWshbCnWGqiW8Ppok9QELgr2OARfDwksSbQnRP
 koRTJ+CY49HYgXrk5ZO6oVRPzkL9rqEZxzYZg0aqLd0s2m/IbawcTvSSJ9kJyG1GFAAY
 WXiw==
X-Gm-Message-State: AOAM533NQTnA0QChHSpWOFobF6QQnlie4qun6RzUI6svKFiVuYB0Lj+G
 sV23aiA0Su6pFklUOXTfo7onRQHZSa3BkQ==
X-Google-Smtp-Source: ABdhPJxrOw2J8QJf6syvoQ8x/j/BGCbPcIKgz+5Tw6Yt6HNNTjIxcFCkkRQjxaB9efxM3H4/D9GeIQ==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr11079225wmf.115.1624452935710; 
 Wed, 23 Jun 2021 05:55:35 -0700 (PDT)
Received: from localhost.localdomain ([102.41.161.240])
 by smtp.gmail.com with ESMTPSA id c12sm3108461wrr.90.2021.06.23.05.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:55:35 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] plugins/cache: Enable cache parameterization
Date: Wed, 23 Jun 2021 14:54:54 +0200
Message-Id: <20210623125458.450462-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623125458.450462-1-ma.mandourr@gmail.com>
References: <20210623125458.450462-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enabled configuring both icache and dcache parameters using plugin
parameters.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 47 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index e9955cdc3a..b550ef31b0 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -99,8 +99,28 @@ static inline uint64_t extract_set(Cache *cache, uint64_t addr)
     return (addr & cache->set_mask) >> cache->blksize_shift;
 }
 
+static const char *cache_config_error(int blksize, int assoc, int cachesize)
+{
+    if (cachesize % blksize != 0) {
+        return "cache size must be divisible by block size";
+    } else if (cachesize % (blksize * assoc) != 0) {
+        return "cache size must be divisible by set size (assoc * block size)";
+    } else {
+        return NULL;
+    }
+}
+
+static bool bad_cache_params(int blksize, int assoc, int cachesize)
+{
+    return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc) != 0);
+}
+
 static Cache *cache_init(int blksize, int assoc, int cachesize)
 {
+    if (bad_cache_params(blksize, assoc, cachesize)) {
+        return NULL;
+    }
+
     Cache *cache;
     int i;
     uint64_t blk_mask;
@@ -397,7 +417,19 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "limit=")) {
+        if (g_str_has_prefix(opt, "iblksize=")) {
+            iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+        } else if (g_str_has_prefix(opt, "iassoc=")) {
+            iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+        } else if (g_str_has_prefix(opt, "icachesize=")) {
+            icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dblksize=")) {
+            dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dassoc=")) {
+            dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+        } else if (g_str_has_prefix(opt, "dcachesize=")) {
+            dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+        } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
@@ -406,7 +438,20 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     }
 
     dcache = cache_init(dblksize, dassoc, dcachesize);
+    if (!dcache) {
+        const char *err = cache_config_error(dblksize, dassoc, dcachesize);
+        fprintf(stderr, "dcache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
+
     icache = cache_init(iblksize, iassoc, icachesize);
+    if (!icache) {
+        const char *err = cache_config_error(iblksize, iassoc, icachesize);
+        fprintf(stderr, "icache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
 
     rng = g_rand_new();
 
-- 
2.25.1


