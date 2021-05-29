Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C92E394CE5
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 17:24:35 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln0pE-0004oC-HT
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 11:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0nD-0001NM-9G
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n8-0006ee-0Q
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g17so6124774wrs.13
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SykQW2VZCed5IFbt4dsj/M5Blr8ToABeANkngq/IOEY=;
 b=n6ghKfmeEOoxdfzW2/HOs89gT8Cl7B66gGBp8uV15rX3fzUhcmySfXpkg25rM/FsPF
 FQ99MJLPLFKklvJCNtIKNcVi+6sKSy9qRueS22aTNxF4nAiXK3tASGRU8gxgL5dWxSm4
 /2UjA6TC/rgvA3ebAAOeJIyeydpsMrME/BrDKkRaZ/GWoyRT7N8rRXeiyKhUA3OTNIL2
 4IfU2oXHa8kuaVNTIKOmL/NKiwb85Sz/0bKeK3d4/S6ovIThnudEtycln6jCdraHmUsb
 0jS5VBLrgAoOS8J2rqwYNgRpGxPePwj8z6G8RN0ShgSaHmbj6AYRZbG9F3TdVJW1bq5P
 9CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SykQW2VZCed5IFbt4dsj/M5Blr8ToABeANkngq/IOEY=;
 b=KxU9y4Hk5xh5JrZqVP0C8uhcyF/LaPJpXr6AODaOU0QiuLY7ZH66+WFKgTtYtACSb3
 2OSlnvtVpafqbR/y44FEeql4a/QFPffHx28yIB5BxBqEbcjEk+B8skaqi3JAcJIB+c/n
 SWywrq/MC6/KK4QNeIVMDvKZYisi/81rrev7K82vAtzlx1MwNyV9arxhV0vWEf7PH6WA
 uGiqEU9/ESBn7jvooVrxWsFQlqmpIgoSpo81WbQa1794KKSjSklDInAspQwiW+NAH6yl
 BDokkM3YsuJgc5tc21AjpYp+rdAfT5Q+LERs11uW09cMzscuDr2qGgmWv342HT4mFSe6
 gf1g==
X-Gm-Message-State: AOAM531VZvIqBdU/Ec0wXfrj85AIAcf0vZ+RRQf5orXY2rRRZrTFZHY2
 UwMl5PMF+O6w3MA+qKYT5aT/iDfXzcbk1g==
X-Google-Smtp-Source: ABdhPJyZcyZee2tXuskcpmYVw/KGdddzFr9rYuAz9A3uFzrtVQ5SFRmA/FSXxttsovBkxOb4aj2ctw==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr2043533wrs.418.1622301738983; 
 Sat, 29 May 2021 08:22:18 -0700 (PDT)
Received: from localhost.localdomain ([102.47.172.201])
 by smtp.gmail.com with ESMTPSA id s7sm17019164wmh.35.2021.05.29.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:22:18 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] plugins: cache: Enabled parameterization and added
 trace printing
Date: Sat, 29 May 2021 17:22:02 +0200
Message-Id: <20210529152203.40358-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210529152203.40358-1-ma.mandourr@gmail.com>
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
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

Made both icache and dcache configurable through plugin arguments
and added memory trace printing in a separate file.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index f8c15ebed2..7d1d185480 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -22,7 +22,7 @@ static GRand *rng;
 static GHashTable *dmiss_ht;
 static GHashTable *imiss_ht;
 
-static GMutex dmtx, imtx;
+static GMutex dmtx, imtx, fmtx;
 
 static int limit;
 static bool sys;
@@ -33,6 +33,8 @@ static uint64_t dmisses;
 static uint64_t imem_accesses;
 static uint64_t imisses;
 
+FILE *tracefile;
+
 static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
 
 enum AccessResult {
@@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_t info,
     insn_addr = ((struct InsnData *) userdata)->addr;
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
+    if (tracefile) {
+        g_mutex_lock(&fmtx);
+        g_autoptr(GString) rep = g_string_new("");
+        bool is_store = qemu_plugin_mem_is_store(info);
+        g_string_append_printf(rep, "%c: 0x%" PRIx64,
+                is_store ? 'S' : 'L', effective_addr);
+        fprintf(tracefile, "%s\n", rep->str);
+        g_mutex_unlock(&fmtx);
+    }
+
     if (access_cache(dcache, effective_addr) == MISS) {
         struct InsnData *insn = get_or_create(dmiss_ht, userdata, insn_addr);
         insn->misses++;
@@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     g_mutex_lock(&imtx);
     addr = ((struct InsnData *) userdata)->addr;
 
+    if (tracefile) {
+        g_mutex_lock(&fmtx);
+        g_autoptr(GString) rep = g_string_new("");
+        g_string_append_printf(rep, "I: 0x%" PRIx64, addr);
+        fprintf(tracefile, "%s\n", rep->str);
+        g_mutex_unlock(&fmtx);
+    }
+
     if (access_cache(icache, addr) == MISS) {
         struct InsnData *insn = get_or_create(imiss_ht, userdata, addr);
         insn->misses++;
         imisses++;
     }
+
     imem_accesses++;
     g_mutex_unlock(&imtx);
 }
@@ -352,6 +373,15 @@ static void plugin_exit()
 
     g_mutex_unlock(&dmtx);
     g_mutex_unlock(&imtx);
+
+    if (tracefile) {
+        fclose(tracefile);
+    }
+}
+
+static bool bad_cache_params(int blksize, int assoc, int cachesize)
+{
+    return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc) != 0);
 }
 
 QEMU_PLUGIN_EXPORT
@@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "limit=")) {
+        if (g_str_has_prefix(opt, "I=")) {
+            gchar **toks = g_strsplit(opt + 2, " ", -1);
+            if (g_strv_length(toks) != 3) {
+                fprintf(stderr, "option parsing failed: %s\n", opt);
+                return -1;
+            }
+            icachesize = g_ascii_strtoull(toks[0], NULL, 10);
+            iassoc = g_ascii_strtoull(toks[1], NULL, 10);
+            iblksize = g_ascii_strtoull(toks[2], NULL, 10);
+        } else if (g_str_has_prefix(opt, "D=")) {
+            gchar **toks = g_strsplit(opt + 2, " ", -1);
+            if (g_strv_length(toks) != 3) {
+                fprintf(stderr, "option parsing failed: %s\n", opt);
+                return -1;
+            }
+            dcachesize = g_ascii_strtoull(toks[0], NULL, 10);
+            dassoc = g_ascii_strtoull(toks[1], NULL, 10);
+            dblksize = g_ascii_strtoull(toks[2], NULL, 10);
+        } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoull(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "tracefile=")) {
+            char *file_name = opt + 10;
+            tracefile = fopen(file_name, "w");
+            if (!tracefile) {
+                fprintf(stderr, "could not open: %s for writing\n", file_name);
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    if (bad_cache_params(iblksize, iassoc, icachesize)) {
+        fprintf(stderr, "icache cannot be constructed from given parameters\n");
+        return -1;
+    }
+
+    if (bad_cache_params(dblksize, dassoc, dcachesize)) {
+        fprintf(stderr, "dcache cannot be constructed from given parameters\n");
+        return -1;
+    }
+
     dcache = cache_init(dblksize, dassoc, dcachesize);
     icache = cache_init(iblksize, iassoc, icachesize);
 
-- 
2.25.1


