Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6C38B9F4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 01:03:56 +0200 (CEST)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrhr-00017H-KX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 19:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbe-0006lT-M2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbT-0005ps-4j
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621551437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L2dNBFHnepsFnXeVP4wSaHtBxmZStINR161v2mwYvg=;
 b=CCM3hTsQk8t8CMJLgONum4xJHYXJUM2pOFP6FJN5Fv8c6Gk56qPiMN2tHMD57ZqXc6hNZl
 uox/gL1Su0n7m1pLNtBBrc6AQTS7up+iPV8fYZ/LN/Mz4wbaI3bjIo6StMkaFLkkD0UGGG
 ZnPPoqujPmHrcwgCzS2NVpo9UbW7OYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-7E7RJKjKNoefnP8K-kZD4A-1; Thu, 20 May 2021 18:57:15 -0400
X-MC-Unique: 7E7RJKjKNoefnP8K-kZD4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B31101371D;
 Thu, 20 May 2021 22:57:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC22D10027C4;
 Thu, 20 May 2021 22:57:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] qapi/parser: fix unused check_args_section arguments
Date: Thu, 20 May 2021 18:57:05 -0400
Message-Id: <20210520225710.168356-2-jsnow@redhat.com>
In-Reply-To: <20210520225710.168356-1-jsnow@redhat.com>
References: <20210520225710.168356-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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
index 06167ed3e0a..b6a5e661215 100644
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
2.30.2


