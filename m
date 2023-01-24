Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D139167A0DD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhe-0005Ro-9n; Tue, 24 Jan 2023 13:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhI-000539-Lz
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhD-00073p-HZ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r9so14715448wrw.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZB9Cc0xMOhCGJB6fTmQvTQEJUTVvHhHFvjiUGcRpH00=;
 b=pe+95QOVsTjJ44EHeaoZcKhwMNh64ZUVrrrhXvIL68QiTALPRa1gp13KFKcb/nWFMO
 /iy/zqSUsQ+tdcK2dRIdWDe2UIcY0ATMV3tYxYU62sLN7LetwYJIfNVacwERvlmPoT+D
 pdpYe5P/Rjp+waAWefMCXRoID+2F3DwnMo/ykagBc334FBAesgUO9eTRwkQIOwq0HZwj
 keNslHqpWOJZV0oDWcRT8Qv6tx3zXziBA/YzP47+pqmWZhGclphJZME7UmQ+FQxzvw4k
 nxNIGv4wQd8wDd+pTfu1TjwSHjJ4jmYJK8sJ9iBxwhM1oqm5ffFX4XfrQpmofBoM5G4z
 o7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZB9Cc0xMOhCGJB6fTmQvTQEJUTVvHhHFvjiUGcRpH00=;
 b=68Nwksel3wJSR2euPEgCcKc8TSbFRHz2YBrn/UI/ewT8zbDEIbkbLkyV3DHY2dPfZ+
 6tyov0h4jzH5DEB1S6mTS1ZrGUSFzfD6h+KfWlMyJ0jzbzYbPWC2hmDjQflWV/tTvka+
 7lng1APE96CqOSW/pOoneaxkrvAyaSC6fFdGu6ztvc4NtSVENfvOxKpQeu3whMwOu/7H
 jXk8BKsYK4d9bMAp4OXSZXOgZdB0n4xwLwutWf1jKjGLZu56Z/a6s9FlmAfUh2F6uiyk
 PoVsqvKW8Y0TJ9d4gjz9eqyptl9YYW6Co3VF2wIUcUabAjVCs91xfvsQJTfbU+zWmGAV
 B96Q==
X-Gm-Message-State: AFqh2kr3efK6XlIv2ujNzUYwnDXM0vaxCVdPuAa//lT/mYUaJcHNCHiu
 NFBqpMV1lz/WFkTyGDrG75vjdQ==
X-Google-Smtp-Source: AMrXdXtUEFzxnUHwfrWRJtORwH4MmGE8/Yb+qkRwb3GnufYkSR0JJluyWyRhpkgauebkLwX9msGHuA==
X-Received: by 2002:adf:e883:0:b0:2be:4624:dd81 with SMTP id
 d3-20020adfe883000000b002be4624dd81mr16711968wrm.58.1674583617838; 
 Tue, 24 Jan 2023 10:06:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d5705000000b002bdbde1d3absm2334319wrv.78.2023.01.24.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AE4F1FFD1;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 30/35] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Tue, 24 Jan 2023 18:01:22 +0000
Message-Id: <20230124180127.1881110-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emilio Cota <cota@braap.org>

To fix potential deadlocks as reported by tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230111151628.320011-6-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..728bacef95 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -500,10 +500,17 @@ void qemu_plugin_user_exit(void)
     enum qemu_plugin_event ev;
     CPUState *cpu;
 
-    QEMU_LOCK_GUARD(&plugin.lock);
-
+    /*
+     * Locking order: we must acquire locks in an order that is consistent
+     * with the one in fork_start(). That is:
+     * - start_exclusive(), which acquires qemu_cpu_list_lock,
+     *   must be called before acquiring plugin.lock.
+     * - tb_flush(), which acquires mmap_lock(), must be called
+     *   while plugin.lock is not held.
+     */
     start_exclusive();
 
+    qemu_rec_mutex_lock(&plugin.lock);
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
@@ -513,13 +520,12 @@ void qemu_plugin_user_exit(void)
             }
         }
     }
-
-    tb_flush(current_cpu);
-
     CPU_FOREACH(cpu) {
         qemu_plugin_disable_mem_helpers(cpu);
     }
+    qemu_rec_mutex_unlock(&plugin.lock);
 
+    tb_flush(current_cpu);
     end_exclusive();
 
     /* now it's safe to handle the exit case */
-- 
2.34.1


