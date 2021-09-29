Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59941CCEB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:51:33 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfc4-0007sA-ON
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfW7-0007cQ-Pv
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfW6-0006M3-4c
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4wmRwo9I4SnMcomzCicuV3AAogfgQNNH0p/ykhYf6s=;
 b=VadJxxtZAXKot5VLC4nTPRF6Nt+xj00+V7cX+62u1Pvnr5jCUQ5OrXMnG+yk0rVnnEFdg7
 AUQFqYPHfleJSZu5C5dyc1B7Oj0ltuY/qKGAg19MNPt97o325oJnliwW+uS2XrcFXopAvb
 kvpFKjRK80UMTmvdUH54y776/SnvuPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-GhyMCmF8OoGRYfhC5EgEVg-1; Wed, 29 Sep 2021 15:45:18 -0400
X-MC-Unique: GhyMCmF8OoGRYfhC5EgEVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4AB100792F;
 Wed, 29 Sep 2021 19:45:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58C41277C4;
 Wed, 29 Sep 2021 19:45:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] qapi/parser: fix unused check_args_section arguments
Date: Wed, 29 Sep 2021 15:44:18 -0400
Message-Id: <20210929194428.1038496-4-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pylint informs us we're not using these arguments. Oops, it's
right. Correct the error message and remove the remaining unused
parameter.

Fix test output now that the error message is improved.

Fixes: e151941d1b
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                | 16 +++++++++-------
 tests/qapi-schema/doc-bad-feature.err |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f03ba2cfec8..bfd2dbfd9a2 100644
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
index e4c62adfa3e..49d1746c3d1 100644
--- a/tests/qapi-schema/doc-bad-feature.err
+++ b/tests/qapi-schema/doc-bad-feature.err
@@ -1 +1 @@
-doc-bad-feature.json:3: documented member 'a' does not exist
+doc-bad-feature.json:3: documented feature 'a' does not exist
-- 
2.31.1


