Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F42607EBE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:10:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxNM-0003Uu-Cj; Fri, 21 Oct 2022 15:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olv4W-00015o-E0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:40:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olv4U-00057T-4w
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:40:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 186-20020a1c02c3000000b003c6c154d528so5461058wmc.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FLSLvPI5diE0vfct5cvufJQNAvAsRI7ZBMMMOLBJMAg=;
 b=od++4Fq9bgCOUAJ+FKch2cJCteaCQ20a9YyIv6Y7EREPPvwkmf+LG5lpRgsf0HP1X7
 XfWmFdyp9e2u8rkBZXgTnenj5UVbfhtFbB5DByvVpI+sn/WQUVjPSuHwe14CpyMsn18w
 /2zNYfK5xLt7Sw7hF6T9rPn7cR/ViE1lMJZyD0HEi1Noduhvdepy/B/mQZt5WV8Hj7V4
 hNXWHKY/3rb2HCW1y/oTGp57Y6pAs3IU0nv/0m9mWmO1RPyQCY9Ven5bQ8oGnD9MvdhE
 G3GU9qFGGCcb00oOkhny6CAU71p90nV51pai1EuT/PHAPlqXc+eYFtQ45MSn4QOPjTG0
 QWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLSLvPI5diE0vfct5cvufJQNAvAsRI7ZBMMMOLBJMAg=;
 b=eSae+btDDyJVc6H1faj26LdwiWcbjlMUfMDtCNd8pM6aPOCvYKaugSyvir9COTLthz
 5GB2vifwax4Q1mzB5hSK16VHHKAKWTZMPTFOZzQX92r6tHekPg+7+npmVB6VymNgxQp4
 pdOfPQEuX5vh6u8yTMLm2pCHaAMUt/y0i9SwDDGaX/fea6odR69n5IV+EhCXqWScX4Lj
 LXxmKa1iPaUP1Y626hlTJm4O6Uq1SnEpcmN5bLvR/que31rHnatIqp4Y4FV5Sp1tqgFQ
 ML87//JlhbcEb6ZlClJb/SDZt+8lnXJGDTThIGVBdJ1eCNJKZWZo/7zFOK15tXQ679tK
 eQMg==
X-Gm-Message-State: ACrzQf167WGpoOc8k+Dxxb7jLvDOVVHmgZ02qf//osSARAo63WpTRRX9
 LEqnFkv3VRDW4J9E1LDcEICKKw==
X-Google-Smtp-Source: AMsMyM61WTYdETQ8KQY2U0H9HlPghYkblosOZ19wfNhOIvXV1LJVWcNG1Q7XDUqerH9nXrxzm/KFHw==
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr13811863wmp.201.1666370432348; 
 Fri, 21 Oct 2022 09:40:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bw17-20020a0560001f9100b0022afedf3c87sm5564545wrb.105.2022.10.21.09.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:40:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36EF21FFB7;
 Fri, 21 Oct 2022 17:40:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC PATCH] contrib/plugins: protect execlog's last_exec expansion
Date: Fri, 21 Oct 2022 17:40:27 +0100
Message-Id: <20221021164028.2757262-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We originally naively treated expansion as safe because we expected
each new CPU/thread to appear in order. However the -M raspi2 model
triggered a case where a new high cpu_index thread started executing
just before a smaller one.

Clean this up by converting the GArray into the simpler GPtrArray and
then holding a lock for the expansion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexandre Iooss <erdnaxe@crans.org>
---
 contrib/plugins/execlog.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 1b3bb7ebba..e255bd21fd 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -18,11 +18,30 @@
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 /* Store last executed instruction on each vCPU as a GString */
-GArray *last_exec;
+static GPtrArray *last_exec;
+static GMutex expand_array_lock;
 
 static GPtrArray *imatches;
 static GArray *amatches;
 
+/*
+ * Expand last_exec array.
+ *
+ * As we could have multiple threads trying to do this we need to
+ * serialise the expansion under a lock. Threads accessing already
+ * created entries can continue without issue even if the ptr array
+ * gets reallocated during resize.
+ */
+static void expand_last_exec(int cpu_index)
+{
+    g_mutex_lock(&expand_array_lock);
+    while (cpu_index >= last_exec->len) {
+        GString *s = g_string_new(NULL);
+        g_ptr_array_add(last_exec, s);
+    }
+    g_mutex_unlock(&expand_array_lock);
+}
+
 /**
  * Add memory read or write information to current instruction log
  */
@@ -33,7 +52,7 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
 
     /* Find vCPU in array */
     g_assert(cpu_index < last_exec->len);
-    s = g_array_index(last_exec, GString *, cpu_index);
+    s = g_ptr_array_index(last_exec, cpu_index);
 
     /* Indicate type of memory access */
     if (qemu_plugin_mem_is_store(info)) {
@@ -61,11 +80,10 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     GString *s;
 
     /* Find or create vCPU in array */
-    while (cpu_index >= last_exec->len) {
-        s = g_string_new(NULL);
-        g_array_append_val(last_exec, s);
+    if (cpu_index >= last_exec->len) {
+        expand_last_exec(cpu_index);
     }
-    s = g_array_index(last_exec, GString *, cpu_index);
+    s = g_ptr_array_index(last_exec, cpu_index);
 
     /* Print previous instruction in cache */
     if (s->len) {
@@ -163,7 +181,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     guint i;
     GString *s;
     for (i = 0; i < last_exec->len; i++) {
-        s = g_array_index(last_exec, GString *, i);
+        s = g_ptr_array_index(last_exec, i);
         if (s->str) {
             qemu_plugin_outs(s->str);
             qemu_plugin_outs("\n");
@@ -201,7 +219,11 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
      * Initialize dynamic array to cache vCPU instruction. In user mode
      * we don't know the size before emulation.
      */
-    last_exec = g_array_new(FALSE, FALSE, sizeof(GString *));
+    if (info->system_emulation) {
+        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
+    } else {
+        last_exec = g_ptr_array_new();
+    }
 
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-- 
2.34.1


