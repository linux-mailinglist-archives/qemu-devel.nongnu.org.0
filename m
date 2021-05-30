Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C3394FE4
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:42:07 +0200 (CEST)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnF9C-0001Jf-6b
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF4l-00044X-8O
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:37:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF4i-0003Er-7L
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:37:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id r13so3879092wmq.1
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yJpEnBBLwnL7hxOOCxZgHivdNATscGG91R17yNlKa78=;
 b=UDmPuqq0dZQV84kkkC1JbsJkiR7rHK0Dvw3yba9mVGJOB9Vid6CqOHm7+nujPvHIOR
 XEuvmRvol0f6aZBDc3Zg8XnruDpjb2HmVYKab9ZWyzVMwmm/4m2TaqUoEypY2jMpJxKA
 3x0nj0nqEc8qxXE751hBKMD/rdjsA/DO7YDiMTQLpSMDaP1fr1PeA0h0N0StwgrCb0sK
 4Nu4gAivQVob4K7iS9EShwxJGSPU5LTVuokSWJV4dqYOmF0LC19Syo8t93zLrw7trf/O
 9v5wHJEgbIa696S5ZtEMbv0642cYdSugINa2rBqdEEP/7dx9bv4XpxRWQWGWNOdFJVu7
 IH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJpEnBBLwnL7hxOOCxZgHivdNATscGG91R17yNlKa78=;
 b=SMHmt9otdRKtcBjzDEc4xgjivHHSNajuQiaPwAMFm6KBLiN4K8Uv1++vmnSua7Eb1Q
 HnmDhOkslnF9Nh31rPh2bCKtTnTfhDcjA3pmpfUV/YzMtcp5wqtp/Oklpl7caqzecSik
 bY1IaRJBoWB74CAJ6y6T3wAHj+g13Ef+aVNfafcVcykK4PhjGQgLYtojiTYH6YtGsvK+
 RlRCOlmQ0XEOGb2bHcG7dVa4u9A6pB25W6avxxibZZiBPlVNQT0bzQBmmjElGFOwryt8
 M7yXzYjrQV99YhhrlOAuhopcLDUJsoPEi1xsi8C8hp6NrKAmREaPiJ4yYuXZww76FH1F
 Y7KQ==
X-Gm-Message-State: AOAM5339tXm39uLYj5DzylAE5oUAS9YcrSMS3XI7hZHSVP7JzP8XE9x5
 dUkJKtysTo0EC7cJYrD5AYG6fIN93YaBhA==
X-Google-Smtp-Source: ABdhPJyBZAr0qtj2vivIfRPcoEeWbRzGdST+BiuQIdP7ob9c512uyGSRYvBW/mUjqTjtNIdYZHLS/w==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr8416712wmi.42.1622356646560;
 Sat, 29 May 2021 23:37:26 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.239])
 by smtp.gmail.com with ESMTPSA id 3sm2732431wmi.7.2021.05.29.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 23:37:26 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/3] plugins: cache: Enabled parameterization and added
 trace printing
Date: Sun, 30 May 2021 08:37:11 +0200
Message-Id: <20210530063712.6832-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530063712.6832-1-ma.mandourr@gmail.com>
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x333.google.com
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
index 8c9d1dd538..fa0bf1dd40 100644
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


