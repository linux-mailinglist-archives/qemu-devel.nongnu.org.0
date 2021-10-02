Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13741FAD6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:09:08 +0200 (CEST)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbx5-0008Hg-7H
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWbla-0001A5-Iu
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblS-0004Vn-Ir
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqmFVoiTVjs8tvTiE9gE/QJL+B7YMW9/oO7UhH+jNvg=;
 b=WEyfUh+0L47FOI3gaka60dZ8kZpNLyvzZL+fw2e9H6s3KvYRLZ0QoT+/9IxYElGZCPaypy
 KvoqkOYexralnF3t9VNJIHr8qoy0HKO5REbvZR4rRbpQJs621Qqwl4byfIK1ctfwgbrx2t
 mgjkBArveWL4JRWTGxxqboUgsMprJrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-rNrez117N-67MslsDNmKvg-1; Sat, 02 Oct 2021 05:57:02 -0400
X-MC-Unique: rNrez117N-67MslsDNmKvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E711006AA7;
 Sat,  2 Oct 2021 09:57:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5B76060F;
 Sat,  2 Oct 2021 09:56:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 760FF11385C3; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] qapi/parser: fix unused check_args_section arguments
Date: Sat,  2 Oct 2021 11:56:45 +0200
Message-Id: <20211002095655.1944970-4-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Pylint informs us we're not using these arguments. Oops, it's
right. Correct the error message and remove the remaining unused
parameter.

Fix test output now that the error message is improved.

Fixes: e151941d1b
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210930205716.1148693-4-jsnow@redhat.com>
[Commit message formatting tweaked]
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py                | 16 +++++++++-------
 tests/qapi-schema/doc-bad-feature.err |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f03ba2cfec..bfd2dbfd9a 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -753,16 +753,18 @@ def check_expr(self, expr):
 
     def check(self):
 
-        def check_args_section(args, info, what):
+        def check_args_section(args, what):
             bogus = [name for name, section in args.items()
                      if not section.member]
             if bogus:
                 raise QAPISemError(
                     self.info,
-                    "documented member%s '%s' %s not exist"
-                    % ("s" if len(bogus) > 1 else "",
-                       "', '".join(bogus),
-                       "do" if len(bogus) > 1 else "does"))
+                    "documented %s%s '%s' %s not exist" % (
+                        what,
+                        "s" if len(bogus) > 1 else "",
+                        "', '".join(bogus),
+                        "do" if len(bogus) > 1 else "does"
+                    ))
 
-        check_args_section(self.args, self.info, 'members')
-        check_args_section(self.features, self.info, 'features')
+        check_args_section(self.args, 'member')
+        check_args_section(self.features, 'feature')
diff --git a/tests/qapi-schema/doc-bad-feature.err b/tests/qapi-schema/doc-bad-feature.err
index e4c62adfa3..49d1746c3d 100644
--- a/tests/qapi-schema/doc-bad-feature.err
+++ b/tests/qapi-schema/doc-bad-feature.err
@@ -1 +1 @@
-doc-bad-feature.json:3: documented member 'a' does not exist
+doc-bad-feature.json:3: documented feature 'a' does not exist
-- 
2.31.1


