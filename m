Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA64F825D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 17:02:53 +0200 (CEST)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncTet-0005ac-M7
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 11:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncTdE-0004RE-EG
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 11:01:08 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncTd8-0007YX-JO
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 11:01:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id b15so6749768edn.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L7aj3TlH1FeOVFO5fVt8bwxMwqrk5z6X0xlRHY0FX/g=;
 b=qdVxV7rRao6SlSruRvIcoUOnPF7+FarZx8kA/Ee+4hmBf5nvXek2lprSG2FPymf3Aa
 LZVlc2Qz28ZAMf7o/M2uAzLL1zciE9ZE/k4aLdeouHKEgIPfCEEldSImw+o4iMvEzp2j
 DWN3AYgcCrWTiZF66v998AewzeZwJAfXmmBmotVrELb1bgHZQGFQ47S2N45i32ZFkwiN
 wgJ5T8jQjV/pYYMuGLUrsLzYNjezTSnx5+4AbkL4cRWRZNZudeX/Tx0g+cl5WoIhiCHc
 X9nJwzuxihW9Hc24hukuA8aaDz0ngra4EUN6N2C9PqssWe2C4SYuq+mft4rOlCfnIdpW
 VyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L7aj3TlH1FeOVFO5fVt8bwxMwqrk5z6X0xlRHY0FX/g=;
 b=Xwuqt2p2GCcfTW7g/ca1YNFKrCN7LJ+FXL/s4St6HZz/zLa+DUuMSb+4D6PNlNSSi7
 sSlOz1ZylWbVWf0ox3PRaChgBahjZ3DjGqKoqBLrjAZ/LlzhNJsQ9rVW50rQ0Haym8xu
 vdHQZmOJFu1kAlcwRmONTEj7cb5dBsCFhMEV/d/sP4AJAqvZ7H2q2TkQ0+XBBx10np4q
 JBeHhYZCFlNKcagHXtRCa/5eli0BUw3CgNG7A6ipSKiZU0JthTel6/I3PufVWR40ycey
 epC3DxY5bOo48Gqd4bTwtIj07Mgd31XLLbVr8c/W8oWdWRzGEXd7FxoVn57oY7pZ7nRk
 n9Og==
X-Gm-Message-State: AOAM531G0XFtMSjXIoaRZjyJWCIBOCqoJ3QUdZpkMJk9WD4M9XKnSFxS
 2D10oorYl83yirvu1yGpN/vXVQ==
X-Google-Smtp-Source: ABdhPJyxVjuqaQ8nNRycoqGgigf+J2VVy7rzWWBgdNIORl6wje/enmQB8ZFYsjLCVmFJwwoiWOEhGQ==
X-Received: by 2002:a05:6402:34c4:b0:419:e00e:64c1 with SMTP id
 w4-20020a05640234c400b00419e00e64c1mr14752712edc.88.1649343660969; 
 Thu, 07 Apr 2022 08:01:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm7758061ejb.162.2022.04.07.08.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:00:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EC6B1FFB7;
 Thu,  7 Apr 2022 16:00:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/qtest: pass stdout/stderr down to subtests
Date: Thu,  7 Apr 2022 16:00:42 +0100
Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to work out what the virtio-net-tests where doing it was
hard because the g_test_trap_subprocess redirects all output to
/dev/null. Lift this restriction by using the appropriate flags so you
can see something similar to what the vhost-user-blk tests show when
running.

While we are at it remove the g_test_verbose() check so we always show
how the QEMU is run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/qos-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..c6c196cc95 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
 
 static void restart_qemu_or_continue(char *path)
 {
-    if (g_test_verbose()) {
-        qos_printf("Run QEMU with: '%s'\n", path);
-    }
+    qos_printf("Run QEMU with: '%s'\n", path);
     /* compares the current command line with the
      * one previously executed: if they are the same,
      * don't restart QEMU, if they differ, stop previous
@@ -185,7 +183,8 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0, 0);
+    g_test_trap_subprocess(path, 0,
+                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
 
-- 
2.30.2


