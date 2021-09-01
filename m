Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817B3FDE98
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:25:28 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLS7D-00039G-60
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz4-00049m-Sk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz2-0003UQ-Eq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dWOu3tH/Dl5NzUP0V6ShDHO9gBC97s69qGQfrVxU44=;
 b=ioR7vw5+wE6Xd0oa6L/F55s8/m6T1wuGUVpNW36dVypwvAQbECRS/bS9SDLLEsP1KEjWlj
 dRiQ/Y7seDo+ZZgTvggRn4QvcfWxfeP9GCszQEfS3G43+Ll8/H84aJ7O4N3lf8EZz/kVZJ
 94adRqCyByjDgR4SfZra3APT/8DkeSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-eMG7yyU5N4uSVwmGiqseLg-1; Wed, 01 Sep 2021 11:16:58 -0400
X-MC-Unique: eMG7yyU5N4uSVwmGiqseLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD9EA87D543;
 Wed,  1 Sep 2021 15:16:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55C7446;
 Wed,  1 Sep 2021 15:16:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/56] block/monitor: Consolidate hmp_handle_error calls to
 reduce redundant code
Date: Wed,  1 Sep 2021 17:15:40 +0200
Message-Id: <20210901151619.689075-18-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Message-Id: <20210802062507.347555-1-maozhongyi@cmss.chinamobile.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 3e6670c963..2ac4aedfff 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -251,10 +251,10 @@ void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
 
     if (!filename) {
         error_setg(&err, QERR_MISSING_PARAMETER, "target");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
     qmp_drive_mirror(&mirror, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
@@ -281,11 +281,11 @@ void hmp_drive_backup(Monitor *mon, const QDict *qdict)
 
     if (!filename) {
         error_setg(&err, QERR_MISSING_PARAMETER, "target");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
 
     qmp_drive_backup(&backup, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
@@ -356,8 +356,7 @@ void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
          * will be taken internally. Today it's actually required.
          */
         error_setg(&err, QERR_MISSING_PARAMETER, "snapshot-file");
-        hmp_handle_error(mon, err);
-        return;
+        goto end;
     }
 
     mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS;
@@ -365,6 +364,7 @@ void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
                                filename, false, NULL,
                                !!format, format,
                                true, mode, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
-- 
2.31.1


