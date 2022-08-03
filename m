Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E823588CBE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:13:13 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEBT-0002gm-OV
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJE4L-0002j4-Pt
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:05:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJE4J-0003KO-9F
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:05:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so846558wmm.4
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=vSv3Q3J2ovOGmUs7rN9jQ+/fiC+eBHfeJiLpvH4nmoM=;
 b=p9yzy0D6xEcgAWOPiPtn/2uJ4VDvigj1jz1Gbn3JeHm+PhXKnbkS1t6gsVdEmMlY5q
 oOewIKqzxIP1BiCNClXBlol0lTSLwBxEZM1uqSuVSKFzCxNoMkLpG0LQMJKwzciZDfdU
 wlXtuFH6wGozJoTvhDfFAlnGaIDhUJw5EgTRKFnFVpRq2wd7Lplh/WADgMiSWK8SLAK5
 96gqxx2N8EP3ORWADw00tx1UecdYo7mkB1jP28EnZfEe7wBN/TmkWedtM8c0IXB/icJ9
 NeAtC1b4VCwyg/Bl37J4VhRs/MBiTqm3NtqP+sq25Zws37N5HpYawDQ20z1B3ScLOFh/
 oG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vSv3Q3J2ovOGmUs7rN9jQ+/fiC+eBHfeJiLpvH4nmoM=;
 b=ZKzJw8gjQwGGahj1WBo4RhYnKs3OT20HW7FnpZfVVvO2yGhecwaYF8PeLZr+rA4wl2
 /TwSQSkLfyd7krRr3+YjD9+OPsuAkYN++o76tpAQ6ghMkKeKrilY/XdNqgha6b2YmHKe
 R6mGDyrvjDM1HaRMyZEWmmO6NOxMn/Z+ZY9ehScPbq2CX49QjqzHUNXK76eQPde0rVs9
 nzT0Pga0hBmNo7ebHQLqxsu2zoDWY537aKWxQvpImBUgbm9Gqr/lumZ9zStaNFNc8Lwz
 UH81AVxhIpwGd6qBhoBXLJLianDHTTaZpsOmPmrgWzJ+fcTQTd1wpo8dbB3761zclbqR
 iIdQ==
X-Gm-Message-State: ACgBeo11KY5KxnMAZEMjQjsmBgcYbaO5zbE2HutQ0j37dY0xDq2t6fm0
 7BuoSAcwcOedH5ezyR7cBq+a7Q==
X-Google-Smtp-Source: AA6agR7jeoAkxV4wqwuNfEvc3G6nTzlrJ7AdFEIJ9tEbmfuiI59URYLP3BWHBjUBmhCo3S7AIT6r3A==
X-Received: by 2002:a7b:c391:0:b0:3a3:2f22:7bf6 with SMTP id
 s17-20020a7bc391000000b003a32f227bf6mr2820092wmj.96.1659531945270; 
 Wed, 03 Aug 2022 06:05:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d64e2000000b0021b970a68f9sm1565558wri.26.2022.08.03.06.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:05:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 843161FFB7;
 Wed,  3 Aug 2022 14:05:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Wed,  3 Aug 2022 14:05:37 +0100
Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

While forcing the CPU to unrealize by hand does trigger the clean-up
code we never fully free resources because refcount never reaches
zero. This is because QOM automatically added objects without an
explicit parent to /unattached/, incrementing the refcount.

Instead of manually triggering unrealization just unparent the object
and let the device machinery deal with that for us.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220610143855.1211000-1-alex.bennee@linaro.org>

---
v2
  - move clearing of child_tidptr to before we finalise the CPU
    object. While ts itself can be cleared g2h needs the current CPU
    to resolve the address.
---
 linux-user/syscall.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b27a6552aa..85b9ff2fa6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8570,7 +8570,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
+            if (ts->child_tidptr) {
+                put_user_u32(0, ts->child_tidptr);
+                do_sys_futex(g2h(cpu, ts->child_tidptr),
+                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
+            }
+
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
              * At this point the CPU should be unrealized and removed
@@ -8580,11 +8586,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
             pthread_mutex_unlock(&clone_lock);
 
-            if (ts->child_tidptr) {
-                put_user_u32(0, ts->child_tidptr);
-                do_sys_futex(g2h(cpu, ts->child_tidptr),
-                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
-            }
             thread_cpu = NULL;
             g_free(ts);
             rcu_unregister_thread();
-- 
2.30.2


