Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D866930FB1F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:20:44 +0100 (CET)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jFD-0006qd-TI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIq-00088f-Tg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIi-0005n1-Oi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLxlV8YcrZG8wxhPPp1jZ38qGz5MNzYZ0LbczyXAwxU=;
 b=V07vEDyu4y/PyorgBXNozAYy5UzI4jglP/Q+pFJMl9wTDJ3Z08AEVjgV+fZuNvoGCY7vVx
 BWEbY3gIxDuhKpNCFfkxf79IQD6aeakCvA5LLrwi+eWIEtLAFWHDLP51cCWtR0h+VU5ORz
 Ohq5NdN8Ei/GE4U2GW9js26bvD208fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-rvs3Qj_VM_OCJsyC16mARQ-1; Thu, 04 Feb 2021 12:20:12 -0500
X-MC-Unique: rvs3Qj_VM_OCJsyC16mARQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4AFBBEE2;
 Thu,  4 Feb 2021 17:20:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75E660937;
 Thu,  4 Feb 2021 17:20:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/33] migration: push Error **errp into postcopy_do_resume()
Date: Thu,  4 Feb 2021 17:19:07 +0000
Message-Id: <20210204171907.901471-34-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 32a61b04bf..135a26349f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3163,17 +3163,14 @@ static int postcopy_resume_handshake(MigrationState *s, Error **errp)
     return -1;
 }
 
-/* Return zero if success, or <0 for error */
-static int postcopy_do_resume(MigrationState *s)
+/* Return zero if success, or -1 for error */
+static int postcopy_do_resume(MigrationState *s, Error **errp)
 {
-    Error *local_err = NULL;
-
     /*
      * Call all the resume_prepare() hooks, so that modules can be
      * ready for the migration resume.
      */
-    if (qemu_savevm_state_resume_prepare(s, &local_err) < 0) {
-        error_report_err(local_err);
+    if (qemu_savevm_state_resume_prepare(s, errp) < 0) {
         return -1;
     }
 
@@ -3181,8 +3178,7 @@ static int postcopy_do_resume(MigrationState *s)
      * Last handshake with destination on the resume (destination will
      * switch to postcopy-active afterwards)
      */
-    if (postcopy_resume_handshake(s, &local_err) < 0) {
-        error_report_err(local_err);
+    if (postcopy_resume_handshake(s, errp) < 0) {
         return -1;
     }
 
@@ -3196,6 +3192,7 @@ static int postcopy_do_resume(MigrationState *s)
  */
 static MigThrError postcopy_pause(MigrationState *s)
 {
+    Error *local_err = NULL;
     assert(s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE);
 
     while (true) {
@@ -3235,7 +3232,7 @@ static MigThrError postcopy_pause(MigrationState *s)
             qemu_sem_post(&s->postcopy_pause_rp_sem);
 
             /* Do the resume logic */
-            if (postcopy_do_resume(s) == 0) {
+            if (postcopy_do_resume(s, &local_err) == 0) {
                 /* Let's continue! */
                 trace_postcopy_pause_continued();
                 return MIG_THR_ERR_RECOVERED;
@@ -3245,6 +3242,7 @@ static MigThrError postcopy_pause(MigrationState *s)
                  * pause again. Pause is always better than throwing
                  * data away.
                  */
+                error_report_err(local_err);
                 continue;
             }
         } else {
-- 
2.29.2


