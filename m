Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA306332BA0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:12:14 +0100 (CET)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJexx-00066z-TO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJef3-00043A-KB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeew-0000zI-5X
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4bsRq1VirKe2ASbmCZh3EkX8lBPwCCHptbKgdSJPKI=;
 b=O8hIKuPUBgMuBJ2b722lXyuyl9smFTJmC1iGsCtiE5iyTJ9a3zoS6p7qXyIxSnm8chxmvO
 U9eWjr76qr7WgN7sJrA/LQiPJedblS7VRN0+O9ZHBvvHZshR5NAJ5QH9fYGI8z2X9npJDN
 ndPrqHyoCgwjwxGVKfyBnKXidUm2/HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-9OJ7n1yaOI2TcgI7nJrDyg-1; Tue, 09 Mar 2021 10:52:29 -0500
X-MC-Unique: 9OJ7n1yaOI2TcgI7nJrDyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE961018F64;
 Tue,  9 Mar 2021 15:52:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 805A019714;
 Tue,  9 Mar 2021 15:52:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] block/mirror: drop extra error propagation in
 commit_active_start()
Date: Tue,  9 Mar 2021 09:51:54 -0600
Message-Id: <20210309155202.1312571-10-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Block Jobs" <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Let's check return value of mirror_start_job to check for failure
instead of local_err.

Rename ret to job, as ret is usually integer variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-7-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/mirror.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 1803c6988b2e..6af02a57c4bb 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1860,8 +1860,7 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
                               bool auto_complete, Error **errp)
 {
     bool base_read_only;
-    Error *local_err = NULL;
-    BlockJob *ret;
+    BlockJob *job;

     base_read_only = bdrv_is_read_only(base);

@@ -1871,19 +1870,18 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
         }
     }

-    ret = mirror_start_job(
+    job = mirror_start_job(
                      job_id, bs, creation_flags, base, NULL, speed, 0, 0,
                      MIRROR_LEAVE_BACKING_CHAIN, false,
                      on_error, on_error, true, cb, opaque,
                      &commit_active_job_driver, false, base, auto_complete,
                      filter_node_name, false, MIRROR_COPY_MODE_BACKGROUND,
-                     &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                     errp);
+    if (!job) {
         goto error_restore_flags;
     }

-    return ret;
+    return job;

 error_restore_flags:
     /* ignore error and errp for bdrv_reopen, because we want to propagate
-- 
2.30.1


