Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BC3040FB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:54:32 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pjj-0004yO-EM
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEV-0001Em-Rj
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEL-0006ZF-8p
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOzoMWzLKeiYw3mF7MjZ3sF6AF+EWAwnRZ2PYJl+2bU=;
 b=N4GlUkLi2Mi7NIhEMjQrbWd3Jg7EmNXaTV7P+ShhBwYe5Iz0GDF/+Fs+F8pCW4ONo5Uh+1
 KpFr5mOOaDkUJ9zaZzXhANYgWfZdKuzQO9NpB4t8GTmrpL8+/Oa7SuOkDylvIpGZBzmfL9
 /O4aQbkSX1vpF6mH02euPypGwFBgKcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-YK1JaDLCOy69WnjSuIt8ug-1; Tue, 26 Jan 2021 09:22:00 -0500
X-MC-Unique: YK1JaDLCOy69WnjSuIt8ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 739208017FB;
 Tue, 26 Jan 2021 14:21:59 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC50819934;
 Tue, 26 Jan 2021 14:21:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 44/53] qapi: backup: disable copy_range by default
Date: Tue, 26 Jan 2021 15:20:07 +0100
Message-Id: <20210126142016.806073-45-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Further commit will add a benchmark
(scripts/simplebench/bench-backup.py), which will show that backup
works better with async parallel requests (previous commit) and
disabled copy_range. So, let's disable copy_range by default.

Note: the option was added several commits ago with default to true,
to follow old behavior (the feature was enabled unconditionally), and
only now we are going to change the default behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-19-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 2 +-
 blockdev.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index abcd41ed63..9f555d5c1d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1377,7 +1377,7 @@
 # Optional parameters for backup. These parameters don't affect
 # functionality, but may significantly affect performance.
 #
-# @use-copy-range: Use copy offloading. Default true.
+# @use-copy-range: Use copy offloading. Default false.
 #
 # @max-workers: Maximum number of parallel requests for the sustained background
 #               copying process. Doesn't influence copy-before-write operations.
diff --git a/blockdev.c b/blockdev.c
index 25aaacf253..93417f6302 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2829,7 +2829,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
-    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
+    BackupPerf perf = { .max_workers = 64 };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
-- 
2.29.2


