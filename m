Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0511D4E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:57:06 +0200 (CEST)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZth-0005py-PX
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZil-0002Qu-CU
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46146
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZik-00028F-5P
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFGIYOTWtWLuRkue4L5tXUmyf/BGmje7dO/Hk+0/J2M=;
 b=AflrEWQqCoJf4SmPSE1AAAhOnVLbyQu3AzXfcz9RI1MnrAH5sb1O7NZ9lQ6sJZn8FDPgLN
 Rl82rmOaqh4Ap9Fn+ASOEMoz1pZaRk5Pm6h89hU27AI5frujuESJvURv2YpMwArM55JG0S
 a6ubn81JbP/Q7NXrLMngeVrL1+ZdShQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-RZvtCyK-Or25bHgr_tWd2w-1; Fri, 15 May 2020 08:45:40 -0400
X-MC-Unique: RZvtCyK-Or25bHgr_tWd2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8C9219200C2;
 Fri, 15 May 2020 12:45:38 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFC1A2E024;
 Fri, 15 May 2020 12:45:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/51] iotests: Run pylint and mypy in a testcase
Date: Fri, 15 May 2020 14:44:37 +0200
Message-Id: <20200515124521.335403-8-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We made sure that iotests.py passes pylint. It would be a shame if we
allowed new patches in that break this again, so let's just add a
meta-test case that runs pylint on it.

While we don't pass mypy --strict yet, we can already run it with a few
options that would be part of --strict to make sure that we won't
regress on these aspects at least until we can enable the full thing.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200511163529.349329-3-kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/297     | 44 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/297.out |  3 +++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 48 insertions(+)
 create mode 100755 tests/qemu-iotests/297
 create mode 100644 tests/qemu-iotests/297.out

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
new file mode 100755
index 0000000000..5c5420712b
--- /dev/null
+++ b/tests/qemu-iotests/297
@@ -0,0 +1,44 @@
+#!/usr/bin/env bash
+#
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+seq=$(basename $0)
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+# get standard environment
+. ./common.rc
+
+if ! type -p "pylint-3" > /dev/null; then
+    _notrun "pylint-3 not found"
+fi
+if ! type -p "mypy" > /dev/null; then
+    _notrun "mypy not found"
+fi
+
+pylint-3 --score=n iotests.py
+
+MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
+    --disallow-any-generics --disallow-incomplete-defs \
+    --disallow-untyped-decorators --no-implicit-optional \
+    --warn-redundant-casts --warn-unused-ignores \
+    --no-implicit-reexport iotests.py
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
new file mode 100644
index 0000000000..6acc843649
--- /dev/null
+++ b/tests/qemu-iotests/297.out
@@ -0,0 +1,3 @@
+QA output created by 297
+Success: no issues found in 1 source file
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 34175fd437..445c26f8d2 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -300,3 +300,4 @@
 289 rw quick
 290 rw auto quick
 292 rw auto quick
+297 meta
-- 
2.25.4


