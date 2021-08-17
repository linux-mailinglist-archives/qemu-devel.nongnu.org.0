Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270683EE8F3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:58:50 +0200 (CEST)
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuvp-0001Mo-7n
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFuv6-0000hG-7I
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFuv4-0005j1-KK
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629190681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi7VnpVH6EM8gDZHLmeZzVCrienYtGQFMeOTZtWZBOA=;
 b=Iz/n/HMMsga9hOQNjh4YSuYOauVWoz6nYlKQu7KCe0Ps4KnusgHA8ZYJU8L/Om4zD7ccvP
 ZGtmLDDrHFOT7JLD6jntEV54d0w8HTbTtnyaKsri34RAVFDMvITFHrJcxlkMV1/w7PhwNA
 e+NVQKc6jQUPNB0yZvZqHTBtxfJCinw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-xqcvg14CPDmZ64DV7V0DZw-1; Tue, 17 Aug 2021 04:56:42 -0400
X-MC-Unique: xqcvg14CPDmZ64DV7V0DZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE115100A5F3
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:56:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15B2C60C81;
 Tue, 17 Aug 2021 08:56:40 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] chardev: Propagate error from logfile opening
Date: Tue, 17 Aug 2021 10:56:27 +0200
Message-Id: <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
In-Reply-To: <cover.1629190206.git.mprivozn@redhat.com>
References: <cover.1629190206.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.31.1


