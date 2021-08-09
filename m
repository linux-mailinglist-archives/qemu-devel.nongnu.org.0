Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B33E4A7A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:05:04 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8hz-00039X-OW
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gV-00017R-GH
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gS-0005zH-4N
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628528607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve6nuXjrwhAA4rhRPdbwFCeXYiTyAR/OUQ2sIfiRJcY=;
 b=Is0a6TysCX4FX8X9x91SUSsGxYrNNOVTJBsvTHIxOK4C6jHxpoH8Dpa+CHZzEpbEJMnCEx
 0R+1LDzcDfuxaMMLi7pCo9+8ZYBnjavO+wYsx5mwlr+KdzdyHeFDXqeAUjvSrd25MSFQ1S
 4or/1sGCnuqZH1aolim+YLji7kCTdjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-iaysage0NYehg_t8i5CeZg-1; Mon, 09 Aug 2021 13:03:25 -0400
X-MC-Unique: iaysage0NYehg_t8i5CeZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D45D1006C80;
 Mon,  9 Aug 2021 17:03:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A066913950;
 Mon,  9 Aug 2021 17:03:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/2] block/export/fuse.c: fix musl build
Date: Mon,  9 Aug 2021 19:03:18 +0200
Message-Id: <20210809170319.740284-2-hreitz@redhat.com>
In-Reply-To: <20210809170319.740284-1-hreitz@redhat.com>
References: <20210809170319.740284-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.702, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Fix the following build failure on musl raised since version 6.0.0 and
https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
because musl does not define FALLOC_FL_ZERO_RANGE:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                       ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/export/fuse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index ada9e263eb..fc7b07d2b5 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -635,7 +635,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (mode & FALLOC_FL_ZERO_RANGE) {
+    }
+#ifdef CONFIG_FALLOCATE_ZERO_RANGE
+    else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
             /* No need for zeroes, we are going to write them ourselves */
             ret = fuse_do_truncate(exp, offset + length, false,
@@ -654,7 +656,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (!mode) {
+    }
+#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
+    else if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
             fuse_reply_err(req, EOPNOTSUPP);
-- 
2.31.1


