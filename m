Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E056137C4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUic-0005dP-Jv; Mon, 31 Oct 2022 09:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhx-00034T-Sm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhr-0005Rv-I6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id l32so7125305wms.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPlORCDUhIdMTxSbY9+3ApJt0vgPiTHe09LMHvFMmc4=;
 b=Zr61yoZpcMQ0OzWDriDszfVjLXAStSVhy1OlxW/sBrnorIeaLuEKJ1nJgPZH/Cfhwb
 0Gg3iSCgffRf7MKqTnZ5Zp6j3rg+OgEqT/TsXjWNlaBsC1M3odYv9FuuB+/6c+52pc6q
 j2RbYk09eUsdTYWRwn3+zzToOAXHtB9BNv2NK4E2IUW3xhW084ilnEiOTTpeiZHAJ5cf
 dlHjNLpemPNHtnCKynxt1uDIyPBAsh1QNmPNmF5JbO3MFI+jF43h2uR9yj7879BDj52k
 as2eYcvzGU4zm3O/FLQHnKrWOVVAprA9VSUJvMVk7sxnpoKCkXUwVDwvG3POpZUdkTi+
 KVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPlORCDUhIdMTxSbY9+3ApJt0vgPiTHe09LMHvFMmc4=;
 b=Ry1cwny66/xUf1hdWfQrZNpAHXUac6qTeyE0DKlUDA8Dq1dZk/Pwe2Dk+laZSsWlVb
 7gDqKDelb5pKzjmoBTfxNx7syQd+rwnCv4H+DWmEE587lXPvIpLMsTZFANloZaLpbjwg
 xwNfPjnMKlwFEk4iszGkTHGgqQgg9OG2zBDxydhDCQ5LKRIhn/RtNdcHod3huQiFRVqi
 LqWMVSWDf6/08vOhfft/V24m6gY1Crjfhq7Fv3mdmKAdnWfjFOh9S/yrtR3xzYIdFWPW
 7+5vnEPsk0aj9XhHt4jdKpB7POGiqDyQ2NJK/XiMlLUOtJrPyP7jk+CPS2YqlE/mN5lh
 CEJg==
X-Gm-Message-State: ACrzQf3b046aWM2d7aM+nyfApEb7Bgh5sXeQDdmWQegN2Dc3oVS3nSlr
 7kf28uz25Fm2QrrJmrhnTa/fAg==
X-Google-Smtp-Source: AMsMyM49sOnQa2tAhaNYEtUUBktQSvPcCY69e2TQLUi5GGDxrogBD+w53WX2k0+VU24gt0vk581Dig==
X-Received: by 2002:a05:600c:3ac9:b0:3cf:6be9:e69a with SMTP id
 d9-20020a05600c3ac900b003cf6be9e69amr4879331wms.130.1667222397191; 
 Mon, 31 Oct 2022 06:19:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003b4868eb71bsm6908905wmo.25.2022.10.31.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B08ED1FFD2;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 29/31] contrib/plugins: protect execlog's last_exec expansion
Date: Mon, 31 Oct 2022 13:10:08 +0000
Message-Id: <20221031131010.682984-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We originally naively treated expansion as safe because we expected
each new CPU/thread to appear in order. However the -M raspi2 model
triggered a case where a new high cpu_index thread started executing
just before a smaller one.

Clean this up by converting the GArray into the simpler GPtrArray and
then holding a lock for the expansion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221027183637.2772968-29-alex.bennee@linaro.org>

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


