Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D030FB4B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:26:54 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jLB-0001Js-DL
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIn-00087N-2p
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIi-0005ng-PI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/Ra0T4DinBmIkwbi8W/oGROJUqRKQWdb+vyzgrP4aA=;
 b=iyzpP5kMNgSUq4KfRiLOzU2wDujsebmxCfKGnAv0Wvumubr2bwpKmkkfKVWlFWwDJmic4A
 NQsUH6PGSOivBGpTncm3vNTXUSOdzMmqiljSPMsDziwvUSRzWU1MyiBgz6yIzwlG4Vumi3
 16coFVDbJ3FzeKko99unUYxpEuXalhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-FfjMb1rtOlyClrb4mnO1sA-1; Thu, 04 Feb 2021 12:20:11 -0500
X-MC-Unique: FfjMb1rtOlyClrb4mnO1sA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CF60100C661;
 Thu,  4 Feb 2021 17:20:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2947860937;
 Thu,  4 Feb 2021 17:20:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/33] migration: push Error **errp into
 postcopy_resume_handshake()
Date: Thu,  4 Feb 2021 17:19:06 +0000
Message-Id: <20210204171907.901471-33-berrange@redhat.com>
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
 migration/migration.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3f0586842d..32a61b04bf 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3146,7 +3146,7 @@ typedef enum MigThrError {
     MIG_THR_ERR_FATAL = 2,
 } MigThrError;
 
-static int postcopy_resume_handshake(MigrationState *s)
+static int postcopy_resume_handshake(MigrationState *s, Error **errp)
 {
     qemu_savevm_send_postcopy_resume(s->to_dst_file);
 
@@ -3158,13 +3158,14 @@ static int postcopy_resume_handshake(MigrationState *s)
         return 0;
     }
 
+    error_setg(errp, "postcopy resume handshake failed state %x != %x",
+               s->state, MIGRATION_STATUS_POSTCOPY_ACTIVE);
     return -1;
 }
 
 /* Return zero if success, or <0 for error */
 static int postcopy_do_resume(MigrationState *s)
 {
-    int ret;
     Error *local_err = NULL;
 
     /*
@@ -3180,10 +3181,9 @@ static int postcopy_do_resume(MigrationState *s)
      * Last handshake with destination on the resume (destination will
      * switch to postcopy-active afterwards)
      */
-    ret = postcopy_resume_handshake(s);
-    if (ret) {
-        error_report("%s: handshake failed: %d", __func__, ret);
-        return ret;
+    if (postcopy_resume_handshake(s, &local_err) < 0) {
+        error_report_err(local_err);
+        return -1;
     }
 
     return 0;
-- 
2.29.2


