Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB239ED63
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:09:44 +0200 (CEST)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqT3e-0006ag-Tj
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2F-0003tQ-9u
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2B-0008Mc-Qp
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so14852788wri.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 21:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVydF8W/6ZNYBMXe/l8al/gKrABRXvmDJUUWROof7X8=;
 b=EvDR+mNCh0kHyxqJyLQbtZjKltl6zfxnkmu1ErcSgQyFDgmtKd5+kJFEJySRj4jWh9
 0i2QxHAqqOvJ5AZ7d0JdR3mTsqetg+dN3H7JHQKNstQT5rOThQVQ4zvJnIHceWO0dja/
 cTMMveT3uo/vGuYfPSoG5r7CbTjdXteBhm4XWA3vl4fY+9OQ7I/29Ca19cvy7hLiUoD9
 NHfhANR3utzm3trUfVGnByBTDzMKxaPplKgzUnPm7YlYh8kaynuUf3OzGRrz1fw2PYqg
 48mteOowEtUyzsFiKGx+gJJ6E/1tghNYWQTFnz5v23NgHU7H48LMLONPkEdSm7FpK2Bu
 0R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVydF8W/6ZNYBMXe/l8al/gKrABRXvmDJUUWROof7X8=;
 b=R5n2AKSI377VWTjxMKrFA5tLaNMBrxZ5uKU7g4z4ieIqejkWfjktU65EtC96xPlRPn
 RJxlUNKMBI6fevM3Yxr5EeHO+JtbxnLoP0eRBPeYnmF+2JZ7/4iaVVzVaMe6x4E44CsK
 VICZ0u0V6yySy4DJDYJFquCmFpvYDQl7aqwPllDLmLdbFEHftivw7Ut9RK01LbbyAi6H
 DyNB9ExBwEeUbLt6/haVvR6+XlTV5zK/wJbTNJZeLTxaOw7LL6PTf6UZWmM03pgxlTLI
 zu675WO+AEn3KhsuZeDBfYpCMy/GHrzlJ2DIa9n7iMtAVP+vQxG5ids+vJRxBMQPNeUY
 DuLw==
X-Gm-Message-State: AOAM5334jzp51GOeUvKhdaAvCpVrCiq5bVSeMgEizKppOePFjsHIL25e
 r7Sb9dk7t4wO34F0fOM35UOhX42WHIibUw==
X-Google-Smtp-Source: ABdhPJxh/JFJanrgKDvHjB0a+dkIHAGqkWSF+iosKsXmepzdM6hXhkzm0z3ywv20InusdHc3rQpVWQ==
X-Received: by 2002:adf:c54b:: with SMTP id s11mr20478065wrf.349.1623125290341; 
 Mon, 07 Jun 2021 21:08:10 -0700 (PDT)
Received: from localhost.localdomain ([197.61.123.212])
 by smtp.gmail.com with ESMTPSA id y189sm16862008wmy.25.2021.06.07.21.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:08:10 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/4] plugins/cache: Enabled cache parameterization
Date: Tue,  8 Jun 2021 06:05:31 +0200
Message-Id: <20210608040532.56449-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608040532.56449-1-ma.mandourr@gmail.com>
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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

Made both icache and dcache configurable through plugin arguments.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 44 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 715e5443b0..d8e8c750b6 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -104,8 +104,17 @@ static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
     return (addr & cache->set_mask) >> cache->blksize_shift;
 }
 
+static bool bad_cache_params(int blksize, int assoc, int cachesize)
+{
+    return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc) != 0);
+}
+
 static struct Cache *cache_init(int blksize, int assoc, int cachesize)
 {
+    if (bad_cache_params(blksize, assoc, cachesize)) {
+        return NULL;
+    }
+
     struct Cache *cache;
     int i;
     uint64_t blk_mask;
@@ -403,8 +412,30 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "limit=")) {
-            limit = g_ascii_strtoull(opt + 6, NULL, 10);
+        if (g_str_has_prefix(opt, "I=")) {
+            gchar **toks = g_strsplit(opt + 2, " ", -1);
+            if (g_strv_length(toks) != 3) {
+                g_strfreev(toks);
+                fprintf(stderr, "option parsing failed: %s\n", opt);
+                return -1;
+            }
+            icachesize = g_ascii_strtoull(toks[0], NULL, 10);
+            iassoc = g_ascii_strtoull(toks[1], NULL, 10);
+            iblksize = g_ascii_strtoull(toks[2], NULL, 10);
+            g_strfreev(toks);
+        } else if (g_str_has_prefix(opt, "D=")) {
+            gchar **toks = g_strsplit(opt + 2, " ", -1);
+            if (g_strv_length(toks) != 3) {
+                g_strfreev(toks);
+                fprintf(stderr, "option parsing failed: %s\n", opt);
+                return -1;
+            }
+            dcachesize = g_ascii_strtoull(toks[0], NULL, 10);
+            dassoc = g_ascii_strtoull(toks[1], NULL, 10);
+            dblksize = g_ascii_strtoull(toks[2], NULL, 10);
+            g_strfreev(toks);
+        } else if (g_str_has_prefix(opt, "limit=")) {
+            limit = g_ascii_strtoll(opt + 6, NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
@@ -412,7 +443,16 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     }
 
     dcache = cache_init(dblksize, dassoc, dcachesize);
+    if (!dcache) {
+        fprintf(stderr, "dcache cannot be constructed from given parameters\n");
+        return -1;
+    }
+
     icache = cache_init(iblksize, iassoc, icachesize);
+    if (!icache) {
+        fprintf(stderr, "icache cannot be constructed from given parameters\n");
+        return -1;
+    }
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


