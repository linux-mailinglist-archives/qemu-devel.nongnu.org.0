Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D164B9FD0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:11:10 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfcr-0005AD-7w
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPw-0003SA-Om
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPu-00012x-LZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0djHtDYTCT8o11tvsYjoGG7HO47OqRaXAJmmb7d9OM=;
 b=Qz3UalmDfcS1HLSQlj6PfgUfCXKgeuomdqrtj5rkG9U+vRURnqiUd2v9e9ekIxfjxXc3bm
 yICZV1tbZbcSt5QTfdTWHKkijzuiu6Bf9KBTIiLL2F5b7v9ZqWQt9Qo8CnBlkRBBWDhfB2
 8AEtZHm2fMnw6vbKLJaxhdGDENR8svE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-MA6P3HehMO28DVTHt3Yt3g-1; Thu, 17 Feb 2022 06:57:45 -0500
X-MC-Unique: MA6P3HehMO28DVTHt3Yt3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4BE1091DA0;
 Thu, 17 Feb 2022 11:57:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1A03108648D;
 Thu, 17 Feb 2022 11:57:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] seccomp: allow action to be customized per syscall
Date: Thu, 17 Feb 2022 11:57:17 +0000
Message-Id: <20220217115723.1782616-5-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently tailoring whether to use kill process or return EPERM
based on the syscall set. This is not flexible enough for future
requirements where we also need to be able to return a variety of
actions on a per-syscall granularity.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c | 172 +++++++++++++++++++++++++----------------
 1 file changed, 106 insertions(+), 66 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index f50026778c..9f6df8d033 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -38,6 +38,7 @@ struct QemuSeccompSyscall {
     uint8_t set;
     uint8_t narg;
     const struct scmp_arg_cmp *arg_cmp;
+    uint32_t action;
 };
 
 const struct scmp_arg_cmp sched_setscheduler_arg[] = {
@@ -47,61 +48,111 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
 
 static const struct QemuSeccompSyscall denylist[] = {
     /* default set of syscalls that should get blocked */
-    { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(syslog),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(mount),                  QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(umount),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(kexec_load),             QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(afs_syscall),            QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(break),                  QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(ftime),                  QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(getpmsg),                QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(gtty),                   QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(lock),                   QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(mpx),                    QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(prof),                   QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(profil),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(putpmsg),                QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(security),               QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(stty),                   QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(tuxcall),                QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(ulimit),                 QEMU_SECCOMP_SET_DEFAULT },
-    { SCMP_SYS(vserver),                QEMU_SECCOMP_SET_DEFAULT },
+    { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(syslog),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(mount),                  QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(umount),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(kexec_load),             QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(afs_syscall),            QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(break),                  QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(ftime),                  QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(getpmsg),                QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(gtty),                   QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(lock),                   QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(mpx),                    QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(prof),                   QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(profil),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(putpmsg),                QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(security),               QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(stty),                   QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(tuxcall),                QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(ulimit),                 QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(vserver),                QEMU_SECCOMP_SET_DEFAULT,
+      0, NULL, SCMP_ACT_TRAP },
     /* obsolete */
-    { SCMP_SYS(readdir),                QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(_sysctl),                QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(bdflush),                QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(create_module),          QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(get_kernel_syms),        QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(query_module),           QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(sgetmask),               QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(ssetmask),               QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(sysfs),                  QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(uselib),                 QEMU_SECCOMP_SET_OBSOLETE },
-    { SCMP_SYS(ustat),                  QEMU_SECCOMP_SET_OBSOLETE },
+    { SCMP_SYS(readdir),                QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(_sysctl),                QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(bdflush),                QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(create_module),          QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(get_kernel_syms),        QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(query_module),           QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(sgetmask),               QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(ssetmask),               QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(sysfs),                  QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(uselib),                 QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(ustat),                  QEMU_SECCOMP_SET_OBSOLETE,
+      0, NULL, SCMP_ACT_TRAP },
     /* privileged */
-    { SCMP_SYS(setuid),                 QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setgid),                 QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setpgid),                QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setsid),                 QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setreuid),               QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setregid),               QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setresuid),              QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setresgid),              QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setfsuid),               QEMU_SECCOMP_SET_PRIVILEGED },
-    { SCMP_SYS(setfsgid),               QEMU_SECCOMP_SET_PRIVILEGED },
+    { SCMP_SYS(setuid),                 QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setgid),                 QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setpgid),                QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setsid),                 QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setreuid),               QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setregid),               QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setresuid),              QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setresgid),              QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setfsuid),               QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(setfsgid),               QEMU_SECCOMP_SET_PRIVILEGED,
+      0, NULL, SCMP_ACT_TRAP },
     /* spawn */
