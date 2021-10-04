Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DCC421917
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:14:34 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVI8-0007zg-BD
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9e-0000Mb-SM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9b-0007f9-Le
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuNG23n/ROlnrCZj1iAPbGo5ccVoOtxrMacAee7pCck=;
 b=TLXhcGxROAUQOJA+OXzH/6qUNZB5DGsuvLChn98vj8vsEXwSXjEKOviOKbpw1mXjcMg9hG
 Thu59QQf7gUA7gUUHc5Os3E1oizyI8JY85AWitz9mt5U3o2isAHesvomU/t/hh6VYlY+NJ
 e21znh61YcPn8wPTyyk6kBTVK4ybIYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-MvTQs5jLN8eFjjHUQiNQrg-1; Mon, 04 Oct 2021 17:05:36 -0400
X-MC-Unique: MvTQs5jLN8eFjjHUQiNQrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC8D100C661;
 Mon,  4 Oct 2021 21:05:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BC3719C59;
 Mon,  4 Oct 2021 21:05:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] iotests/linters: Add workaround for mypy bug #9852
Date: Mon,  4 Oct 2021 17:05:01 -0400
Message-Id: <20211004210503.1455391-12-jsnow@redhat.com>
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
---
 tests/qemu-iotests/linters.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 191df173064..83fcc5a960c 100644
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -92,7 +92,9 @@ def main() -> int:
     if sys.argv[1] == '--pylint':
         return run_linter('pylint', files)
     elif sys.argv[1] == '--mypy':
-        return run_linter('mypy', files)
+        # mypy bug #9852; disable incremental checking as a workaround.
+        args = ['--no-incremental'] + files
+        return run_linter('mypy', args)
 
     raise ValueError(f"Unrecognized argument(s): '{sys.argv[1:]}'")
 
-- 
2.31.1


