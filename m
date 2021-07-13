Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304463C7323
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:26:22 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KIf-0005yU-6x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGZ-000398-3T
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGX-0001wC-IP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLicAbQ6BbohQeCm60hkQbJ59Id12TDfMlMmNWs0oxg=;
 b=gDYTBDhST69yeNxRIFGYmnipH1r/iFdHxtZVHoa3kdP3wNDZ5qNZyQxUFSj/LKzSnpB/ZF
 ee7vsco3USMHZ/iODvipmmfyO43tz4N16hmArWMc4ZV/8Ba19rG4hEhWvRGgop5gDxdkc2
 n2DVC7PxamCW67S9866YOp/3LqVQXI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-ldgtMkcJOSedQI7o5WtDcw-1; Tue, 13 Jul 2021 11:24:07 -0400
X-MC-Unique: ldgtMkcJOSedQI7o5WtDcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995F2800050;
 Tue, 13 Jul 2021 15:24:06 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 766AA5D9CA;
 Tue, 13 Jul 2021 15:24:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 5/6] migration: Clear error at entry of migrate_fd_connect()
Date: Tue, 13 Jul 2021 16:23:23 +0100
Message-Id: <20210713152324.217255-6-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

For each "migrate" command, remember to clear the s->error before going on.
For one reason, when there's a new error it'll be still remembered; see
migrate_set_error() who only sets the error if error==NULL.  Meanwhile if a
failed migration completes (e.g., postcopy recovered and finished), we
shouldn't dump an error when calling migrate_fd_cleanup() at last.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210708190653.252961-4-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 20c48cfff1..2d306582eb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1855,6 +1855,15 @@ void migrate_set_error(MigrationState *s, const Error *error)
     }
 }
 
+static void migrate_error_free(MigrationState *s)
+{
+    QEMU_LOCK_GUARD(&s->error_mutex);
+    if (s->error) {
+        error_free(s->error);
+        s->error = NULL;
+    }
+}
+
 void migrate_fd_error(MigrationState *s, const Error *error)
 {
     trace_migrate_fd_error(error_get_pretty(error));
@@ -3970,6 +3979,13 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     int64_t rate_limit;
     bool resume = s->state == MIGRATION_STATUS_POSTCOPY_PAUSED;
 
+    /*
+     * If there's a previous error, free it and prepare for another one.
+     * Meanwhile if migration completes successfully, there won't have an error
+     * dumped when calling migrate_fd_cleanup().
+     */
+    migrate_error_free(s);
+
     s->expected_downtime = s->parameters.downtime_limit;
     if (resume) {
         assert(s->cleanup_bh);
-- 
2.31.1


