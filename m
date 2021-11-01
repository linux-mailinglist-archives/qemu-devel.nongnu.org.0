Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F22442042
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:47:47 +0100 (CET)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcLS-0007rQ-F2
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbDc-0008W8-GO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbDT-0002wn-BC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UA6ZggHcuapOOdsIo2jIAlXRy8t37afT4BCttNb6dcA=;
 b=SSnHD2KlGxf+YCZwFAK5qgtzFMnY94rdDc+tLLAPaYfk8wDq4ae9Vyn+IjZld/KMhqLCse
 /vrfnXWp6vAIqBnsgFi6hmniFJ4d2ma/kcx6RgF8+IdPMkxRc8czOCxSlquadfeQhK4iRQ
 cA4dEJR08RnLN1359BNNeTlqo9n+C1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-8d1YomRFNEqrCtwOfmT7jg-1; Mon, 01 Nov 2021 13:35:23 -0400
X-MC-Unique: 8d1YomRFNEqrCtwOfmT7jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB1A1926DA0;
 Mon,  1 Nov 2021 17:35:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC9219C79;
 Mon,  1 Nov 2021 17:34:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] iotests/linters: Add entry point for linting via Python
 CI
Date: Mon,  1 Nov 2021 13:29:56 -0400
Message-Id: <20211101173006.656673-13-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211019144918.3159078-13-jsnow@redhat.com
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


