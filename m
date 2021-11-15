Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68945019A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 10:44:56 +0100 (CET)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYXn-0002kA-Mu
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 04:44:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYV2-0000I9-1b
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:04 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:57514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYUy-0003Uq-DY
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:02 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 26DF92E0A2C;
 Mon, 15 Nov 2021 12:41:55 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 9qoVj7sgfN-fssObqAM; Mon, 15 Nov 2021 12:41:55 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636969315; bh=3kiwD/t2GjiTMDtVtYiHujmyCLuy/WmBdmnj7Nqa41s=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=igVSc6HsiHR4euEY07OdBLhqjKWbPgPqpJuaghuQ04aT2eZ2a0UcC2X+R142i5TvA
 dVLB0CYS6YBSusvVbn18NfUpRtQURsriI9NxyjvvvzHyu5pOEGFwILGJls1yhxVvw4
 AolL+rv9fhlDW43hSGJ9sShaQHlpEH8ggRUZ84kc=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8016::1:27])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 1oVbS2CALn-fsw4Tomv; Mon, 15 Nov 2021 12:41:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] vl: flush all task from rcu queue before exiting
Date: Mon, 15 Nov 2021 12:41:43 +0300
Message-Id: <20211115094143.157399-3-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
References: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, dgilbert@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device destruction may superimpose over qemu shutdown.
In this case some management layer, requested a device unplug and
waiting for DEVICE_DELETED event, may never get this event.

This happens because device_finalize() may never be called on qemu shutdown
for some devices using address_space_destroy(). The later is called from
the rcu thread.
On qemu shutdown, not all rcu callbacks may be called because the rcu thread
may not have enough time to converge before qemu main thread exit.

To resolve this issue this patch makes rcu thread to finish all its callbacks
explicitly by calling a new rcu intreface function right before
qemu main thread exit.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 include/qemu/rcu.h |  1 +
 softmmu/runstate.c |  2 ++
 util/rcu.c         | 12 ++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf11c..f7fbdc3781e5 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -134,6 +134,7 @@ struct rcu_head {
 
 extern void call_rcu1(struct rcu_head *head, RCUCBFunc *func);
 extern void drain_call_rcu(void);
+extern void flush_rcu(void);
 
 /* The operands of the minus operator must have the same type,
  * which must be the one that we specify in the cast.
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 8d29dd2c00e2..3f833678f6eb 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -821,6 +821,8 @@ void qemu_cleanup(void)
     audio_cleanup();
     qemu_chr_cleanup();
     user_creatable_cleanup();
+    /* finish all the tasks from rcu queue before exiting */
+    flush_rcu();
     monitor_cleanup();
     /* TODO: unref root container, check all devices are ok */
 }
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb2a..f047f8ee8d16 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -348,6 +348,18 @@ void drain_call_rcu(void)
 
 }
 
+/*
+ * This function drains rcu queue until there are no tasks to do left
+ * and aims to the cases when one needs to ensure that no work hang
+ * in rcu thread before proceeding, e.g. on qemu shutdown.
+ */
+void flush_rcu(void)
+{
+    while (qatomic_read(&rcu_call_count) > 0) {
+        drain_call_rcu();
+    }
+}
+
 void rcu_register_thread(void)
 {
     assert(rcu_reader.ctr == 0);
-- 
2.25.1


