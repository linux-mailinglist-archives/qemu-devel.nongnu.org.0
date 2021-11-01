Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3E442085
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:08:35 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcfa-0002Us-EV
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbEW-0002X4-Qr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbEU-0003nY-Ki
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4sSoBFZezLBtoGV5lwWO+TDpCmaxAMN92BP93BZNGs=;
 b=a5tx6u313ToP2UEpErFiKW2ktnLc+O11/wR++bRfA4a90U+gmBeYU0gbikwpEP2w0QJxX6
 cNXHqUdM6crUkoWSICh9nRBU1Pv0obWZGLL/LuoHxaS5Cd+jSkWU/DQ6splaBDHfcmns1U
 JCGHTvZq0SiTWKjj7SEZQ/18ynqWBsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-bfXdBPQEMPWqPP1K92fv4A-1; Mon, 01 Nov 2021 13:36:27 -0400
X-MC-Unique: bfXdBPQEMPWqPP1K92fv4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5BF48066F7;
 Mon,  1 Nov 2021 17:36:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45BE319C79;
 Mon,  1 Nov 2021 17:36:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] python: Add iotest linters to test suite
Date: Mon,  1 Nov 2021 13:29:58 -0400
Message-Id: <20211101173006.656673-15-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Run mypy and pylint on the iotests files directly from the Python CI
test infrastructure. This ensures that any accidental breakages to the
qemu.[qmp|aqmp|machine|utils] packages will be caught by that test
suite.

It also ensures that these linters are run with well-known versions and
test against a wide variety of python versions, which helps to find
accidental cross-version python compatibility issues.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211019144918.3159078-15-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