-    { SCMP_SYS(fork),                   QEMU_SECCOMP_SET_SPAWN },
-    { SCMP_SYS(vfork),                  QEMU_SECCOMP_SET_SPAWN },
-    { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN },
+    { SCMP_SYS(fork),                   QEMU_SECCOMP_SET_SPAWN,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(vfork),                  QEMU_SECCOMP_SET_SPAWN,
+      0, NULL, SCMP_ACT_TRAP },
+    { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN,
+      0, NULL, SCMP_ACT_TRAP },
     /* resource control */
-    { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
-    { SCMP_SYS(sched_setparam),         QEMU_SECCOMP_SET_RESOURCECTL },
+    { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL,
+      0, NULL, SCMP_ACT_ERRNO(EPERM) },
+    { SCMP_SYS(sched_setparam),         QEMU_SECCOMP_SET_RESOURCECTL,
+      0, NULL, SCMP_ACT_ERRNO(EPERM) },
     { SCMP_SYS(sched_setscheduler),     QEMU_SECCOMP_SET_RESOURCECTL,
-      ARRAY_SIZE(sched_setscheduler_arg), sched_setscheduler_arg },
-    { SCMP_SYS(sched_setaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
+      ARRAY_SIZE(sched_setscheduler_arg), sched_setscheduler_arg,
+      SCMP_ACT_ERRNO(EPERM) },
+    { SCMP_SYS(sched_setaffinity),      QEMU_SECCOMP_SET_RESOURCECTL,
+      0, NULL, SCMP_ACT_ERRNO(EPERM) },
 };
 
 static inline __attribute__((unused)) int
@@ -115,15 +166,11 @@ qemu_seccomp(unsigned int operation, unsigned int flags, void *args)
 #endif
 }
 
-static uint32_t qemu_seccomp_get_action(int set)
+static uint32_t qemu_seccomp_update_action(uint32_t action)
 {
-    switch (set) {
-    case QEMU_SECCOMP_SET_DEFAULT:
-    case QEMU_SECCOMP_SET_OBSOLETE:
-    case QEMU_SECCOMP_SET_PRIVILEGED:
-    case QEMU_SECCOMP_SET_SPAWN: {
 #if defined(SECCOMP_GET_ACTION_AVAIL) && defined(SCMP_ACT_KILL_PROCESS) && \
     defined(SECCOMP_RET_KILL_PROCESS)
+    if (action == SCMP_ACT_TRAP) {
         static int kill_process = -1;
         if (kill_process == -1) {
             uint32_t action = SECCOMP_RET_KILL_PROCESS;
@@ -137,16 +184,9 @@ static uint32_t qemu_seccomp_get_action(int set)
         if (kill_process == 1) {
             return SCMP_ACT_KILL_PROCESS;
         }
-#endif
-        return SCMP_ACT_TRAP;
-    }
-
-    case QEMU_SECCOMP_SET_RESOURCECTL:
-        return SCMP_ACT_ERRNO(EPERM);
-
-    default:
-        g_assert_not_reached();
     }
+#endif
+    return action;
 }
 
 
@@ -175,7 +215,7 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
             continue;
         }
 
-        action = qemu_seccomp_get_action(denylist[i].set);
+        action = qemu_seccomp_update_action(denylist[i].action);
         rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
                                     denylist[i].narg, denylist[i].arg_cmp);
         if (rc < 0) {
-- 
2.34.1


