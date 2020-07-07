Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABF216481
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 05:20:35 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jse9q-0004DL-Bd
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 23:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jse96-0003mR-79
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 23:19:48 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jse94-0002J0-Fm
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 23:19:47 -0400
Received: by mail-wm1-x341.google.com with SMTP id g75so41508251wme.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 20:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMQcln6beIWM2wCoIS7T1da/Ok91kBytCDOiJC9/fuA=;
 b=iBkjIO+W+clGkH17LPtEMc5AA55jA/McoWHT/9QCWQa3/QTFbFJJnPRKW7jmq5P2nM
 wFnK17r7B9NwkKs3lLUAn8w3iKV+HSiZ+jp8NVxEfL/blScvkHU1P66FvnyxBCL9eejE
 rydaMbL1KXR3qkinCpJGhcEvtfhg5pFtNZusz2EcoCatkgV3ZA4UkK+Je6bXbgmLEYCI
 C41F/4TN3wLHX9CrxmaPcX0ySun7feFGtPHPYovI30ap7J2uYWlzNvzxENiP94NwFRd/
 XnEotC/1uFs6fwX0wvFgQU9lkkYdiY+1BV2rgo5Fq7Wxtqq1i+WbkBWhgoKZYJ/urX0I
 DkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XMQcln6beIWM2wCoIS7T1da/Ok91kBytCDOiJC9/fuA=;
 b=mYgCWu3JUfH//O4grxbwVVz9/Sm8/ATJyb1gUgx5WBh3K1q2hOIhnSUdMYspyqJikQ
 NTtw85qcv6Ev2Tznn06Iijiqyo6kVvDCFZOVsCK0to1tk4delKZxdlrgmv1LOGV9oCo8
 gzfmC2Xtyg+fIgGI1/jkWy5RKEA5mAMc3RyyyQPh2DgAVaeQ/7OYGqVvd9WanUD7Rtgn
 EkbZ3sM4tHGVo4AKfWicEqol9eVuLpJzURiI+lFAYPqePFa3NBl50/eqc1Z0mUMq5Iub
 yaPHb8xDw96nW6sBXgxpc2u41JMfWJkmt6CqF1Rd2Bx4p7FiTcl+TOGGqRqggRumcypQ
 m89w==
X-Gm-Message-State: AOAM531Y2eeENcxA6qOphW+r+xK/k9zhvKSau6JLRKnZ1gibmeouQOvJ
 rzuq23IwHUXPUVkfjdqb5hc7PlXc
X-Google-Smtp-Source: ABdhPJwjyHPIY68153KOxAfk6W6fhxBJByAW3dx+vq133f701X8I2hEAWta8yA3Dr13bW3vFxc512A==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr1888210wml.92.1594091962946; 
 Mon, 06 Jul 2020 20:19:22 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 30sm27832456wrm.74.2020.07.06.20.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 20:19:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/libqtest: Do not overwrite child coredump
Date: Tue,  7 Jul 2020 05:19:20 +0200
Message-Id: <20200707031920.17428-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yury Kotov <yury-kotov@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are interested by the coredump of the child, not the qtest
parent. If the child generated a coredump, simply call
exit(EXIT_FAILURE) in the parent to avoid overwriting the
child coredump.

Fixes: 71a268a5fd ("tests/libqtest: Improve kill_qemu()")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/libqtest.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 49075b55a1..bd85d01145 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -173,7 +173,12 @@ static void kill_qemu(QTestState *s)
         fprintf(stderr, "%s:%d: kill_qemu() detected QEMU death "
                 "from signal %d (%s)%s\n",
                 __FILE__, __LINE__, sig, signame, dump);
-        abort();
+        if (WCOREDUMP(wstatus)) {
+            /* Preserve child coredump */
+            exit(1);
+        } else {
+            abort();
+        }
     }
 }
 
-- 
2.21.3


