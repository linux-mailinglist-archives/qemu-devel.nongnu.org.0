Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550B3B48C5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:27:52 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqYQ-0000DQ-VS
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRo-00043v-Si
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRY-0005kU-3T
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8i8xinDtZ6m5roDKOuknYSg2NFaliuXZZJDWKqJlH+Q=;
 b=b5LCOoaJTsw95r0kL0/+ZmUeGDVk/vWdPcbpRyRcA319W2+SRiDK3oYFLV3odKIRZWJc2l
 up7tpgUS+2Nqz9zOH1e9iYykMLjrFzBuIGSkaISpxr2dle9qsINvRKJPaGucZ87KXFgYMO
 oVcJEhrvA/ok71cdAIiY0vWVHzJpN6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-zuQTsIxsOBCnK71QaMRs9Q-1; Fri, 25 Jun 2021 14:20:40 -0400
X-MC-Unique: zuQTsIxsOBCnK71QaMRs9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3641100C611;
 Fri, 25 Jun 2021 18:20:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB1705D9C6;
 Fri, 25 Jun 2021 18:20:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] iotests/linters: Add entry point for Python CI linters
Date: Fri, 25 Jun 2021 14:20:20 -0400
Message-Id: <20210625182021.803227-10-jsnow@redhat.com>
In-Reply-To: <20210625182021.803227-1-jsnow@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a main() function to linters.py so that the Python CI infrastructure
has something it can run.

Now, linters.py represents an invocation of the linting scripts that
more resembles a "normal" execution of pylint/mypy, like you'd expect to
use if 'qemu' was a bona-fide package you obtained from PyPI.

297, by contrast, now represents the iotests-specific configuration bits
you need to get it to function correctly as a part of iotests, and with
'qemu' as a namespace package that isn't "installed" to the current
environment, but just lives elsewhere in our source tree.

By doing this, we will able to run the same linting configuration from
the Python CI tests without calling iotest logging functions or messing
around with PYTHONPATH / MYPYPATH.

iotest 297 continues to operate in a standalone fashion for now --
presumably, it's convenient for block maintainers and contributors to
run in this manner.

See the following commit for how this is used from the Python packaging side.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 6fa7ba2d22..1bbcfd1088 100755
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -115,3 +115,16 @@ def run_linters(
             print(p.stdout)
 
     return ret
+
+
+def main() -> int:
+    """
+    Used by the Python CI system as an entry point to run these linters.
+    """
+    directory = os.path.dirname(os.path.realpath(__file__))
+    files = get_test_files(directory)
+    return run_linters(files, directory)
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.31.1


