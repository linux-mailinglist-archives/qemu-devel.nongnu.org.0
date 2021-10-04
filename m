Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE2421929
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:22:43 +0200 (CEST)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVQ2-0003Ya-IE
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9d-0000Kv-Pl
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9X-0007aq-0E
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzywCHfezvyILqdnEd3Yo5bNTFUUpTRqOuOoMjthsKI=;
 b=Z71dB6PiO8kXTs5259pSsO0LE4bKyKz5zZ6LhMjLvk9HBl4Ia+LZYYLm9fZnSWH9Fv8dgF
 QHcdW2dSnn2rBRTHxYvmNY4rCnmsYCZKiwfFIkmB7RtkLzV/8iVKELlVcY4IzcPWLzk9XB
 xQamfjPc1IumxwSSug1aZoVNEDzTmcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-NWd1f3tzOsiUlSDphSdBxg-1; Mon, 04 Oct 2021 17:05:35 -0400
X-MC-Unique: NWd1f3tzOsiUlSDphSdBxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C5891270;
 Mon,  4 Oct 2021 21:05:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D340C19C59;
 Mon,  4 Oct 2021 21:05:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/13] iotests/linters: Add entry point for linting via Python
 CI
Date: Mon,  4 Oct 2021 17:05:00 -0400
Message-Id: <20211004210503.1455391-11-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

(1) I think that the test file discovery logic and skip list belong together,
    and that those items belong in iotests/. I think they also belong in
    whichever directory pylintrc and mypy.ini are in, also in iotests/.

(2) Moving this logic into python/tests/ is challenging because I'd have
    to import iotests code from elsewhere in the source tree, which just
    inverts an existing problem I have been trying to rid us of --
    needing to muck around with PYTHONPATH or sys.path hacking in python
    scripts. I'm keen to avoid this.

(3) If we moved all python tests into tests/ and gave them *.py
    extensions, we wouldn't even need the test discovery functions
    anymore, and all of linters.py could be removed entirely, including
    this execution shim. We could rely on mypy/pylint's own file
    discovery mechanisms at that point. More work than I'm up for with
    just this series, but I could be coaxed into doing it if there was
    some promise of not rejecting all that busywork ;)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index f6a2dc139fd..191df173064 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -16,6 +16,7 @@
 import os
 import re
 import subprocess
+import sys
 from typing import List, Mapping, Optional
 
 
@@ -81,3 +82,20 @@ def run_linter(
 
     return p.returncode
 
+
+def main() -> int:
+    """
+    Used by the Python CI system as an entry point to run these linters.
+    """
+    files = get_test_files()
+
+    if sys.argv[1] == '--pylint':
+        return run_linter('pylint', files)
+    elif sys.argv[1] == '--mypy':
+        return run_linter('mypy', files)
+
+    raise ValueError(f"Unrecognized argument(s): '{sys.argv[1:]}'")
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.31.1


