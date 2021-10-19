Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF27433C02
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:23:11 +0200 (CEST)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrtO-0000ng-3i
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqR2-0001v1-0N
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQu-0008Es-LB
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=of0nRlCXnCXhgd1yWv9n6B/plzG43d0f0S9OjxqVBbE=;
 b=AGeexfLe/JybFEz5N4m6BO1rZzzDAoNesXXRfDu6x1kJab6BKCJB6zKKpZi6bNCQ4AXcwU
 Nao+kSQv4HSjrxAgqon7lySucQh6pY8XtPT3Zr4fUJGmefct3Sop/3wmtwQ2KZZKN0BIj9
 XTWXeVgxqMfBkBq5YIumIAIuRos18bQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-o8A35AadMkujJmFdo-89Yw-1; Tue, 19 Oct 2021 10:49:36 -0400
X-MC-Unique: o8A35AadMkujJmFdo-89Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70F85802682;
 Tue, 19 Oct 2021 14:49:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F8825D6D7;
 Tue, 19 Oct 2021 14:49:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] iotests/linters: Add workaround for mypy bug #9852
Date: Tue, 19 Oct 2021 10:49:16 -0400
Message-Id: <20211019144918.3159078-14-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


