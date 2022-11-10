Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A5623BC8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10U-000252-PL; Thu, 10 Nov 2022 01:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10Q-000232-W2
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:43 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10P-0008Su-Hf
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:42 -0500
Received: by mail-pf1-x433.google.com with SMTP id b185so1007655pfb.9
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2AW9NaqdulAEV6U7rG6cnfGeNB8asIOOIZhmyN9/Ug=;
 b=2Sk9AwSSjoJXhw7R+5QsY+j1MeYjLji0TJU2NWuw+LarU3pkAu6e3xJmpscrH3yoTF
 c6q7tGfc4JZpcdP38HoWDq1kDPg7qiFvWLR1iLDgMZlQnndAlI835b9iwidwNbvEW5yt
 R8osHiy3v2QGapQxRp1gyeeCgyJHAs6qDqo9A6ZmIA5cqaGmKGhxOSpyOWepxLPMAj8C
 tp5nsCg+RwaTKQgpH+bgeVKLVwJZZZFQrl5fTCdnM+sf9iANRcyxn8TKsumi2pJWOBcg
 bclkPzHBUhr5Yi0tqKbh7/K9qNP5gKWBsGzNR3drQ5SvDNrwzgpTximxES8AUE8mRmzu
 Kp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X2AW9NaqdulAEV6U7rG6cnfGeNB8asIOOIZhmyN9/Ug=;
 b=eTdbz/y15JaprVfa4SnSd+JnHohSevpODXlJWuCcMCxGKlNp0wI/PgG17kmCjXz505
 v0L/SXICnjXwxSWOEPBO4uJe3OuV5/PoH2aDqUxBCQGey1+NFHPTk15iL7VpE8A7rWpl
 oLTRNi4JQQFl32cYeMsZgnj2h6/uim4DQnHGLjgqARprTLJoL8bBCf1awMiXq9ADmCTI
 ghTqss/UVXLYj+9ZF5ALrqboYV1aVy28Xu8WuRb0kIyGNaU1eRulKHslpJfF8LV0jp99
 XVEwxemAdCaPmi2zWeBFJmPVQNkCLZLgjlh+or+eX9lMeA/3rqSWxMff2XGXJxv3NY0E
 DZUQ==
X-Gm-Message-State: ACrzQf2a404x/onGBWPJtkWj9yE9avnYMG1QmFirCRh92aufMhxEWAev
 6KRSgDqHzFSi34kXltfpU8WmnroF9dm1i5ZX
X-Google-Smtp-Source: AMsMyM4gjuN3Spi/5/tKLTmgjhUfJNjx2W2suDEJV/ukujpOOEryjPm0d+RFx/rG/yZjgtH2cwb8KA==
X-Received: by 2002:a65:62c7:0:b0:463:9c67:5fe2 with SMTP id
 m7-20020a6562c7000000b004639c675fe2mr53818716pgv.443.1668061540387; 
 Wed, 09 Nov 2022 22:25:40 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:40 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 05/10] qga: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:24 +0900
Message-Id: <20221110062329.13363-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu_get_runtime_dir() is used to construct the default state directory.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 qga/main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index b3580508fa..dc875079f0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -46,12 +46,11 @@
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
 #endif /* __FreeBSD__ */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
-#define QGA_STATE_RELATIVE_DIR  "run"
 #else
 #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
-#define QGA_STATE_RELATIVE_DIR  "qemu-ga"
 #define QGA_SERIAL_PATH_DEFAULT "COM1"
 #endif
+#define QGA_STATE_RELATIVE_DIR  "qemu-ga"
 #ifdef CONFIG_FSFREEZE
 #define QGA_FSFREEZE_HOOK_DEFAULT CONFIG_QEMU_CONFDIR "/fsfreeze-hook"
 #endif
@@ -128,12 +127,12 @@ static void stop_agent(GAState *s, bool requested);
 static void
 init_dfl_pathnames(void)
 {
-    g_autofree char *state = qemu_get_local_state_dir();
+    g_autofree char *run = qemu_get_runtime_dir();
 
     g_assert(dfl_pathnames.state_dir == NULL);
     g_assert(dfl_pathnames.pidfile == NULL);
-    dfl_pathnames.state_dir = g_build_filename(state, QGA_STATE_RELATIVE_DIR, NULL);
-    dfl_pathnames.pidfile = g_build_filename(state, QGA_STATE_RELATIVE_DIR, "qemu-ga.pid", NULL);
+    dfl_pathnames.state_dir = g_build_filename(run, QGA_STATE_RELATIVE_DIR, NULL);
+    dfl_pathnames.pidfile = g_build_filename(run, QGA_STATE_RELATIVE_DIR, "qemu-ga.pid", NULL);
 }
 
 static void quit_handler(int sig)
-- 
2.38.1


