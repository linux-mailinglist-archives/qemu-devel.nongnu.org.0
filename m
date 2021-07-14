Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D125E3C89C8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:27:35 +0200 (CEST)
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ifW-00029A-S8
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idV-0008NL-Bt
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idT-0005gT-Fg
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g12so2084311wme.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SukRF58NpvmPFNZKWh62vrFHgotopGXPTaY3xAEaGPA=;
 b=SlMvXQnVk3E5DeBXgGz4jRYbNs+T+qGAswdVnjTG73+0XZcA8ShAJt/7/Ke7OCIkWh
 QloZhBzVnF17o4mmI5tto11JeRNdNIhlHbajiPT1FC2FCCmB4q65CnK9j7ZdCdC9ZGgS
 uKtCN74PTEulfA7xJ+K9wighkuh2L6jgBYAunLB4BwjpBkbmafEUALmGSj5ejmRIH9bl
 q6gplcWwJjEJXVbu09z08uH5MdGDp+GrUgUZzmgBjtujzSLYH0Z/5yj3xB5WbHmMcEJe
 R3rcQyCW1eCw5CfXtLHvKfzDaTiLS+HesNMyoIRitziHWTrHEz75746XxfHr/bnnAyQO
 EvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SukRF58NpvmPFNZKWh62vrFHgotopGXPTaY3xAEaGPA=;
 b=MxiVsnxtRMTMImD830UK1gzNA85CXZdyMAZsN3ACRqIgIExEfM3Qj0nReWGcDHZclk
 KIivOYhJ65ymKzS9ZBkCxjKuMFi7xZAiodMuGnsXNBRBNZBkZKzS5eBX1kjTxP17m5iW
 393IsFSbDXVAzgcz299HyOz/9ONM6W5VgwywUp87ILJtt3bJHiRG5x0T67EtDPWw4fKP
 BUPTaz+81LjxvviSwAlTFSVd3GpAtvDFFO/xYsAVJNAaNVR5oN5lNfd8uvoL/tSfMmd4
 3zOu4zcbISVqDGXgAWpWUxrhUsI9GrNELyvr9zCU2ttVIwivKvFSuGez8nnypLP3TsVU
 Oe0w==
X-Gm-Message-State: AOAM5317Br9CkL70Rz0IotwI65t4QxqzndN2/D//jvAkRoLYqPpaBcvA
 l4+9adphcsI96Payrj3p7q3EiHdrEwimig==
X-Google-Smtp-Source: ABdhPJwLyEhr7IdtAkf8eHNgxtdlBRIEfV2k11WwtlQF5XCqxm+tddY1SRI7pNLxdttqGMdi71i3Fw==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr6611619wma.5.1626283524858; 
 Wed, 14 Jul 2021 10:25:24 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:24 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
Date: Wed, 14 Jul 2021 19:21:49 +0200
Message-Id: <20210714172151.8494-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
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

Since callbacks may be interleaved because of multithreaded execution,
we should not make assumptions about `plugin_exit` either. The problem
with `plugin_exit` is that it frees shared data structures (caches and
`miss_ht` hash table). It should not be assumed that callbacks will not
be called after it and hence use already-freed data structures.

This is mitigated in this commit by synchronizing the call to
`plugin_exit` through locking to ensure execlusive access to data
structures, and NULL-ifying those data structures so that subsequent
callbacks can check whether the data strucutres are freed, and if so,
immediately exit.

It's okay to immediately exit and don't account for those callbacks
since they won't be accounted for anyway since `plugin_exit` is already
called once and reported the statistics.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 695fb969dc..a452aba01c 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
     g_mutex_lock(&mtx);
+    if (dcache == NULL) {
+        g_mutex_unlock(&mtx);
+        return;
+    }
+
     if (!access_cache(dcache, effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
@@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     g_mutex_lock(&mtx);
     insn_addr = ((InsnData *) userdata)->addr;
 
+    if (icache == NULL) {
+        g_mutex_unlock(&mtx);
+        return;
+    }
+
     if (!access_cache(icache, insn_addr)) {
         insn = (InsnData *) userdata;
         insn->imisses++;
@@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             effective_addr = (uint64_t) qemu_plugin_insn_vaddr(insn);
         }
 
+        g_mutex_lock(&mtx);
+
+        /*
+         * is the plugin_exit callback called? If so, any further callback
+         * registration is useless as it won't get accounted for after calling
+         * plugin_exit once already, and also will use miss_ht after it's freed
+         */
+        if (miss_ht == NULL) {
+            g_mutex_unlock(&mtx);
+            return;
+        }
+
         /*
          * Instructions might get translated multiple times, we do not create
          * new entries for those instructions. Instead, we fetch the same
          * entry from the hash table and register it for the callback again.
          */
-        g_mutex_lock(&mtx);
+
         data = g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effective_addr));
         if (data == NULL) {
             data = g_new0(InsnData, 1);
@@ -527,13 +549,20 @@ static void log_top_insns()
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
+    g_mutex_lock(&mtx);
     log_stats();
     log_top_insns();
 
     cache_free(dcache);
+    dcache = NULL;
+
     cache_free(icache);
+    icache = NULL;
 
     g_hash_table_destroy(miss_ht);
+    miss_ht = NULL;
+
+    g_mutex_unlock(&mtx);
 }
 
 static void policy_init()
-- 
2.25.1


