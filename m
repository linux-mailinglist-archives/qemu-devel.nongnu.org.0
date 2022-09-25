Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A505E92FE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:12:25 +0200 (CEST)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQUi-000817-Eh
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsB-0003On-Bb
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:37 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs9-0006SV-K3
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r62so390332pgr.12
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YsVoae9ivi9Cg+kCdP1PRZfFksunz3gscATDK4L4ZUA=;
 b=cNxpQ7jSHDfY68Cqg/xlvB6wyba2e1lDf/2BVtZb5AuhvkuR9C3GhMF/R5kKUlc7du
 habTHdHW9uSMqw36KQ4e28GWl4UswDrgf/pViczPQbsueHogqxwUsv+Y3ONrIRvdfGzT
 whauQR6V76i/yG95qlxnKWlue0DkWqmn0pb+8QN69Lin/QIOPU9DIpSgJNP3NUdrvivU
 h+n9PpGDmrTzcu2adZAdZJjTaShJ8d6RxMeD1ZApXHQRuUV6bDfm4gf7SvOl1yfwOuDw
 Dg7sUPuat9m+6g6PR6a8wlmPoBjO1aTtuxmoVOA7nZbCWGZl3D5bqX6UkOP3WNzVfWbK
 JQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YsVoae9ivi9Cg+kCdP1PRZfFksunz3gscATDK4L4ZUA=;
 b=48RoMIfKk2RSbpkN2+2WpqaKIZRUqTug/3TUDaRrTboViDZIPBD9nyyXhRoKyWK+3j
 CDP8tH3LrcGND02tNQ9kwb7ODjf+fbTHXamLTjkpYk7w6wYFBU4hRR+CUURoJd+XRsZp
 +iqC8qoMISHE/7md5p8pkeos5Uig+FijZvcdvGLUMkkSjKf+H+pgLwH0wmqwA3AaTUh5
 BZi/N85+RjI/TtLswyI860E3UXjMcVmJfigyaGAuE+EXYEhe+rC5iiTp7EyLJ/z+s0eE
 xjz7DKr2sxJcWMUDUG6RVFKVlEyEzCt4h2IdUEP9XXDsFj7ZJt3v2nYeZFJ/IwgNpQjD
 d+UA==
X-Gm-Message-State: ACrzQf0acWatcsr+F383WcUMj/MhmOR2q+TbvKS8y8BnhTYpWBSNdbzy
 ++tZeV+A3bDysNPqOln3qYCXV6Xbs5w=
X-Google-Smtp-Source: AMsMyM4kJ8GIssnDjNjwmzdNK7nTimeh1EXZXcfv/6dw4DGF8DGNmjcUkakEq2EaS/Y7wAWoqqlbMQ==
X-Received: by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with SMTP id
 h4-20020a056a001a4400b005286af7ff4amr18381770pfv.78.1664105552193; 
 Sun, 25 Sep 2022 04:32:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 43/54] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Sun, 25 Sep 2022 19:30:21 +0800
Message-Id: <20220925113032.1949844-44-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Make sure QEMU process "to" exited before launching another target
for migration in the test_multifd_tcp_cancel case.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Add a usleep(1) in the busy wait loop

Changes in v2:
- Change to a busy wait after migration is canceled

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index a1dd342739..9ec501d1eb 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
     wait_for_migration_pass(from);
 
     migrate_cancel(from);
+    /* Make sure QEMU process "to" exited */
+    while (qtest_probe_child(to)) {
+        usleep(1);
+    }
 
     args = (MigrateStart){
         .only_target = true,
-- 
2.34.1


