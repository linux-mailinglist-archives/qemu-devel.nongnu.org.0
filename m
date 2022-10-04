Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA75F4212
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgEc-0004Di-KT
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofgB8-0001AP-J5
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:33:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofgB6-000753-DK
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:33:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id bu30so974116wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 04:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=oF7F6AhtybcPIaHi8qI4fAqedd4ySIwVuVC6Y4/Lx7A=;
 b=WrYIBLhrqBjMmGKNl9zifusAbtT0G/gw67S1LpCa1Bp9owLlNvj1po0ScuRoEGn+Gr
 Wsey3LFu7xS6nCXmx+6NOwQZXDKq9OokGoaY2PBpkmHA6494ZCmeRd1NFz6ifG6kYy7g
 puBPvjtD4s5EW/YKVTnQjpPVU1pvltEexh+kDvpdY88TfYF3dJkhlHiN5G2QS49lZ5GR
 OCAulOBiEchCQ3h27dTuHGDZVrAEw6rcgscwe4Bhwce6gMU6RPE6Pa8aQwUMhywUVV/a
 rQhi84y0X3N5O3LFOyWcxAWRhkfojMB2/IrVgQAIjLCz/PIMSrSbCcfNADRcaRFLkBo8
 /EPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oF7F6AhtybcPIaHi8qI4fAqedd4ySIwVuVC6Y4/Lx7A=;
 b=IMxq04EN6a84UgyvjsfJNsznLrnlMan2Lu76B5k/Ip+TWcPxkqmDb69AO2wyI6nMqz
 CDZv4Cz+OQqmjaDfYx4eEXmlOzuMQHBOKxDJoTsafrycSAGdLL1FEqCXA2c8m8ygk6j2
 /z9zoQs7E52WWS47Xn4fJ9UsL3nt2RmN7ZHE7l9wOBM5EXUb48d1yGVJOnn5ZTuj3GNb
 aF7FwLUmlPEr7FgIINp9MvLd6dvuS1K6Mvy4retzkf7MBLA06pF81Ie+NrzEASogVf+b
 569+2p9Ahkku1oSWQgZ02iV3lDhPSdBVxDrQSfyidwVqUZfqFxbfIlvosYvl0bAHx3RY
 1rtQ==
X-Gm-Message-State: ACrzQf2vCT3QM9d1hrsGvQV6StAMN28L94bU0ZXjHYI7pVxXTSxsK3Ps
 7x5uRIiTqzTW2THEl9sI1aJy5w==
X-Google-Smtp-Source: AMsMyM6y/a7JNsRLqSJWUncnsVvK+zzJj6F2zBJfx30yXn6GvxwZSkDIR6ew0sgwqRf4RHjI5d6qcg==
X-Received: by 2002:a5d:6647:0:b0:22e:3ea3:e037 with SMTP id
 f7-20020a5d6647000000b0022e3ea3e037mr5438492wrw.581.1664883214412; 
 Tue, 04 Oct 2022 04:33:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfee83000000b0022cc3e67fc5sm12181599wro.65.2022.10.04.04.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:33:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FE7D1FFB7;
 Tue,  4 Oct 2022 12:33:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, ncopa@alpinelinux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC PATCH] plugins: add [pre|post]fork helpers to linux-user
 [!TESTED]
Date: Tue,  4 Oct 2022 12:33:30 +0100
Message-Id: <20221004113330.2167736-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 include/qemu/plugin.h | 24 ++++++++++++++++++++++++
 linux-user/main.c     |  2 ++
 plugins/core.c        | 20 ++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 145f8a221a..810c6b4588 100644
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
+static inline void qemu_plugin_prefork_lock(void)
+{ }
+
+static inline qemu_plugin_user_postfork(bool is_child)
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


