Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA85F45DA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:45:57 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjBD-0003Rp-DJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi9L-0001dC-Av
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:39:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi9J-00023Y-8u
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:39:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id iv17so8907534wmb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/9Y6bpIHZhQdKfRF3tpCFZOqNt538z/9rXtxQM4vg68=;
 b=ZxfLpC+NyrTYle0l7hQPZpiMBUw1aMhslEnk+H0uD+MLtPbyOG/XxxqzQsd9R3V84W
 +zrD4JDw8j4EsXNLzC25R+ZIZNd5QBLhgde9ZJA0aXbJD/NfiPgTF2MTnNaPPjIaOnVc
 kxu31hzrGGcRRP69IQb4q/SMvhpGckVNxfHPAQ1oABF0YDMcGH0bvGGn4HZQg+Ilf28+
 +BwLwUbTQu1Auj//gf8N9LrdgCCLvdh7oF4v+5HJB3nj9CFoO4ipravv8L1dB+eFbSbM
 Rc7zSkcrw/p3QmXk5RkmZ6BPDrObfK04TeUJ8m23xYVzheFpRNelJ6mF/YKP/m8iCjao
 pVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/9Y6bpIHZhQdKfRF3tpCFZOqNt538z/9rXtxQM4vg68=;
 b=vz6BRugCDQABipPZZU8osmOByWX/1lLi2asOguuZ5nQhvAx8hRadDp/IQiTrZkGjb7
 zasysbQdl6pfbjt6c/P617meG+JwJsepzjYqCGMNf/GlZhDIQjmQfDpbsoNDosbTHxAS
 sbXXHMUtNy44H1SjXa5cokQtlLt2s0B+0AjWnzNwewN34O5KuhB2EVRz1JyPqg7F9NL9
 XBlfoRznbER7sVi5wXWpDM8VkPhpPNTymZO9EbewqJIu9TWFcFDEuslI1FSrFZ0Mz5Sj
 JFVXq4MKQWtXZGBM6YLyOjzRLtGM9/OfS5l3IeidkcCgM7M1kV/UvBBpZz72kD+F0v+V
 CH1Q==
X-Gm-Message-State: ACrzQf1PyU+Kzvdavyv0KOk1Q9JfIC8ixliumRy2q8S/aCIjplBpIkpK
 Bd9PivLYWVBgRm+26aD711SMEg==
X-Google-Smtp-Source: AMsMyM7UAo4gvNuYtU0hBWXxF4X0NelWULqR8Zg3oPdcoVqTsh0/q9uMuNgIfaDs4ZQPPsTwez0gdw==
X-Received: by 2002:a05:600c:3d17:b0:3b4:adc7:976c with SMTP id
 bh23-20020a05600c3d1700b003b4adc7976cmr9959018wmb.108.1664890791397; 
 Tue, 04 Oct 2022 06:39:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b0022878c0cc5esm12415603wrm.69.2022.10.04.06.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:39:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74CE91FFBD;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 54/54] plugins: add [pre|post]fork helpers to linux-user
Date: Tue,  4 Oct 2022 14:01:38 +0100
Message-Id: <20221004130138.2299307-55-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Special care needs to be taken in ensuring locks are in a consistent
state across fork events. Add helpers so the plugin system can ensure
that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/358
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221004115221.2174499-1-alex.bennee@linaro.org>

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 145f8a221a..a772e14193 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -224,6 +224,23 @@ void qemu_plugin_disable_mem_helpers(CPUState *cpu);
  */
 void qemu_plugin_user_exit(void);
 
+/**
+ * qemu_plugin_user_prefork_lock(): take plugin lock before forking
+ *
+ * This is a user-mode only helper to take the internal plugin lock
+ * before a fork event. This is ensure a consistent lock state
+ */
+void qemu_plugin_user_prefork_lock(void);
+
+/**
+ * qemu_plugin_user_postfork(): reset the plugin lock
+ * @is_child: is this thread the child
+ *
+ * This user-mode only helper resets the lock state after a fork so we
+ * can continue using the plugin interface.
+ */
+void qemu_plugin_user_postfork(bool is_child);
+
 #else /* !CONFIG_PLUGIN */
 
 static inline void qemu_plugin_add_opts(void)
@@ -287,6 +304,13 @@ static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
 
 static inline void qemu_plugin_user_exit(void)
 { }
+
+static inline void qemu_plugin_user_prefork_lock(void)
+{ }
+
+static inline void qemu_plugin_user_postfork(bool is_child)
+{ }
+
 #endif /* !CONFIG_PLUGIN */
 
 #endif /* QEMU_PLUGIN_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 88fccfe261..a17fed045b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -142,10 +142,12 @@ void fork_start(void)
     start_exclusive();
     mmap_fork_start();
     cpu_list_lock();
+    qemu_plugin_user_prefork_lock();
 }
 
 void fork_end(int child)
 {
+    qemu_plugin_user_postfork(child);
     mmap_fork_end(child);
     if (child) {
         CPUState *cpu, *next_cpu;
diff --git a/plugins/core.c b/plugins/core.c
index 792262da08..532cbaa94d 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -526,6 +526,26 @@ void qemu_plugin_user_exit(void)
     qemu_plugin_atexit_cb();
 }
 
+/*
+ * Helpers for *-user to ensure locks are sane across fork() events.
+ */
+
+void qemu_plugin_user_prefork_lock(void)
+{
+    qemu_rec_mutex_lock(&plugin.lock);
+}
+
+void qemu_plugin_user_postfork(bool is_child)
+{
+    if (is_child) {
+        /* should we just reset via plugin_init? */
+        qemu_rec_mutex_init(&plugin.lock);
+    } else {
+        qemu_rec_mutex_unlock(&plugin.lock);
+    }
+}
+
+
 /*
  * Call this function after longjmp'ing to the main loop. It's possible that the
  * last instruction of a TB might have used helpers, and therefore the
-- 
2.34.1


