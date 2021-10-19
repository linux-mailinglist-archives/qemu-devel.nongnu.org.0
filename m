Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA6433B38
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:51:58 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrPB-00036c-E8
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqR1-0001uJ-29
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQv-0008Fl-7l
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rnYm3KUMFTKZkdzVIR4h2DoAnLK6JzNtjjg3NWdm2Y=;
 b=KFi4cSlFH0qAJyA+rjlHDOGHeSLuIBaFFzdmKUNYrYXgHpCOHJ9BESM6IJkgygmHh1m3BW
 PUCL9MgIed4NPCLJcz8pBk7nnWsUob3jc5gNaLH4IKaab8jai82zUJZPXiuN96E7lAdY6o
 vsYuzVb1kDCqKaw7HJUaBY7FI++ngAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-OueSyCSuNxemkNWylfnrmQ-1; Tue, 19 Oct 2021 10:49:37 -0400
X-MC-Unique: OueSyCSuNxemkNWylfnrmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E32D801FCE;
 Tue, 19 Oct 2021 14:49:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE9E5D6D7;
 Tue, 19 Oct 2021 14:49:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] python: Add iotest linters to test suite
Date: Tue, 19 Oct 2021 10:49:17 -0400
Message-Id: <20211019144918.3159078-15-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Run mypy and pylint on the iotests files directly from the Python CI
test infrastructure. This ensures that any accidental breakages to the
qemu.[qmp|aqmp|machine|utils] packages will be caught by that test
suite.

It also ensures that these linters are run with well-known versions and
test against a wide variety of python versions, which helps to find
accidental cross-version python compatibility issues.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/tests/iotests-mypy.sh   | 4 ++++
 python/tests/iotests-pylint.sh | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100755 python/tests/iotests-mypy.sh
 create mode 100755 python/tests/iotests-pylint.sh

diff --git a/python/tests/iotests-mypy.sh b/python/tests/iotests-mypy.sh
new file mode 100755
index 00000000000..ee764708199
--- /dev/null
+++ b/python/tests/iotests-mypy.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+
+cd ../tests/qemu-iotests/
+python3 -m linters --mypy
diff --git a/python/tests/iotests-pylint.sh b/python/tests/iotests-pylint.sh
new file mode 100755
index 00000000000..4cae03424b4
--- /dev/null
+++ b/python/tests/iotests-pylint.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+
+cd ../tests/qemu-iotests/
+python3 -m linters --pylint
-- 
2.31.1


