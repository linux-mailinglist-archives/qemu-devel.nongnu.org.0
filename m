Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3AD44204D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:51:46 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcPJ-0006m1-Mf
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbEC-0001zl-2y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbE9-00037x-V9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ns6c1OlNy9CyNvD/UazqnY1SJqx5gH9tGPM3Sc8NxdE=;
 b=f1T8j/Lck1y0Nkm90U1WTN5ovsWPnAJQntIT8zVJ54BCbz66SDUh5Lu6KaeOPpYPXncqdU
 g1gNqUUOomObaoaNAe/Lq62OugPHQ0p8V0BUv568wOfIaq9ZNkna/ZJz8jiPvmoNd5azvD
 wPbV2EKOz5vFG84cqCvdNiT54qMREpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-8Q0bovz6Oli1bAF-Ks4Y4g-1; Mon, 01 Nov 2021 13:36:06 -0400
X-MC-Unique: 8Q0bovz6Oli1bAF-Ks4Y4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDA610A8E01;
 Mon,  1 Nov 2021 17:36:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEDAB19C79;
 Mon,  1 Nov 2021 17:35:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] iotests/linters: Add workaround for mypy bug #9852
Date: Mon,  1 Nov 2021 13:29:57 -0400
Message-Id: <20211101173006.656673-14-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This one is insidious: if you write an import as "from {namespace}
import {subpackage}" as mirror-top-perms (now) does, mypy will fail on
every-other invocation *if* the package being imported is a typed,
installed, namespace-scoped package.

Upsettingly, that's exactly what 'qemu.[aqmp|qmp|machine]' et al are in
the context of Python CI tests.

Now, I could just edit mirror-top-perms to avoid this invocation, but
since I tripped on a landmine, I might as well head it off at the pass
and make sure nobody else trips on that same landmine.

It seems to have something to do with the order in which files are
checked as well, meaning the random order in which set(os.listdir())
produces the list of files to test will cause problems intermittently
and not just strictly "every other run".

This will be fixed in mypy >= 0.920, which is not released yet. The
workaround for now is to disable incremental checking, which avoids the
issue.

Note: This workaround is not applied when running iotest 297 directly,
because the bug does not surface there! Given the nature of CI jobs not
starting with any stale cache to begin with, this really only has a
half-second impact on manual runs of the Python test suite when executed
directly by a developer on their local machine. The workaround may be
removed when the Python package requirements can stipulate mypy 0.920 or
higher, which can happen as soon as it is released. (Barring any
unforseen compatibility issues that 0.920 may bring with it.)

See also:
 https://github.com/python/mypy/issues/11010
 https://github.com/python/mypy/issues/9852

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211019144918.3159078-14-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 46c28fdcda0..65c4c4e8272 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -93,7 +93,9 @@ def show_usage() -> None:
     if sys.argv[1] == '--pylint':
         run_linter('pylint', files)
     elif sys.argv[1] == '--mypy':
-        run_linter('mypy', files)
+        # mypy bug #9852; disable incremental checking as a workaround.
+        args = ['--no-incremental'] + files
+        run_linter('mypy', args)
     else:
         print(f"Unrecognized argument: '{sys.argv[1]}'", file=sys.stderr)
         show_usage()
-- 
2.31.1


