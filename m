Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B0433BEE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:18:51 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrpC-0003em-EN
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqR2-0001vB-2W
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQy-0008HS-2C
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kc4rw9PTg3j02DqJnesYJwK5eFavai1QX+gbLvRT1U=;
 b=G9rStVysvvg1FfdqYf6bZb+83UJmfss+Df1pQN0mPvG8rHej7Vssub1QLTd76lX5KgJo0f
 Z74lYrsoOEz60lix0HMsmUuZ5+iCFPrlid7GkiEGKx59GokJTtEoxhKag/lWJyToDg2ODJ
 wcpnVSplB2lAQE0ndO59AO9a4IHDYcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-VkFNGQaUOJaby4Ha-sxuKA-1; Tue, 19 Oct 2021 10:49:35 -0400
X-MC-Unique: VkFNGQaUOJaby4Ha-sxuKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58AFC824FA7;
 Tue, 19 Oct 2021 14:49:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E19A5D6D7;
 Tue, 19 Oct 2021 14:49:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] iotests/linters: Add entry point for linting via
 Python CI
Date: Tue, 19 Oct 2021 10:49:15 -0400
Message-Id: <20211019144918.3159078-13-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need at least a tiny little shim here to join test file discovery
with test invocation. This logic could conceivably be hosted somewhere
in python/, but I felt it was strictly the least-rude thing to keep the
test logic here in iotests/, even if this small function isn't itself an
iotest.

Note that we don't actually even need the executable bit here, we'll be
relying on the ability to run this module as a script using Python CLI
arguments. No chance it gets misunderstood as an actual iotest that way.

(It's named, not in tests/, doesn't have the execute bit, and doesn't
have an execution shebang.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index c515c7afe36..46c28fdcda0 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -16,6 +16,7 @@
 import os
 import re
 import subprocess
+import sys
 from typing import List, Mapping, Optional
 
 
@@ -74,3 +75,29 @@ def run_linter(
         stderr=subprocess.STDOUT if suppress_output else None,
         universal_newlines=True,
     )
+
+
+def main() -> None:
+    """
+    Used by the Python CI system as an entry point to run these linters.
+    """
+    def show_usage() -> None:
+        print(f"Usage: {sys.argv[0]} < --mypy | --pylint >", file=sys.stderr)
+        sys.exit(1)
+
+    if len(sys.argv) != 2:
+        show_usage()
+
+    files = get_test_files()
+
+    if sys.argv[1] == '--pylint':
+        run_linter('pylint', files)
+    elif sys.argv[1] == '--mypy':
+        run_linter('mypy', files)
+    else:
+        print(f"Unrecognized argument: '{sys.argv[1]}'", file=sys.stderr)
+        show_usage()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.31.1


