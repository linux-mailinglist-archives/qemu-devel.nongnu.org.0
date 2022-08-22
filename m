Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1959C60C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:25:31 +0200 (CEST)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQC78-0008VG-KU
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAil-0008JQ-9I
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAii-0005zi-Kz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id j21so17064593ejs.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WyNPEcxZT+0dqh6qBfly/w3zPsNi3DOLgNMcDAo03+c=;
 b=xp6Lvgda1S5jVv91RNXM1Y9TWMqxk/95sKnoDb/YZqb84DuXEkbDCR1DI3qrz/L/5e
 lVr0GV2/UtY45KU3dnGsOp2RGUbyjndps3zFXtrR/xp0Dqol65eZSX5M5L7uzfI7uKcF
 p+C6A/YsVuSfFQ1bwMam2duDCJcdCyzMGlifK0zoVnEnIrbPSu+An++kSoXBxXIInoEh
 TjoKyr1cYIH/Hbnh7ET2jjSHVwtFoziMAXZIlHKyWP5aBBi1oBy57Q8MMCh8xo7mm6F7
 7BWXr6VLw3E2AK0KIoiXtvxFxKUzS9rUiFCseGA0VgfrnujQt1AfHkMfIzt1PHauNWb0
 qLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WyNPEcxZT+0dqh6qBfly/w3zPsNi3DOLgNMcDAo03+c=;
 b=gtsP21SSHLIowhBdQgI4jXEaaG1q5AmxPRGnS0eLFn8SCPlKGLy4Or3JnbrUbKP1oS
 hTtUVBMXAAuqGwJmqtJbSri06vV2Bu5H4jM1XIslax4CLEEHJchjEQ7gHOCVrTQOtsps
 gFaNNMt4stREm33mYgYgIxRfx/vsp7UBwnQ4cDvscJYLEBNpvPATxA7Hit16y2eXU+sQ
 IaUx2OUgcIssMyIJIY7wYcSfOcfAvIl8RLj0XaJxkVbHSyp/r1yWK0TWlGNb7Yc/IGoq
 sIfnamS3txL5wIDx4VSuVxdw9zJaq3LzYLNjMEMO94Q76jpWE7IkKGGLz1vIVD6OIfgJ
 q0mA==
X-Gm-Message-State: ACgBeo1MNpL/A3IAQJEseJ+PN6FhCYQJ0OJ6iFD8cf7Uk9030LRYa37M
 S2Adx+wiIMzFpEOHAEt82tCReg==
X-Google-Smtp-Source: AA6agR4tiy5BO8VJCzRreDgPS5zt7fEYGxvDl7wxMnSIaXCZc5+xOP++lD/48TTqOvfFZCCPxDa3UA==
X-Received: by 2002:a17:907:2e01:b0:730:a098:7257 with SMTP id
 ig1-20020a1709072e0100b00730a0987257mr13969563ejc.705.1661187371286; 
 Mon, 22 Aug 2022 09:56:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906694f00b0073d6cfdc44dsm3095409ejs.115.2022.08.22.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19A841FFBA;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v1 2/6] tests/qtest/migration-test: Only wait for serial
 output where migration succeeds
Date: Mon, 22 Aug 2022 17:56:04 +0100
Message-Id: <20220822165608.2980552-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Waiting for the serial output can take a couple of seconds - and since
we're doing a lot of migration tests, this time easily sums up to
multiple minutes. But if a test is supposed to fail, it does not make
much sense to wait for the source to be in the right state first, so
we can skip the waiting here. This way we can speed up all tests where
the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
each of the migration-tests now run two minutes faster!

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220819053802.296584-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/migration-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 520a5f917c..7be321b62d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1307,7 +1307,9 @@ static void test_precopy_common(MigrateCommon *args)
     }
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    if (args->result == MIG_TEST_SUCCEED) {
+        wait_for_serial("src_serial");
+    }
 
     if (!args->connect_uri) {
         g_autofree char *local_connect_uri =
-- 
2.30.2


