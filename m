Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F16101CB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7te-0005t8-1D; Thu, 27 Oct 2022 14:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sO-0005WC-B3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sB-0004lE-JH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id o4so3711364wrq.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLSLvPI5diE0vfct5cvufJQNAvAsRI7ZBMMMOLBJMAg=;
 b=eF/8vFD7yvk4R1Jki1WtbZ7TzHrwCHeUE+9zmtbLFH0w7ir4FWAZxF6XfFS1UR9QUe
 OUBjTbSOgFt13d148Psz6lgJ3L/ttr3xWDhAb1iVnxnC9wKJb18/Wdxwum4dFZijffqL
 EmlbIkm/sNYJD1zRqJJ9qKO2EbIO7t3p3+Or4ZNldCOHBUTEN7Wl7vCwg+NG5emfekPu
 kKLMHiul2mphHhM0y8WYUxmCl5PEkx7GFoM30z8oq5oDrrb4GKW3PLs4pczDhzGVUa28
 nYtbBpF/tQo5QxRiQOnfoY9Toi5FF6+F7KNKNL8voLahLHynwX14hgPWCWA8HMxlI/Zd
 N8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLSLvPI5diE0vfct5cvufJQNAvAsRI7ZBMMMOLBJMAg=;
 b=Ua9TvXrW8IlLzJAu9gn6K4GBGm1l4VRJGySMasIRVZo9FLgN6aG21nySg2zhcqyKZ0
 q0CIa2peHlawc7lEeKVidEkcViRbKw5Mf34mCWLzGDkbU8i2B/Ue6mx5/XXeYFKObenT
 88vUaxv/EcIbHxboChblKE/LuACAgVxmCnWeZW66JZKpZtJHa1pbnafGrrZ9TwEmK9W+
 4WIPfFUnBIpdNc3lVYfAIaFEjM4/dbBSDpAoAWI1sCEo7/xE6IIME/XjPr0QsEaFZp4U
 EjPdMKXIq9RO+CH7vkeeQhjP1cYXJqEwCBeLeDPzDOkvieMB5CcvDN9ESWE9dLepkreu
 qKeQ==
X-Gm-Message-State: ACrzQf3/r9krwF03xEGXBqWdFaxt6jZpxzgRGuOzV1F2IZtOSSy0pLFh
 Emb8BHnFop1JcuUw1bNAVGgNlg==
X-Google-Smtp-Source: AMsMyM5j7IYHxz5uFM1wIgnC2i60miO7kDDT4YeiGpEqI6y4Qy5zld/ibrJBCPk3Arz9U7u60+VLTA==
X-Received: by 2002:a05:6000:1447:b0:22e:7b1d:cca2 with SMTP id
 v7-20020a056000144700b0022e7b1dcca2mr34094494wrx.276.1666896298059; 
 Thu, 27 Oct 2022 11:44:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6751000000b00236488f62d6sm1797013wrw.79.2022.10.27.11.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB04C1FFD2;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 28/30] contrib/plugins: protect execlog's last_exec
 expansion
Date: Thu, 27 Oct 2022 19:36:34 +0100
Message-Id: <20221027183637.2772968-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


