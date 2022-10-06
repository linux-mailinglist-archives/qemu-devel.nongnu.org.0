Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EDA5F6B49
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:14:44 +0200 (CEST)
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTWF-00061B-Fa
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfU-0004W1-K1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfS-0006Co-8q
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id 67so2303840pfz.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AFisMEhPtudU5rqA28QSZ0J20KCJlzzQQR7vCLusZI=;
 b=jewsg9XyWDC4WrrEA/6zGWr+cwwwCSGFCPlnzZFpiXBLAKJO2xN3imRzlpLDUSdEhD
 TZW+Ev5XF2hd7PNSLnxmR06hR3/2OH0bzKReEYnLeZHm5GlWjg7mj56a/evUvBBVrWji
 c6tB2PDA/PwxBlPUUUJkLfFnzHWF5RmYHee+yHdK7S2RsGavT7J0UkYVzBVdmnlMLvvm
 veADai00YXhDtDjc60k8teZrwPd41elQfe6O89XYxvAhpXBwIHBBGYgVvLDlMCN5V1zN
 IS1MajYZpvHxoeU6aOuQaBUhAP+P/HsN1PzQ3YgGMe2/l3d2f7VyZYp4iJqJbNVJ8J9k
 XBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AFisMEhPtudU5rqA28QSZ0J20KCJlzzQQR7vCLusZI=;
 b=Wmo4R9fZRri6C0JqjDEyKzgLi4TP+GPRbe8yPVSHCANfIlh7djJ7VXL/CBrmBgitG7
 qXPzGzjWs4PP4YU2OapzOEU2Gtm4IETbRtUvolyxTXKa2WDTD44WtrncLybRiTmNqbsN
 MmzhtnjRrE0Se3XBobv4l91ImPuqKdMo/+H97sldJg8J8+Yv3bs0bGuVQx7loN2B+IKb
 6D9Xf0NwJ7kRBLtpq8BC7Lh7WL6b6TK3lUVw4JXIVVz52UeJBCDTPsIdKin7Xn37UXAR
 lQHAWTE8t/U2o1SUxMxrLNpq7Kb/sYgZFyAIN+B707KgE1cpVeoAJNuE+YLImUxBTJRA
 5zqA==
X-Gm-Message-State: ACrzQf0/j00Wl3tcvr83AcPZNOx175/NQ3H/MPIFft0fS4EaC/gcH4Qo
 SpR3nto5itdzi/9vU6dXrOMUjEwSG/M=
X-Google-Smtp-Source: AMsMyM5Y2QpKHrjZwPTgaNV7xU2imbWsJaj1n8X1q7T5UOfnOFaY3drkfkzb9VMQWYPW6t8LokdfaA==
X-Received: by 2002:a63:fe13:0:b0:452:2b86:50fb with SMTP id
 p19-20020a63fe13000000b004522b8650fbmr330152pgh.167.1665069608431; 
 Thu, 06 Oct 2022 08:20:08 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 12/18] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Thu,  6 Oct 2022 23:19:21 +0800
Message-Id: <20221006151927.2079583-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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
index ef4427ff4d..e5ba0e21d2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2140,6 +2140,10 @@ static void test_multifd_tcp_cancel(void)
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


