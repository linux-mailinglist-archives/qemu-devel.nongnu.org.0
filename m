Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D640AEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:32:10 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Xh-0005gC-9G
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84Y-0006NU-5i
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84V-0008Rj-JU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtJKgxBbwisRtrtoddv42qvS68FVp0Px0t8Kp44t3Cg=;
 b=Dgx2UX0SBYzDMawBKDr2I2vFMa7d4rtzHMpJoeMDSRRkbUGPujEZC0zidUiOslvdc8cuF9
 E7ACWx2YIKfeSGeZv3qiK1JZ4CItGeAyxhSt5qEh1wTwyo5FK8gjnhAU0/gtUWR8KyO5Su
 h7zxE8v27QSwbudAMGtL0BWEILJAF9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-dklwETsyNciO9d-mfXsvHA-1; Tue, 14 Sep 2021 09:01:56 -0400
X-MC-Unique: dklwETsyNciO9d-mfXsvHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD08561196;
 Tue, 14 Sep 2021 13:01:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D20455C3DF;
 Tue, 14 Sep 2021 13:01:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] chardev: Propagate error from logfile opening
Date: Tue, 14 Sep 2021 17:01:26 +0400
Message-Id: <20210914130128.298226-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210914130128.298226-1-marcandre.lureau@redhat.com>
References: <20210914130128.298226-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michal Privoznik <mprivozn@redhat.com>

If a chardev has a logfile the file is opened using
qemu_open_old() which does the job, but since @errp is not
propagated into qemu_open_internal() we lose much more accurate
error and just report "Unable to open logfile $errno".  When
using plain files, it's probably okay as nothing complex is
happening behind the curtains. But the problem becomes more
prominent when passing an "/dev/fdset/XXX" path since much more
needs to be done.

The fix is to use qemu_create() which passes @errp further down.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
---
 chardev/char.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 4595a8d430..0169d8dde4 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -241,18 +241,15 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
 
     if (common && common->has_logfile) {
-        int flags = O_WRONLY | O_CREAT;
+        int flags = O_WRONLY;
         if (common->has_logappend &&
             common->logappend) {
             flags |= O_APPEND;
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+        chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
         if (chr->logfd < 0) {
-            error_setg_errno(errp, errno,
-                             "Unable to open logfile %s",
-                             common->logfile);
             return;
         }
     }
-- 
2.33.0.113.g6c40894d24


