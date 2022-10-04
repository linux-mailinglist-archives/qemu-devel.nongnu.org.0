Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CB5F426A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:54:34 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgVN-0007rK-1j
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofgTR-0006ST-Nx
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:52:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofgTP-0001qO-I0
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:52:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso10687426wmk.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Fhd1uL9cZ5nuv6sVBgm7UzbxQkwvwqsikXE40wb1KsU=;
 b=XXMkw5mJZerKefwBia+4xbDzuU59en4EMjcsadz1BxAFS+vT10Qby68ud81ZwvDs+H
 ufwAHUnXwdOM8dwPuAFKAO+Z1DYJW6RB82ztiOz7+1mRtbFCOmf0sET7VDdNMBTMYOG7
 wX6FaNDdXTZ5IyUC9LnhUQyXY+itjbTomE64h4rZbjoy9Tz09k5yupu/l28J7cRttAYp
 qxwdyoVZhu0Bcze6Q6ALA+3VLD8tSnhaj9hIp5/9peF8NoNM7xsr/N+F1BrGGefrNyeL
 AzT7W4v4Y0vHTkby4VJUF5U7KjS21gYO4r6UwdU44k44Dw6+ziHCdNMTfp+uSluwiHgM
 VacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Fhd1uL9cZ5nuv6sVBgm7UzbxQkwvwqsikXE40wb1KsU=;
 b=UAhoC6YJhqfcMYiWJpVpeVaNJiAbfSnxTvBZWNlqtp39iW9ke0OuOT8K7wxV6CXzl4
 8ccM0/U7zoKO+daTLL+MBsV8kkt5ihhdA4w5Xin31np6Bgxd4n4vp0ylkLwu3Hg+MXPo
 p9q0mxFn/EZyp62uOPSp7PIFQn+NqD45ar/UXgicA3SxRRPHFRO/GhU4XWsXpuh4SItj
 X/pmi80APTUWEkqPECjyORwbgjG1bYcAY6O8+ZllLxgXbyJMEmzRAaKkrzQ9RSro5Epf
 kqm+31DvqpkUSNkjvFEA9odTKObvyBXJsjfnMA8CCr3NNBcgLqEYETyYINULVtvLNKUt
 3BVw==
X-Gm-Message-State: ACrzQf2noZfy3FdP2rJgWB6aGxYdbH7a3HiVEboEnPnIBLhY2Kry0Xof
 faPr2gyh0gTtXEDTPHBuPJkBhg==
X-Google-Smtp-Source: AMsMyM4pbrn6BU1Xqy9tyWjum6RilbDB2zj/XOu4c5IvhOhYbbuzgeq0End4JSCZp9lDj4Zwz3wPAQ==
X-Received: by 2002:a05:600c:43d3:b0:3b3:2f1c:f01c with SMTP id
 f19-20020a05600c43d300b003b32f1cf01cmr9868602wmn.152.1664884346078; 
 Tue, 04 Oct 2022 04:52:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bn23-20020a056000061700b0022e55f40bc7sm1032962wrb.82.2022.10.04.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:52:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE1BE1FFB7;
 Tue,  4 Oct 2022 12:52:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, ncopa@alpinelinux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC PATCH v2] plugins: add [pre|post]fork helpers to linux-user
 [!TESTED]
Date: Tue,  4 Oct 2022 12:52:21 +0100
Message-Id: <20221004115221.2174499-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Special care needs to be taken in ensuring locks are in a consistent
state across fork events. Add helpers so the plugin system can ensure
that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/358

---
v2
  - fix null inline prototypes
---
 include/qemu/plugin.h | 24 ++++++++++++++++++++++++
 linux-user/main.c     |  2 ++
 plugins/core.c        | 20 ++++++++++++++++++++
 3 files changed, 46 insertions(+)

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
index c3ae284994..ccb770a485 100644
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


