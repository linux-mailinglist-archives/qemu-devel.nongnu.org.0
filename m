Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7C5EC396
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:06:00 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAHf-0000gx-KO
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S8-0003ZN-E1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:40 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S6-0005IG-N6
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:40 -0400
Received: by mail-pl1-x635.google.com with SMTP id d24so8768534pls.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4YlvwwHBUrcNOnSxEFPAUdpBdu13q6q8TiMytRlndpg=;
 b=cFkWFOU+SLyKxHC8TI5GHsFp3lW+Kro/4tvMMObpv3AzelZkodwoaWDKOOjHXrjaah
 7iFVprZg1icIX23Nwadg67K0mpcj7O4T/Cx3vPGPDbT3/4k8XjgJKXNLZwgeY+r9DCRv
 /OyWiMI+FhJQ1swjcWXULAZ2tv2B/gtd2Xf49okehsgSGFySH7/BX8OiqQz06KASDsxR
 uF5/K/lCCHcXMXk9rJm40pfjmtlBMwubiM/7lGFyVyB+0Jio9XrB8N1Pr5bn3hl9b99E
 FSRHhPyhK2E/+2nW8XQmAeXG2z7L4TV85oTUNY0MjKqOVfhAXuxa7+ku/YAWp7VYqZb/
 U/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4YlvwwHBUrcNOnSxEFPAUdpBdu13q6q8TiMytRlndpg=;
 b=R+yz8kYMU4pYnL4i1pIS/YRFTT48Jhwc29c1JIqsuAj3dYywZiGDR60ixOMcakY4RB
 Px7o1fx54uIWkmr7fCAhXJGIqZhMm2XJDleGCswMUnps7GIFb8m6702JYz5aJJAwYHzH
 hmL73WKApM+OwTso5UTIsrkK2lbEeOu5seKdWOBMLXNjZdldhnK3L3AbdycIuEij8owk
 tnzLJlygUjy1ri/XWYhFa0XsK6uMX/mzhh8YaMnPFNYLlYdsMlV4uBDHdI8zLnadLM9h
 Y45FBRXQsT7EIZi46UiM+3LZr21VQ+LrUi/frGTBQJ5Wv+SnR3fkUt2y6eJahQYzHBO8
 ZOQQ==
X-Gm-Message-State: ACrzQf1G2Dvy4vCN9xdRsJHrVMhNH76GBA8Dvl3W6/3KaiLeOCJRrPMv
 rFFd1wOQbfU8sLOTioix2wYPmxfeAWA=
X-Google-Smtp-Source: AMsMyM64lL6+ATGpyOXwBOFvneYNwcdWi+2gaV70WlSBdvapqQc3yVRRRTah56lhC7GPE5uGtFmJvg==
X-Received: by 2002:a17:902:d2d2:b0:177:4940:cc0f with SMTP id
 n18-20020a170902d2d200b001774940cc0fmr26459896plc.4.1664276917356; 
 Tue, 27 Sep 2022 04:08:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 43/54] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Tue, 27 Sep 2022 19:06:21 +0800
Message-Id: <20220927110632.1973965-44-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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

(no changes since v3)

Changes in v3:
- Add a usleep(1) in the busy wait loop

Changes in v2:
- Change to a busy wait after migration is canceled

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 45c5f5761b..6f9fe13488 100644
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


