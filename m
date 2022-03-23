Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEDB4E5679
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:29:57 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3rw-0002m5-9i
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:29:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PN-0005Og-0g
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PJ-0005O5-BE
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Bm3R/vYLJ3jnt1uqOsIu2MZY57957LvypTiL1JuVIg=;
 b=M3PBOAkZLdswnIujRyzL05IeXphUtxJja95wQSym+s1iqK2w/eCAbvaW1WiowR5RwpdyuT
 eEOd8YYX+LNpO808fevkaBb+HWc6MNSrr4+EnwavJH7D0GJSNfUkG4MvTI75SAd69D02K/
 3XdJbuHsSBFTxPR7NY277VxY2bA8POU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-egI5Q0j8OFCeArz0xKYhtA-1; Wed, 23 Mar 2022 12:00:19 -0400
X-MC-Unique: egI5Q0j8OFCeArz0xKYhtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F9C3803521
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:00:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA2B1C202C9;
 Wed, 23 Mar 2022 16:00:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/32] include: move dump_in_progress() to runstate.h
Date: Wed, 23 Mar 2022 19:57:31 +0400
Message-Id: <20220323155743.1585078-21-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Along with other state tracking functions. Rename it for consistency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h     | 4 ----
 include/sysemu/runstate.h | 1 +
 dump/dump.c               | 4 ++--
 monitor/qmp-cmds.c        | 4 ++--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index fdb0b16166a5..5f53a0e11287 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -76,8 +76,4 @@ int parse_debug_env(const char *name, int max, int initial);
 
 void page_size_init(void);
 
-/* returns non-zero if dump is in progress, otherwise zero is
- * returned. */
-bool dump_in_progress(void);
-
 #endif
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a53569157343..c3f445dd2683 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -69,6 +69,7 @@ void qemu_system_killed(int signal, pid_t pid);
 void qemu_system_reset(ShutdownCause reason);
 void qemu_system_guest_panicked(GuestPanicInformation *info);
 void qemu_system_guest_crashloaded(GuestPanicInformation *info);
+bool qemu_system_dump_in_progress(void);
 
 #endif
 
diff --git a/dump/dump.c b/dump/dump.c
index f57ed76fa76d..5d71c47d06aa 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1564,7 +1564,7 @@ static void dump_state_prepare(DumpState *s)
     *s = (DumpState) { .status = DUMP_STATUS_ACTIVE };
 }
 
-bool dump_in_progress(void)
+bool qemu_system_dump_in_progress(void)
 {
     DumpState *state = &dump_state_global;
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
@@ -1930,7 +1930,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
 
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0b04855ce899..883cf1ca4bbf 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -85,7 +85,7 @@ void qmp_stop(Error **errp)
 {
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
@@ -115,7 +115,7 @@ void qmp_cont(Error **errp)
 
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
-- 
2.35.1.273.ge6ebfd0e8cbb


