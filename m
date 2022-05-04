Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98278519DDC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:21:02 +0200 (CEST)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmD41-0006q5-FM
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBpA-0000QH-Fj
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBp8-0006HC-RR
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlQECKQuhJDdLwwEy/HTaRQ2au5LWxZ7ON+0Bk3rmJE=;
 b=RsiW8ya/9zJpVRXG3nJwb8X80HUtq8Vy3wnD0apZUTbb2ok3K1xkfWnoOj5zSHvM5gKGpj
 pOYh/f2ep/Nhs+h7B5nk7+zxwGz2jwySardxQPCvm+dhRVPeecAZVXK9kfFwO32yaM5Jdg
 BXJD2r3m7q0RHGru8kBMmqaBY1E1PSQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-4Q1AwTQ8M_6FtD5DhdNaEw-1; Wed, 04 May 2022 06:01:29 -0400
X-MC-Unique: 4Q1AwTQ8M_6FtD5DhdNaEw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFAAE85A5BE;
 Wed,  4 May 2022 10:01:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CB6144A19D;
 Wed,  4 May 2022 10:01:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Deason <adeason@sinenomine.net>
Subject: [PULL 5/7] qga/commands-posix: 'guest-shutdown' for Solaris
Date: Wed,  4 May 2022 14:00:59 +0400
Message-Id: <20220504100101.564747-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Andrew Deason <adeason@sinenomine.net>

On Solaris, instead of the -P, -H, and -r flags, we need to provide
the target init state to the 'shutdown' command: state 5 is poweroff,
0 is halt, and 6 is reboot. We also need to pass -g0 to avoid the
default 60-second delay, and -y to avoid a confirmation prompt.

Implement this logic under an #ifdef CONFIG_SOLARIS, so the
'guest-shutdown' command works properly on Solaris.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220426195526.7699-6-adeason@sinenomine.net>
---
 qga/commands-posix.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ee997a58f21c..7ab8d5eb3c69 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -85,13 +85,23 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     pid_t pid;
     int status;
 
+#ifdef CONFIG_SOLARIS
+    const char *powerdown_flag = "-i5";
+    const char *halt_flag = "-i0";
+    const char *reboot_flag = "-i6";
+#else
+    const char *powerdown_flag = "-P";
+    const char *halt_flag = "-H";
+    const char *reboot_flag = "-r";
+#endif
+
     slog("guest-shutdown called, mode: %s", mode);
     if (!has_mode || strcmp(mode, "powerdown") == 0) {
-        shutdown_flag = "-P";
+        shutdown_flag = powerdown_flag;
     } else if (strcmp(mode, "halt") == 0) {
-        shutdown_flag = "-H";
+        shutdown_flag = halt_flag;
     } else if (strcmp(mode, "reboot") == 0) {
-        shutdown_flag = "-r";
+        shutdown_flag = reboot_flag;
     } else {
         error_setg(errp,
                    "mode is invalid (valid values are: halt|powerdown|reboot");
@@ -106,8 +116,13 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
+#ifdef CONFIG_SOLARIS
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
+              "hypervisor initiated shutdown", (char *)NULL);
+#else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
+#endif
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
-- 
2.36.0.44.g0f828332d5ac


